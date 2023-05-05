ESX = exports["es_extended"]:getSharedObject()

RegisterKeyMapping('menuf5','Apri Menu F5','KEYBOARD','F5')

RegisterCommand('menuf5', function()
    Menu()
end)
function Menu()
    lib.registerMenu({
        id = 'menuf5',
        title = 'Menu F5',
        position = 'top-left',
        options = {
            {label = 'Gestione Documenti'}, 
            {label = 'Menu Gps'},
            {label = 'Menu Fps'},
            {label = 'Menu Amministrazione'},
        }
    }, function(selected)
        print(selected)
        if selected == 1 then 
            Documenti()
        elseif selected == 2 then
            MenuGps()
        elseif selected == 3 then
            MenuFps()
        elseif selected == 4 then
            ESX.TriggerServerCallback("YD:checkgroup", function(playerRank)
                if playerRank == "admin" or playerRank == "superadmin" then
                    MenuAdmin()
                else 
                    ESX.ShowNotification("Non Hai I Permessi!")
                end
            end)
        end
    end)
        lib.showMenu('menuf5') 
end

function Documenti()
    ESX.TriggerServerCallback('yd:dati', function(nome, id, lavoro)
        lib.registerMenu({
            id = 'documenti',
            title = 'Menu title',
            position = 'top-left',
            options = {
                {label = "Nome: "..nome..""},
                {label = "ID: "..id..""},
                {label = "Lavoro: "..lavoro..""},
            }
        }, function(selected)
        end)
        lib.showMenu('documenti') 
    end)
end

function MenuGps()
    lib.registerMenu({
        id = 'menugps',
        title = 'Menu F5',
        position = 'top-left',
        options = {
            {label = "Centrale Di Polizia"},
            {label = "Ospedale"},
            {label = "Concessionario"},
            {label = "Garage Centrale"},
            {label = "Armeria"},
            {label = "Banca"},
        }
    }, function(selected)
        print(selected)
        if selected == 1 then 
            TriggerEvent("centrale")
        elseif selected == 2 then
            TriggerEvent('ospedale')
        elseif selected == 3 then
            TriggerEvent('concessionario')
        elseif selected == 5 then
            TriggerEvent('garagecentrale')
        elseif selected == 6 then
            TriggerEvent('armeria')
        elseif selected == 7 then
            TriggerEvent('banca')
        elseif selected == 8 then
            TriggerEvent('chiudimenu')
        end
    end)
        lib.showMenu('menugps') 
end

RegisterNetEvent('centrale')
AddEventHandler('centrale', function()
	SetNewWaypoint(411.4890, -982.9155, 29.4157)
		ESX.ShowNotification("GPS Impostato Centrale Di Polizia")
end)

RegisterNetEvent('ospedale')
AddEventHandler('ospedale', function()
	SetNewWaypoint(293.0005, -584.2846, 43.1920)
		ESX.ShowNotification("GPS Impostato Ospedale")
end)

RegisterNetEvent('concessionario')
AddEventHandler('concessionario', function()
	SetNewWaypoint(-54.8417, -1111.2412, 26.4357)
		ESX.ShowNotification("GPS Impostato Concessionario")
end)

RegisterNetEvent('garagecentrale')
AddEventHandler('garagecentrale', function()
	SetNewWaypoint(214.1303, -792.8495, 30.8494)
		ESX.ShowNotification("GPS Impostato Garage Centrale")
end)

RegisterNetEvent('armeria')
AddEventHandler('armeria', function()
	SetNewWaypoint(814.4321, -2127.8757, 29.3061)
		ESX.ShowNotification("GPS Impostato Armeria")
end)

RegisterNetEvent('bancaaa')
AddEventHandler('bancaaa', function()
	SetNewWaypoint(152.4882, -1029.8076, 29.1989)
		ESX.ShowNotification("GPS Impostato Banca")
end)



