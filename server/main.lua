ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('silencieux', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('silencieux', 1)
    TriggerClientEvent('pngt_ase:silencieux', source)
end)

ESX.RegisterUsableItem('flashlight', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('flashlight', 1)
    TriggerClientEvent('pngt_ase:flashlight', source)
end)

ESX.RegisterUsableItem('grip', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('grip', 1)
    TriggerClientEvent('pngt_ase:grip', source)
end)

RegisterNetEvent('returnItem')
AddEventHandler('returnItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(item, 1)
end)