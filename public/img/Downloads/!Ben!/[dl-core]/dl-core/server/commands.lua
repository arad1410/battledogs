DLCore.Commands = {}
DLCore.Commands.List = {}

DLCore.Commands.Add = function(name, help, arguments, argsrequired, callback, permission) -- [name] = command name (ex. /givemoney), [help] = help text, [arguments] = arguments that need to be passed (ex. {{name="id", help="ID of a player"}, {name="amount", help="amount of money"}}), [argsrequired] = set arguments required (true or false), [callback] = function(source, args) callback, [permission] = rank or job of a player
    DLCore.Commands.List[name:lower()] = {
        name = name:lower(),
        permission = permission ~= nil and permission:lower() or "user",
        help = help,
        arguments = arguments,
        argsrequired = argsrequired,
        callback = callback,
    }
end

DLCore.Commands.Refresh = function(source)
    local Player = DLCore.Functions.GetPlayer(tonumber(source))
    if Player ~= nil then
        for command, info in pairs(DLCore.Commands.List) do
            if DLCore.Functions.HasPermission(source, "god") or DLCore.Functions.HasPermission(source, DLCore.Commands.List[command].permission) then
                TriggerClientEvent('chat:addSuggestion', source, "/"..command, info.help, info.arguments)
            end
        end
    end
end