DLCore = {}
DLCore.Config = DLConfig
DLCore.Shared = DLShared
DLCore.ServerCallbacks = {}
DLCore.UseableItems = {}

function GetCoreObject()
	return DLCore
end

RegisterServerEvent("dl-core:getObject")
AddEventHandler("dl-core:getObject", function(cb)
	cb(GetCoreObject())
end)

exports("GetCoreObject", GetCoreObject)
