function roundValue(number, decimals)
    local power = 10^decimals
    return math.floor(number * power) / power
end

local blips             = {}
local PedsCreateds      = {}

--
-- [[ BLIPS ]]
---
if Config.BlipsMap then
    Citizen.CreateThread(function()
        for _, info in pairs(Config.Stores) do
            local blipR = N_0x554d9d53f696d002(1664425300, info.x, info.y, info.z)
            SetBlipSprite(blipR, info.sprite, 1)
            SetBlipScale(blipR, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, blipR, info.Name)
            table.insert(blips, blipR)
        end
    end)
end

--
-- [[ NPC CREATOR ]]
---
PedID = {}
Citizen.CreateThread(function()
    for _, v in pairs(Config.Peds) do
        addNPC(v[1], v[2], v[3], v[4], v[5], v[6])
    end
end)
function addNPC(x, y, z, heading, model, pedBase)
    hashe = GetHashKey(model)
    RequestModel(hashe)
    if not HasModelLoaded(hashe) then
        Wait(15)
    end
    while not HasModelLoaded(hashe) do
        Wait(1)
    end
    ped = CreatePed(
        hashe,
        x,
        y,
        z -1,
        heading,
        false,
        true
    )
    Citizen.InvokeNative(0x283978A15512B2FE, ped, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetEntityAsMissionEntity(ped, 1, 1)
    SetBlockingOfNonTemporaryEvents(ped, true)
    table.insert(PedID,{
        IDPED   = ped,
        pedBase = pedBase
    })
    table.insert(PedsCreateds, ped)
    PedsList  = json.encode(PedID)
end


---
-- [[ INTERACT ]]
---
local HasAlreadyEnteredMarker   = false
local Timer                     = 1800
local notificationSend          = false

Citizen.CreateThread(function()

    _InfinitySource = GetPlayerServerId(PlayerId())

    while true do

		Citizen.Wait(Timer)

       -- click             = false
		local playerPed   = PlayerPedId()
		local coords      = GetEntityCoords(playerPed)
        local TypeZone    = nil
        local IsInMarker  = false

        for _, store in pairs(Config.Stores) do
            if GetDistanceBetweenCoords(coords, store.x, store.y,  store.z, true) <= Config.Distance and not click then

                IsInMarker  = true
                Timer       = 10

                if not notificationSend then
                    PlaySoundFrontend("Player_Enter_Line", "RDRO_ATL_Sounds", true, 0)
                    exports.infinity_core:notification(_InfinitySource, store.Name, '<small style="font-size:20px;">Press Enter Key <br> Taxs '..store.tax..'$</small>', 'center_left', 'infinitycore', 2500)
                    notificationSend = true
                end

                if IsControlJustPressed(2, Config.KeyOpenMenu) and not click then

                    click       = true
                    Timer       = 1800

                    TaskStartScenarioInPlace(
                        PlayerPedId() --[[ Ped ]],
                        GetHashKey('WORLD_HUMAN_SMOKE') --[[ Hash ]],
                        -1 --[[ integer ]],
                        true --[[ boolean ]],
                        GetHashKey('') --[[ Hash ]],
                        -1.0 --[[ number ]],
                        false --[[ boolean ]]
                    )

                    if store.pedid ~= 0 then
                        extract = json.decode(PedsList)
                        if extract ~= nil then
                            for i, json in pairs(extract) do
                                if json.pedBase == store.pedid then
                                        if store.pedSound ~= nil then
                                            NetworkRequestControlOfNetworkId(store.pedid)
                                            play_ambient_speech_from_entity(json.IDPED, store.pedSound, store.dialog,"speech_params_force",0)
                                        end
                                    break
                                end
                            end
                        end
                    end
                    TriggerEvent('infinity_stores:openmenu', store.Name, store.DescName, store.type, store.tax)
                end

            end
        end

        if IsInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
		end

        if not IsInMarker and HasAlreadyEnteredMarker then
			Timer                   = 1800
			HasAlreadyEnteredMarker = false
            notificationSend        = false
		end

	end
end)


---- NUI ----
RegisterNetEvent('infinity_stores:openmenu')
AddEventHandler('infinity_stores:openmenu', function(StoreName, DescName, StoreType, StoreTax)
    DisplayActions(not displaymenu, StoreName, DescName, StoreType, StoreTax)
end)

function DisplayActions(bool, StoreName, DescName, StoreType, StoreTax)
    displaymenu    = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type                 = "nui_content",
        status               = displaymenu,
        StoreName            = StoreName,
        DescName             = DescName,
        StoreType            = StoreType,
        StoreTax             = StoreTax
    })
