local PlayerData = {}
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand('neons', function()
	local player = GetPlayerPed(-1)
	if IsPedSittingInAnyVehicle(player) then 

			SetNuiFocus( true, true )
			SendNUIMessage({
				ativa = true
			})
		end
end)


RegisterNUICallback('1', function(data, cb)
	TriggerEvent('Neon')
  	cb('ok')
end)

RegisterNUICallback('2', function(data, cb)
	TriggerEvent('NeonFront')
  	cb('ok')
end)

RegisterNUICallback('3', function(data, cb)
	TriggerEvent('NeonBack')
  	cb('ok')
end)

RegisterNUICallback('4', function(data, cb)
	TriggerEvent('NeonRight')
  	cb('ok')
end)

RegisterNUICallback('5', function(data, cb)
	TriggerEvent('NeonLeft')
  	cb('ok')
end)

RegisterNUICallback('fechar', function(data, cb)
	SetNuiFocus( false )
	SendNUIMessage({
	ativa = false
	})
  	cb('ok')
end)

local isOn	=	false

RegisterNetEvent('Neon')
AddEventHandler('Neon', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--left
        if isOn then
            SetVehicleNeonLightEnabled(veh, 0, false)
            SetVehicleNeonLightEnabled(veh, 1, false)
            SetVehicleNeonLightEnabled(veh, 2, false)
            SetVehicleNeonLightEnabled(veh, 3, false)
			
			isOn = false
        else
            SetVehicleNeonLightEnabled(veh, 0, true)
            SetVehicleNeonLightEnabled(veh, 1, true)
            SetVehicleNeonLightEnabled(veh, 2, true)
            SetVehicleNeonLightEnabled(veh, 3, true)
			
			isOn = true
        end
    end
end, false)

RegisterNetEvent('NeonLeft')
AddEventHandler('NeonLeft', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--left
        if IsVehicleNeonLightEnabled(veh, 0) then
            SetVehicleNeonLightEnabled(veh, 0, false)
        else
            SetVehicleNeonLightEnabled(veh, 0, true)
			
			isOn = true
        end
    end
end, false)

RegisterNetEvent('NeonRight')
AddEventHandler('NeonRight', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--right
        if IsVehicleNeonLightEnabled(veh, 1) then
            SetVehicleNeonLightEnabled(veh, 1, false)
        else
            SetVehicleNeonLightEnabled(veh, 1, true)
			
			isOn = true
        end
    end
end, false)

RegisterNetEvent('NeonFront')
AddEventHandler('NeonFront', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--front
        if IsVehicleNeonLightEnabled(veh, 2) then
            SetVehicleNeonLightEnabled(veh, 2, false)
        else
            SetVehicleNeonLightEnabled(veh, 2, true)
			
			isOn = true
        end
    end
end, false)

RegisterNetEvent('NeonBack')
AddEventHandler('NeonBack', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--back
        if IsVehicleNeonLightEnabled(veh, 3) then
            SetVehicleNeonLightEnabled(veh, 3, false)
        else
            SetVehicleNeonLightEnabled(veh, 3, true)
			
			isOn = true
        end
    end
end, false)