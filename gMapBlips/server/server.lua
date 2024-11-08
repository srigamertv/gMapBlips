local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

RegisterServerEvent("checkPlayerPermission")
AddEventHandler("checkPlayerPermission", function(permission)
    local user_id = vRP.getUserId(source)
    local hasPermission = vRP.hasPermission(user_id, permission)
    TriggerClientEvent("returnPlayerPermission", source, permission, hasPermission)
end)
