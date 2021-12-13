
local DLCore = exports["dl-core"]:GetCoreObject()
DLCore.Functions.CreateCallback("dl:multicharacters:getCharacters", function(src, cb)
    local steamId = GetPlayerIdentifier(src, 0)
    local query = [[
        SELECT *,p.citizenid FROM players AS `p`
        LEFT JOIN character_current AS `cc` ON p.citizenid = cc.citizenid
        LEFT JOIN character_face AS `cf` ON p.citizenid = cf.citizenid
        LEFT JOIN playerstattoos AS `cg` ON p.citizenid = cg.citizenid
        WHERE p.steam='%s' and deleted = '0'
    ]]
	local result = DLCore.Functions.ExecuteSql((query):format(steamId))
	if result ~= nil then
	    local characters = {}
	    for _,char in ipairs(result) do
	        char.info = json.decode(char.charinfo)
	        char.money = json.decode(char.money)
	        char.job = json.decode(char.job)


	        if char.model ~= nil then
	            char.model = char.model
	            char.drawables = json.decode(char.drawables)
	            char.props = json.decode(char.props)
	            char.drawtextures = json.decode(char.drawtextures)
	            char.proptextures = json.decode(char.proptextures)
	        else
	            char.model = "1885233650"
	            char.drawables = json.decode('{"1":["masks",0],"2":["hair",0],"3":["torsos",0],"4":["legs",0],"5":["bags",0],"6":["shoes",1],"7":["neck",0],"8":["undershirts",0],"9":["vest",0],"10":["decals",0],"11":["jackets",0],"0":["face",0]}')
	            char.props = json.decode('{"1":["glasses",-1],"2":["earrings",-1],"3":["mouth",-1],"4":["lhand",-1],"5":["rhand",-1],"6":["watches",-1],"7":["braclets",-1],"0":["hats",-1]}')
	            char.drawtextures = json.decode('[["face",0],["masks",0],["hair",0],["torsos",0],["legs",0],["bags",0],["shoes",2],["neck",0],["undershirts",1],["vest",0],["decals",0],["jackets",11]]')
	            char.proptextures = json.decode('[["hats",-1],["glasses",-1],["earrings",-1],["mouth",-1],["lhand",-1],["rhand",-1],["watches",-1],["braclets",-1]]')
	        end
	        if char.headBlend ~= nil then
	            char.headBlend = json.decode(char.headBlend)
	            char.hairColor = json.decode(char.hairColor)
	            char.headStructure = json.decode(char.headStructure)
	            char.headOverlay = json.decode(char.headOverlay)
	        end
            print(json.encode(char.tattoos))
            if char.tattoos ~= nil then
                char.tattoos = json.decode(char.tattoos)
            end
	        characters[char.cid] = char
	    end
	    cb(characters)
	end
end)

DLCore.Functions.CreateCallback("dl:multicharacters:deleteCharacter", function(src,cb,cid)
    local Source = src
    local result = DLCore.Functions.ExecuteSql("DELETE FROM `players` WHERE `citizenid` = '" .. cid .. "'")

	if result then
        cb(true)
    end
    -- DLCore.Player.DeleteCharacter(Source, cid)
    -- exports.ghmattimysql:execute("SELECT * FROM players WHERE steam = @steam AND citizenid=@citizenid", {["@steam"] = steamId,["@citizenid"]=cid}, function(result)
    --     cb(result)
    -- end)
end)

RegisterNetEvent("dl-characters:setPlayerInCharactersMode")
AddEventHandler("dl-characters:setPlayerInCharactersMode", function()
    local src = tonumber(source)
    SetPlayerRoutingBucket(src,1)
    TriggerClientEvent("dl-characters:initCharacters",src)
end)

RegisterNetEvent("dl:multicharacters:loadCharacter")
AddEventHandler("dl:multicharacters:loadCharacter",function (citizenid)
    local src = source
    print("playChar:server", citizenid)
    if citizenid ~= nil then
        local success = DLCore.Player.Login(src, citizenid)
        print("dl:multicharacters", tostring(success))
        if success then
            print("loaded2")
            print('^2[dl-core]^7 '..GetPlayerName(src)..' has succesfully loaded!')
            TriggerClientEvent("dl:multicharacters:spawnCharacter",src)
            loadHouseData()
            SetPlayerRoutingBucket(src,0)
        end
    end
end)

RegisterNetEvent("dl:multicharacters:registerCharacter")
AddEventHandler("dl:multicharacters:registerCharacter", function(data)
    local src = source
    if DLCore.Player.Login(src, false, data) then
        print('^2[dl-core]^7 '..GetPlayerName(src)..' has succesfully created and loaded!')
        TriggerClientEvent("dl-characters:setPlayerInClothingMode",src)
        GiveStarterItems(src)
        loadHouseData()
	end
end)

RegisterNetEvent("dl-characters:loadNewPlayer")
AddEventHandler("dl-characters:loadNewPlayer",function ()
    local src = tonumber(source)
    local Player = DLCore.Functions.GetPlayer(src)
    GiveStarterItems(src)
    TriggerClientEvent("dl:multicharacters:spawnCharacter",src,true,Player.PlayerData.charinfo.gender)
    SetPlayerRoutingBucket(src,0)
end)

RegisterCommand("logout",function(source)
    local src = tonumber(source)
    DLCore.Player.Logout(src)
    SetPlayerRoutingBucket(src,1)
    TriggerClientEvent("dl:multicharacters:logout",src)
end)

function GiveStarterItems(src)
    local Player = DLCore.Functions.GetPlayer(src)

    for k, v in pairs(DLCore.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "A1-A2-A | AM-B | C1-C-CE"
        end
        Player.Functions.AddItem(v.item, 1, false, info)
    end
end

function loadHouseData()
    local HouseGarages = {}
    local Houses = {}
	DLCore.Functions.ExecuteSql("SELECT * FROM `houselocations`", function(result)
		if result[1] ~= nil then
			for k, v in pairs(result) do
				local owned = false
				if tonumber(v.owned) == 1 then
					owned = true
				end
				local garage = v.garage ~= nil and json.decode(v.garage) or {}
				Houses[v.name] = {
					coords = json.decode(v.coords),
					owned = v.owned,
					price = v.price,
					locked = true,
					adress = v.label,
					tier = v.tier,
					garage = garage,
					decorations = {},
				}
				HouseGarages[v.name] = {
					label = v.label,
					takeVehicle = garage,
				}
			end
		end
		TriggerClientEvent("dl-garages:client:houseGarageConfig", -1, HouseGarages)
		TriggerClientEvent("dl-houses:client:setHouseConfig", -1, Houses)
	end)
end
