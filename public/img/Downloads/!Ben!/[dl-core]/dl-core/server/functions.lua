

DLCore.Functions = {}



DLConfig.Server.Webhooks = {

	["default"] = "https://discordapp.com/api/webhooks/859758099048693770/i4NaZNhVrdxtWAm7oqfyOfBDtXJIn409nY0FAhgCCK4Lu5RkP2ezSdbYDVBKnSwzPyx9",

  	["dropped"] = "https://discordapp.com/api/webhooks/859758217638576158/oYf7TtXbV3i6T46ULujg9_sSc3O80hgBehxRYQPeYBJCn8STXCvGPp7Ax3PH2byaoMiT",

	["connecting"] = "https://discordapp.com/api/webhooks/859757729622261781/KKi3wPoQH8v9pZL1pwo5MAnkorx3ZpaphicFJerr9igkCrsggSMHd4nQMR2X4exXX6Vk",

	["goto"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["bring"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["noclip"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["give-item"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["sv"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["dv"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["tpm"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["devmode"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["shownames"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["skin"] = "https://discord.com/api/webhooks/788233987838967870/PwZT_HFNdVfbkNeRMeS1LoqzNbjNlsSQnJZy9xw9JOIdhItkjQ0wSh1tWja2NP9wgoWi",

	["givemoney"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["setjob"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["revive"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["kill"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf",

	["illegal"] = "https://discordapp.com/api/webhooks/859758789561024542/pcD0DrkTLuM1a_WynJCzgZSvnSjHH_JuAMn4m_OV_DeDRPweUkZnIUBWlNeu7Jh96S5V",

	["clearinv"] = "https://discordapp.com/api/webhooks/859758415655862282/K8beWP2pR0Eiq3hr9aTcyvompfmk5_NdL0l9wl_JEdzuVKIjmqnsw4FGReElRDI0fdbf"

}



DLConfig.Server.Colors = {

	default = "3447003",

  	green = "3066993",

	red = "16711680",

	white = "16777215",

    black = "0",

    orange = "16743168",

    lightgreen = "65309",

    yellow = "15335168",

    turqois = "62207",

    pink = "16711900",

}



local logEmbed

DLCore.Functions.CreateLog = function(type, title, description, color)

    logEmbed = {

        {

            ["color"] = (DLConfig.Server.Colors[color] and DLConfig.Server.Colors[color] or DLConfig.Server.Colors["default"]),

            ["title"] = title,

            ["description"] = description,

            ["footer"] = {["text"] = "Different Life Logs"},

        }

    }

    PerformHttpRequest(DLConfig.Server.Webhooks[type], function(error, body, headers) end, "POST", json.encode({username = "Different Life Logger", embeds = embed}), { ["Content-Type"] = "application/json" })

end



DLCore.Functions.ExecuteSql = function(query)

	local responseData = nil



	exports["ghmattimysql"]:execute(query, {}, function(responseDataCb)

		responseData = responseDataCb

	end)



	while (responseData == nil) do Wait(100) end



	return responseData

end



local numPlayerIdentifiers, playerIdentifier

DLCore.Functions.GetIdentifier = function(playerServerId, identifierName, fullString)

	numPlayerIdentifiers = GetNumPlayerIdentifiers(playerServerId)

	for identifierIndex = 0, numPlayerIdentifiers - 1 do

		playerIdentifier = GetPlayerIdentifier(playerServerId, identifierIndex)

		if (playerIdentifier):match(identifierName) then

			return not fullString and (playerIdentifier):sub(#identifierName + 2) or playerIdentifier

		end

	end

end



DLCore.Functions.GetPlayer = function(playerServerId)

	return DLCore.Players[playerServerId]

end

DLCore.Functions.GetPlayerByPhone = function(number)
	for src, player in pairs(DLCore.Players) do
		if player.PlayerData.charinfo.phone == number then
			return player
		end
	end
	return nil
end

DLCore.Functions.GetPlayerByCitizenId = function(citizenid)
	for src, player in pairs(DLCore.Players) do
		local cid = citizenid
		if DLCore.Players[src].PlayerData.citizenid == cid then
			return DLCore.Players[src]
		end
	end
	return nil
end

DLCore.Functions.GetPlayers = function()

	return DLCore.Players

end



DLCore.Functions.CreateCallback = function(name, cb)

	DLCore.ServerCallbacks[name] = cb

end



DLCore.Functions.TriggerCallback = function(name, source, cb, ...)

	if DLCore.ServerCallbacks[name] ~= nil then

		DLCore.ServerCallbacks[name](source, cb, ...)

	end

end



DLCore.Functions.CreateUseableItem = function(item, cb)

	DLCore.UseableItems[item] = cb

end



DLCore.Functions.CanUseItem = function(item)

	return DLCore.UseableItems[item] ~= nil

end



DLCore.Functions.UseItem = function(source, item)

	DLCore.UseableItems[item.name](source, item)

end



local httpResponseData

DLCore.Functions.PerformAsyncHttpRequest = function(requestUrl, requestMethod, requestData, requestHeaders)

	httpResponseData = nil



	PerformHttpRequest(requestUrl, function(responseCode, responseData, requestHeaders)

		print("[^2dl-core^7] Performing http:// request to: ", requestUrl)

		httpResponseData = {responseCode, responseData, requestHeaders}

	end, requestMethod, requestData, requestHeaders)



	while (httpResponseData == nil) do Wait(50) end



	return httpResponseData[1], httpResponseData[2], httpResponseData[3]

end

DLCore.Functions.Notify = function(source, notifyText, notifyType, notifyDuration)

	
	TriggerClientEvent("dl-core:client:notify", source, notifyText, notifyType, notifyDuration)

end

DLCore.Functions.GetPlayersFromCoords = function(coords, distance)
    local players = SRPCore.Functions.GetPlayers()
    local closePlayers = {}

    if coords == nil then
        coords = GetEntityCoords(GetPlayerPed(-1))
    end
    if distance == nil then
        distance = 5.0
    end
    for _, player in pairs(players) do
        local target = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(target)
        local targetdistance = GetDistanceBetweenCoords(targetCoords, coords.x, coords.y, coords.z, true)
        if targetdistance <= distance then
            table.insert(closePlayers, player)
        end
    end
    
    return closePlayers
end

