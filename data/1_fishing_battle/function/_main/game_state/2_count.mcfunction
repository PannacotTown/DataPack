#> 1_fishing_battle:_main/game_state/2_count
#
# FishingBattle：ゲーム開始前カウントダウンに常時読み込む
# 
# @within function 1_fishing_battle:_main/_tick

#> Temp Holder
# @private
    #define score_holder $XXX.Player.ID



# 釣果アイテムを削除
    ## 手持ち
        ### 釣果アイテム
            execute as @a[tag=PNCT.1FSBT.Player] at @s run clear @s minecraft:cod[custom_data={"PNCT":{"1FSBT":{"CatchItem":{}}}}]
        ### 釣竿
            execute as @a[tag=PNCT.1FSBT.Player] at @s run clear @s minecraft:fishing_rod[custom_data={"PNCT":{"1FSBT":{"FishingRod":{}}}}]
        ### 実績トロフィー
    ## ドロップ
        ### 釣果アイテム
            execute as @e[type=item] at @s if data entity @s Item.components.minecraft:custom_data.PNCT.1FSBT.CatchItem run kill @s
        ### 釣竿
            execute as @e[type=item] at @s if data entity @s Item.components.minecraft:custom_data.PNCT.1FSBT.FishingRod run kill @s
        ### 実績トロフィー

# ゲーム開始カウントダウン10秒
    ## カウント初期化
        execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run scoreboard players set $XXX.GameStart.Countdown PNCT.Temp 200
    ## 通知
        ### 5秒前
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 100 run title @a times 0 18 2
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 100 run title @a subtitle {"text":"ゲーム開始まで","color":"gray"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 100 run title @a title {"text":"5","color":"red","bold":true}
        ### 4秒前
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 80 run title @a times 0 18 2
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 80 run title @a subtitle {"text":"ゲーム開始まで","color":"gray"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 80 run title @a title {"text":"4","color":"gold","bold":true}
        ### 3秒前
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 60 run title @a times 0 18 2
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 60 run title @a subtitle {"text":"ゲーム開始まで","color":"gray"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 60 run title @a title {"text":"3","color":"yellow","bold":true}
        ### 2秒前
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 40 run title @a times 0 18 2
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 40 run title @a subtitle {"text":"ゲーム開始まで","color":"gray"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 40 run title @a title {"text":"2","color":"green","bold":true}
        ### 1秒前
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 20 run title @a times 0 18 2
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 20 run title @a subtitle {"text":"ゲーム開始まで","color":"gray"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 20 run title @a title {"text":"1","color":"light_purple","bold":true}
    ## ゲーム開始
        ## tilte時間修正
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run title @a times 10 70 20
        ## 通知
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run title @a subtitle {"text":"ゲーム開始！","color":"green"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run title @a title {"text":"GameStart!!","color":"aqua","bold":true}
        ## GameState変更
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run data modify storage 1_fishing_battle:system System.GameState set value "Play"

    ## カウント減少
        execute if score $XXX.GameStart.Countdown PNCT.Temp matches 1.. run scoreboard players remove $XXX.GameStart.Countdown PNCT.Temp 1

