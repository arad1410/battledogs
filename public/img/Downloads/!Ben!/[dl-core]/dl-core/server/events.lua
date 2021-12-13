RegisterServerEvent("dl-core:playerJoined")
AddEventHandler("dl-core:playerJoined", function()
	print("[^2dl-core^7] Player joined, ", GetPlayerName(source))
end)

AddEventHandler("playerDropped", function()
	if (source == nil or DLCore.Players[source] == nil) then return false end
	local source = tonumber(source)
	DLCore.Players[source].Functions.Save()
	local playerDroppedData = DLCore.Players[source].PlayerData
	print("[^2dl-core^7] Player dropped, ", playerDroppedData.name)
	TriggerEvent("dl-core:server:playerDropped", source, playerDroppedData)
	DLCore.Players[source] = nil

	local playerDroppedLog = ("**Steam:** %s\n**Discord:** <@%s>\n**Character Name:** %s\n**Steam Hex:** %s\n**License:** %s"):format(playerDroppedData.name, playerDroppedData.discord.id, playerDroppedData.charinfo.firstname .. " " .. playerDroppedData.charinfo.lastname, playerDroppedData.steam, playerDroppedData.license)
	PerformHttpRequest("https://discordapp.com/api/webhooks/859758217638576158/oYf7TtXbV3i6T46ULujg9_sSc3O80hgBehxRYQPeYBJCn8STXCvGPp7Ax3PH2byaoMiT", function(error, body, headers) end, "POST", json.encode({username = "Different Life Log", embeds = {
        {
            ["color"] = "16711680",
            ["title"] = "Player Dropped",
            ["description"] = playerDroppedLog,
            ["footer"] = {["text"] = "Different Life Logs"},
        }
    }}), { ["Content-Type"] = "application/json" })
end)

AddEventHandler("playerConnecting", function()
	print("[^2dl-core^7] Player connecting, ", GetPlayerName(source))
	local playerConnectingLog = ("**Steam:** %s\n**IP:** %s\n**Discord:** <@%s>\n**Steam Hex:** %s\n**License:** %s"):format(GetPlayerName(source), GetPlayerEndpoint(source), DLCore.Functions.GetIdentifier(source, "discord"), DLCore.Functions.GetIdentifier(source, "steam"), DLCore.Functions.GetIdentifier(source, "license"))
	PerformHttpRequest("https://discordapp.com/api/webhooks/859757729622261781/KKi3wPoQH8v9pZL1pwo5MAnkorx3ZpaphicFJerr9igkCrsggSMHd4nQMR2X4exXX6Vk", function(error, body, headers) end, "POST", json.encode({username = "Different Life Log", embeds = {
        {
            ["color"] = "3066993",
            ["title"] = "Player Connecting",
            ["description"] = playerConnectingLog,
            ["footer"] = {["text"] = "Different Life Logs"},
        }
    }}), { ["Content-Type"] = "application/json" })
end)

RegisterServerEvent("dl-core:server:updatePlayer")
AddEventHandler("dl-core:server:updatePlayer", function()
	local source = source
	local updatedPlayer = DLCore.Functions.GetPlayer(source)

	if (updatedPlayer ~= nil) then
		
		local updatedHunger = updatedPlayer.PlayerData.metadata["hunger"] - 0.5
		local updatedThirst = updatedPlayer.PlayerData.metadata["thirst"] - 0.6

		if (updatedHunger <= 0) then updatedHunger = 0 end
		if (updatedThirst <= 0) then updatedThirst = 0 end

		updatedPlayer.Functions.SetMetaData("thirst", updatedThirst)
		updatedPlayer.Functions.SetMetaData("hunger", updatedHunger)
		updatedPlayer.Functions.Save()

		TriggerClientEvent("dl-hud:client:updateNeeds", source, updatedHunger, updatedThirst)
	end
end)

RegisterServerEvent("dl-core:client:updatePlayerPosition")
AddEventHandler("dl-core:client:updatePlayerPosition", function(position)
	local src = source
	local Player = DLCore.Functions.GetPlayer(src)
	if Player ~= nil then
		Player.PlayerData.position = position
	end
end)

RegisterServerEvent("dl-core:server:updatePlayerSalary")
AddEventHandler("dl-core:server:updatePlayerSalary", function()
	local source = source
	local updatedPlayer = DLCore.Functions.GetPlayer(source)

	if (updatedPlayer ~= nil) then
		updatedPlayer.Functions.AddMoney("bank", updatedPlayer.PlayerData.job.payment)
	end
end)

RegisterServerEvent("dl-core:server:triggerCallback")
AddEventHandler("dl-core:server:triggerCallback", function(name, ...)
	local source = source
	DLCore.Functions.TriggerCallback(name, source, function(...)
		TriggerClientEvent("dl-core:client:triggerCallback", source, name, ...)
	end, ...)
end)


RegisterServerEvent("dl-core:server:useItem")
AddEventHandler("dl-core:server:useItem", function(itemData)
	if (itemData ~= nil and itemData.amount > 0) then
		if (DLCore.Functions.CanUseItem(itemData.name)) then
			DLCore.Functions.UseItem(source, itemData)
		end
	end
end)

RegisterServerEvent("dl-core:server:toggleDuty")
AddEventHandler("dl-core:server:toggleDuty", function()
	local toggleDutyPlayer = DLCore.Functions.GetPlayer(source)
	toggleDutyPlayer.Functions.SetJobDuty(not toggleDutyPlayer.PlayerData.job.onduty)
	TriggerEvent("dl-core:server:onDutyChange", toggleDutyPlayer.PlayerData.job.name, toggleDutyPlayer.PlayerData.job.onduty)
end)

RegisterNetEvent("dl-core:server:setMetadata")
AddEventHandler("dl-core:server:setMetadata", function(metaName, metaValue)
	local player = DLCore.Functions.GetPlayer(source)
	if (player ~= nil) then
		if (type(metaName) == "table") then
			for metaIndex = 1, #metaName do
				player.Functions.SetMetaData(metaName[metaIndex][1], metaName[metaIndex][2])
			end
		elseif (metaName ~= nil and metaValue ~= nil) then
			player.Functions.SetMetaData(metaName, metaValue)
		end
	end
end)

RegisterServerEvent("dl-core:server:notify")
AddEventHandler("dl-core:server:notify", function(notifyText, notifyType)
	DLCore.Functions.Notify(notifyText, notifyType)
end)

DLCore.Functions.CreateCallback("dl-core:server:hasItem", function(source, cb, itemName)
	local hasItemRetval = false
	local hasItemPlayer = DLCore.Functions.GetPlayer(source)

	if (hasItemPlayer ~= nil) then
		if (hasItemPlayer.Functions.GetItemByName(itemName) ~= nil) then
			hasItemRetval = true
		end
	end

	cb(hasItemRetval)
end)

RegisterNetEvent("dl-core:client:useItem")
AddEventHandler("dl-core:client:useItem", function(item)
	TriggerServerEvent("dl-core:server:useItem", item)
end)

RegisterNetEvent("dl-core:server:removeItem")
AddEventHandler("dl-core:server:removeItem", function(itemName, amount)
	local player = DLCore.Functions.GetPlayer(source)
	if (player ~= nil) then
		player.Functions.RemoveItem(itemName, amount)
	end
end)
