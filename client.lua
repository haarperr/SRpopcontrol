Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(0)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

local xPlayers = {}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait (200) 
       for ped in EnumeratePeds() do
           if DoesEntityExist(ped) and not IsPedDeadOrDying(ped) then
				for i,model in pairs(Config.peds) do
					if (GetEntityModel(ped) == GetHashKey(model)) then
						veh = GetVehiclePedIsIn(ped, false)
						SetEntityAsNoLongerNeeded(ped)
						DeleteEntity(ped)
						if veh ~= nil then
							SetEntityAsNoLongerNeeded(veh)
							DeleteVehicle(veh)

						end
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait (Config.updatetick) 
	local xPlayers = GetPlayers()

	playersConnected = 0

		for i=1, #xPlayers, 1 do
			playersConnected = playersConnected + 1
			ESX.PlayerData = ESX.GetPlayerData()
		end
		                --print"playerconnected"
				--print (playersConnected)
				ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(isDead)
				if Config.usingesx and isDead then
				count = (0.0)
				vcount = (0.0)
				pvcount = (0.0)
   --print "Pedpopdead"
   --print (count)
   --print (vcount) 
   --print (pvcount)	
				end
	
				if not isDead and playersConnected > 0 and playersConnected < 6 then 
				count = (Config.density.peds1)
				vcount = (Config.density.vehicles1)
				pvcount = (Config.density.pvehicles1)
   --print "Pedpop1"
  -- print (count)
   --print (vcount) 
  -- print (pvcount)
				end

				if not isDead and playersConnected > 5 and playersConnected < 11 then 
				count = (Config.density.peds2)
				vcount = (Config.density.vehicles2)
				pvcount = (Config.density.pvehicles2)
   -- print "Pedpop2"
   --print (count)
   --print (vcount) 
   --print (pvcount)
				end

				if not isDead and playersConnected > 10 and playersConnected < 16 then 
				count = (Config.density.peds3)
				vcount = (Config.density.vehicles3)
				pvcount = (Config.density.pvehicles3)
   -- print "Pedpop3"
   --print (count)
  -- print (vcount) 
   --print (pvcount)
				end

				if not isDead and playersConnected > 15 and playersConnected < 21 then 
				count = (Config.density.peds4)
				vcount = (Config.density.vehicles4)
				pvcount = (Config.density.pvehicles4)
   --print "Pedpop4"
   --print (count)
   --print (vcount) 
   --print (pvcount)
				end
				if not isDead and playersConnected > 20 then 
				count = (Config.density.peds5)
				vcount = (Config.density.vehicles5)
				pvcount = (Config.density.pvehicles5)				
   --print "Pedpop5"
   --print (count)
   --print (vcount) 
   --print (pvcount)
			end
		end)
	end
end)




function GetPlayers()
    local players = {}
    for i = 0, 32 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end


Citizen.CreateThread(function()
    while true do
        SetPedDensityMultiplierThisFrame(count)
        SetScenarioPedDensityMultiplierThisFrame(count,count)
        SetVehicleDensityMultiplierThisFrame(vcount)
        SetRandomVehicleDensityMultiplierThisFrame(vcount)
        SetParkedVehicleDensityMultiplierThisFrame(pvcount)
        local playerPed = GetPlayerPed(-1)
        local pos = GetEntityCoords(playerPed)
        RemoveVehiclesFromGeneratorsInArea(pos['x'] - 1000.0,
		pos['y'] - 1000.0,
		pos['z'] - 1000.0,
		pos['x'] + 1000.0,
		pos['y'] + 1000.0,
		pos['z'] + 1000.0);  
        Citizen.Wait(0) 
    end
end)
