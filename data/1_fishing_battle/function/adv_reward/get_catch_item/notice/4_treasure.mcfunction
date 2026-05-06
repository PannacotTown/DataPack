#> 1_fishing_battle:adv_reward/get_catch_item/notice/4_treasure
#
# FishingBattle：宝の通知function
# 
# @within function 1_fishing_battle:adv_reward/get_catch_item/handleing_catch_item



# SE
    execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_Treasure]
# tellraw
    execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_Treasure] run tellraw @s ["",{score:{name:"$XXX.GetCatchItem_Score",objective:"PNCT.Temp"},bold:true,color:"gold"},{text:"pt",bold:true,color:"gold"}]