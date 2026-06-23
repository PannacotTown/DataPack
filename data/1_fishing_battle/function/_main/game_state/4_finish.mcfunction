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
    execute unless score $XXX.GameFinish.Progress_Timer PNCT.Temp = $XXX.GameFinish.Progress_Timer PNCT.Temp run scoreboard players set $XXX.GameFinish.Progress_Timer PNCT.Temp 460

# ランキング
    ## 作成
        execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 460 run function 1_fishing_battle:ranking/solo/score_attack/create
    ## 更新
        #execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 460 run function 1_fishing_battle:ranking/solo/score_attack/update
    ## 発表
        ### 6位
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 420 run tellraw @a ["",{text:"\n"},{text:"\n"},{text:" 6位 ",bold:true,color:"aqua"},{score:{name:"$XXX.Ranking.Score.6th",objective:"PNCT.Temp"}},{text:"\n"},{text:"    "},{selector:"@a[tag=XXXTemp_Player_Score_6th]",bold:true},{text:"\n"}]
        ### 5位
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 380 run tellraw @a ["",{text:" 5位 ",bold:true,color:"aqua"},{score:{name:"$XXX.Ranking.Score.5th",objective:"PNCT.Temp"}},{text:"\n"},{text:"    "},{selector:"@a[tag=XXXTemp_Player_Score_5th]",bold:true},{text:"\n"}]
        ### 4位
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 340 run tellraw @a ["",{text:" 4位 ",bold:true,color:"aqua"},{score:{name:"$XXX.Ranking.Score.4th",objective:"PNCT.Temp"}},{text:"\n"},{text:"    "},{selector:"@a[tag=XXXTemp_Player_Score_4th]",bold:true},{text:"\n"}]
        ### 3位
            #### 順位・スコア表示
                execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 300 run tellraw @a ["",{text:"\n"},{text:"\n"}," ",{text:"3位",bold:true,color:"dark_red",underlined:true}," ",{score:{name:"$XXX.Ranking.Score.3rd",objective:"PNCT.Temp"}},{text:"\n"}]
            #### プレイヤー名
                execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 260 run tellraw @a ["",{text:"    "},{selector:"@a[tag=XXXTemp_Player_Score_3rd]",bold:true},{text:"\n"}]
        ### 2位
            #### 順位・スコア表示
                execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 200 run tellraw @a ["",{text:"\n"},{text:"\n"}," ",{text:"2位",bold:true,color:"gray",underlined:true}," ",{score:{name:"$XXX.Ranking.Score.2nd",objective:"PNCT.Temp"}},{text:"\n"}]
            #### プレイヤー名
                execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 160 run tellraw @a ["",{text:"    "},{selector:"@a[tag=XXXTemp_Player_Score_2nd]",bold:true},{text:"\n"}]
        ### 1位
            #### 順位
                execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 100 run tellraw @a ["",{text:"\n"},{text:"\n"}," ",{text:"1位",bold:true,color:"gold",underlined:true}," ",{text:"\n"}]
            #### スコア表示
                execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 60 run tellraw @a [{text:"\n"},{"score":{"name":"$XXX.Ranking.Score.1st","objective":"PNCT.Temp"}},{text:"\n"}]
            #### プレイヤー名
                execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run title @a subtitle ["",{text:"== ",color:"aqua"},{text:"Congratulations!!",bold:true,color:"yellow"},{text:" ==",color:"aqua"}]
                execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run title @a title {selector:"@a[tag=XXXTemp_Player_Score_1st]",bold:true}
        

# 進捗管理
    ## 進捗付与

# ゲーム終了
    ## scoreboard表示 #####仮置き
        execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run scoreboard objectives setdisplay sidebar 1FSBT.Player.Score
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
            execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 0 run scoreboard players reset $XXX.GameFinish.Progress_Timer PNCT.Temp

# カウント減少
    execute if score $XXX.GameFinish.Progress_Timer PNCT.Temp matches 1.. run scoreboard players remove $XXX.GameFinish.Progress_Timer PNCT.Temp 1