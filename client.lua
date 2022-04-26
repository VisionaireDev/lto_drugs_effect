-- Smoke Weed // Fumer du Weed
RegisterNetEvent("lto_drugs_effect:weed")
AddEventHandler("lto_drugs_effect:weed", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_SMOKE_INTERACTION'), 20000, true, false, false, false)
    Wait(20000)
	AnimpostfxPlay("PlayerDrugsPoisonWell")
	Citizen.InvokeNative(0x406CCF555B04FAD3 , PlayerPedId(), 1, 0.95)
	Wait(60000) -- 1 min effect/duration
	AnimpostfxStop("PlayerDrugsPoisonWell")
	Citizen.InvokeNative(0x406CCF555B04FAD3 , PlayerPedId(), 1, 0.00)
end)


-- Magic Mush to Eat // Manger des Champignons Magic
RegisterNetEvent("lto_drugs_effect:mush")
AddEventHandler("lto_drugs_effect:mush", function()
	Manger()
	AnimpostfxPlay("PlayerDrunkAberdeen")
	Citizen.InvokeNative(0x406CCF555B04FAD3 , PlayerPedId(), 1, 0.95)
	Wait(60000) -- 1 min effect/duration
	AnimpostfxStop("PlayerDrunkAberdeen")
	Citizen.InvokeNative(0x406CCF555B04FAD3 , PlayerPedId(), 1, 0.00)
end)


-- Drink Alcool and be Drunk // Boire et être Alcoolisé
RegisterNetEvent("lto_drugs_effect:moonshine")
AddEventHandler("lto_drugs_effect:moonshine", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_DRINKING'), 20000, true, false, false, false)
    Wait(20000)
	ClearPedTasksImmediately(PlayerPedId())
	AnimpostfxPlay("PlayerDrunk01")
	Citizen.InvokeNative(0x406CCF555B04FAD3 , PlayerPedId(), 1, 0.95)
	Wait(60000) -- 1 min effect/duration
	AnimpostfxStop("PlayerDrunk01")
	Citizen.InvokeNative(0x406CCF555B04FAD3 , PlayerPedId(), 1, 0.00)
end)


function Manger()
    Eat = true
    local ped = PlayerPedId()

    local playerPed = PlayerPedId()
    local prop_name = 's_amedmush'
    local x,y,z = table.unpack(GetEntityCoords(playerPed))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(playerPed, "SKEL_R_Finger00")

    RequestAnimDict("amb_misc@world_human_eat_apple@male_a@wip_base")
    while not HasAnimDictLoaded("amb_misc@world_human_eat_apple@male_a@wip_base") do
        Citizen.Wait(100)
    end
    if  IsPedMale(playerPed) then
        TaskPlayAnim(playerPed, "amb_misc@world_human_eat_apple@male_a@wip_base", "wip_base", 8.0, -8.0, 5500, 0, 0, true, 0, false, 0, false)
        AttachEntityToEntity(prop, playerPed,boneIndex, 0.00, 0.0, 0.0, 1.024, 70.0, 100.0, true, true, false, true, 1, true)
        Wait(5500)
        ClearPedSecondaryTask(playerPed)
        DeleteObject(prop)
    else
        TaskPlayAnim(playerPed, "amb_misc@world_human_eat_apple@male_a@wip_base", "wip_base", 8.0, -8.0, 5500, 0, 0, true, 0, false, 0, false)
        AttachEntityToEntity(prop, playerPed,boneIndex, 0.00, 0.0, 0.0, 1.024, 70.0, 100.0, true, true, false, true, 1, true)
        Wait(5500)
        ClearPedSecondaryTask(playerPed)
        DeleteObject(prop)
    end
    Eat = false
end

-- Annuler/Stop
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 0xA65EBAB4) then
            ClearPedTasksImmediately(PlayerPedId())
        end
    end 
end)