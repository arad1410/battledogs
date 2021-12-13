RLCore = nil
TriggerEvent('RLCore:GetObject', function(obj) RLCore = obj end)

local cryptoWorth = 30000 * BBBankingCore['config']['cryptoPresentage']

RegisterServerEvent("RLCore:Server:OnPlayerLoadedFromDB")
AddEventHandler('RLCore:Server:OnPlayerLoadedFromDB', function(src)
   
   --TriggerClientEvent("bb-banking:client:registerPlayer", src)
end)

RegisterServerEvent("bb-banking:server:setNui")
AddEventHandler('bb-banking:server:setNui', function()
	
	TriggerClientEvent("bb-banking:client:setNui", source, true, BBBankingCore['config'].nui, {price = cryptoWorth, presantage = BBBankingCore['config']['cryptoPresentage'] * 100})
end)

Citizen.CreateThread(function()

	Citizen.Wait(1000)
	
	while true do
		PerformHttpRequest("https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd", function(err, text, headers)
			
			if err == 200 then
				local data = json.decode(text)
				
				cryptoWorth = data.bitcoin.usd * BBBankingCore['config']['cryptoPresentage']
				
				TriggerClientEvent("bb-banking:client:setNui", -1, true, BBBankingCore['config'].nui, {price = cryptoWorth, presantage = BBBankingCore['config']['cryptoPresentage'] * 100})
			else
				print("Could not fetch crypto prices, error code " .. tostring(err))
			end
		end, "GET", "", {["Content-type"] = "application/json"})
		
		Citizen.Wait(300000)
	end
end)

cryptoChartWorth = {}

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	
	while true do
		local unix = os.time()
		
		PerformHttpRequest("https://api.coingecko.com/api/v3/coins/bitcoin/market_chart/range?vs_currency=usd&from=" .. tostring(unix - 604800) .. "&to=" .. tostring(unix), function(err, text, headers)
			
			if err == 200 then
				local data = json.decode(text)
				
				local day = 1
				
				cryptoChartWorth = {}
				for day = 1, 8 do 
					local miliunixBackThen = (unix - (86400 * (day - 1))) * 1000
					
					local winnerDistance = nil
					local winnerPrice = nil
					
					for k, v in pairs(data["prices"]) do
						if winnerDistance == nil or math.abs(v[1] - miliunixBackThen) < winnerDistance then
							winnerDistance = math.abs(v[1] - miliunixBackThen)
							winnerPrice = v[2]
						end
					end
					
					cryptoChartWorth[day] = winnerPrice
				end
			else
				print("Could not fetch crypto prices, error code " .. tostring(err))
			end
		end, "GET", "", {["Content-type"] = "application/json"})
		
		Citizen.Wait(86400 * 1000) -- Every day.
	end
