#> 1_fishing_battle:_main/game_state/1_ready
#
# FishingBattle：ゲーム開始前に常時読み込む
# 
# @within function 1_fishing_battle:_main/_tick

#> Public tag
# @Public
    #define tag PNCT.1FSBT.Player
    #   FSBTプレイヤータグ

#> Public Score_Holder
# @Public
    #define score_holder $PNCT.1FSBT.System
        #ゲーム全体で使用するスコアホルダー
    #define score_holder $PNCT.1FSBT.Score.Total.Red
    #define score_holder $PNCT.1FSBT.Score.Total.Blue
    #define score_holder $PNCT.1FSBT.Score.Total.Yellow
    #define score_holder $PNCT.1FSBT.Score.Total.Green
    #define score_holder $PNCT.1FSBT.Score.Total.Purple
        #各チームの合計スコアホルダー



# survival→adventure
    execute as @a[gamemode=survival] run tellraw @s [{"text":"┃ ","color":"dark_gray"},{"text":"ゲームモードが ","color":"gray"},{"text":"サバイバル","color":"green"},{"text":" → ","color":"dark_gray"},{"text":"アドベンチャー","color":"gold"},{"text":" に変更されました。","color":"gray"}]
    execute as @a[gamemode=survival] run gamemode adventure @s

# プレイヤータグ
    ## 付与
        execute as @a[gamemode=adventure] run tag @s add PNCT.1FSBT.Player
    ## 削除
        execute as @a[gamemode=!adventure] run tag @s remove PNCT.1FSBT.Player

# プレイヤー数検知
    execute store result storage 1_fishing_battle:system System.Player.Count int 1 run execute if entity @a[gamemode=adventure]

# スコア関連
    ## scoreboardをリセット
        execute as @a if score @s 1FSBT.Player.Score matches 1.. run scoreboard players set @s 1FSBT.Player.Score 0
    ## プレイヤーの経験値をリセット
        execute as @a run xp set @s 129 levels
        execute as @a run xp set @s 1002 points
        execute as @a run xp set @s 0 levels
    ## チーム用のscoreboardをリセット
        scoreboard players reset $PNCT.1FSBT.Score.Total.Red 1FSBT.Player.Score
        scoreboard players reset $PNCT.1FSBT.Score.Total.Blue 1FSBT.Player.Score
        scoreboard players reset $PNCT.1FSBT.Score.Total.Yellow 1FSBT.Player.Score
        scoreboard players reset $PNCT.1FSBT.Score.Total.Green 1FSBT.Player.Score
        scoreboard players reset $PNCT.1FSBT.Score.Total.Purple 1FSBT.Player.Score

# 時間設定
    ## 設定時間をSystemに取得
        execute store result score $PNCT.1FSBT.System 1FSBT.System.GameTimer run data get storage 1_fishing_battle:rule Rule.Timer
    ## 分秒に計算
        scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Minute = $PNCT.1FSBT.System 1FSBT.System.GameTimer
        scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Minute /= #1200 PNCT.Const
        scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second = $PNCT.1FSBT.System 1FSBT.System.GameTimer
        scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second %= #1200 PNCT.Const
        scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second /= #20 PNCT.Const
    ## 秒を2桁表示に計算
        scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second.Tens = $PNCT.1FSBT.System 1FSBT.System.Time.Second
        scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second.Tens /= #10 PNCT.Const
        scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second.Ones = $PNCT.1FSBT.System 1FSBT.System.Time.Second
        scoreboard players operation $PNCT.1FSBT.System 1FSBT.System.Time.Second.Ones %= #10 PNCT.Const
# bossbar
    ## 設定
        bossbar set 1_fishing_battle:game_timer visible true
        bossbar set 1_fishing_battle:game_timer color green
        bossbar set 1_fishing_battle:game_timer max 1
        bossbar set 1_fishing_battle:game_timer value 1
    ## 名前編集
        ### ScoreAttack
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"ScoreAttack",Rank:{Enable:0b},Team:{Enable:0b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"ScoreAttack","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"}]}
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"ScoreAttack",Rank:{Enable:1b},Team:{Enable:0b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"ScoreAttack","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"},{"text":" | ","color":"dark_gray"},{"text":"ランク戦","color":"red","bold":true}]}
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"ScoreAttack",Rank:{Enable:0b},Team:{Enable:1b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"ScoreAttack","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"},{"text":" | ","color":"dark_gray"},{"text":"チーム数: ","color":"green","bold":true},{"nbt":"Rule.Team.Count","storage":"1_fishing_battle:rule","color":"green","bold":true}]}
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"ScoreAttack",Rank:{Enable:1b},Team:{Enable:1b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"ScoreAttack","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"},{"text":" | ","color":"dark_gray"},{"text":"ランク戦","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"text":"チーム数: ","color":"green","bold":true},{"nbt":"Rule.Team.Count","storage":"1_fishing_battle:rule","color":"green","bold":true}]}
        ### TimeAttack
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"TimeAttack",Rank:{Enable:0b},Team:{Enable:0b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"TimeAttack","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"}]}
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"TimeAttack",Rank:{Enable:1b},Team:{Enable:0b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"TimeAttack","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"},{"text":" | ","color":"dark_gray"},{"text":"ランク戦","color":"red","bold":true}]}
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"TimeAttack",Rank:{Enable:0b},Team:{Enable:1b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"TimeAttack","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"},{"text":" | ","color":"dark_gray"},{"text":"チーム数: ","color":"green","bold":true},{"nbt":"Rule.Team.Count","storage":"1_fishing_battle:rule","color":"green","bold":true}]}
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"TimeAttack",Rank:{Enable:1b},Team:{Enable:1b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"TimeAttack","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"},{"text":" | ","color":"dark_gray"},{"text":"ランク戦","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"text":"チーム数: ","color":"green","bold":true},{"nbt":"Rule.Team.Count","storage":"1_fishing_battle:rule","color":"green","bold":true}]}
        ### UncleGacha
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"UncleGacha",Rank:{Enable:0b},Team:{Enable:0b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"UncleGacha","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"}]}
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"UncleGacha",Rank:{Enable:1b},Team:{Enable:0b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"UncleGacha","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"},{"text":" | ","color":"dark_gray"},{"text":"ランク戦","color":"red","bold":true}]}
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"UncleGacha",Rank:{Enable:0b},Team:{Enable:1b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"UncleGacha","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"},{"text":" | ","color":"dark_gray"},{"text":"チーム数: ","color":"green","bold":true},{"nbt":"Rule.Team.Count","storage":"1_fishing_battle:rule","color":"green","bold":true}]}
            execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"UncleGacha",Rank:{Enable:1b},Team:{Enable:1b}}} run bossbar set 1_fishing_battle:game_timer name {"text":"","extra":[{"text":"UncleGacha","color":"gold","bold":true},{"text":" | ","color":"dark_gray"},{"text":"時間 ","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Minute"},"color":"aqua"},{"text":":","color":"gray"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Tens"},"color":"aqua"},{"score":{"name":"$PNCT.1FSBT.System","objective":"1FSBT.System.Time.Second.Ones"},"color":"aqua"},{"text":" | ","color":"dark_gray"},{"text":"ランク戦","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"text":"チーム数: ","color":"green","bold":true},{"nbt":"Rule.Team.Count","storage":"1_fishing_battle:rule","color":"green","bold":true}]}
