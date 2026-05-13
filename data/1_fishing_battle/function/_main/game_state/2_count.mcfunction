#> 1_fishing_battle:_main/game_state/2_count
#
# FishingBattle：ゲーム開始前カウントダウンに常時読み込む
# 
# @within function 1_fishing_battle:_main/_tick

#> Temp Holder
# @private
    #define score_holder $XXX.Player.ID



# 釣果アイテムを削除
    ## 手持ち
        ### 釣果アイテム
            execute as @a[tag=PNCT.1FSBT.Player] at @s run clear @s minecraft:cod[custom_data={"PNCT":{"1FSBT":{"CatchItem":{}}}}]
        ### 釣竿
            execute as @a[tag=PNCT.1FSBT.Player] at @s run clear @s minecraft:fishing_rod[custom_data={"PNCT":{"1FSBT":{"FishingRod":{}}}}]
        ### 実績トロフィー
    ## ドロップ
        ### 釣果アイテム
            execute as @e[type=item] at @s if data entity @s Item.components.minecraft:custom_data.PNCT.1FSBT.CatchItem run kill @s
        ### 釣竿
            execute as @e[type=item] at @s if data entity @s Item.components.minecraft:custom_data.PNCT.1FSBT.FishingRod run kill @s
        ### 実績トロフィー