end)
RLCore.Functions.CreateCallback('bb-banking:server:getPlayerData', function(source, cb, group)
	
	
	local playerData = {}
	playerData.cryptoData = {}
	playerData.information = {}
	playerData.chart = {}
	playerData.fees = {}
	playerData.crypto = {}
	
	playerData.information.accounts = {}
	
	local Player = RLCore.Functions.GetPlayer(source)
	
	playerData.cryptoData.amount = Player.PlayerData.money["crypto"]
	playerData.cryptoData.value = Player.PlayerData.money["crypto"] * cryptoWorth

	-- Can't get this to work.
	playerData.crypto.chart =
	{
		{
			date = os.date("%d/%m", os.time() - 86400 * 0),
			price = cryptoChartWorth[1]
		},
		{
			date = os.date("%d/%m", os.time() - 86400 * 1),
			price = cryptoChartWorth[2]
		},
		{
			date = os.date("%d/%m", os.time() - 86400 * 2),
			price = cryptoChartWorth[3]
		},
		{
			date = os.date("%d/%m", os.time() - 86400 * 3),
			price = cryptoChartWorth[4]
		},
		{
			date = os.date("%d/%m", os.time() - 86400 * 4),
			price = cryptoChartWorth[5]
		},
		{
			date = os.date("%d/%m", os.time() - 86400 * 5),
			price = cryptoChartWorth[6]
		},
		{
			date = os.date("%d/%m", os.time() - 86400 * 6),
			price = cryptoChartWorth[7]
		},
	}

	playerData.crypto.price = cryptoWorth
	
	playerData.currentAmount = Player.PlayerData.money["bank"]
	
	playerData.information.name = BBBankingCore['functions'].GetCharacterName(Player)
	playerData.information.identifier = Player.PlayerData.citizenid
	playerData.information.iban = Player.PlayerData.citizenid
	
	-- Random constants, this is both revenue o.
	
	playerData.nui = BBBankingCore['config'].nui
	
	playerData.fees = BBBankingCore['config'].fees
	
	playerData.currentCash = Player.PlayerData.money["cash"]

	RLCore.Functions.ExecuteSql(true, "SELECT * FROM `bbanking_accounts` WHERE `identifier` = '"..playerData.information.iban.."'", function(result)
		if result[1] ~= nil then 
			playerData.information.accounts[result[1].type] = result[1]
        else
			playerData.information.accounts = {}
		end
		
		RLCore.Functions.ExecuteSql(true, "SELECT * FROM `bbanking_cards` WHERE `identifier` = '"..playerData.information.iban.."'", function(result2)
		
			playerData.cards = {}
			local atmCards = {}
			atmCards.cards = {}
			
			if result2[1] ~= nil then 
				for k, v in ipairs(result2) do
					local data = {}
					
					data = v
					
					data.data = json.decode(v.data) -- Override the line above.
					
					data.balance = Player.PlayerData.money["bank"]
					
					table.insert(playerData.cards, data)
					table.insert(atmCards.cards, data)
				end
			end

			RLCore.Functions.ExecuteSql(true, "SELECT * FROM `bbanking_statements` WHERE `iban` = '"..playerData.information.iban.."' ORDER BY `time` DESC LIMIT 1024", function(result3)
				
				playerData.information.stats = {}
				
				local depositAmount = 0
				local withdrawAmount = 0
				
				local day = 1
				
				for day=1, 8 do
					playerData.chart[tostring(day-1)] = 0
				end
				
				if result3[1] ~= nil then 
					
					for k, v in ipairs(result3) do
						local data = {}
						
						data = v
						
						if math.floor(v.time / 86400) == math.floor(os.time() / 86400) then
							if v.type == "deposit" then
								depositAmount = depositAmount + v.amount
							elseif v.type == "withdraw" then
								withdrawAmount = withdrawAmount + v.amount
							end
						end
						
						local day = 1
						for day=1, 8 do
						
							if math.floor((v.time + 86400 * (day-1)) / 86400) == math.floor(os.time() / 86400) then
								if v.type == "deposit" then
									playerData.chart[tostring(day-1)] = playerData.chart[tostring(day-1)] + v.amount
								elseif v.type == "withdraw" then
									playerData.chart[tostring(day-1)] = playerData.chart[tostring(day-1)] - v.amount
								end
							end
						end
						
						table.insert(playerData.information.stats, data)
					end
				end
				
				playerData.lastdayData = {depositAmount, withdrawAmount}
				cb(playerData, atmCards, BBBankingCore['config'].nui)	
			end)
		end)
	end)
end)

RegisterServerEvent("bb-banking:server:withdrawEvent")
AddEventHandler('bb-banking:server:withdrawEvent', function(data)

	local src = source
	
	local account = data.account
	local amount = tonumber(data.amount)
	
	local Player = RLCore.Functions.GetPlayer(src)
	
	if Player then
		if account == "account" or account == "atm" then
			if tonumber(Player.PlayerData.money["bank"]) >= amount then
				Player.Functions.RemoveMoney("bank", amount, "withdraw-from-" .. account)
				Player.Functions.AddMoney("cash", math.floor(((100 - BBBankingCore['config'].fees.withdraw) / 100) * amount), "withdraw-from-" .. account)
				
				Citizen.Wait(0)
				
				if account == "atm" then
					TriggerClientEvent("bb-banking:client:refreshNuiNew", src, true)
				else
					TriggerClientEvent("bb-banking:client:refreshNuiNew", src, false)
				end
			else
				TriggerClientEvent('RLCore:Notify', src, "Insufficient Bank Funds", "error")
			end
		elseif account == "saving" then
			RLCore.Functions.ExecuteSql(true, "SELECT * FROM `bbanking_accounts` WHERE `identifier` = '"..Player.PlayerData.citizenid.."'", function(result)
				if(result[1] ~= nil and result[1].amount >= amount) then
					TriggerClientEvent("bb-banking:client:refreshNuiNew", src)
					Player.Functions.AddMoney("bank", amount, "withdraw-from-savings-account")
					RLCore.Functions.ExecuteSql(true, "UPDATE `bbanking_accounts` set amount = amount - " .. amount .. " WHERE `identifier` = '"..Player.PlayerData.citizenid.."'", function()
						Citizen.Wait(0)
						TriggerClientEvent("bb-banking:client:refreshNuiNew", src, false)
					end)
				else
					TriggerClientEvent('RLCore:Notify', src, "Insufficient Saving Bank Funds", "error")
				end		
			end)
		end
	end
end)

