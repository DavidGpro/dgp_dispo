ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('dgp_dispo:getPlayersJob', function(source, cb)
    local job = {}
    local retvalPolice = 0
    local retvalEMS = 0
    local retvalMechanic = 0
    local retvalTaxi = 0
    
    for k, v in pairs(ESX.GetPlayers()) do
        local Player = ESX.GetPlayers(v)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        
        if Player ~= nil then
            if xPlayer.job.name == 'police' then
                retvalPolice = retvalPolice + 1
            elseif xPlayer.job.name == 'ems' then
                retvalEMS = retvalEMS + 1
            elseif xPlayer.job.name == 'mechanic' then
                retvalMechanic = retvalMechanic + 1
            elseif xPlayer.job.name == 'taxi' then
                retvalTaxi = retvalTaxi + 1
            end
        end
    end

    table.insert(job, retvalPolice)
    table.insert(job, retvalEMS)
    table.insert(job, retvalMechanic)
    table.insert(job, retvalTaxi)

    cb(job)
end)