function MenuFps()
    lib.registerMenu({
        id = 'menufps',
        title = 'Menu F5',
        position = 'top-left',
        options = {
            {label = 'Reset'},
            {label = 'Boost FPS'},
            {label = 'Boost Grafica'},
            {label = 'Boost Luci'},
            {label = 'Gestione Distanza'},		
        }
    }, function(selected)
        print(selected)
        if selected == 1 then 
            SetTimecycleModifier()
            ClearTimecycleModifier()
            ClearExtraTimecycleModifier()
            SetTimecycleModifier('default')
        elseif selected == 2 then 
            SetTimecycleModifier('cinema')
            SetForceVehicleTrails(false)
            SetForcePedFootstepsTracks(false)
        elseif selected == 3 then 
            SetTimecycleModifier('MP_Powerplay_blend')
            SetExtraTimecycleModifier('reflection_correct_ambient')  
        elseif selected == 4 then 
            SetTimecycleModifier('tunnel')
        elseif selected == 5 then 
            DistanzaFPS()
        end
    end)
    
        lib.showMenu('menufps') 

end

function DistanzaFPS()
    lib.registerMenu({
        id = 'distanzafps',
        title = 'Menu F5',
        position = 'top-left',
        options = {
            {label = 'Distanza Bassa'},
		{label = 'Distanza Media'},
		{label = 'Distanza Alta'},	
        }
    }, function(selected)
        print(selected)
        if selected == 1 then 
            OverrideLodscaleThisFrame(0.5)
            SetLightsCutoffDistanceTweak(0.5)
            CascadeShadowsSetCascadeBoundsScale(0.0)	
            RopeDrawShadowEnabled(false)
            CascadeShadowsClearShadowSampleType()
            CascadeShadowsSetAircraftMode(false)
            CascadeShadowsEnableEntityTracker(true)
            CascadeShadowsSetDynamicDepthMode(false)
            CascadeShadowsSetEntityTrackerScale(0.0)
            CascadeShadowsSetDynamicDepthValue(0.0)
            CascadeShadowsSetCascadeBoundsScale(0.0)
            SetFlashLightFadeDistance(0.0)
            SetLightsCutoffDistanceTweak(0.0)
            DistantCopCarSirens(false)
            SetDisableDecalRenderingThisFrame()
        elseif selected == 2 then
            OverrideLodscaleThisFrame(1.0)
            SetLightsCutoffDistanceTweak(1.0)
            CascadeShadowsSetCascadeBoundsScale(0.5)	
            RopeDrawShadowEnabled(false)
            CascadeShadowsClearShadowSampleType()
            CascadeShadowsSetAircraftMode(false)
            CascadeShadowsEnableEntityTracker(true)
            CascadeShadowsSetDynamicDepthMode(false)
            CascadeShadowsSetEntityTrackerScale(0.0)
            CascadeShadowsSetDynamicDepthValue(0.0)
            CascadeShadowsSetCascadeBoundsScale(0.0)
            SetFlashLightFadeDistance(5.0)
            SetLightsCutoffDistanceTweak(5.0)
            DistantCopCarSirens(false)
            SetDisableDecalRenderingThisFrame()
        elseif selected == 3 then
            OverrideLodscaleThisFrame(75.0)
            SetLightsCutoffDistanceTweak(75.0)
            CascadeShadowsSetCascadeBoundsScale(1.0)
            RopeDrawShadowEnabled(true)
            CascadeShadowsClearShadowSampleType()
            CascadeShadowsSetAircraftMode(false)
            CascadeShadowsEnableEntityTracker(true)
            CascadeShadowsSetDynamicDepthMode(false)
            CascadeShadowsSetEntityTrackerScale(5.0)
            CascadeShadowsSetDynamicDepthValue(3.0)
            CascadeShadowsSetCascadeBoundsScale(3.0)
            SetFlashLightFadeDistance(3.0)
            SetLightsCutoffDistanceTweak(3.0)
            DistantCopCarSirens(false)
            SetArtificialLightsState(false)
            SetDisableDecalRenderingThisFrame()
        end
    end)
        lib.showMenu('distanzafps') 
end



