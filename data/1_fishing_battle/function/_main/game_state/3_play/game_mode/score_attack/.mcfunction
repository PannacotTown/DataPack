#> 1_fishing_battle:_main/game_state/3_play/game_mode/score_attack/
#
# FishingBattle：ゲームモード:スコアアタックのゲーム処理
# 
# @within function 1_fishing_battle:_main/game_state/3_play/



# 終了
    ## 釣竿削除
        execute if score $PNCT.1FSBT.System 1FSBT.System.GameTimer matches 0 run clear @a[tag=PNCT.1FSBT.Player] fishing_rod[custom_data={PNCT:{1FSBT:{FishingRod:{}}}}]
    ## GameState変更
        execute if score $PNCT.1FSBT.System 1FSBT.System.GameTimer matches 0 run data modify storage 1_fishing_battle:system System.GameState set value "Finish"

# 制限時間
    ## 表示
        ### 計算
            #### 分秒に計算
                scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Minute = $PNCT.1FSBT.System 1FSBT.System.GameTimer
                scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Minute /= #1200 PNCT.Const
                scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second = $PNCT.1FSBT.System 1FSBT.System.GameTimer
                scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second %= #1200 PNCT.Const
                scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second /= #20 PNCT.Const
            #### 秒を2桁表示に計算
                scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second.Tens = $PNCT.1FSBT.System 1FSBT.System.Time.Second
                scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second.Tens /= #10 PNCT.Const
                scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second.Ones = $PNCT.1FSBT.System 1FSBT.System.Time.Second
                scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second.Ones %= #10 PNCT.Const
        ### bossbar反映
            #### text
                bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"}]}
            ### value
                execute store success bossbar 1_fishing_battle:game_timer value run scoreboard players get $PNCT.1FSBT.System 1FSBT.System.GameTimer
    ## 減少
        execute if score $PNCT.1FSBT.System 1FSBT.System.GameTimer matches 1.. run scoreboard players remove $PNCT.1FSBT.System 1FSBT.System.GameTimer 1

# 終了