#> 1_fishing_battle:adv_reward/event_detection/fishing_rod_hooked/notice/1_common
#
# FishingBattle：一般魚の通知function
# 
# @within function 1_fishing_battle:adv_reward/event_detection/fishing_rod_hooked/handleing_catch_item



# SE
    execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_Common]
# tellraw
    execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_Common] run tellraw @s ["",{text:"\n"},{text:"\n"},{text:"\n"},{text:" >> ",bold:true,color:"gray"},{text:"GET  ",bold:true,color:"yellow"},{nbt:"Item.components.minecraft:custom_name",entity:"@e[type=item,nbt={Item:{components:{\"minecraft:custom_data\":{\"PNCT\":{\"1FSBT\":{\"CatchItem\":{\"Fishing_Hooked\":true}}}}}}},tag=XXXTemp_Rarity_Common,limit=1,sort=nearest]",interpret:true},{text:"\n"},{text:"\n"},"     \uF822",{score:{name:"$XXX.GetCatchItem_Score",objective:"PNCT.Temp"},bold:true,color:"green"},{text:"pt",bold:true,color:"green"},{text:"\n"}]