ESX = nil
local IsDead = false

pistol = {453432689, 3219281620, 1593441988, -1716589765, -1076751822, -771403250, 137902532, -598887786, -1045183535, 584646201}

supp1 = {-2084633992, -1357824103, 2132975508, -494615257}
supp2 = {-1716589765, 324215364, -270015777, -1074790547, -1063057011, -1654528753, 984333226}
supp3 = {1593441988, -771403250, 584646201, 137902532, 736523883}
supp4 = {487013001}

flash1 = {453432689, 1593441988, 584646201, -1716589765, -771403250, 324215364}
flash2 = {736523883, -270015777, 171789620, -1074790547, -2084633992, -1357824103, -1063057011, 2132975508, 487013001, -494615257, -1654528753, 984333226}

grip1 = {171789620, -1074790547, -2084633992, -1063057011, 2132975508, 2144741730, -494615257, -1654528753, 984333226}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('playerSpawned', function()
    used = 0
    used2 = 0
    used3 = 0
    used4 = 0
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

local used = 0

RegisterNetEvent('pngt_ase:silencieux')
AddEventHandler('pngt_ase:silencieux', function()
    local inventory = ESX.GetPlayerData().inventory
    local silencieux = 0
    local item = 'silencieux'
    
    for i=1, #inventory, 1 do
        if inventory[i].name == 'silencieux' then
            silencieux = inventory[i].count
        end
    end

    local ped = PlayerPedId()
    local WepHash = GetSelectedPedWeapon(ped)

    if WepHash == GetHashKey("WEAPON_PISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))
        used = used + 1
    elseif table.includes(supp1, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0x837445AA)
        used = used + 1
    elseif table.includes(supp2, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xA73D4664)
        used = used + 1
    elseif table.includes(supp3, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xC304849A)
        used = used + 1
    elseif table.includes(supp4, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xE608B35E)
        used = used + 1
    else
        TriggerServerEvent('returnItem', item)
    end
end)

local used2 = 0

RegisterNetEvent('pngt_ase:flashlight')
AddEventHandler('pngt_ase:flashlight', function() 
    local inventory = ESX.GetPlayerData().inventory
    local flashlight = 0
    local item = 'flashlight'
    
    for i=1, #inventory, 1 do
		if inventory[i].name == 'flashlight' then
			flashlight = inventory[i].count
		end
	end
    local ped = PlayerPedId()
    local WepHash = GetSelectedPedWeapon(ped)

    if table.includes(flash1, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0x359B7AAE)
    elseif table.includes(flash2, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0x7BC4CDDC)
    else
        TriggerServerEvent('returnItem', item)
    end
end)

local used3 = 0

RegisterNetEvent('pngt_ase:grip')
AddEventHandler('pngt_ase:grip', function()
    local inventory = ESX.GetPlayerData().inventory
    local grip = 0
    local item = 'grip'

    for i=1, #inventory, 1 do
        if inventory[i].name == 'grip' then
            grip = inventory[i].count
        end
    end

    local ped = PlayerPedId()
    local WepHash = GetSelectedPedWeapon(ped) 

    if table.includes(grip1, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xC164F53)
    else
        TriggerServerEvent('returnItem', item)
    end
end)

function table.includes(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end