function MenuAdmin()
    lib.registerMenu({
        id = 'menuadmin',
        title = 'Menu F5',
        position = 'top-left',
        options = {
            {label = 'Noclip'},
            {label = 'Tpm'},
            {label = 'Nomi Player'},
            {label = 'Blip Player'},
            {label = 'Godmode'},
            {label = 'Ripara Veicolo'},
			{label = 'Ribalta Veicolo'},
			{label = 'Spawn Veicolo'},
        }
     
    }, function(selected)
        print(selected)
        if selected == 1 then 
           
            noclip = not noclip

            Wait(100)

            if noclip then
                Noclip()
                ESX.ShowNotification('Noclip Abilitato')
            else
                FreezeEntityPosition(PlayerPedId(), false)
                SetEntityInvincible(PlayerPedId(), false)
                SetEntityCollision(PlayerPedId(), true, true)

                SetEntityVisible(PlayerPedId(), true, false)

                SetEveryoneIgnorePlayer(PlayerId(), false)
                SetPoliceIgnorePlayer(PlayerId(), false)

                ESX.ShowNotification('Noclip Disabilitato')
            end
        elseif selected == 2 then
            ExecuteCommand('tpm')
        elseif val == 'invisiblita' then
            invisibile = not invisibile

            if invisibile then
                SetEntityVisible(PlayerPedId(), false, false)
                ESX.ShowNotification('Invisibilità Abilitata')
            else
                SetEntityVisible(PlayerPedId(), true, false)
                ESX.ShowNotification('Invisibilità Disabilitata')
            end
        elseif val == 'tpcoords' then
            local pos = KeyboardInput('BOX_COORDINATE', 'Inserisci Coordinate', '', 50)

            if pos ~= nil and pos ~= '' then
                local _, _, x, y, z = string.find(pos, '([%d%.]+) ([%d%.]+) ([%d%.]+)')
                        
                if x ~= nil and y ~= nil and z ~= nil then
                    SetEntityCoords(PlayerPedId(), x + .0, y + .0, z + .0)
                end
            end
        elseif selected == 6 then
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    SetVehicleFixed(GetVehiclePedIsUsing(PlayerPedId()))	
                    SetVehicleDirtLevel(GetVehiclePedIsUsing(PlayerPedId()),0)
                    ESX.ShowNotification("Hai riparato il veicolo")
                    
                else
                    ESX.ShowNotification("Bro devi stare nel veicolo!!")
                    
                end
        elseif selected == 7 then
            local player = PlayerPedId()
            local posdepmenu = GetEntityCoords(player)
            local carTargetDep = GetClosestVehicle(posdepmenu['x'], posdepmenu['y'], posdepmenu['z'], 10.0,0,70)
            SetPedIntoVehicle(player , carTargetDep, -1)
            Citizen.Wait(200)
            ClearPedTasksImmediately(player)
            Citizen.Wait(100)
            local playerCoords = GetEntityCoords(PlayerPedId())
            playerCoords = playerCoords + vector3(0, 2, 0)
            SetEntityCoords(carTargetDep, playerCoords)
			ESX.ShowNotification("Hai ribaltato il veicolo")
			
        elseif selected == 8 then
            local input = lib.inputDialog('Spawna un veicolo', {'Inserisci il nome del veicolo'})

			if input then
				local ModelHash = input[1]

				if not IsModelInCdimage(ModelHash) then return end
				RequestModel(ModelHash)
				while not HasModelLoaded(ModelHash) do 
				Citizen.Wait(10)
				end
				local MyPed = PlayerPedId() 
				local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false)
				SetModelAsNoLongerNeeded(ModelHash)
				TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
				ESX.ShowNotification("Hai spawnato un veicolo")
            
			end
        elseif selected == 3 then
            OpenNomiPlayer()
        elseif selected == 4 then
            OpenblipPlayer()
        elseif selected == 5 then
            Godmode()
        end
    end)
        lib.showMenu('menuadmin') 
end

