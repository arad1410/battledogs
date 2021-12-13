RegisterNetEvent("dl-core:client:setPlayerData")
AddEventHandler("dl-core:client:setPlayerData", function(playerData)
	DLCore.PlayerData = playerData
end)

RegisterNetEvent("dl-core:client:triggerCallback")
AddEventHandler("dl-core:client:triggerCallback", function(name, ...)
	if (DLCore.ServerCallbacks[name] ~= nil) then
		DLCore.ServerCallbacks[name](...)
		DLCore.ServerCallbacks[name] = nil
	end
end)

RegisterNetEvent("dl-core:client:useItem")
AddEventHandler("dl-core:client:useItem", function(item)
	TriggerServerEvent("dl-core:server:useItem", item)
end)

RegisterNetEvent("dl-core:client:notify")
AddEventHandler("dl-core:client:notify", function(notifyText, notifyType, notifyDuration)
	DLCore.Functions.Notify(notifyText, notifyType, notifyDuration)
end)

RegisterNetEvent('dl-core:client:updatePlayerPosition')
AddEventHandler('dl-core:client:updatePlayerPosition', function()
	local position = GetEntityCoords(PlayerPedId())
	TriggerServerEvent('dl-core:client:updatePlayerPosition', position)
end)
