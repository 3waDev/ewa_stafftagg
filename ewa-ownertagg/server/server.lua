spelers = {}

ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('ewa-ownerTag:server:requestSync', function(source, cb)
	cb(spelers)
end)

RegisterServerEvent('ewa-ownerTag:server:enable')
AddEventHandler('ewa-ownerTag:server:enable', function()
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
                TriggerClientEvent('ewa-ownerTagg:client:syncTags', -1, spelers)
            else
                spelers[src] = nil
                TriggerClientEvent('ewa-ownerTagg:client:syncTags', -1, spelers)
            end
        else
            TriggerClientEvent('ewa-ownerTagg:function:notify', src) 
        end
    end
end)

AddEventHandler('esx:playerDropped', function(source)
    if spelers[source] ~= nil then
        spelers[source] = nil
    end
    TriggerClientEvent('ewa-ownerTagg:client:syncTags', -1, spelers)
end)