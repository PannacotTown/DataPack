#> 1_fishing_battle:_main/_tick
#
# FishingBattle：ゲームモード中、常時読み込む
# 
# @within tag/function minecraft:tick



# GameState
    execute if data storage 1_fishing_battle:system {System:{GameState:"Ready"}} run function 1_fishing_battle:_main/game_state/1_ready
    execute if data storage 1_fishing_battle:system {System:{GameState:"Count"}} run function 1_fishing_battle:_main/game_state/2_count
    execute if data storage 1_fishing_battle:system {System:{GameState:"Play"}} run function 1_fishing_battle:_main/game_state/3_play/
    execute if data storage 1_fishing_battle:system {System:{GameState:"Finish"}} run function 1_fishing_battle:_main/game_state/4_finish
    execute if data storage 1_fishing_battle:system {System:{GameState:"End"}} run function 1_fishing_battle:_main/game_state/5_end

# System用advancement達成
    execute as @a[advancements={1_fishing_battle:=false}] run advancement grant @a only 1_fishing_battle:

# 経験値オーブ削除
    execute as @e[type=experience_orb] run kill @s

# エフェクト
    effect give @a saturation infinite 0 true
    effect give @a resistance infinite 255 true

# 釣竿使用回数リセット
    execute as @a if score @s 1FSBT.Player.Used.Fishing_Rod matches 1.. run scoreboard players reset @s 1FSBT.Player.Used.Fishing_Rod