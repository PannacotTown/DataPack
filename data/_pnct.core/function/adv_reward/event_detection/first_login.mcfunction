#> -pnct.core:adv_reward/event_detection/first_login
#
# -pnct.core：advacement報酬/ワールド入室時
#
# @within advancement -pnct.core:event_detection/first_login
# @within function -pnct.core:adv_reward/event_detection/first_login

#> ScoreHolder
# @private
    #define score_holder $XXX.PlayerID_Controler PNCT.Player.ID


# PlayerID
    ## 初プレイヤーの場合、初期化
        scoreboard players set $XXX.PlayerID_Controler PNCT.Player.ID 0
    ## PlayerID設定準備
        scoreboard players set @s PNCT.Player.ID -1
    ## PlayerID増加
        execute if score $XXX.PlayerID_Controler PNCT.Player.ID matches 0 run execute store result score $XXX.PlayerID_Controler PNCT.Player.ID run random value 1..65535
    ## 同IDが存在したらやり直し
        execute as @a if score $XXX.PlayerID_Controler PNCT.Player.ID = @s PNCT.Player.ID run return run function _pnct.core:adv_reward/event_detection/first_login
    ## 同IDが存在しなかったら、設定
        execute as @a unless score $XXX.PlayerID_Controler PNCT.Player.ID = @s PNCT.Player.ID run execute as @a[scores={PNCT.Player.ID=-1}] run scoreboard players operation @s PNCT.Player.ID = $XXX.PlayerID_Controler PNCT.Player.ID
    ## scoreboardをリセット
        scoreboard players reset $XXX.PlayerID_Controler PNCT.Player.ID