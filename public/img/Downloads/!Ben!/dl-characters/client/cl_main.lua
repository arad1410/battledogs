Characters.mainCam = nil

Characters.characters = {}

Characters.secondCam = nil

local activePed = nil

local inSelecting = false

local selectedCid = nil

local switching = false

Characters.thread = nil

local DLCore = exports["dl-core"]:GetCoreObject()



Characters.Config.Camera.fov = Characters.Config.Camera.fov * 1920 / 1080



CreateThread(function()

	while ( not NetworkIsSessionStarted() ) do Wait(50) end

	TriggerServerEvent("dl-characters:setPlayerInCharactersMode")

end)



RegisterNetEvent("dl-characters:initCharacters")

AddEventHandler("dl-characters:initCharacters", function()

    Characters:Init()

end)



RegisterNetEvent("dl:multicharacters:logout")

AddEventHandler("dl:multicharacters:logout",function()

    if not inSelecting then

        Characters:Init()

    end

end)



RegisterNetEvent("dl-characters:setPlayerInClothingMode")

AddEventHandler("dl-characters:setPlayerInClothingMode",function()
    DoScreenFadeOut(10)
    Wait(1000)
    local interior = GetInteriorAtCoords(-811.89245605469, 175.08549499512, 76.745391845703)
    LoadInterior(interior)
    while not IsInteriorReady(interior) do
        Wait(1000)
    end
    Characters:Reset()
    SetEntityCoords(PlayerPedId(),-811.89245605469, 175.08549499512, 76.745391845703)
    NetworkSetEntityInvisibleToNetwork(PlayerPedId(),true)
    TriggerEvent("dl-clothing:setclothes",{})
    DoScreenFadeIn(500)
    Wait(500)
	FreezeEntityPosition(PlayerPedId(), true)
	
    -- DoScreenFadeOut(10)
    -- Characters:Reset()
    -- Wait(1000)
    -- TriggerEvent("dl-apartments:client:init")
    -- DoScreenFadeIn(500)
    -- Wait(500)
end)







function Characters:Reset()

    SendNUIMessage({

        action="clearscreen"

    })

    inSelecting = false

    selectedChar = nil

    activePed = nil

    self.thread = nil

    self.secondCam = nil

    SetNuiFocus(false)

    NetworkSetEntityInvisibleToNetwork(PlayerPedId(),false)

    if #self.characters > 0 then

        for _,ped in pairs(self.characters) do

            DeletePed(ped.ped)

        end

        self.characters = {}

    end

    RenderScriptCams(false, false, 1, true, true)

    DestroyAllCams(true)

end



function Characters:Init()

    self:Reset()

    inSelecting = true

    DoScreenFadeOut(1000)

    Wait(1000)

    local ped = PlayerPedId()

    SetEntityCoords(ped,self.Config.Camera.coords.xy,self.Config.Camera.coords.z - 30.0)

    NetworkSetEntityInvisibleToNetwork(ped,true)

    if not DoesCamExist(self.mainCam) then

        self.mainCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

    end

    local sx, sy = GetActiveScreenResolution()

    self:CreateCharacters()

    SetCamActive(self.mainCam, true)

    SetCamRot(self.mainCam,self.Config.Camera.rot, true)

    SetCamFov(self.mainCam,self.Config.Camera.fov * sy/sx)

    SetCamCoord(self.mainCam, self.Config.Camera.coords)

    PointCamAtCoord(self.mainCam,self.Config.Camera.coords)

    RenderScriptCams(true, false, 2500.0, true, true)

    SetFocusPosAndVel(self.Config.Camera.coords,0.0,0.0,0.0)



    for _,char in pairs(self.characters) do

        SetEntityVisible(char.ped,true)

    end

end



function Characters:CreateCharacters()

    DLCore.Functions.TriggerCallback("dl:multicharacters:getCharacters", function(characters)

        for slot, loc in ipairs(self.Config.Locations) do

            local char = characters[slot]

            local chardata = {}

            if char == nil then

                chardata = {

                    name = "Create New",

                    citizenid = ""

                }

            else

                chardata = {

                    name =  char.info.firstname.." "..char.info.lastname,

                    nationality = char.info.nationality,

                    citizenid = char.citizenid,

                    dob = char.info.birthdate,

                    job = char.job.label,

                    cash = char.money.cash,

                    bank = char.money.bank,

                    phone = char.info.phone

                }

            end

            self.characters[#self.characters+1] = {

                ped = self:CreatePed(loc,char),

                isNew = char == nil,

                data = chardata,

                clothing = char ~= nil and char or {},

                cid = slot

            }

        end

        for _,ped in pairs(Characters.characters) do

            SetEntityVisible(ped.ped,true)

        end

        ShutdownLoadingScreenNui()

        ShutdownLoadingScreen()

        SetNuiFocus(true,true)

        self:Thread()

        DoScreenFadeIn(500)

    end)