RegisterServerEvent("bb-banking:server:depositEvent")
AddEventHandler('bb-banking:server:depositEvent', function(data)
	local src = source
	local account = data.account
	local amount = tonumber(data.amount)
	
	local Player = RLCore.Functions.GetPlayer(src)
	
	if Player then
		if account == "account" then
			if tonumber(Player.PlayerData.money["cash"]) >= amount then
				Player.Functions.RemoveMoney("cash", amount, "deposit-to-account")
				Player.Functions.AddMoney("bank", amount, "deposit-to-account")
				Citizen.Wait(0)
				TriggerClientEvent("bb-banking:client:refreshNuiNew", src, false)
			else
				TriggerClientEvent('RLCore:Notify', src, "Insufficient Cash", "error")
			end
		elseif account == "saving" then
			if tonumber(Player.PlayerData.money["bank"]) >= amount then
				RLCore.Functions.ExecuteSql(true, "UPDATE `bbanking_accounts` set amount = amount + " .. amount .. " WHERE `identifier` = '"..Player.PlayerData.citizenid.."'", function()
					Player.Functions.RemoveMoney("bank", amount, "deposit-to-savings-account")
					Citizen.Wait(0)
					TriggerClientEvent("bb-banking:client:refreshNuiNew", src, false)
				end)
			else
				TriggerClientEvent('RLCore:Notify', src, "Insufficient Bank Funds", "error")
			end		
		end
	end
end)

RegisterServerEvent("bb-banking:server:transferEvent")
AddEventHandler('bb-banking:server:transferEvent', function(data)
	local target = tonumber(data.account)
	local amount = tonumber(data.amount)
	
	local Player = RLCore.Functions.GetPlayer(source)
	local targetPlayer = RLCore.Functions.GetPlayer(target)
	
	if Player and targetPlayer then
		if tonumber(Player.PlayerData.money["bank"]) >= amount then
			Player.Functions.RemoveMoney("bank", amount, "transfer-to-" .. BBBankingCore['functions'].GetCharacterName(targetPlayer))
			targetPlayer.Functions.AddMoney("bank", math.floor(((100 - BBBankingCore['config'].fees.transfer) / 100) * amount),  "transfer-by-" .. BBBankingCore['functions'].GetCharacterName(Player))
			Citizen.Wait(0)
			TriggerClientEvent("bb-banking:client:refreshNuiNew", source, false)
			TriggerClientEvent("bb-banking:client:refreshNuiNew", target, false)
		else
			TriggerClientEvent('RLCore:Notify', source, "Insufficient Bank Funds", "error")
		end
	else
		TriggerClientEvent('RLCore:Notify', source, "User ID not found!", "error")
	end
end)
RegisterServerEvent("bb-banking:server:cryptoEvent")
AddEventHandler('bb-banking:server:cryptoEvent', function(data)

	local event = tostring(data.event)
	local cashAmount = tonumber(data.amount)
	
	if event == "buy" then
		local Player = RLCore.Functions.GetPlayer(source)
		
		if Player then
			if tonumber(Player.PlayerData.money["bank"]) >= cashAmount then
				Player.Functions.RemoveMoney("bank", cashAmount, "invest-in-crypto")
				Player.Functions.AddMoney("crypto", cashAmount / cryptoWorth)
				Citizen.Wait(0)
				TriggerClientEvent("bb-banking:client:refreshNuiNew", source, false)
			else
				TriggerClientEvent('RLCore:Notify', source, "Insufficient Bank Funds", "error")
			end
		else
			TriggerClientEvent('RLCore:Notify', source, "User ID not found!", "error")
		end
	elseif event == "sell" then
		local Player = RLCore.Functions.GetPlayer(source)
		
		if Player then
			if tonumber(Player.PlayerData.money["crypto"] * cryptoWorth) >= cashAmount then
				Player.Functions.AddMoney("bank", cashAmount, "sell-crypto")
				Player.Functions.RemoveMoney("crypto", cashAmount / cryptoWorth)
				Citizen.Wait(0)
				TriggerClientEvent("bb-banking:client:refreshNuiNew", source, false)
			else
				TriggerClientEvent('RLCore:Notify', source, "Insufficient Crypto Worth", "error")
			end
		else
			TriggerClientEvent('RLCore:Notify', source, "User ID not found!", "error")
		end
	end

end)

