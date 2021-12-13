DLCore = {}
DLCore.PlayerData = {}
DLCore.Config = DLConfig
DLCore.Shared = DLShared
DLCore.ServerCallbacks = {}

isLoggedIn = false

function GetCoreObject()
	return DLCore
end

RegisterNetEvent("dl-core:getObject")
AddEventHandler("dl-core:getObject", function(cb)
	cb(GetCoreObject())
end)

RegisterNetEvent("dl-core:client:onPlayerLoaded")
AddEventHandler("dl-core:client:onPlayerLoaded", function()
	DLCore.Functions.SetupRichPresence()
	isLoggedIn = true
end)

RegisterNetEvent("dl-core:client:onPlayerUnload")
AddEventHandler("dl-core:client:onPlayerUnload", function()
    isLoggedIn = false
end)

CreateThread(function()
    NetworkClearClockTimeOverride()
    ClearOverrideWeather()
    RequestModel(1885233650)
    while not HasModelLoaded(1885233650) do Wait(100) end
    SetPlayerModel(PlayerId(), 1885233650)
    SetModelAsNoLongerNeeded(1885233650)
    local playerPed = PlayerPedId()
    SetEntityCoordsNoOffset(playerPed, 0.0, 0.0, 70.0)
    NetworkResurrectLocalPlayer(0.0, 0.0, 70.0, 0.0, true, false)
    SetPedHeadBlendData(playerPed, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, true)
    SetPedDefaultComponentVariation(playerPed)
    SetEntityVisible(playerPed, true)
    FreezeEntityPosition(playerPed, false)

	NetworkSetFriendlyFireOption(true) -- Enable Friendly Fire
	SetCanAttackFriendly(playerPed, true, true) -- Enable Friendly Fire
	SetMaxWantedLevel(0) -- Set Max Wanted Level to 0
	SetCreateRandomCops(0) -- Prevent AI Cop Creation
	SetCreateRandomCopsNotOnScenarios(0) -- Prevent AI Cop Creation
	SetCreateRandomCopsOnScenarios(0) -- Prevent AI Cop Creation
	SetPlayerHealthRechargeLimit(PlayerId(), 0) -- Disable Health Recharge
	SetPedSuffersCriticalHits(playerPed, false) -- Disable Critical Hits
	SetPedMinGroundTimeForStungun(playerPed, 10000) -- Time spent on ground after being tased (in ms)
	SetPedConfigFlag(ped, 184, true) -- Disable Seat Shuffle
	SetPedConfigFlag(ped, 35, false) -- Disable Automatic Bike Helmet
end)

exports("GetCoreObject", GetCoreObject)