end



RegisterNetEvent("dl:multicharacters:spawnCharacter")

AddEventHandler("dl:multicharacters:spawnCharacter",function (isNew,gender)

    SendNUIMessage({

        action="clearscreen"

    })

    print(isNew)

    if not isNew then

		--[[

        local selectedData = selectedChar.clothing

        DoScreenFadeOut(500)

        local ped = PlayerPedId()

        Wait(1000)

        SwitchOutPlayer(ped, 0,1)

        Characters:Reset()

        Wait(1000)

        SetEntityCoords(PlayerPedId(),686.03149414063, 582.71429443359, 145.86776733398)

        Wait(500)

        DoScreenFadeIn(500)

        Wait(500)

        local coords = exports["dl-spawnselector"]:OpenSpawner()

        StartPlayerTeleport(ped,coords.x, coords.y, coords.z,0.0,false,true,false)

        SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z)

        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, 0.0, true, false)

        SwitchInPlayer(ped)

        while GetPlayerSwitchState() ~= 8 do

            Wait(100)

        end

        TriggerEvent("dl-clothing:setclothes",selectedData)

		]]--

		local selectedData = selectedChar.clothing

		DoScreenFadeOut(500)

		Characters:Reset()

        Wait(500)

        local inJail = DLCore.Functions.GetPlayerData().metadata["injail"]
        if (inJail) then
            SetEntityCoords(PlayerPedId(), 1680.1171875, 2513.417236328125, 45.56484985351562)
        else

            exports["dl-spawnselector"]:OpenSpawnSelection(function(spawnLocation)
                if (spawnLocation == "apartment") then
                    TriggerEvent("dl-apartments:client:init")
                elseif (spawnLocation == "lastLocation") then
                    local lastPosition = DLCore.Functions.GetPlayerData().position
                    SetEntityCoords(PlayerPedId(), lastPosition.x, lastPosition.y, lastPosition.z, 0.0, 0.0, 0.0)
                end
            end)
        end

		TriggerEvent("dl-clothing:setclothes",selectedData)

		Wait(1000)

		DoScreenFadeIn(500)
		
		TriggerEvent("dl-core:client:onPlayerLoaded")

		TriggerServerEvent("dl-core:server:onPlayerLoaded")

    else

        DoScreenFadeOut(500)

        Wait(500)

        Characters:Reset()

        RequestCutsceneWithPlaybackList("MP_INTRO_CONCAT", 31, 8)



        while not HasThisCutsceneLoaded("MP_INTRO_CONCAT") do

            Wait(100)

        end



        DoScreenFadeIn(500)

        local PlayerPed = PlayerPedId()

        local Sex = gender

        SetFocusPosAndVel(-1141.2520751953, -1621.3182373047, 4.4060635566711,0.0,0.0,0.0)

        SetEntityCoords(PlayerPed,-1141.2520751953, -1621.3182373047, 4.4060635566711)





        local ModelOne = Sex == 0 and "MP_Male_Character" or "MP_Female_Character"

        local ModelTwo = Sex == 0 and "MP_Female_Character" or "MP_Male_Character"



        RegisterEntityForCutscene(PlayerPed, ModelOne, 0, 0, 0)

        StartCutscene(4)



        while not DoesCutsceneEntityExist(ModelTwo) do

            Wait(100)

        end



        SetEntityVisible(GetEntityIndexOfCutsceneEntity(ModelTwo), false)



		for pedIndex = 1, 8 do

			RegisterEntityForCutscene(0, "MP_Plane_Passenger_" .. pedIndex, 3, `mp_m_freemode_01`, 0)

			SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_" .. pedIndex, 0, 0)

		end



        local Plane = GetEntityIndexOfCutsceneEntity("MP_Plane")



        Wait(4000-GetCutsceneTime())



        while GetCutsceneTime() < 34500 and DoesEntityExist(Plane) do

            local pos = GetEntityCoords(PlayerPedId())

            local pos2 = GetEntityCoords(Plane)

            if Vdist2(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 62500 then

                SetEntityCoords(PlayerPedId(), pos2)

            end



            Wait(1000)

        end



		print("1")

        Wait(35000-GetCutsceneTime())

		print("2")

        DoScreenFadeOut(2000)

        Wait(2000)

        StopCutsceneImmediately()

        -- PlayerPed = PlayerPedId()

        -- SetFocusPosAndVel(-1038.04, -2737.45, 20.16,0.0,0.0,0.0)

        -- SetEntityCoords(PlayerPed, -1038.04, -2737.45, 20.16)

        -- SetEntityHeading(PlayerPed, 325.0)

        -- SetEntityVelocity(PlayerPed, 0.0, 0.0, 0.0)
		TriggerEvent("dl-core:client:onPlayerLoaded")

		TriggerServerEvent("dl-core:server:onPlayerLoaded")
		
		TriggerEvent("dl-apartments:client:init")

        Wait(800)
		
        DoScreenFadeIn(1200)

        ClearFocus()

    end

end)



