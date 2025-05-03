function roundValue(number, decimals)
    local power = 10^decimals
    return math.floor(number * power) / power
end

RegisterNetEvent("infinity_stores:buy")
AddEventHandler("infinity_stores:buy", function(_InfinitySource, itemdb, price, quantity, PlayerDatas)
    local SourceSteamID, result = exports.infinity_core:GetPlayerSource(_InfinitySource)
    local playerCash = tonumber(PlayerDatas and PlayerDatas._Cash) or 0
    local priceNum = tonumber(price) or 0
    local quantityNum = tonumber(quantity) or 0
    if playerCash >= priceNum then
        exports.infinity_core:RemoveCash(_InfinitySource, priceNum)
        exports.infinity_needs:AddInventoryItem(_InfinitySource, itemdb, quantityNum, PlayerDatas and PlayerDatas._Inventory or {}, false)
        exports.infinity_core:notification(_InfinitySource, "Item Buy", '<b class="text-danger">- '..roundValue(priceNum, 2)..'$</b>', 'center_right', 'infinitycore', 3000)
    else
        exports.infinity_core:notification(_InfinitySource,'<div class="text-danger">No Money</div>', '<small style="font-size:18px;">You dont have enough money</small>', 'center_right', 'infinitycore', 2500)
    end
end)

RegisterNetEvent("infinity_stores:sell")
AddEventHandler("infinity_stores:sell", function(_InfinitySource, itemdb, price, quantity, Xp)
    local SourceSteamID = exports.infinity_core:GetPlayerSource(_InfinitySource)
    if SourceSteamID then
       local PlayerDatas   = exports.infinity_core:GetPlayerSession(tonumber(_InfinitySource))
       local InventoryQT   = exports.infinity_needs:CheckPlayerInventory(_InfinitySource, itemdb)
       local quantityNum = tonumber(quantity) or 0
       local priceNum = tonumber(price) or 0
       local XP_Given = tonumber(Xp) or 0
       if InventoryQT ~= nil and tonumber(InventoryQT) > 0 then
            exports.infinity_core:AddXP(_InfinitySource, XP_Given)
            exports.infinity_core:notification(_InfinitySource, "<b class='text-success'>Item Sell</b>", '<b class="text-light">+ '..roundValue(priceNum, 2)..'$ <br> +'..XP_Given..'XP</b>', 'center_right', 'redm_min', 2500)
            exports.infinity_core:AddCash(_InfinitySource, priceNum)
            exports.infinity_needs:RemoveInventoryItem(_InfinitySource, itemdb, quantityNum, PlayerDatas and PlayerDatas._Inventory or {}, false)
       else
        exports.infinity_core:notification(_InfinitySource, "<b class='text-danger'>ERROR</b>", 'You dont have this item', 'center_right', 'redm_min', 2500)
       end
    end
end)
