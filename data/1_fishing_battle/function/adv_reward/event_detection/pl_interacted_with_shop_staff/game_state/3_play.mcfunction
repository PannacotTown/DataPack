#> 1_fishing_battle:adv_reward/event_detection/pl_interacted_with_shop_staff/
#
# FishingBattle：advacement報酬/村人を右クリックした時
# 
# @within advancement 1_fishing_battle:pl_interacted_with_shop_staff

#> Temp Holder
    #define score_holder $XXX.Shop_Price PNCT.Temp
    #   値段保持用



# 購入処理
    ## 価格代入
        execute if predicate 1_fishing_battle:player.loocing_at.shop_staff/double run execute store result score $XXX.Shop_Price PNCT.Temp run data get entity @n[nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Double"}}}}}] data.PNCT.1FSBT.Shop.Price
        execute if predicate 1_fishing_battle:player.loocing_at.shop_staff/lure run execute store result score $XXX.Shop_Price PNCT.Temp run data get entity @n[nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Lure"}}}}}] data.PNCT.1FSBT.Shop.Price
        execute if predicate 1_fishing_battle:player.loocing_at.shop_staff/rich run execute store result score $XXX.Shop_Price PNCT.Temp run data get entity @n[nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Rich"}}}}}] data.PNCT.1FSBT.Shop.Price
        execute if predicate 1_fishing_battle:player.loocing_at.shop_staff/gambling run execute store result score $XXX.Shop_Price PNCT.Temp run data get entity @n[nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Gambling"}}}}}] data.PNCT.1FSBT.Shop.Price
        execute if predicate 1_fishing_battle:player.loocing_at.shop_staff/slot run execute store result score $XXX.Shop_Price PNCT.Temp run data get entity @n[nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Slot"}}}}}] data.PNCT.1FSBT.Shop.Price
        execute if predicate 1_fishing_battle:player.loocing_at.shop_staff/slot-10 run execute store result score $XXX.Shop_Price PNCT.Temp run data get entity @n[nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Slot-10"}}}}}] data.PNCT.1FSBT.Shop.Price
    ## 勘定
        ### 成功
            #### give
                execute if score @s 1FSBT.Player.Score >= $XXX.Shop_Price PNCT.Temp if predicate 1_fishing_battle:player.loocing_at.shop_staff/double run loot give @s loot item:1_fishing_battle/item/fishing_rod/double
                execute if score @s 1FSBT.Player.Score >= $XXX.Shop_Price PNCT.Temp if predicate 1_fishing_battle:player.loocing_at.shop_staff/lure run loot give @s loot item:1_fishing_battle/item/fishing_rod/lure
                execute if score @s 1FSBT.Player.Score >= $XXX.Shop_Price PNCT.Temp if predicate 1_fishing_battle:player.loocing_at.shop_staff/rich run loot give @s loot item:1_fishing_battle/item/fishing_rod/rich
                execute if score @s 1FSBT.Player.Score >= $XXX.Shop_Price PNCT.Temp if predicate 1_fishing_battle:player.loocing_at.shop_staff/gambling run loot give @s loot item:1_fishing_battle/item/fishing_rod/gambling
                execute if score @s 1FSBT.Player.Score >= $XXX.Shop_Price PNCT.Temp if predicate 1_fishing_battle:player.loocing_at.shop_staff/slot run loot give @s loot item:1_fishing_battle/item/fishing_rod/slot
                execute if score @s 1FSBT.Player.Score >= $XXX.Shop_Price PNCT.Temp if predicate 1_fishing_battle:player.loocing_at.shop_staff/slot-10 run loot give @s loot item:1_fishing_battle/item/fishing_rod/slot10
            #### 計算
                execute if score @s 1FSBT.Player.Score >= $XXX.Shop_Price PNCT.Temp run scoreboard players operation @s 1FSBT.Player.Score -= $XXX.Shop_Price PNCT.Temp
            #### 通知
                execute at @s run playsound minecraft:entity.villager.yes voice MVrasame ~ ~ ~ 1.0 1.0
        ### 失敗
            #### 通知
                execute if score @s 1FSBT.Player.Score < $XXX.Shop_Price PNCT.Temp run tellraw @s ""
                execute if score @s 1FSBT.Player.Score < $XXX.Shop_Price PNCT.Temp run execute at @s run playsound minecraft:entity.villager.trade voice @s ~ ~ ~ 1.0 1.0
        ### debug msg
            tellraw @a[tag=PNCT.Debug] "[DEBUG/Shop] 購入"

# Temp削除
    scoreboard players reset $XXX.Shop_Price PNCT.Temp
