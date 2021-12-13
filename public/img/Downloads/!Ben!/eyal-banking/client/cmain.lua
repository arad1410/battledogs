RLCore = nil
TriggerEvent('RLCore:GetObject', function(obj) RLCore = obj end)

local docReady = false

local temp = {}

RegisterNetEvent('bb-banking:client:setNui')
AddEventHandler('bb-banking:client:setNui', function(authData, nuiData, cryptoData)
    BBBankingCore['config']['authorized'] = authData
    temp[1] = nuiData
    temp[2] = cryptoData
	
    SendNUIMessage({type = 'nui', lang = Locales.Nui, sets = temp[1]})
	SendNUIMessage({type = 'crypto', crypto = temp[2]})
    SendNUIMessage(temp[2])
    TriggerServerEvent('bb-banking:server:isRegistered')
end)

RegisterNetEvent('bb-banking:client:refreshNuiNew')
AddEventHandler('bb-banking:client:refreshNuiNew', function(isATM)
	BBBankingCore['functions'].RefreshNui(isATM)
end)

--[[
RegisterNetEvent('bb-banking:client:updateCrypto')
AddEventHandler('bb-banking:client:updateCrypto', function(data)
	 SendNUIMessage({type = 'crypto', auth = authData})
end)
--]]
CreateThread(function()
	while RLCore == nil or RLCore.Functions.GetPlayerData() == nil or RLCore.Functions.GetPlayerData().money == nil or not docReady do
		Citizen.Wait(100)
	end
	
	
	
	--print('loaded account')
    BBBankingCore['functions'].CreateBlips()

	isPopup = false
	
	Citizen.Wait(1000) -- Compensates the 1 second delay when getting the current crypto prices ( prevents restart spam of script )
	
	while true do
		
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		local closestBank, closestDst = BBBankingCore['functions'].GetClosestBank(pos)
		
		local w = 3
		if closestDst < 4.0 then
			if IsControlJustPressed(0, 38) then
				--print('here')
				BBBankingCore['functions'].OpenNui()
			end
			if BBBankingCore['config']['popupText'] and not isPopup then
				BBBankingCore['functions'].PopupText(true, 'bank', 'E')
			end
		else
			if BBBankingCore['config']['atmPopupText'] == true then
				local foundATM = false
				for k, v in pairs(BBBankingCore['config']['atmModels']) do
					local hash = GetHashKey(v)
					local atm = IsObjectNearPoint(hash, pos.x, pos.y, pos.z, 1.9)
					if atm then
						foundATM = true 
						if IsControlJustPressed(0, 38) then
							ExecuteCommand('atm')
						end

						if not isATMPopup then
							BBBankingCore['functions'].PopupText(true, 'atm', 'E')
						end
						w = 3
					end
				end

				if not foundATM then
					if isATMPopup then
						BBBankingCore['functions'].PopupText(false, 'atm', 'E')
					end
					w = 10
				end

				if isPopup then
					BBBankingCore['functions'].PopupText(false, 'bank', 'E')
					w = 10
				end
			else
				BBBankingCore['functions'].PopupText(false, 'bank', 'E')
				w = 10
			end
		end
		Wait(w)
	end
end)

RegisterCommand('atm', function()
    TriggerServerEvent('bb-banking:server:checkCards')
end)

RegisterNetEvent('bb-banking:client:triggerAtm')
AddEventHandler('bb-banking:client:triggerAtm', function(data, nui, fees)
    if data.cards ~= nil and data.cards[1] ~= nil then
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed, true)
        for k, v in pairs(BBBankingCore['config']['atmModels']) do
            local hash = GetHashKey(v)
            local atm = IsObjectNearPoint(hash, playerCoords.x, playerCoords.y, playerCoords.z, 1.7)
            if atm then 
                local obj = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 2.0, hash, false, false, false)
                local atmCoords = GetEntityCoords(obj, false)
                SetNuiFocus(true, true)
                SendNUIMessage({
                    type = "atm",
                    atmCards = data,
					fees = fees,
					nui = nui
                })
            end
        end     
    else
        RLCore.Functions.Notify("To use ATM you need to open a credit card", "error")
    end
