#> 1_fishing_battle:_main/game_state/3_play
#
# FishingBattle：ゲーム中に常時読み込む
# 
# @within function 1_fishing_battle:_main/_tick



#　釣竿の浮き初期設定
    execute as @e[type=fishing_bobber] unless score @s PNCT.Player.ID = @s PNCT.Player.ID at @s run function 1_fishing_battle:fishing_bobber_setting

# 浮きのIDと釣竿が合わなければ、kill
    execute as @a[tag=PNCT.FSBT.Player] at @s run function 1_fishing_battle:fishing_bobber_replace_decision
    