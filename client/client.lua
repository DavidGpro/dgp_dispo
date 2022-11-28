ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local open = false

Citizen.CreateThread(function()
    while true do
        if IsControlJustPressed(1, Config.Key) then
            if not open then
                ESX.TriggerServerCallback('dgp_dispo:getPlayersJob', function(job)
                    Config.Police = job[1]
                    Config.Ems = job[2] 
                    Config.Mechanic = job[3]
                    Config.Taxi = job[4]

                    SendNUIMessage({
                        action = 'open',
                        players = GetCurrentPlayers(),
                        maxPlayers = Config.MaxPlayers,
                        requiredPolice = Config.Robs,
                        police = Config.Police,
                        ems = Config.Ems,
                        mechanic = Config.Mechanic,
                        taxi = Config.Taxi
                    })
                    open = true
                end)
            end
        end

        if IsControlJustPressed(1, Config.Key) then
            if open then
                SendNUIMessage({
                    action = 'close',
                })
                open = false
            end
        end

        Citizen.Wait(0)
    end
end)

RegisterNetEvent('dgp_dispo:setRobActive')
AddEventHandler('dgp_dispo:setRobActive', function(rob, active)
    Config.Robs[rob].active = active
end)