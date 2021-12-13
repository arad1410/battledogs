

CreateThread(function()

	while (not NetworkIsSessionStarted()) do Wait(50) end

	TriggerServerEvent("dl-core:playerJoined")

end)



CreateThread(function()

	while (true) do

		if (isLoggedIn) then

			Wait((1000 * 60) * 30)

			TriggerServerEvent("dl-core:server:updatePlayerSalary")
			TriggerEvent("dl-phone:client:NotifySalary",  DLCore.Functions.GetPlayerData().job.payment, DLCore.Functions.GetPlayerData().money["bank"] + DLCore.Functions.GetPlayerData().job.payment)

		else
			Wait(2000)
		end

		Wait(0)
	end

end)

CreateThread(function()
	while (true) do

		if (isLoggedIn) then

			Wait((1000 * 60) * 1)

			TriggerServerEvent("dl-core:server:updatePlayer")

		else
			Wait(2000)
		end

		Wait(0)
	end
end)

CreateThread(function()
	while true do
		Wait(7)
		if isLoggedIn then
			Wait(30000)
			TriggerEvent("dl-core:client:updatePlayerPosition")
		else
			Wait(5000)
		end
	end
end)

local playerPed, playerHealth, playerData

CreateThread(function()

	while (true) do
		playerPed = PlayerPedId()
		SetPedSuffersCriticalHits(playerPed, false)

		if (isLoggedIn) then

			playerData = DLCore.Functions.GetPlayerData()

			if (playerData.metadata["hunger"] <= 0 or playerData.metadata["thirst"] <= 0) then

				playerHealth = GetEntityHealth(playerPed)

				SetEntityHealth(playerPed, playerHealth - 20)

			end

		end

		Wait(5000)

	end

end)
