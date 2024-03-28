spelers = {}

ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('ewa-managementTag:server:requestSync', function(source, cb)
	cb(spelers)
end)

RegisterServerEvent('ewa-managementTag:server:enable')
AddEventHandler('ewa-managementTag:server:enable', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local name = GetPlayerName(src)
    for k,v in pairs(Ewa.staffTagg) do
        if xPlayer.group == v.groupCheck then
            if spelers[src] == nil then
                spelers[src] = {
                    ['id'] = src,
                    ['naam'] = name
                }
                TriggerClientEvent('ewa-managementTagg:client:syncTags', -1, spelers)
            else
                spelers[src] = nil
                TriggerClientEvent('ewa-managementTagg:client:syncTags', -1, spelers)
            end
        else
            TriggerClientEvent('ewa-managementTagg:function:notify', src) 
        end
    end
end)

AddEventHandler('esx:playerDropped', function(source)
    if spelers[source] ~= nil then
        spelers[source] = nil
    end
    TriggerClientEvent('ewa-managementTagg:client:syncTags', -1, spelers)
end)