RegisterServerEvent("bb-banking:server:createSavingAccount")
AddEventHandler('bb-banking:server:createSavingAccount', function()
	local Player = RLCore.Functions.GetPlayer(source)
	
	if Player then
		RLCore.Functions.ExecuteSql(true, "INSERT INTO `bbanking_accounts` (`identifier`, `type`, `amount`) VALUES ('"..Player.PlayerData.citizenid.."', 'saving', 0)")
	end
end)

-- dv0l
function randomLetters(amount)
	local txt = ""
	for i = 1, amount do
		txt = txt .. string.char(math.random(65, 90))
	end
    return txt
end

RegisterServerEvent("bb-banking:server:checkCards")
AddEventHandler('bb-banking:server:checkCards', function()
	local src = source
	
	local Player = RLCore.Functions.GetPlayer(src)
	
	if Player then
        data = {}
		data.cards = {}
		
        RLCore.Functions.ExecuteSql(true, "SELECT * FROM `bbanking_cards` WHERE `identifier` = '"..Player.PlayerData.citizenid.."'", function(result)
			if(result[1] ~= nil) then
				for k, v in ipairs(result) do
					
					datum = v
					
					datum.data = json.decode(v.data) -- Override the line above.
					
					datum.balance = Player.PlayerData.money["bank"]
					
					table.insert(data.cards, datum)
				end
			end
			
			TriggerClientEvent('bb-banking:client:triggerAtm', src, data, BBBankingCore['config'].nui, BBBankingCore['config'].fees)			
		end)
	end
end)


RegisterServerEvent("bb-banking:server:createCard")
AddEventHandler('bb-banking:server:createCard', function(data)
	local src = source
	local ccPin = data.pin

	local ccHolder = randomLetters(3) .. math.random(10000, 99999)
	local ccNumber = math.random(1000, 9999) .. '-' .. math.random(1000, 9999) .. '-' .. math.random(1000, 9999) .. '-' .. math.random(1000, 9999)
	
	local ccDate = ''
	
	local dayRandom = math.random(1, 27)
	local monthRandom = math.random(1, 12)
	
	if dayRandom < 10 then
		if monthRandom < 10 then
			ccDate = '0' .. dayRandom .. '/0' .. monthRandom -- Same here
		else
			ccDate = '0' .. dayRandom .. '/' .. monthRandom -- It ads 0 to date so it looks nicer like 07/10 or 02/11
		end
	else
		if monthRandom < 10 then
			ccDate = dayRandom .. '/0' .. monthRandom
		else
			ccDate = dayRandom .. '/' .. monthRandom
		end
	end
	
	local Player = RLCore.Functions.GetPlayer(src)
	
	if Player then
		local name = BBBankingCore['functions'].GetCharacterName(Player)
		data = 
		{
			holder = name,
			date = ccDate
		}
	
		RLCore.Functions.ExecuteSql(true, "INSERT INTO `bbanking_cards` (`identifier`, `holder`, `type`, `number`, `pin`, `hold`, `data`) VALUES ('"..Player.PlayerData.citizenid.."', '".. ccHolder .."', 'account', '".. ccNumber .."', '".. ccPin .."', 0, '".. json.encode(data) .."')", function(result)
			TriggerClientEvent("bb-banking:client:refreshNuiNew", src, false)
		end)
	end
end)

RegisterServerEvent("bb-banking:server:cardEvent")
AddEventHandler('bb-banking:server:cardEvent', function(data)
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
	--]]
	
	local src = source
	
	local Player = RLCore.Functions.GetPlayer(src)
	
	if Player then
		if data.action == "remove" then
			-- Always use his identifier to prevent hackers from deleting other people's cards.
			RLCore.Functions.ExecuteSql(true, "DELETE FROM `bbanking_cards` WHERE `id` = " .. data.card.id .. " AND `identifier` = '" .. Player.PlayerData.citizenid .. "'", function(result)
				TriggerClientEvent("bb-banking:client:refreshNuiNew", src, false)
			end)
		elseif data.action == "disable" then
			-- Always use his identifier to prevent hackers from deleting other people's cards.
			RLCore.Functions.ExecuteSql(true, "UPDATE `bbanking_cards` SET hold = 1 WHERE `id` = " .. data.card.id .. " AND `identifier` = '" .. Player.PlayerData.citizenid .. "'", function(result)
				TriggerClientEvent("bb-banking:client:refreshNuiNew", src, false)
			end)
		elseif data.action == "activate" then
			-- Always use his identifier to prevent hackers from deleting other people's cards.
			RLCore.Functions.ExecuteSql(true, "UPDATE `bbanking_cards` SET hold = 0 WHERE `id` = " .. data.card.id .. " AND `identifier` = '" .. Player.PlayerData.citizenid .. "'", function(result)
				TriggerClientEvent("bb-banking:client:refreshNuiNew", src, false)
			end)
		end
	end
