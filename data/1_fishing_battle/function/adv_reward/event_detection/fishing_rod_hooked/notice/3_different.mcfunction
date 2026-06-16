#> 1_fishing_battle:adv_reward/event_detection/fishing_rod_hooked/notice/3_different
#
# FishingBattle：異種の通知function
# 
# @within function 1_fishing_battle:adv_reward/event_detection/fishing_rod_hooked/handleing_catch_item



# SE
    execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_Different]
# tellraw
    execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_Different] run tellraw @s ["",{text:"\n"},{text:"\n"},{text:" >> ",bold:true,color:"gray"},{text:"GET  ",bold:true,color:"yellow"},{nbt:"Item.components.minecraft:custom_name",entity:"@e[type=item,nbt={Item:{components:{\"minecraft:custom_data\":{\"PNCT\":{\"1FSBT\":{\"CatchItem\":{\"Fishing_Hooked\":true}}}}}}},tag=XXXTemp_Rarity_Different,limit=1,sort=nearest]",interpret:true},{text:"\n"},{text:"\n"},"     \uF822",{score:{name:"$XXX.GetCatchItem_Score",objective:"PNCT.Temp"},bold:true,color:"light_purple"},{text:"pt",bold:true,color:"light_purple"}]