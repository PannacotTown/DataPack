#> 1_fishing_battle:fishing_bobber_replace_decision
#
# FishingBattle：浮きの判定
# 
# @within function 1_fishing_battle:_main/game_state/3_play

#> Temp Holder
# @private
    #define score_holder $XXX.Player.ID
    #define score_holder $XXX.Player.RodType
    #define score_holder $XXX.Fishing_Bobber.RodType




# スコア保存
    execute store result score $XXX.Player.ID PNCT.Temp run scoreboard players get @s PNCT.Player.ID
    execute store result score $XXX.Player.RodType PNCT.Temp run data get entity @s SelectedItem.components."minecraft:custom_data".1FSBT.ID
    execute store result score $XXX.Fishing_Bobber.RodType PNCT.Temp run execute as @e[type=fishing_bobber] if score @s PNCT.Player.ID = $XXX.Player.ID PNCT.Temp run data get entity @s data.RodType

# 判定
    execute as @e[type=fishing_bobber] if score @s PNCT.Player.ID = $XXX.Player.ID PNCT.Temp run execute unless score $XXX.Player.RodType PNCT.Temp = $XXX.Fishing_Bobber.RodType PNCT.Temp run kill @s

    