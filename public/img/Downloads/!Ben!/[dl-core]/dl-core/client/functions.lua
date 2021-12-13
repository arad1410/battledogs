DLCore.Functions = {}
DLCore.RequestId = 0

DLCore.Functions.GetPlayerData = function()
    return DLCore.PlayerData
end

DLCore.Functions.LoadAnimDict = function(animDictName)
	if (DoesAnimDictExist(animDictName) and not HasAnimDictLoaded(animDictName)) then
		RequestAnimDict(animDictName)
		while (not HasAnimDictLoaded(animDictName)) do Wait(50) end
	end
end

DLCore.Functions.LoadModel = function(modelName)
	if (IsModelValid(modelName) and not HasModelLoaded(modelName)) then
		RequestModel(modelName)
		while (not HasModelLoaded(modelName)) do Wait(50) end
	end
end

DLCore.Functions.CreateVehicle = function(vehicleHash, vehicleCoords, vehicleHeading, vehicleNetwork, vehicleOwnership, vehicleWarp)
	DLCore.Functions.LoadModel(vehicleHash)
    local vehicle = CreateVehicle(vehicleHash, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, vehicleHeading, vehicleNetwork)
    SetModelAsNoLongerNeeded(vehicleHash)
    if (vehicleOwnership) then exports["dl-hotwire"]:GiveKeys(GetVehicleNumberPlateText(vehicle)) end
    if (vehicleWarp) then SetPedIntoVehicle(PlayerPedId(), vehicle, -1) end
	return vehicle
end

DLCore.Functions.TriggerCallback = function(name, cb, ...)
	DLCore.ServerCallbacks[name] = cb
	TriggerServerEvent("dl-core:server:triggerCallback", name, ...)
end

DLCore.Functions.GetSquaredDistance = function(vectorOne, vectorTwo)
	local squaredDistance = (vectorOne-vectorTwo)
	squaredDistance = (squaredDistance*squaredDistance)
	return (squaredDistance.x + squaredDistance.y + squaredDistance.z)
end

local getClosestFunctions = {
	["vehicle"] = function(coords)
		local vehicleList = GetGamePool("CVehicle")
		local closestDistance = math.huge
		local vehicleCoords, distance, closestVehicle

        for vehicleIndex = 1, #vehicleList do
        		vehicleCoords = GetEntityCoords(vehicleList[vehicleIndex])
        		distance = DLCore.Functions.GetSquaredDistance(coords, vehicleCoords)

        		if (distance < closestDistance) then
        			closestDistance = distance
        			closestVehicle = vehicleList[vehicleIndex]
        		end
        end

		return closestDistance, closestVehicle
	end,
    ["player"] = function(coords)
        local distance
        local localPlayer = PlayerPedId()
        local playersList = GetActivePlayers()
        local closestDistance = math.huge
        local playerPed, playerCoords, closestPlayerPed, closestPlayer

        for playerIndex = 1, #playersList do
            playerPed = GetPlayerPed(playersList[playerIndex])
            if (playerPed ~= localPlayer) then
                playerCoords = GetEntityCoords(playerPed)
                distance = DLCore.Functions.GetSquaredDistance(coords, playerCoords)

                if (distance < closestDistance) then
                    closestDistance = distance
                    closestPlayerPed = playerPed
					closestPlayer = GetPlayerServerId(playersList[playerIndex])
                end
            end
        end

        return closestDistance, closestPlayerPed, closestPlayer
    end
}

DLCore.Functions.GetClosest = function(dataType, coords)
  	return getClosestFunctions[dataType](coords)
end

DLCore.Functions.GetPlayersInArea = function(coords, areaDistance)
    local distance
    local localPlayer = PlayerPedId()
    local playersList = GetActivePlayers()
    -- local closestDistance = math.huge
    local playerPed, playerCoords
    local playersInArea = {}

    for playerIndex = 1, #playersList do
        playerPed = GetPlayerPed(playersList[playerIndex])
        if (playerPed ~= localPlayer) then
            playerCoords = GetEntityCoords(playerPed)
            distance = DLCore.Functions.GetSquaredDistance(coords, playerCoords)

            if (distance < areaDistance) then
                playersInArea[playersInArea + 1] = GetPlayerServerId(playersList[playerIndex])
            end
        end
    end

    return playersInArea
end

DLCore.Functions.GetPlayersFromCoords = function(coords, distance)
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if DoesEntityExist(ped) then
            table.insert(players, player)
        end
    end

    local closePlayers = {}

    if coords == nil then
		coords = GetEntityCoords(PlayerPedId())
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

DLCore.Functions.DrawFloatingNotification = function(message, coords)
	AddTextEntry("dl-core", message)
	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp("dl-core")
	EndTextCommandDisplayHelp(2, false, false, -1)
