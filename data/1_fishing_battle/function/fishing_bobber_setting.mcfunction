#> 1_fishing_battle:fishing_bobber_setting
#
# FishingBattle：浮きの初期設定
# 
# @within function 1_fishing_battle:_main/game_state/3_play



# PlayerID設定
    scoreboard players operation @s PNCT.Player.ID = @p[tag=PNCT.FSBT.Player,scores={1FSBT.Player.Used.Fishing_Rod=1..}] PNCT.Player.ID
