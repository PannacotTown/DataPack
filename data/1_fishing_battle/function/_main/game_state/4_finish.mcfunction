#> 1_fishing_battle:_main/game_state/4_finish
#
# FishingBattle：ゲーム終了時に常時読み込む
# 
# @within function 1_fishing_battle:_main/-tick

#> Temp Holder
# @private
    #define score_holder $XXX.GameFinish.Progress_Timer
    #   カウントダウン用タイマーホルダー



# カウント初期化
    execute unless score $XXX.GameFinish.Progress_Timer PNCT.Temp = $XXX.GameFinish.Progress_Timer PNCT.Temp run scoreboard players set $XXX.GameFinish.Progress_Timer PNCT.Temp 420

# ランキング
    ## 更新
        #execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 420 run function 1_fishing_battle:ranking/solo/score_attack/update
    ## 発表
        ### 6位
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 360
        ### 5位
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 340
        ### 4位
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 320
        ### 3位
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 280
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 240
        ### 2位
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 180
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 140
        ### 1位
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 80
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 60
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0
        

# 進捗管理
    ## 進捗付与

# ゲーム終了
    ## GameState変更
        execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run data modify storage 1_fishing_battle:system System.GameState set value "End"
    ## Temp削除
        ## ranking score
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run scoreboard players reset $XXX.Ranking.Score.1st PNCT.Temp
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run scoreboard players reset $XXX.Ranking.Score.2nd PNCT.Temp
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run scoreboard players reset $XXX.Ranking.Score.3rd PNCT.Temp
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run scoreboard players reset $XXX.Ranking.Score.4th PNCT.Temp
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run scoreboard players reset $XXX.Ranking.Score.5th PNCT.Temp
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run scoreboard players reset $XXX.Ranking.Score.6th PNCT.Temp
        ## player tag
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run tag @a[tag=XXXTemp_Player_Score_1st] remove XXXTemp_Player_Score_1st
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run tag @a[tag=XXXTemp_Player_Score_2nd] remove XXXTemp_Player_Score_2nd
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run tag @a[tag=XXXTemp_Player_Score_3rd] remove XXXTemp_Player_Score_3rd
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run tag @a[tag=XXXTemp_Player_Score_4th] remove XXXTemp_Player_Score_4th
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run tag @a[tag=XXXTemp_Player_Score_5th] remove XXXTemp_Player_Score_5th
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run tag @a[tag=XXXTemp_Player_Score_6th] remove XXXTemp_Player_Score_6th
        ## countdown
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run scoreboard players reset $XXX.GameStart.Countdown PNCT.Temp

# カウント減少
    execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 1.. run scoreboard players remove $XXX.GameFinish.Progress_Timer PNCT.Temp 1