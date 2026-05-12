#> 1_fishing_battle:fishing_bobber_setting
#
# FishingBattle：浮きの初期設定
# 
# @within function 1_fishing_battle:_main/game_state/3_play



# PlayerID設定
    scoreboard players operation @s PNCT.Player.ID = @p[tag=PNCT.1FSBT.Player,scores={1FSBT.Player.Used.Fishing_Rod=1..}] PNCT.Player.ID

# 釣竿の種類を浮きに保存
    execute store result entity @s data.RodType int 1.0 run data get entity @p[tag=PNCT.1FSBT.Player,scores={1FSBT.Player.Used.Fishing_Rod=1..}] SelectedItem.components."minecraft:custom_data".1FSBT.ID