local mostrablip = false
OpenblipPlayer = function ()
    mostrablip = not mostrablip
    if mostrablip then
        mostrablip = true
        print("Blip sui player Abilitati")
    else
        mostrablip = false
        print("Blip sui player Disabilitati")
    end
    Citizen.CreateThread(function()
        local blips = {}
        while mostrablip do
            Citizen.Wait(1)
            for _, ServerPlayer in ipairs(GetActivePlayers()) do
                local player = tonumber(ServerPlayer)
                if GetPlayerPed(player) ~= GetPlayerPed(-1) then
                    ped = GetPlayerPed(player)
                    if mostrablip then
                        RemoveBlip(blips[player])
                        local playerName = GetPlayerName(player)
                        local new_blip = AddBlipForEntity(ped)
                        SetBlipNameToPlayerName(new_blip, player)
                        SetBlipColour(new_blip, 1)
                        SetBlipScale(new_blip, 0.9)

                        blips[player] = new_blip
                    else
                        for blip, v in pairs(blips) do
                            RemoveBlip(v)
                        end
                        isShowingBlips = false
                        return
                    end
                end
            end
        end
        return
    end)
    if not mostrablip then 
        return
    end
end

local Attiva  = false
Godmode = function ()
    Attiva = not Attiva   
    if Attiva then
        print("Hai Attivato la Godmode")
    else
        print("Hai Disattivato la Godmode")
    end 
    Citizen.CreateThread(function()
        while true do
            if Attiva then
                Citizen.Wait(0)
                SetEntityHealth(GetPlayerPed(-1),GetEntityMaxHealth(GetPlayerPed(-1))) 
            else
                return
            end
        end
    end)
end

local mostranomi = false
 OpenNomiPlayer =function ()
    mostranomi = not mostranomi
    if mostranomi then
        mostranomi = true
        print("Nomi sui player Abilitati")
    else
        mostranomi = false
        print("Nomi sui player Disabilitati")
    end
    Citizen.CreateThread(function()
        while mostranomi do
            Citizen.Wait(1)
            for _, ServerPlayer in ipairs(GetActivePlayers()) do
                local player = tonumber(ServerPlayer)
                if GetPlayerPed(player) ~= GetPlayerPed(-1) then
                    ped = GetPlayerPed(player)
                    idTesta = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped,"Nome: "..GetPlayerName(player) .. "\nID: ["..GetPlayerServerId(player).."]\n Vita: "..GetEntityHealth(ped), false, false, "", false)
                    if mostranomi then
                        N_0x63bb75abedc1f6a0(idTesta, 9, true)
                    else
                        N_0x63bb75abedc1f6a0(idTesta, 0, false)
                    end
                    if not mostranomi then
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 9, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 0, false)
                        
                        RemoveMpGamerTag(idTesta)
                        return
                    end
                end
            end
        end
        return
    end)
    if not mostranomi then 
        return
    end
end


function getCamDirection()
	local heading = GetGameplayCamRelativeHeading() + GetEntityPhysicsHeading(PlayerPedId())
	local pitch = GetGameplayCamRelativePitch()
	local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0))
	local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))

	if len ~= 0 then
		coords = coords / len
	end

	return coords
end

function Noclip()
    Citizen.CreateThread(function()
		while noclip do
			Wait(0)
			local plyCoords = GetEntityCoords(PlayerPedId(), false)
			local camCoords = getCamDirection()
			SetEntityVelocity(PlayerPedId(), 0.01, 0.01, 0.01)

			if IsControlPressed(0, 32) then
				plyCoords = plyCoords + (1.0 * camCoords)
			end

			if IsControlPressed(0, 269) then
				plyCoords = plyCoords - (1.0 * camCoords)
			end

			SetEntityCoordsNoOffset(PlayerPedId(), plyCoords, true, true, true)

			FreezeEntityPosition(PlayerPedId(), true)
			SetEntityInvincible(PlayerPedId(), true)
			SetEntityCollision(PlayerPedId(), false, false)

			SetEntityVisible(PlayerPedId(), false, false)

			SetEveryoneIgnorePlayer(PlayerId(), true)
			SetPoliceIgnorePlayer(PlayerId(), true)
		end
	end)
end