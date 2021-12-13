DLConfig = {}

DLConfig.MaxPlayers = GetConvarInt("sv_maxclients", 64)
DLConfig.IdentifierType = "steam"
DLConfig.DefaultSpawn = {x = -1035.71, y = -2731.87, z = 12.86, a = 0.0}

DLConfig.Money = {}
DLConfig.Money.MoneyTypes = {["cash"] = 0, ["bank"] = 2500 }
DLConfig.Money.DontAllowMinus = {"cash"}

DLConfig.Player = {}
DLConfig.Player.MaxWeight = 250000
DLConfig.Player.MaxInvSlots = 45

DLConfig.Player.Bloodtypes = {
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
}

DLConfig.Server = {}
DLConfig.Server.PermissionList = {}
