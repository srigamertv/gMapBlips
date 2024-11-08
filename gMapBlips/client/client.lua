local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vSERVER = Tunnel.getInterface("gMapBlips")

local blipConfigs = {}
local createdBlips = {}

RegisterNetEvent("returnPlayerPermission")
AddEventHandler("returnPlayerPermission", function(permission, hasPermission)
    for i, blipData in pairs(blipConfigs) do
        if blipData.Permission == permission then
            if hasPermission then
                if not createdBlips[blipData.Label] then
                    createdBlips[blipData.Label] = createBlip(blipData)
                end
            else
                if createdBlips[blipData.Label] then
                    RemoveBlip(createdBlips[blipData.Label].blip)
                    RemoveBlip(createdBlips[blipData.Label].radiusBlip)
                    createdBlips[blipData.Label] = nil
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        for k, v in pairs(Config.Makers) do
            if v.RequirePermission then
                blipConfigs[k] = v
                TriggerServerEvent("checkPlayerPermission", v.Permission)
            else
                if not createdBlips[v.Label] then
                    createdBlips[v.Label] = createBlip(v)
                end
            end
        end
        Citizen.Wait(10000) -- Verifica a cada 10 segundos (ajuste conforme necessário)
    end
end)

function createBlip(blipConfig)
    local pos = blipConfig.Pos
    local label = blipConfig.Label
    local color = blipConfig.Color
    local size = blipConfig.Size
    local type = blipConfig.Type
    local radius = blipConfig.Radius

    local blip = AddBlipForCoord(pos)
    SetBlipSprite(blip, type)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, size)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)

    -- Adiciona o círculo ao redor do blip
    local radiusBlip = AddBlipForRadius(pos.x, pos.y, pos.z, radius)
    SetBlipColour(radiusBlip, color)
    SetBlipAlpha(radiusBlip, 128) -- Define a transparência do círculo

    return {blip = blip, radiusBlip = radiusBlip}
end