end

RegisterNUICallback("buy", function(data)
    local PlayerLevel = exports.infinity_core:XpReturn()
    local PlayerDatas = exports.infinity_core:GetPlayerSession(_InfinitySource)
    local dataLvl = tonumber(data.lvl)
    local playerLvlNum = tonumber(PlayerLevel)
    if dataLvl == nil or playerLvlNum == nil then
        exports.infinity_core:notification(_InfinitySource, "Internal error: level data missing", "", "center_right", "infinitycore", 1500)
        return
    end
    if dataLvl <= playerLvlNum then
        PlaySoundFrontend("PURCHASE", "Ledger_Sounds", true, 0)
        TriggerServerEvent('infinity_stores:buy', _InfinitySource, data.itemdb, data.price, data.quantity, PlayerDatas)
    else
        exports.infinity_core:notification(_InfinitySource, "You dont have the required level to buy this item", "", "center_right", "infinitycore", 1500)
    end
end)

RegisterNUICallback("sell", function(data)
    local PlayerLevel = exports.infinity_core:XpReturn()
    local dataLvl = tonumber(data.lvl)
    local playerLvlNum = tonumber(PlayerLevel)
    if dataLvl == nil or playerLvlNum == nil then
        exports.infinity_core:notification(_InfinitySource, "Internal error: level data missing", "", "center_right", "infinitycore", 1500)
        return
    end
    if dataLvl <= playerLvlNum then
        PlaySoundFrontend("PURCHASE", "Ledger_Sounds", true, 0)
        TriggerServerEvent('infinity_stores:sell', _InfinitySource, data.itemdb, data.price, data.quantity, data.xp)
    else
        exports.infinity_core:notification(_InfinitySource, "You dont have the required level to sell this item", "", "center_right", "infinitycore", 1500)
    end
end)

RegisterNUICallback("exit", function(data)
    ClearPedTasks(PlayerPedId(), true, true)
    DisplayActions(false)
    click             = false
end)

function play_ambient_speech_from_entity(entity_id,sound_ref_string,sound_name_string,speech_params_string,speech_line)
    local struct = DataView.ArrayBuffer(128)
    local sound_name = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", sound_name_string,Citizen.ResultAsLong())
    local sound_ref  = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING",sound_ref_string,Citizen.ResultAsLong())
    local speech_params = GetHashKey(speech_params_string)
    local sound_name_BigInt =  DataView.ArrayBuffer(16)
    sound_name_BigInt:SetInt64(0,sound_name)
    local sound_ref_BigInt = DataView.ArrayBuffer(16)
    sound_ref_BigInt:SetInt64(0,sound_ref)
    local speech_params_BigInt = DataView.ArrayBuffer(16)
    speech_params_BigInt:SetInt64(0,speech_params)
    struct:SetInt64(0,sound_name_BigInt:GetInt64(0))
    struct:SetInt64(8,sound_ref_BigInt:GetInt64(0))
    struct:SetInt32(16,speech_line)
    struct:SetInt64(24,speech_params_BigInt:GetInt64(0))
    struct:SetInt32(32, 0)
    struct:SetInt32(40, 1)
    struct:SetInt32(48, 1)
    struct:SetInt32(56, 1)
    Citizen.InvokeNative(0x8E04FEDD28D42462, entity_id, struct:Buffer());
end

----
-- [[ DELETER FUNCTION ]]
----
AddEventHandler("onResourceStop",function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print("^6 ["..GetCurrentResourceName().." are stopped by dev, all blips/npc are removed for performance]")
        for _, blipR in pairs(blips) do
            RemoveBlip(blipR)
        end
        for _, ped in pairs(PedsCreateds) do
            DeleteEntity(ped)
        end
    end
end)
