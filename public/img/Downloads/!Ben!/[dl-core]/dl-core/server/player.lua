DLCore.Players = {}

DLCore.Player = {}



DLCore.Player.Login = function(source, citizenid, newData)

	if source ~= nil then

		if citizenid then

			local loginPlayerData = DLCore.Functions.ExecuteSql("SELECT * FROM `players` WHERE `citizenid` = '"..citizenid.."'")

			local PlayerData = loginPlayerData[1]

			if (PlayerData ~= nil) then

				PlayerData.money = json.decode(PlayerData.money)

				PlayerData.job = json.decode(PlayerData.job)

				PlayerData.position = json.decode(PlayerData.position)

				PlayerData.metadata = json.decode(PlayerData.metadata)

				PlayerData.charinfo = json.decode(PlayerData.charinfo)

				PlayerData.inventory = json.decode(PlayerData.inventory)

				if PlayerData.gang ~= nil then

					PlayerData.gang = json.decode(PlayerData.gang)

				else

					PlayerData.gang = {}

				end

			end

			DLCore.Player.CheckPlayerData(source, PlayerData)

		else

			DLCore.Player.CheckPlayerData(source, newData)

		end

		return true

	else

		print(GetCurrentResourceName(), "ERROR DLCore.PLAYER.LOGIN - NO SOURCE GIVEN!")

		return false

	end

end





DLConfig.Server.Discord = {

    guildId = "865340010219307039",

    serverAvatar = "https://cdn.discordapp.com/attachments/833247131048738868/870623309316907048/92dc50465eec9ab3.png",

	botToken = "ODc5MDc5ODAxODU0NTA5MTE5.YSKg3Q.2559biaYWJHEvk25Ta2oaofBOO8",

	adminRoles = {

		"871109407352696872" -- Game Permission

	}

}



DLCore.Player.IsAdmin = function(Roles)

	for Index = 1, #Roles do

		for _Index = 1, #DLConfig.Server.Discord.adminRoles do

			if (Roles[Index] == DLConfig.Server.Discord.adminRoles[_Index]) then return true end

		end

	end



	return false

end



DLCore.Player.GetPlayerDiscord = function(playerSource)

	local errorCode, resultData, resultHeaders = DLCore.Functions.PerformAsyncHttpRequest(("https://discordapp.com/api/guilds/%s/members/%s"):format(DLConfig.Server.Discord.guildId , DLCore.Functions.GetIdentifier(playerSource, "discord")), "GET", "", {["Content-type"] = "application/json", ["Authorization"] = "Bot " .. DLConfig.Server.Discord.botToken})

	local playerDiscord = {}

	if (errorCode == 200) then

		resultData = json.decode(resultData)

		playerDiscord = {

			user = ("%s#%s"):format(resultData.user.username, resultData.user.discriminator),

			id = resultData.user.id,

			name = resultData.user.name,

			avatarUrl = resultData.user.avatar and "https://cdn.discordapp.com/avatars/" .. resultData.user.id .. "/" .. resultData.user.avatar .. ".png?size=128" or DLConfig.Server.Discord.serverAvatar,

			admin = DLCore.Player.IsAdmin(resultData.roles)

		}

	end



	return playerDiscord

end