end)


RegisterServerEvent("bb-banking:server:RegisterNewAction")
AddEventHandler('bb-banking:server:RegisterNewAction', function(src, moneytype, actiontype, amount, reason)
	if moneytype == "bank" then
		local Player = RLCore.Functions.GetPlayer(src)
		
		if Player then
			RLCore.Functions.ExecuteSql(true, "INSERT INTO `bbanking_statements` (`iban`, `from`, `source`, `type`, `amount`, `reason`, `time`) VALUES ('" .. Player.PlayerData.citizenid .. "', 'ACTION_UNKNOWN', 'account', '" .. actiontype .. "', '" .. amount .. "', '" .. reason .. "', '" .. os.time() .. "')", function(result)
				TriggerClientEvent("bb-banking:client:refreshNuiNew", src, false)
			end)
		end
	end
end)

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
--[[
{{
    "currentAmount": 62638,
    "chart": {
        "0": -1332,
        "1": -30,
        "2": 0,
        "3": 0,
        "4": 0,
        "5": 0,
        "6": 0,
        "7": 7000
    },
    "lastdayData": [
        15,
        1347
    ],
    "cards": [
        {
            "identifier": "RL04WL951",
            "type": "account",
            "number": "3084-7862-1883-1662",
            "daily": 0,
            "data": {
                "holder": "John Smith",
                "date": "13/7"
            },
            "holder": "YZI48693",
            "hold": 0,
            "pin": "6969"
        },
        {
            "identifier": "RL04WL951",
            "type": "account",
            "number": "1317-5084-2447-2311",
            "daily": 0,
            "data": {
                "holder": "John Smith",
                "date": "13/12"
            },
            "holder": "YZI48693",
            "hold": 1,
            "pin": "9696"
        }
    ],
    "cryptoData": {
        "value": 920,
        "amount": 0.01772854039674
    },
    "nui": {
        "enableCustomColor": true,
        "customColor": "lightblue",
        "logo": "https://cdn.discordapp.com/attachments/801809102756904960/832276791208181780/sfg.png"
    },
    "information": {
        "iban": "RL04WL951",
        "identifier": "YZI48693",
        "stats": [
            {
                "id": 80197,
                "reason": "salary-update",
                "type": "deposit",
                "time": "1630351002",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 7000
            },
            {
                "id": 80199,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868829",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80201,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868830",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80203,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868830",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80205,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868830",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80207,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868830",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80209,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868830",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80211,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868831",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80213,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868831",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80215,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868831",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80217,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868831",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80219,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868831",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80221,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868831",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80223,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868831",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80225,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868831",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80227,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868832",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80229,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868832",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80231,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868832",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80233,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868832",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80235,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868832",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80237,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868832",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80239,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868833",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80241,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868833",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80243,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868833",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80245,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868833",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80247,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868833",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80249,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868833",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80251,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868833",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80253,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868833",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80255,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868834",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "id": 80257,
                "reason": "unkown",
                "type": "withdraw",
                "time": "1630868834",
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 1
            },
            {
                "reason": "Saving Deposit From RL04WL951",
                "type": "withdraw",
                "time": 1630960445,
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 5
            },
            {
                "reason": "Saving Deposit From RL04WL951",
                "type": "withdraw",
                "time": 1630960454,
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 415
            },
            {
                "reason": "Crypto Buy",
                "type": "withdraw",
                "time": 1630960510,
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 500
            },
            {
                "reason": "Crypto Buy",
                "type": "withdraw",
                "time": 1630960515,
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 420
            },
            {
                "reason": "DEPOSIT_FROMCASH",
                "type": "deposit",
                "time": 1630960540,
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 15
            },
            {
                "reason": "BANK_WITHDRAW",
                "type": "withdraw",
                "time": 1630960544,
                "from": "ACTION_UNKNOWN",
                "iban": "RL04WL951",
                "source": "account",
                "amount": 7
            }
        ],
        "accounts": {
            "saving": {
                "id": -1,
                "identifier": "RL04WL951",
                "amount": 420,
                "type": "saving"
            }
        },
        "name": "John Smith"
    },
    "fees": {
        "transfer": 0,
        "withdraw": 0
    },
    "currentCash": 852
}
--]]