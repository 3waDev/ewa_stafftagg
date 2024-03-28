spelers = {}

ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('ewa-moderatorTag:server:requestSync', function(source, cb)
	cb(spelers)
end)

RegisterServerEvent('ewa-moderatorTag:server:enable')
AddEventHandler('ewa-moderatorTag:server:enable', function()
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
                TriggerClientEvent('ewa-moderatorTagg:client:syncTags', -1, spelers)
            else
                spelers[src] = nil
                TriggerClientEvent('ewa-moderatorTagg:client:syncTags', -1, spelers)
            end
        else
            TriggerClientEvent('ewa-moderatorTagg:function:notify', src) 
        end
    end
end)

AddEventHandler('esx:playerDropped', function(source)
    if spelers[source] ~= nil then
        spelers[source] = nil
    end
    TriggerClientEvent('ewa-moderatorTagg:client:syncTags', -1, spelers)
end)