RegisterNUICallback("register",function(data,cb)

    if selectedChar ~= nil and selectedChar.ped ~= nil and not switching then

        switching = true

        SetCamActiveWithInterp(Characters.mainCam ,Characters.secondCam , 750, 200, 200)

        for _,char in pairs(Characters.characters) do

            if char.ped ~= selctedPed then

                SetEntityVisible(char.ped,true)

            end

        end

        data.r_data.cid = selectedChar.cid

        local newData = {

            cid = selectedChar.cid,

            charinfo = {

                firstname=data.r_data.firstname,

                lastname = data.r_data.lastname,

                birthdate = data.r_data.date,

                gender = (data.r_data.gender == "male") and 0 or 1,

                nationality = data.r_data.nationality

            }

        }

        selectedChar = nil

        cb("false")

        Wait(700)

        switching = false

        TriggerServerEvent("dl:multicharacters:registerCharacter",newData)

    end

end)



RegisterNUICallback("playChar",function (data,cb)

		print("playChar:client", selectedChar.data.citizenid)

    TriggerServerEvent("dl:multicharacters:loadCharacter", selectedChar.data.citizenid)

end)



RegisterNUICallback("delete",function(data,cb)

    DLCore.Functions.TriggerCallback("dl:multicharacters:deleteCharacter",function()

        SendNUIMessage({

            action = "reset"

        })

        DoScreenFadeOut(500)

        Wait(500)

        Characters:Init()

    end,selectedChar.data.citizenid)

end)



RegisterNUICallback("click_event",function(data,cb)

    local primary = data.primary



    if primary then

        if(activePed) ~= nil and not switching then

            switching = true

            if not DoesCamExist(Characters.secondCam) then

                Characters.secondCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

            end

            selectedChar = activePed

            for _,char in pairs(Characters.characters) do

                if char.ped ~= selectedChar.ped then

                    SetEntityVisible(char.ped,false)

                end

            end

            SetCamCoord(Characters.secondCam,Characters.Config.Camera.coords)

            local rx,ry,rz = table.unpack(GetEntityCoords(selectedChar.ped))

            PointCamAtCoord(Characters.secondCam,rx,ry,rz-0.1)

            SetCamFov(Characters.secondCam,15.0)

            if selectedChar.cid == 5 or selectedChar.cid == 1 then SetCamFov(Characters.secondCam,17.5) end

            SendNUIMessage({

                action = "hideIcons"

            })

            SetCamActiveWithInterp(Characters.secondCam, Characters.mainCam, 750, 200, 200)

            if selectedChar.isNew then

                cb("register")

            else

                cb(selectedChar.data)

            end

            Wait(750)

            switching = false

        else

            cb("none")

        end

    else

        if selectedChar ~= nil and selectedChar.ped ~= nil and not switching then

            switching = true

            SetCamActiveWithInterp(Characters.mainCam ,Characters.secondCam , 750, 200, 200)

            for _,char in pairs(Characters.characters) do

                if char.ped ~= selectedChar.ped then

                    SetEntityVisible(char.ped,true)

                end

            end

            selectedChar = nil

            cb("true")

            Wait(700)

            switching = false

        end

    end

end)



function Characters:Thread()

    Characters.thread = CreateThread(function()

        local temp = false

        while inSelecting do

            local hit,coords,entity = GetEntityMouseOn(Characters.mainCam)

            local found = false

            for _, char in pairs(Characters.characters) do

              if entity == char.ped and selectedChar == nil then

                activePed = char

                SendNUIMessage({

                  action = "showDetails",

                  data = char.data

                })

                temp = true

                found = true

              end

            end

            if not found and temp then

                activePed = nil

              SendNUIMessage({

                action = "clearDetails"

              })

              temp = false

            end

            Wait(200)

        end

    end)

end



AddEventHandler("onResourceStop",function(res)

    if res == GetCurrentResourceName() then

        Characters:Reset()

    end

end)



RegisterCommand("characters:fix",function()

    SetNuiFocus(true,true)

end)

