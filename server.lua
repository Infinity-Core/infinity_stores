function roundValue(number, decimals)
    local power = 10^decimals
    return math.floor(number * power) / power
end

RegisterNetEvent("infinity_stores:buy")
AddEventHandler("infinity_stores:buy", function(_InfinitySource, itemdb, price, quantity, PlayerDatas)
    local SourceSteamID, result = exports.infinity_core:GetPlayerSource(_InfinitySource)
    if tonumber(PlayerDatas._Cash) >= tonumber(price) then
        exports.infinity_core:RemoveCash(_InfinitySource, tonumber(price))
        exports.infinity_needs:AddInventoryItem(_InfinitySource, itemdb, tonumber(quantity), PlayerDatas._Inventory, false)
        exports.infinity_core:notification(_InfinitySource, "Item Buy", '<b class="text-danger">- '..roundValue(price, 2)..'$</b>', 'center_right', 'infinitycore', 3000)    
    else
        exports.infinity_core:notification(_InfinitySource,'<div class="text-danger">No Money</div>', '<small style="font-size:18px;">You dont have money</small>', 'center_right', 'infinitycore', 2500)
    end
end)

RegisterNetEvent("infinity_stores:sell")
AddEventHandler("infinity_stores:sell", function(_InfinitySource, itemdb, price, quantity, Xp)
    local SourceSteamID = exports.infinity_core:GetPlayerSource(_InfinitySource)
    if SourceSteamID then
       local PlayerDatas   = exports.infinity_core:GetPlayerSession(tonumber(_InfinitySource))
       local InventoryQT   = exports.infinity_needs:CheckPlayerInventory(_InfinitySource, itemdb)
       if InventoryQT ~= nil and tonumber(InventoryQT) > 0 then 
            XP_Given = tonumber(Xp)
            exports.infinity_core:AddXP(_InfinitySource, XP_Given)
            exports.infinity_core:notification(_InfinitySource, "<b class='text-success'>Item Sell</b>", '<b class="text-light">+ '..roundValue(price, 2)..'$ <br> +'..XP_Given..'XP</b>', 'center_right', 'redm_min', 2500)    
            exports.infinity_core:AddCash(_InfinitySource, price)
            exports.infinity_needs:RemoveInventoryItem(_InfinitySource, itemdb, tonumber(quantity), PlayerDatas._Inventory, false)
       else
        exports.infinity_core:notification(_InfinitySource, "<b class='text-danger'>ERROR</b>", 'You dont have this item', 'center_right', 'redm_min', 2500)    
       end
    end
end)