end

DLCore.Functions.Draw3DText = function(coords, text)
    SetDrawOrigin(coords.x, coords.y, coords.z)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextCentre(1)
    BeginTextCommandWidth("STRING")
    AddTextComponentString(text)
    local textWidth = EndTextCommandGetWidth(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    DrawRect(0.0, 0.0125, textWidth * 1.0, 0.025, 0, 0, 0, 68)
end

local playerCitizenId, playerName, playerServerId
DLCore.Functions.SetupRichPresence = function()
	playerCitizenId = DLCore.PlayerData.citizenid
	playerName = DLCore.PlayerData.charinfo.firstname .. " " .. DLCore.PlayerData.charinfo.lastname
	playerServerId = GetPlayerServerId(PlayerId())

	SetDiscordAppId(859773490100699177)
	SetDiscordRichPresenceAsset("dl-icon")
	SetDiscordRichPresenceAssetSmall("dl-icon")
	SetDiscordRichPresenceAssetSmallText("[DreamCity]")
	SetRichPresence("[" .. playerServerId .. "] " .. playerName .. " [CitizenId: " .. playerCitizenId .. "]")
	SetDiscordRichPresenceAction(0, "Connect", "fivem://connect/b4ba5p")
	SetDiscordRichPresenceAction(1, "Discord", "https://discord.gg/gKcWaUVngu")
end

DLCore.Functions.SetMetadata = function(metaName, metaValue)
    if (type(metaName) == "table") then
        TriggerServerEvent("dl-core:server:setMetadata", metaName)
    elseif (metaName ~= nil and metaValue ~= nil) then
        TriggerServerEvent("dl-core:server:setMetadata", metaName, metaValue)
    end
end

DLCore.Functions.Notify = function(notifyText, notifyType, notifyDuration)
    SendNUIMessage({notifyText = notifyText, notifyType = notifyType and notifyType or "inform", notifyDuration = notifyDuration and notifyDuration or 5000})
end

local progressBarCallback
DLCore.Functions.ProgressBar = function(progressText, progressDuration, callback)
    SendNUIMessage({progressText = progressText, progressDuration = progressDuration and progressDuration or 5000})
    progressBarCallback = callback
end

RegisterNUICallback("finishedProgressBar", function(reusltData)
    progressBarCallback()
end)

DLCore.Functions.StopProgressBar = function()
    SendNUIMessage({stopProgress = true})
    progressBarCallback = nil
end

DLCore.Functions.SplitStr = function(inputString, delimiter)
    local result = {}
    local resultTemp = ""

    for index = 1, #inputString do
        local currentChar = (inputString):sub(index, index)
        if (currentChar ~= delimiter) then
            resultTemp = resultTemp .. currentChar
        else
            result[#result + 1] = resultTemp
            resultTemp = ""
        end
    end

    result[#result + 1] = resultTemp

    return result
end

DLCore.Functions.GetVehicleProperties = function(vehicle)
	local color1, color2               = GetVehicleColours(vehicle)
	local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
	local livery = GetVehicleLivery(vehicle)
	if livery == 0 then
		livery = GetVehicleMod(vehicle, 48)
	end


	return {

		model             = GetEntityModel(vehicle),

		plate             = GetVehicleNumberPlateText(vehicle),
		plateIndex        = GetVehicleNumberPlateTextIndex(vehicle),

		health            = GetEntityHealth(vehicle),
		dirtLevel         = GetVehicleDirtLevel(vehicle),

		color1            = color1,
		color2            = color2,

		pearlescentColor  = pearlescentColor,
		wheelColor        = wheelColor,

		wheels            = GetVehicleWheelType(vehicle),
		windowTint        = GetVehicleWindowTint(vehicle),

		neonEnabled       = {
			IsVehicleNeonLightEnabled(vehicle, 0),
			IsVehicleNeonLightEnabled(vehicle, 1),
			IsVehicleNeonLightEnabled(vehicle, 2),
			IsVehicleNeonLightEnabled(vehicle, 3)
		},

		extras            = {

		},

		neonColor         = table.pack(GetVehicleNeonLightsColour(vehicle)),
		tyreSmokeColor    = table.pack(GetVehicleTyreSmokeColor(vehicle)),

		modSpoilers       = GetVehicleMod(vehicle, 0),
		modFrontBumper    = GetVehicleMod(vehicle, 1),
		modRearBumper     = GetVehicleMod(vehicle, 2),
		modSideSkirt      = GetVehicleMod(vehicle, 3),
		modExhaust        = GetVehicleMod(vehicle, 4),
		modFrame          = GetVehicleMod(vehicle, 5),
		modGrille         = GetVehicleMod(vehicle, 6),
		modHood           = GetVehicleMod(vehicle, 7),
		modFender         = GetVehicleMod(vehicle, 8),
		modRightFender    = GetVehicleMod(vehicle, 9),
		modRoof           = GetVehicleMod(vehicle, 10),

		modEngine         = GetVehicleMod(vehicle, 11),
		modBrakes         = GetVehicleMod(vehicle, 12),
		modTransmission   = GetVehicleMod(vehicle, 13),
		modHorns          = GetVehicleMod(vehicle, 14),
		modSuspension     = GetVehicleMod(vehicle, 15),
		modArmor          = GetVehicleMod(vehicle, 16),

		modTurbo          = IsToggleModOn(vehicle, 18),
		modSmokeEnabled   = IsToggleModOn(vehicle, 20),
		modXenon          = IsToggleModOn(vehicle, 22),

		modFrontWheels    = GetVehicleMod(vehicle, 23),
		modBackWheels     = GetVehicleMod(vehicle, 24),

		modPlateHolder    = GetVehicleMod(vehicle, 25),
		modVanityPlate    = GetVehicleMod(vehicle, 26),
		modTrimA          = GetVehicleMod(vehicle, 27),
		modOrnaments      = GetVehicleMod(vehicle, 28),
		modDashboard      = GetVehicleMod(vehicle, 29),
		modDial           = GetVehicleMod(vehicle, 30),
		modDoorSpeaker    = GetVehicleMod(vehicle, 31),
		modSeats          = GetVehicleMod(vehicle, 32),
		modSteeringWheel  = GetVehicleMod(vehicle, 33),
		modShifterLeavers = GetVehicleMod(vehicle, 34),
		modAPlate         = GetVehicleMod(vehicle, 35),
		modSpeakers       = GetVehicleMod(vehicle, 36),
		modTrunk          = GetVehicleMod(vehicle, 37),
		modHydrolic       = GetVehicleMod(vehicle, 38),
		modEngineBlock    = GetVehicleMod(vehicle, 39),
		modAirFilter      = GetVehicleMod(vehicle, 40),
		modStruts         = GetVehicleMod(vehicle, 41),
		modArchCover      = GetVehicleMod(vehicle, 42),
		modAerials        = GetVehicleMod(vehicle, 43),
		modTrimB          = GetVehicleMod(vehicle, 44),
		modTank           = GetVehicleMod(vehicle, 45),
		modWindows        = GetVehicleMod(vehicle, 46),
		modLivery         = livery,
		modCustomTyres	  = GetVehicleModVariation(vehicle, 23)
	}
end

DLCore.Functions.SetVehicleProperties = function(vehicle, props)
	SetVehicleModKit(vehicle, 0)

	if props.plate ~= nil then
		SetVehicleNumberPlateText(vehicle, props.plate)
	end

	if props.plateIndex ~= nil then
		SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex)
	end

	if props.health ~= nil then
		SetEntityHealth(vehicle, props.health)
	end

	if props.dirtLevel ~= nil then
		SetVehicleDirtLevel(vehicle, props.dirtLevel)
	end

	if props.color1 ~= nil then
		local color1, color2 = GetVehicleColours(vehicle)
		SetVehicleColours(vehicle, props.color1, color2)
	end

	if props.color2 ~= nil then
		local color1, color2 = GetVehicleColours(vehicle)
		SetVehicleColours(vehicle, color1, props.color2)
	end

	if props.pearlescentColor ~= nil then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
	end

	if props.wheelColor ~= nil then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleExtraColours(vehicle, pearlescentColor, props.wheelColor)
	end

	if props.wheels ~= nil then
		SetVehicleWheelType(vehicle, props.wheels)
	end

	if props.windowTint ~= nil then
		SetVehicleWindowTint(vehicle, props.windowTint)
	end

	if props.neonEnabled ~= nil then
		SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1])
		SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2])
		SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3])
		SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4])
	end

	if props.neonColor ~= nil then
		SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
	end

	if props.modSmokeEnabled ~= nil then
		ToggleVehicleMod(vehicle, 20, true)
	end

	if props.tyreSmokeColor ~= nil then
		SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
	end

	if props.modSpoilers ~= nil then
		SetVehicleMod(vehicle, 0, props.modSpoilers, false)
	end

	if props.modFrontBumper ~= nil then
		SetVehicleMod(vehicle, 1, props.modFrontBumper, false)
	end

	if props.modRearBumper ~= nil then
		SetVehicleMod(vehicle, 2, props.modRearBumper, false)
	end

	if props.modSideSkirt ~= nil then
		SetVehicleMod(vehicle, 3, props.modSideSkirt, false)
	end

	if props.modExhaust ~= nil then
		SetVehicleMod(vehicle, 4, props.modExhaust, false)
	end

	if props.modFrame ~= nil then
		SetVehicleMod(vehicle, 5, props.modFrame, false)
	end

	if props.modGrille ~= nil then
		SetVehicleMod(vehicle, 6, props.modGrille, false)
	end

	if props.modHood ~= nil then
		SetVehicleMod(vehicle, 7, props.modHood, false)
	end

	if props.modFender ~= nil then
		SetVehicleMod(vehicle, 8, props.modFender, false)
	end

	if props.modRightFender ~= nil then
		SetVehicleMod(vehicle, 9, props.modRightFender, false)
	end

	if props.modRoof ~= nil then
		SetVehicleMod(vehicle, 10, props.modRoof, false)
	end

	if props.modEngine ~= nil then
		SetVehicleMod(vehicle, 11, props.modEngine, false)
	end

	if props.modBrakes ~= nil then
		SetVehicleMod(vehicle, 12, props.modBrakes, false)
	end

	if props.modTransmission ~= nil then
		SetVehicleMod(vehicle, 13, props.modTransmission, false)
	end

	if props.modHorns ~= nil then
		SetVehicleMod(vehicle, 14, props.modHorns, false)
	end

	if props.modSuspension ~= nil then
		SetVehicleMod(vehicle, 15, props.modSuspension, false)
	end

	if props.modArmor ~= nil then
		SetVehicleMod(vehicle, 16, props.modArmor, false)
	end

	if props.modTurbo ~= nil then
		ToggleVehicleMod(vehicle,  18, props.modTurbo)
	end

	if props.modXenon ~= nil then
		ToggleVehicleMod(vehicle,  22, props.modXenon)
	end

	if props.modFrontWheels ~= nil then
		SetVehicleMod(vehicle, 23, props.modFrontWheels, false)
	end

	if props.modBackWheels ~= nil then
		SetVehicleMod(vehicle, 24, props.modBackWheels, false)
	end

	if props.modPlateHolder ~= nil then
		SetVehicleMod(vehicle, 25, props.modPlateHolder, false)
	end

	if props.modVanityPlate ~= nil then
		SetVehicleMod(vehicle, 26, props.modVanityPlate, false)
	end

	if props.modTrimA ~= nil then
		SetVehicleMod(vehicle, 27, props.modTrimA, false)
	end

	if props.modOrnaments ~= nil then
		SetVehicleMod(vehicle, 28, props.modOrnaments, false)
	end

	if props.modDashboard ~= nil then
		SetVehicleMod(vehicle, 29, props.modDashboard, false)
	end

	if props.modDial ~= nil then
		SetVehicleMod(vehicle, 30, props.modDial, false)
	end

	if props.modDoorSpeaker ~= nil then
		SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false)
	end

	if props.modSeats ~= nil then
		SetVehicleMod(vehicle, 32, props.modSeats, false)
	end

	if props.modSteeringWheel ~= nil then
		SetVehicleMod(vehicle, 33, props.modSteeringWheel, false)
	end

	if props.modShifterLeavers ~= nil then
		SetVehicleMod(vehicle, 34, props.modShifterLeavers, false)
	end

	if props.modAPlate ~= nil then
		SetVehicleMod(vehicle, 35, props.modAPlate, false)
	end

	if props.modSpeakers ~= nil then
		SetVehicleMod(vehicle, 36, props.modSpeakers, false)
	end

	if props.modTrunk ~= nil then
		SetVehicleMod(vehicle, 37, props.modTrunk, false)
	end

	if props.modHydrolic ~= nil then
		SetVehicleMod(vehicle, 38, props.modHydrolic, false)
	end

	if props.modEngineBlock ~= nil then
		SetVehicleMod(vehicle, 39, props.modEngineBlock, false)
	end

	if props.modAirFilter ~= nil then
		SetVehicleMod(vehicle, 40, props.modAirFilter, false)
	end

	if props.modStruts ~= nil then
		SetVehicleMod(vehicle, 41, props.modStruts, false)
	end

	if props.modArchCover ~= nil then
		SetVehicleMod(vehicle, 42, props.modArchCover, false)
	end

	if props.modAerials ~= nil then
		SetVehicleMod(vehicle, 43, props.modAerials, false)
	end

	if props.modTrimB ~= nil then
		SetVehicleMod(vehicle, 44, props.modTrimB, false)
	end

	if props.modTank ~= nil then
		SetVehicleMod(vehicle, 45, props.modTank, false)
	end

	if props.modWindows ~= nil then
		SetVehicleMod(vehicle, 46, props.modWindows, false)
	end

	if props.modLivery ~= nil then
		SetVehicleMod(vehicle, 48, props.modLivery, false)
		SetVehicleLivery(vehicle, props.modLivery)
	end
	if props.modCustomTyres ~= nil and props.modCustomTyres then
		SetVehicleMod(vehicle, 23, props.modCustomTyres, true)
	end
end