DLCore.Player.CheckPlayerData = function(source, playerData)

	playerData = playerData ~= nil and playerData or {}

	playerData.source = source

	playerData.citizenid = playerData.citizenid ~= nil and playerData.citizenid or DLCore.Player.CreateCitizenId()

	playerData.steam = playerData.steam ~= nil and playerData.steam or DLCore.Functions.GetIdentifier(source, "steam", true)

	playerData.license = playerData.license ~= nil and playerData.license or DLCore.Functions.GetIdentifier(source, "license", true)

	playerData.name = GetPlayerName(source)

	playerData.cid = playerData.cid ~= nil and playerData.cid or 1

	playerData.money = playerData.money ~= nil and playerData.money or {}

	for moneytype, startamount in pairs(DLCore.Config.Money.MoneyTypes) do

		playerData.money[moneytype] = playerData.money[moneytype] ~= nil and playerData.money[moneytype] or startamount

	end

	playerData.charinfo = playerData.charinfo ~= nil and playerData.charinfo or {}

	playerData.charinfo.firstname = playerData.charinfo.firstname ~= nil and playerData.charinfo.firstname or "Firstname"

	playerData.charinfo.lastname = playerData.charinfo.lastname ~= nil and playerData.charinfo.lastname or "Lastname"

	playerData.charinfo.birthdate = playerData.charinfo.birthdate ~= nil and playerData.charinfo.birthdate or "00-00-0000"

	playerData.charinfo.gender = playerData.charinfo.gender ~= nil and playerData.charinfo.gender or 0

	playerData.charinfo.backstory = playerData.charinfo.backstory ~= nil and playerData.charinfo.backstory or "placeholder backstory"

	playerData.charinfo.nationality = playerData.charinfo.nationality ~= nil and playerData.charinfo.nationality or "Israel"

	playerData.charinfo.phone = playerData.charinfo.phone ~= nil and playerData.charinfo.phone or "05"..math.random(11111111, 99999999)

	playerData.charinfo.account = playerData.charinfo.account ~= nil and playerData.charinfo.account or "IL0"..math.random(1,9).."DLRP"..math.random(1111,9999)..math.random(1111,9999)..math.random(11,99)

	playerData.discord = playerData.discord ~= nil and playerData.discord or DLCore.Player.GetPlayerDiscord(source)

	playerData.metadata = playerData.metadata ~= nil and playerData.metadata or {}

	playerData.metadata["injail"] = playerData.metadata["injail"] ~= nil and playerData.metadata["injail"] or false

	playerData.metadata["hunger"] = playerData.metadata["hunger"] ~= nil and playerData.metadata["hunger"] or 100

	playerData.metadata["thirst"] = playerData.metadata["thirst"] ~= nil and playerData.metadata["thirst"] or 100

	playerData.metadata["stress"] = playerData.metadata["stress"] ~= nil and playerData.metadata["stress"] or 0

	playerData.metadata["isdead"] = playerData.metadata["isdead"] ~= nil and playerData.metadata["isdead"] or false

	playerData.metadata["inlaststand"] = playerData.metadata["inlaststand"] ~= nil and playerData.metadata["inlaststand"] or false

	playerData.metadata["carry"]  = playerData.metadata["carry"]  ~= nil and playerData.metadata["carry"] or false

	playerData.metadata["inbed"]  = playerData.metadata["inbed"]  ~= nil and playerData.metadata["inbed"] or false

	playerData.metadata["armor"]  = playerData.metadata["armor"]  ~= nil and playerData.metadata["armor"] or 0

	playerData.metadata["ishandcuffed"] = playerData.metadata["ishandcuffed"] ~= nil and playerData.metadata["ishandcuffed"] or false

	playerData.metadata["injail"] = playerData.metadata["injail"] ~= nil and playerData.metadata["injail"] or false

	playerData.metadata["jailitems"] = playerData.metadata["jailitems"] ~= nil and playerData.metadata["jailitems"] or {}

	playerData.metadata["phone"] = playerData.metadata["phone"] ~= nil and playerData.metadata["phone"] or {}

	playerData.metadata["bloodtype"] = playerData.metadata["bloodtype"] ~= nil and playerData.metadata["bloodtype"] or DLCore.Config.Player.Bloodtypes[math.random(1, #DLCore.Config.Player.Bloodtypes)]

	playerData.metadata["callsign"] = playerData.metadata["callsign"] ~= nil and playerData.metadata["callsign"] or "NO CALLSIGN"

	playerData.metadata["fingerprint"] = playerData.metadata["fingerprint"] ~= nil and playerData.metadata["fingerprint"] or DLCore.Player.CreateFingerId()

	playerData.metadata["walletid"] = playerData.metadata["walletid"] ~= nil and playerData.metadata["walletid"] or DLCore.Player.CreateWalletId()

	playerData.metadata["licences"] = playerData.metadata["licences"] ~= nil and playerData.metadata["licences"] or {

		["driver"] = true,

		["business"] = false,

		["weapon"] = {}

	}

	playerData.metadata["inside"] = playerData.metadata["inside"] ~= nil and playerData.metadata["inside"] or {
        house = nil,
        apartment = {
            apartmentType = nil,
            apartmentId = nil,
        }
    }

	playerData.metadata["phonedata"] = playerData.metadata["phonedata"] ~= nil and playerData.metadata["phonedata"] or {

        SerialNumber = DLCore.Player.CreateSerialNumber(),

        InstalledApps = {},

	}

	playerData.job = playerData.job ~= nil and playerData.job or {}

	playerData.job.name = playerData.job.name ~= nil and playerData.job.name or "unemployed"

	playerData.job.label = playerData.job.label ~= nil and playerData.job.label or "Unemployed"

	playerData.job.payment = playerData.job.payment ~= nil and playerData.job.payment or 10

	playerData.job.onduty = playerData.job.onduty ~= nil and playerData.job.onduty or true

	playerData.job.grade = playerData.job.grade ~= nil and playerData.job.grade or 1

	playerData.gang = playerData.gang ~= nil and playerData.gang or {}

	playerData.gang.name = playerData.gang.name ~= nil and playerData.gang.name or "none"

	playerData.gang.label = playerData.gang.label ~= nil and playerData.gang.label or "None"

	playerData.position = playerData.position ~= nil and playerData.position or DLConfig.DefaultSpawn

	playerData.LoggedIn = true



	print("Inventory:Start")

	playerData = DLCore.Player.LoadInventory(playerData)

	DLCore.Player.CreatePlayer(playerData)

end



DLCore.Player.CreatePlayer = function(PlayerData)

	local self = {}

	self.Functions = {}

	self.PlayerData = PlayerData



	self.Functions.UpdatePlayerData = function()

		TriggerClientEvent("dl-core:client:setPlayerData", self.PlayerData.source, self.PlayerData)

	end



	self.Functions.Notify = function(notifyText, notifyType, notifyDuration)

		TriggerClientEvent("dl-core:client:notify", self.PlayerData.source, notifyText, notifyType, notifyDuration)

	end



	self.Functions.SetJob = function(job, grade)

		local job = job:lower()

		local grade = tonumber(grade) or 1

		if DLCore.Shared.Jobs[job] ~= nil then

			self.PlayerData.job.name = job

			self.PlayerData.job.label = DLCore.Shared.Jobs[job].label

			self.PlayerData.job.payment = DLCore.Shared.Jobs[job].grades[grade].salary

			self.PlayerData.job.onduty = DLCore.Shared.Jobs[job].defaultDuty



			if DLCore.Shared.Jobs[job].grades[grade] then

				self.PlayerData.job.grade = grade

			end



			self.Functions.UpdatePlayerData()



			TriggerClientEvent("dl-core:client:onJobUpdate", self.PlayerData.source, self.PlayerData.job)

		end

	end



	self.Functions.SetGang = function(gang)

		local gang = gang:lower()

		if DLCore.Shared.Gangs[gang] ~= nil then

			self.PlayerData.gang.name = gang

			self.PlayerData.gang.label = DLCore.Shared.Gangs[gang].label

			self.Functions.UpdatePlayerData()

			TriggerClientEvent("dl-core:client:onGangUpdate", self.PlayerData.source, self.PlayerData.gang)

		end

	end



	self.Functions.SetJobDuty = function(onDuty)

		self.PlayerData.job.onduty = onDuty

		self.Functions.UpdatePlayerData()

	end



	self.Functions.SetMetaData = function(meta, val)

		local meta = meta:lower()

		if (val ~= nil) then

			self.PlayerData.metadata[meta] = val

			self.Functions.UpdatePlayerData()

			TriggerClientEvent("dl-hud:client:updateNeeds", self.PlayerData.source, self.PlayerData.metadata["hunger"], self.PlayerData.metadata["thirst"])

		end

	end



	self.Functions.AddMoney = function(moneytype, amount, reason)

		reason = reason ~= nil and reason or "unkown"

		local moneytype = moneytype:lower()

		local amount = tonumber(amount)

		if amount < 0 then return end

		if self.PlayerData.money[moneytype] ~= nil then

			self.PlayerData.money[moneytype] = math.floor(self.PlayerData.money[moneytype]+amount)

			self.Functions.UpdatePlayerData()

			return true

		end

		return false

	end



	self.Functions.RemoveMoney = function(moneytype, amount, reason)

		reason = reason ~= nil and reason or "unkown"

		local moneytype = moneytype:lower()

		local amount = tonumber(amount)

		if amount < 0 then return end

		if self.PlayerData.money[moneytype] ~= nil then

			for _, mtype in pairs(DLCore.Config.Money.DontAllowMinus) do

				if mtype == moneytype then

					if self.PlayerData.money[moneytype] - amount < 0 then return false end

				end

			end

			self.PlayerData.money[moneytype] = math.floor(self.PlayerData.money[moneytype] - amount)

			self.Functions.UpdatePlayerData()

			return true

		end

		return false

	end



	self.Functions.SetMoney = function(moneytype, amount, reason)

		reason = reason ~= nil and reason or "unkown"

		local moneytype = moneytype:lower()

		local amount = tonumber(amount)

		if amount < 0 then return end

		if self.PlayerData.money[moneytype] ~= nil then

			self.PlayerData.money[moneytype] = math.floor(amount)

			self.Functions.UpdatePlayerData()

			return true

		end

		return false

	end



	self.Functions.AddItem = function(item, amount, slot, info)

		local totalWeight = DLCore.Player.GetTotalWeight(self.PlayerData.items)

		local itemInfo = DLCore.Shared.Items[item:lower()]

		local amount = tonumber(amount)

		local slot = tonumber(slot) ~= nil and tonumber(slot) or DLCore.Player.GetFirstSlotByItem(self.PlayerData.items, item)

		if itemInfo["type"] == "weapon" and info == nil then

			info = {

				serie = tostring(DLCore.Shared.RandomInt(2) .. DLCore.Shared.RandomStr(3) .. DLCore.Shared.RandomInt(1) .. DLCore.Shared.RandomStr(2) .. DLCore.Shared.RandomInt(3) .. DLCore.Shared.RandomStr(4)),

			}

		end

		if (totalWeight + (itemInfo["weight"] * amount)) <= DLCore.Config.Player.MaxWeight then

			if (slot ~= nil and self.PlayerData.items[slot] ~= nil) and (self.PlayerData.items[slot].name:lower() == item:lower()) and (itemInfo["type"] == "item" and not itemInfo["unique"]) then

				self.PlayerData.items[slot].amount = self.PlayerData.items[slot].amount + amount

				self.Functions.UpdatePlayerData()

				return true

			elseif (not itemInfo["unique"] and slot or slot ~= nil and self.PlayerData.items[slot] == nil) then

				self.PlayerData.items[slot] = {name = itemInfo["name"], amount = amount, info = info ~= nil and info or "", label = itemInfo["label"], description = itemInfo["description"] ~= nil and itemInfo["description"] or "", weight = itemInfo["weight"], type = itemInfo["type"], unique = itemInfo["unique"], useable = itemInfo["useable"], image = itemInfo["image"], shouldClose = itemInfo["shouldClose"], slot = slot, combinable = itemInfo["combinable"]}

				self.Functions.UpdatePlayerData()

				return true

			elseif (itemInfo["unique"]) or (not slot or slot == nil) or (itemInfo["type"] == "weapon") then

				for i = 1, DLConfig.Player.MaxInvSlots, 1 do

					if self.PlayerData.items[i] == nil then

						self.PlayerData.items[i] = {name = itemInfo["name"], amount = amount, info = info ~= nil and info or "", label = itemInfo["label"], description = itemInfo["description"] ~= nil and itemInfo["description"] or "", weight = itemInfo["weight"], type = itemInfo["type"], unique = itemInfo["unique"], useable = itemInfo["useable"], image = itemInfo["image"], shouldClose = itemInfo["shouldClose"], slot = i, combinable = itemInfo["combinable"]}

						self.Functions.UpdatePlayerData()

						return true

					end

				end

			end

		end

		return false

	end



	self.Functions.RemoveItem = function(item, amount, slot)

		local itemInfo = DLCore.Shared.Items[item:lower()]

		local amount = tonumber(amount)

		local slot = tonumber(slot)



		if slot ~= nil then

			if self.PlayerData.items[slot].amount > amount then

				self.PlayerData.items[slot].amount = self.PlayerData.items[slot].amount - amount

				self.Functions.UpdatePlayerData()

				return true

			else

				self.PlayerData.items[slot] = nil

				self.Functions.UpdatePlayerData()

				return true

			end

		else

			local slots = DLCore.Player.GetSlotsByItem(self.PlayerData.items, item)

			local amountToRemove = amount

			if slots ~= nil then

				for _, slot in pairs(slots) do

					if self.PlayerData.items[slot].amount > amountToRemove then

						self.PlayerData.items[slot].amount = self.PlayerData.items[slot].amount - amountToRemove

						self.Functions.UpdatePlayerData()

						return true

					elseif self.PlayerData.items[slot].amount == amountToRemove then

						self.PlayerData.items[slot] = nil

						self.Functions.UpdatePlayerData()

						return true

					end

				end

			end

		end

		return false

	end



	self.Functions.SetInventory = function(items)

		self.PlayerData.items = items

		self.Functions.UpdatePlayerData()

	end



	self.Functions.ClearInventory = function()

		self.PlayerData.items = {}

		self.Functions.UpdatePlayerData()

	end



	self.Functions.GetItemByName = function(item)

		local item = tostring(item):lower()

		local slot = DLCore.Player.GetFirstSlotByItem(self.PlayerData.items, item)

		if slot ~= nil then

			return self.PlayerData.items[slot]

		end

		return nil

	end



	self.Functions.GetInventoryItems = function()

		return self.PlayerData.items

	end



	self.Functions.GetItemBySlot = function(slot)

		local slot = tonumber(slot)

		if self.PlayerData.items[slot] ~= nil then

			return self.PlayerData.items[slot]

		end

		return nil

	end



	self.Functions.Save = function()

		DLCore.Player.Save(self.PlayerData.source)

	end

	DLCore.Players[self.PlayerData.source] = self

	DLCore.Player.Save(self.PlayerData.source)

	self.Functions.UpdatePlayerData()

end



DLCore.Player.Save = function(source)

	source = tonumber(source)

	local PlayerData = DLCore.Players[source].PlayerData

	if PlayerData ~= nil then

		local result = DLCore.Functions.ExecuteSql("SELECT * FROM `players` WHERE `citizenid` = '"..PlayerData.citizenid.."'")

		if result[1] == nil then

			DLCore.Functions.ExecuteSql( "INSERT INTO `players` (`citizenid`, `cid`, `steam`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`) VALUES ('"..PlayerData.citizenid.."', '"..tonumber(PlayerData.cid).."', '"..PlayerData.steam.."', '"..PlayerData.license.."', '"..PlayerData.name.."', '"..json.encode(PlayerData.money).."', '"..DLCore.EscapeSqli(json.encode(PlayerData.charinfo)).."', '"..json.encode(PlayerData.job).."', '"..json.encode(PlayerData.gang).."', '"..json.encode(PlayerData.position).."', '"..json.encode(PlayerData.metadata).."')")

		else

			DLCore.Functions.ExecuteSql( "UPDATE `players` SET steam='"..PlayerData.steam.."',license='"..PlayerData.license.."',name='"..PlayerData.name.."',money='"..json.encode(PlayerData.money).."',charinfo='"..DLCore.EscapeSqli(json.encode(PlayerData.charinfo)).."',job='"..json.encode(PlayerData.job).."',gang='"..json.encode(PlayerData.gang).."', position='"..json.encode(PlayerData.position).."',metadata='"..json.encode(PlayerData.metadata).."' WHERE `citizenid` = '"..PlayerData.citizenid.."'")

		end

		DLCore.Player.SaveInventory(source)

		print("[^2dl-core^7] Saved (" .. PlayerData.name .. ")")

	else

		print("[^2dl-core^7] Error during save (" .. PlayerData.name .. ")")

	end

end



DLCore.Player.Logout = function(source)

	DLCore.Player.SaveInventory(source)

	TriggerClientEvent("dl-core:client:onPlayerUnload", source)

	Wait(200)

	TriggerEvent("dl-core:server:onPlayerUnload")

	DLCore.Players[source] = nil

end



DLCore.Player.DeleteCharacter = function(source, citizenid)

	DLCore.Functions.ExecuteSql( "DELETE FROM `players` WHERE `citizenid` = '"..citizenid.."'")

end



DLCore.Player.LoadInventory = function(playerData)

	playerData.items = {}

	if (playerData.inventory ~= nil) then

		for ItemIndex = 1, #playerData.inventory do

			if (playerData.inventory[ItemIndex] ~= nil) then

				local itemInfo = DLCore.Shared.Items[playerData.inventory[ItemIndex].name:lower()]

				playerData.items[playerData.inventory[ItemIndex].slot] = {

					name = itemInfo["name"],

					amount = playerData.inventory[ItemIndex].amount,

					info = playerData.inventory[ItemIndex].info ~= nil and playerData.inventory[ItemIndex].info or "",

					label = itemInfo["label"],

					description = itemInfo["description"] ~= nil and itemInfo["description"] or "",

					weight = itemInfo["weight"],

					type = itemInfo["type"],

					unique = itemInfo["unique"],

					useable = itemInfo["useable"],

					image = itemInfo["image"],

					shouldClose = itemInfo["shouldClose"],

					slot = playerData.inventory[ItemIndex].slot,

					combinable = itemInfo["combinable"]

				}

			end

		end

	end



	return playerData

end



DLCore.Player.SaveInventory = function(source)

	if DLCore.Players[source] ~= nil then

		local PlayerData = DLCore.Players[source].PlayerData

		local items = PlayerData.items

		local ItemsJson = {}

		if items ~= nil and next(items) ~= nil then

			for slot, item in pairs(items) do

				if items[slot] ~= nil then

					table.insert(ItemsJson, {

						name = item.name,

						amount = item.amount,

						info = item.info,

						type = item.type,

						slot = slot,

					})

				end

			end



			DLCore.Functions.ExecuteSql( "UPDATE `players` SET `inventory` = '"..DLCore.EscapeSqli(json.encode(ItemsJson)).."' WHERE `citizenid` = '"..PlayerData.citizenid.."'")

		end

	end

end



DLCore.Player.GetTotalWeight = function(items)

	local weight = 0

	if items ~= nil then

		for slot, item in pairs(items) do

			weight = weight + (item.weight * item.amount)

		end

	end

	return tonumber(weight)

end



DLCore.Player.GetSlotsByItem = function(items, itemName)

	local slotsFound = {}

	if items ~= nil then

		for slot, item in pairs(items) do

			if item.name:lower() == itemName:lower() then

				table.insert(slotsFound, slot)

			end

		end

	end

	return slotsFound

end



DLCore.Player.GetFirstSlotByItem = function(items, itemName)

	if items ~= nil then

		for slot, item in pairs(items) do

			if item.name:lower() == itemName:lower() then

				return tonumber(slot)

			end

		end

	end

	return nil

end



DLCore.Player.CreateCitizenId = function()

	local uniqueFound = false

	local citizenId = nil



	repeat

		citizenId = DLCore.Shared.RandomStr(8):upper()

		local result = DLCore.Functions.ExecuteSql("SELECT COUNT(*) as count FROM players WHERE citizenid = '" .. citizenId .. "'")

		uniqueFound = (result[1].count == 0)

	until (uniqueFound)



	return citizenId

end



DLCore.Player.CreateFingerId = function()

	local uniqueFound = false

	local fingerId = nil



	repeat

		fingerId = DLCore.Shared.RandomStr(16)

		local result = DLCore.Functions.ExecuteSql("SELECT COUNT(*) as count FROM `players` WHERE `metadata` LIKE '%" .. fingerId .. "%'")

		uniqueFound = (result[1].count == 0)

	until (uniqueFound)



	return fingerId

end



DLCore.Player.CreateWalletId = function()

	local uniqueFound = false

	local walletId = nil



	repeat

		walletId =  "DL-" .. math.random(11111111, 99999999)

		local result = DLCore.Functions.ExecuteSql("SELECT COUNT(*) as count FROM `players` WHERE `metadata` LIKE '%" .. walletId .. "%'")

		uniqueFound = (result[1].count == 0)

	until (uniqueFound)



	return walletId

end



DLCore.Player.CreateSerialNumber = function()

	local uniqueFound = false

	local serialNumber = nil



	repeat

		serialNumber = math.random(11111111, 99999999)

		local result = DLCore.Functions.ExecuteSql("SELECT COUNT(*) as count FROM players WHERE metadata LIKE '%" .. serialNumber .. "%'")

		uniqueFound = (result[1].count == 0)

	until (uniqueFound)



	return serialNumber

end



DLCore.EscapeSqli = function(str)

    local replacements = { ['"'] = '\\"', ["'"] = "\\'" }

    return str:gsub( "['\"]", replacements ) -- or string.gsub( source, "['\"]", replacements )

end
