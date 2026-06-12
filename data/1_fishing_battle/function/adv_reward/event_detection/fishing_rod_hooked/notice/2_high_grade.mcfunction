#> 1_fishing_battle:adv_reward/event_detection/fishing_rod_hooked/notice/2_high_grade
#
# FishingBattle：高級魚の通知function
# 
# @within function 1_fishing_battle:adv_reward/event_detection/fishing_rod_hooked/handleing_catch_item



# SE
    execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_High-Grade]
# tellraw
    execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_High-Grade] run tellraw @s ["",{score:{name:"$XXX.GetCatchItem_Score",objective:"PNCT.Temp"},bold:true,color:"aqua"},{text:"pt",bold:true,color:"aqua"}]