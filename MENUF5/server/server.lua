ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback("YD:checkgroup", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

ESX.RegisterServerCallback('yd:dati',function(source, cb, jobss)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(res)
            if res[1] then
                for k,v in pairs(res) do
                    cb(""..v.firstname.." "..v.lastname.."", source, v.job)
                end
            end
        end)
    end
end)