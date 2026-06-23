#> 1_fishing_battle:ranking/solo/score_attack/create
#
# FishingBattle：ソロ-ランキングを作成する
#
# @within function 1_fishing_battle:_main/game_state/4_finish

#> Temp Holder
# @within function 
#   1_fishing_battle:ranking/solo/score_attack/create
#   1_fishing_battle:_main/game_state/4_finish
#   1_fishing_battle:ranking/solo/score_attack/update
    #define score_holder $XXX.Ranking.Score.1st
    #define score_holder $XXX.Ranking.Score.2nd
    #define score_holder $XXX.Ranking.Score.3rd
    #define score_holder $XXX.Ranking.Score.4th
    #define score_holder $XXX.Ranking.Score.5th
    #define score_holder $XXX.Ranking.Score.6th
    #   スコア保存用ホルダー

#> Temp tag
# @within function 
#   1_fishing_battle:ranking/solo/score_attack/create
#   1_fishing_battle:_main/game_state/4_finish
    #define tag XXXTemp_Player_Score_1st
    #define tag XXXTemp_Player_Score_2nd
    #define tag XXXTemp_Player_Score_3rd
    #define tag XXXTemp_Player_Score_4th
    #define tag XXXTemp_Player_Score_5th
    #define tag XXXTemp_Player_Score_6th
    #   順位参照用タグ



# 上位6位のスコアを保存
    ## 1st
        execute as @a[tag=PNCT.1FSBT.Player] run scoreboard players operation $XXX.Ranking.Score.1st PNCT.Temp > @s 1FSBT.Player.Score
    ## 2nd
        execute as @a[tag=PNCT.1FSBT.Player] if score @s 1FSBT.Player.Score < $XXX.Ranking.Score.1st PNCT.Temp run scoreboard players operation $XXX.Ranking.Score.2nd PNCT.Temp > @s 1FSBT.Player.Score
    ## 3rd
        execute as @a[tag=PNCT.1FSBT.Player] if score @s 1FSBT.Player.Score < $XXX.Ranking.Score.2nd PNCT.Temp run scoreboard players operation $XXX.Ranking.Score.3rd PNCT.Temp > @s 1FSBT.Player.Score
    ## 4th
        execute as @a[tag=PNCT.1FSBT.Player] if score @s 1FSBT.Player.Score < $XXX.Ranking.Score.3rd PNCT.Temp run scoreboard players operation $XXX.Ranking.Score.4th PNCT.Temp > @s 1FSBT.Player.Score
    ## 5th
        execute as @a[tag=PNCT.1FSBT.Player] if score @s 1FSBT.Player.Score < $XXX.Ranking.Score.4th PNCT.Temp run scoreboard players operation $XXX.Ranking.Score.5th PNCT.Temp > @s 1FSBT.Player.Score
    ## 6th
        execute as @a[tag=PNCT.1FSBT.Player] if score @s 1FSBT.Player.Score < $XXX.Ranking.Score.5th PNCT.Temp run scoreboard players operation $XXX.Ranking.Score.6th PNCT.Temp > @s 1FSBT.Player.Score

# 該当者にタグ付け
    ## 1st
        execute as @a[tag=PNCT.1FSBT.Player] if score @s 1FSBT.Player.Score = $XXX.Ranking.Score.1st PNCT.Temp run tag @s add XXXTemp_Player_Score_1st
    ## 2nd
        execute as @a[tag=PNCT.1FSBT.Player] if score @s 1FSBT.Player.Score = $XXX.Ranking.Score.2nd PNCT.Temp run tag @s add XXXTemp_Player_Score_2nd
    ## 3rd
        execute as @a[tag=PNCT.1FSBT.Player] if score @s 1FSBT.Player.Score = $XXX.Ranking.Score.3rd PNCT.Temp run tag @s add XXXTemp_Player_Score_3rd
    ## 4th
        execute as @a[tag=PNCT.1FSBT.Player] if score @s 1FSBT.Player.Score = $XXX.Ranking.Score.4th PNCT.Temp run tag @s add XXXTemp_Player_Score_4th
    ## 5th
        execute as @a[tag=PNCT.1FSBT.Player] if score @s 1FSBT.Player.Score = $XXX.Ranking.Score.5th PNCT.Temp run tag @s add XXXTemp_Player_Score_5th
    ## 6th
        execute as @a[tag=PNCT.1FSBT.Player] if score @s 1FSBT.Player.Score = $XXX.Ranking.Score.6th PNCT.Temp run tag @s add XXXTemp_Player_Score_6th