end)


RegisterNetEvent('bb-banking:client:updateAtm')
AddEventHandler('bb-banking:client:updateAtm', function(data, nui, fees)
    if data.cards ~= nil and data.cards[1] ~= nil then
		SendNUIMessage({
			type = "refresh",
			atmCards = data,
			fees = fees,
			nui = nui
		})
    else
        RLCore.Functions.Notify("To use ATM you need to open a credit card", "error")
    end
end)

RegisterNetEvent('bb-banking:client:triggerWallet')
AddEventHandler('bb-banking:client:triggerWallet', function(json)
    SetNuiFocus(true, true)
    SendNUIMessage(json)
end)

RegisterNetEvent('bb-banking:client:refreshNui')
AddEventHandler('bb-banking:client:refreshNui', function(json, f)
    SendNUIMessage(json)
end)

RegisterCommand('bbnui', function()
    SetNuiFocus(false, false)
    SendNUIMessage({type = 'close'})
end)

RegisterCommand('nui', function()
    SetNuiFocus(false, false)
    SendNUIMessage({type = 'close'})
end)

-- NUI Callbacks
RegisterNUICallback('closeNui', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('finishAuth', function()	
	docReady = true
end)

RegisterNUICallback('withdrawEvent', function(data)
    TriggerServerEvent('bb-banking:server:withdrawEvent', data)
end)

RegisterNUICallback('depositEvent', function(data)
    TriggerServerEvent('bb-banking:server:depositEvent', data)
end)

RegisterNUICallback('transferEvent', function(data)
    TriggerServerEvent('bb-banking:server:transferEvent', data)
end)

RegisterNUICallback('cardEvent', function(data)
	-- Eyal282 didn't do this yet.
	
	-- 1. data.action = remove
	-- 2. data.action = disable
	-- 3. data.action = activate
	
	--[[ data.card = 
	{
    "data": {
        "holder": "John Smith",
        "date": "27/06"
    },
    "type": "account",
    "holder": "BWM82248",
    "number": "2975-7072-6636-1184",
    "pin": "1379",
    "identifier": "YZI48693",
    "id": 1,
    "hold": 0
}
	--]]
	if data.action == "withdraw" then
		data.account = "atm" -- for now.
		TriggerServerEvent('bb-banking:server:withdrawEvent', data)
	else
		TriggerServerEvent('bb-banking:server:cardEvent', data)
	end
end)

RegisterNUICallback('cryptoEvent', function(data)
    TriggerServerEvent('bb-banking:server:cryptoEvent', data)
end)
--[[
RegisterNUICallback('walletEvent', function(data, cb)
    local selfid = GetPlayerServerId(PlayerId())
    if selfid == tonumber(data.playerid) then
        return cb({status = 'error', message = 'You can\'t give yourself.'})
    else
        local selfped = GetEntityCoords(PlayerPedId())
        for k, p in pairs(GetActivePlayers()) do
            local pped = GetEntityCoords(GetPlayerPed(p))
            if #(selfped - pped) < 7 then
                if GetPlayerServerId(p) == tonumber(data.playerid) then
                    Core.Functions.TriggerCallback('bb-banking:server:walletEvent', function(resp) 
                        cb(resp)
                    end, data)
                    return
                end
            end
        end
        return cb({status = 'error', message = 'Could not find this player.'})
    end
end)
--]]

RegisterNUICallback('createSavingAccount', function()
    TriggerServerEvent('bb-banking:server:createSavingAccount')
end)

RegisterNUICallback('createCard', function(data)
	-- Eyal282 didn't do this yet.
    TriggerServerEvent('bb-banking:server:createCard', data)
end)
--[[
AddEventHandler('onResourceStarting', function(rn)
    TriggerServerEvent('bbac:validatestarting', rn)
end)

AddEventHandler('onResourceStop', function(rn)
    TriggerServerEvent('bbac:validatestopping', rn)
end)
--]]



function tprint(tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))      
    else
      print(formatting .. v)
    end
  end
end