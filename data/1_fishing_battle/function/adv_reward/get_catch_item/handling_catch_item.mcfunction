#> 1_fishing_battle:adv_reward/get_catch_item/handleing_catch_item
#
# FishingBattle：釣ったゲームアイテムの操作
#
# @within function 1_fishing_battle:adv_reward/get_catch_item/

#> Temp Holder
# @within 
#   function 1_fishing_battle:adv_reward/get_catch_item/handling_catch_item
#   function 1_fishing_battle:adv_reward/get_catch_item/notice/**
    #define score_holder $XXX.GetCatchItem_Score PNCT.Temp
        # 釣ったアイテムのポイントを一時的に保存するスコア

#> Temp Tag
# @private
    #define tag XXXTemp_Rarity_Common
    #define tag XXXTemp_Rarity_High-Grade
    #define tag XXXTemp_Rarity_Different
    #define tag XXXTemp_Rarity_Treasure
    #define tag XXXTemp_Rarity_Miss
        # 釣ったアイテムのレアリティに応じて付与されるタグ



say handling_catch_item

# 釣ったアイテムがない場合、タグを削除して終了
    execute unless entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}}] run return run tag @a[tag=XXXTemp_GetCatchItem] remove XXXTemp_GetCatchItem

# 釣ったアイテムのレアリティに応じて、タグを付与
    ## Common
        execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}}] if data entity @s {Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Rarity":"Common"}}}}}}} run tag @s add XXXTemp_Rarity_Common
    ## High-Grade
        execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}}] if data entity @s {Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Rarity":"High-Grade"}}}}}}} run tag @s add XXXTemp_Rarity_High-Grade
    ## Different
        execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}}] if data entity @s {Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Rarity":"Different"}}}}}}} run tag @s add XXXTemp_Rarity_Different
    ## Treasure
        execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}}] if data entity @s {Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Rarity":"Treasure"}}}}}}} run tag @s add XXXTemp_Rarity_Treasure
    ## Miss
        execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}}] if data entity @s {Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Rarity":"Miss"}}}}}}} run tag @s add XXXTemp_Rarity_Miss

# 釣ったアイテムのポイントを一時保存
    execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}}] store result score $XXX.GetCatchItem_Score PNCT.Temp run data get entity @s Item.components.minecraft:custom_data.PNCT.1FSBT.CatchItem.Point

# ポイントをスコアに加算
    execute as @a[tag=XXXTemp_GetCatchItem] run scoreboard players operation @s 1FSBT.Player.Score += $XXX.GetCatchItem_Score PNCT.Temp

# 通知
    ## Common
        execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_Common] run function 1_fishing_battle:adv_reward/get_catch_item/notice/1_common
    ## High-Grade
        execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_High-Grade] run function 1_fishing_battle:adv_reward/get_catch_item/notice/2_high_grade
    ## Different
        execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_Different] run function 1_fishing_battle:adv_reward/get_catch_item/notice/3_different
    ## Treasure
        execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_Treasure] run function 1_fishing_battle:adv_reward/get_catch_item/notice/4_treasure
    ## Miss
        execute as @a[tag=XXXTemp_GetCatchItem] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}},tag=XXXTemp_Rarity_Miss] run function 1_fishing_battle:adv_reward/get_catch_item/notice/5_miss

# 釣ったアイテムのcustom_dataを削除
    execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{"PNCT":{"1FSBT":{"CatchItem":{"Fishing_Hooked":true}}}}}}}] run data remove entity @s Item.components.minecraft:custom_data.PNCT.1FSBT.CatchItem.Fishing_Hooked

# Tempスコアをリセット
    scoreboard players reset $XXX.GetCatchItem_Score PNCT.Temp

# タグを削除
    tag @a[tag=XXXTemp_GetCatchItem] remove XXXTemp_GetCatchItem