ESX = nil
local stafftable = {}
local staffTag = false

CreateThread(function()
    while ESX == nil do
        ESX = exports["es_extended"]:getSharedObject()
        Citizen.Wait(0)
    end
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    ESX.TriggerServerCallback('ewa-ownerTag:server:requestSync', function(request)
        stafftable = request
    end)
end)

RegisterNetEvent('ewa-ownerTagg:client:syncTags')
AddEventHandler('ewa-ownerTagg:client:syncTags', function(sync)
    stafftable = sync
end)

RegisterCommand(Ewa.commandName, function(source, args)
    TriggerServerEvent("ewa-ownerTag:server:enable")
end)


CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(stafftable) do
            local player = GetPlayerPed(GetPlayerFromServerId(v.id))
            local spelerNaam = v.naam
            for k,v in pairs(Ewa.staffTagg) do
                local text = ' '..v.nameTagg..' '..spelerNaam..' '
                local ped = PlayerPedId()
                local pos = GetEntityCoords(player)
                local coords = GetEntityCoords(ped)
                local dist = #(pos - coords)
                if dist <= v.afstand then
                    if player ~= PlayerPedId() then
                        DrawScriptText(pos.x, pos.y, pos.z + 1.1, text)
                    else
                        DrawScriptText(pos.x, pos.y, pos.z + 1.1, text)
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    RegisterKeyMapping(Ewa.commandName, 'Owner Tagg', 'keyboard', Ewa.commandKey)
end)