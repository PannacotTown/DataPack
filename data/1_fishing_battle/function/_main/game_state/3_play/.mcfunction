#> 1_fishing_battle:_main/game_state/3_play/
#
# FishingBattle：ゲーム中に常時読み込む
# 
# @within function 1_fishing_battle:_main/-tick



# スコア関連
    ## チーム戦時、チームの合計に
        execute if data storage 1_fishing_battle:rule {Rule:{Team:{Enable:1b}}} as @a[tag=PNCT.1FSBT.Player] run function 1_fishing_battle:score/update_team_score
    ## スコアを経験値に反映
        execute as @a[tag=PNCT.1FSBT.Player] run function 1_fishing_battle:score/ctrl_xpbar

# モード別処理
    ## スコアアタック
        execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"ScoreAttack"}} run function 1_fishing_battle:_main/game_state/3_play/game_mode/score_attack/
    ## タイムアタック
    ## おじガチャ大会

# 釣竿処理
    ## 釣竿の浮き初期設定
        execute as @e[type=fishing_bobber] unless score @s PNCT.Player.ID = @s PNCT.Player.ID at @s run function 1_fishing_battle:fishing_bobber_setting

    ## 浮きのIDと釣竿が合わなければ、kill
        execute as @a[tag=PNCT.1FSBT.Player] at @s run function 1_fishing_battle:fishing_bobber_replace_decision