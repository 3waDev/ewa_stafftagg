RegisterNetEvent("ewa-ownerTagg:function:notify")
AddEventHandler("ewa-ownerTagg:function:notify", function()
    exports['okokNotify']:Alert('Server', 'Alleen een owner kan dit doen', 5000, 'error')
end)

DrawScriptText = function(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(6)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 500
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 85)
    ClearDrawOrigin()
end
