#> 1_fishing_battle:_main/game_state/2_count
#
# FishingBattle：ゲーム開始前カウントダウンに常時読み込む
# 
# @within function 1_fishing_battle:_main/-tick

#> Temp Holder
# @private
    #define score_holder $XXX.GameStart.Countdown
    #   カウントダウン用タイマーホルダー



# 釣果アイテムを削除
    ## 手持ち
        ### 釣果アイテム
            execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run execute as @a at @s run clear @s minecraft:cod[custom_data~{PNCT:{1FSBT:{CatchItem:{}}}},!custom_data~{PNCT:{.Debug:true}}]
        ### 釣竿
            execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run execute as @a at @s run clear @s minecraft:fishing_rod[custom_data~{PNCT:{1FSBT:{FishingRod:{}}}},!custom_data~{PNCT:{.Debug:true}}]
        ### 実績トロフィー
    ## ドロップ
        ### 釣果アイテム
            execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run execute as @e[type=item] at @s if data entity @s Item.components.minecraft:custom_data.PNCT.1FSBT.CatchItem run kill @s
        ### 釣竿
            execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run execute as @e[type=item] at @s if data entity @s Item.components.minecraft:custom_data.PNCT.1FSBT.FishingRod run kill @s
        ### 実績トロフィー

# チーム分け(有効時)
    execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run execute if score $XXX.GameStart.Countdown PNCT.Temp matches 200 run function 1_fishing_battle:team/set_team

# ショップ
    ## ダブル釣竿
        execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run execute store result entity @n[type=villager,x=3.5,y=0,z=21.5,nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Double"}}}}}] data.PNCT.1FSBT.Shop.Price int 1 run data get storage 1_fishing_battle:shop_price ShopPrice.FishingRod.Double
    ## 入れ食い釣竿
        execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run execute store result entity @n[type=villager,x=3.5,y=0,z=18.5,nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Lure"}}}}}] data.PNCT.1FSBT.Shop.Price int 1 run data get storage 1_fishing_battle:shop_price ShopPrice.FishingRod.Lure
    ## リッチ釣竿
        execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run execute store result entity @n[type=villager,x=7.5,y=0,z=15.5,nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Rich"}}}}}] data.PNCT.1FSBT.Shop.Price int 1 run data get storage 1_fishing_battle:shop_price ShopPrice.FishingRod.Rich
    ## 博打釣竿
        execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run execute store result entity @n[type=villager,x=11.5,y=0,z=15.5,nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Gambling"}}}}}] data.PNCT.1FSBT.Shop.Price int 1 run data get storage 1_fishing_battle:shop_price ShopPrice.FishingRod.Gambling
    ## おじガチャ釣竿
        execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run execute store result entity @n[type=villager,x=14.5,y=0,z=17.5,nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Slot"}}}}}] data.PNCT.1FSBT.Shop.Price int 1 run data get storage 1_fishing_battle:shop_price ShopPrice.FishingRod.Slot
    ## 10連おじガチャ釣竿
        execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run execute store result entity @n[type=villager,x=14.5,y=0,z=18.5,nbt={data:{PNCT:{1FSBT:{Shop:{FishingRod:"Slot-10"}}}}}] data.PNCT.1FSBT.Shop.Price int 10 run data get storage 1_fishing_battle:shop_price ShopPrice.FishingRod.Slot

# ゲーム開始カウントダウン10秒
    ## カウント初期化
        execute unless score $XXX.GameStart.Countdown PNCT.Temp = $XXX.GameStart.Countdown PNCT.Temp run scoreboard players set $XXX.GameStart.Countdown PNCT.Temp 200
    ## 通知
        ### 5秒前
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 100 run title @a times 0 18 0
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 100 run title @a subtitle {"text":"ゲーム開始まで","color":"gray"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 100 run title @a title {"text":"5","color":"red","bold":true}
        ### 4秒前
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 80 run title @a times 0 18 0
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 80 run title @a subtitle {"text":"ゲーム開始まで","color":"gray"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 80 run title @a title {"text":"4","color":"gold","bold":true}
        ### 3秒前
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 60 run title @a times 0 18 0
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 60 run title @a subtitle {"text":"ゲーム開始まで","color":"gray"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 60 run title @a title {"text":"3","color":"yellow","bold":true}
        ### 2秒前
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 40 run title @a times 0 18 0
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 40 run title @a subtitle {"text":"ゲーム開始まで","color":"gray"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 40 run title @a title {"text":"2","color":"green","bold":true}
        ### 1秒前
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 20 run title @a times 0 18 0
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 20 run title @a subtitle {"text":"ゲーム開始まで","color":"gray"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 20 run title @a title {"text":"1","color":"light_purple","bold":true}
    ## ゲーム開始
        ## 釣竿配布
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run execute as @a[tag=PNCT.1FSBT.Player] run loot give @s loot item:1_fishing_battle/item/fishing_rod/normal
        ## モード別処理
            ### スコアアタック
                #### 制限時間設定
                    execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"ScoreAttack"}} run execute store result score $PNCT.1FSBT.System 1FSBT.System.GameTimer run data get storage 1_fishing_battle:rule Rule.Timer
                #### bossbar反映
                    execute store success bossbar 1_fishing_battle:game_timer max run data get storage 1_fishing_battle:rule Rule.Timer
            ### タイムアタック
                #### 目標スコア設定
                    execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"TimeAttack"}} run execute store result score $PNCT.1FSBT.System 1FSBT.Player.Score run data get storage 1_fishing_battle:rule Rule.Score
                #### bossbar反映
                    execute store success bossbar 1_fishing_battle:game_timer max run data get storage 1_fishing_battle:rule Rule.Score
                #### 時間設定
                    execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"TimeAttack"}} run scoreboard players set $PNCT.1FSBT.System 1FSBT.System.GameTimer 0
            ### おじガチャ大会
                #### 制限時間設定
                    execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"UncleGacha"}} run execute store result score $PNCT.1FSBT.System 1FSBT.System.GameTimer run data get storage 1_fishing_battle:rule Rule.Timer
                #### bossbar反映
                    execute store success bossbar 1_fishing_battle:game_timer max run data get storage 1_fishing_battle:rule Rule.Timer
        ## tilte時間修正
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run title @a times 10 70 20
        ## 通知
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run title @a subtitle {"text":"ゲーム開始！","color":"green"}
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run title @a title {"text":"GameStart!!","color":"aqua","bold":true}
        ## GameState変更
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run data modify storage 1_fishing_battle:system System.GameState set value "Play"
        ## Temp削除
            execute if score $XXX.GameStart.Countdown PNCT.Temp matches 0 run scoreboard players reset $XXX.GameStart.Countdown PNCT.Temp

    ## カウント減少
        execute if score $XXX.GameStart.Countdown PNCT.Temp matches 1.. run scoreboard players remove $XXX.GameStart.Countdown PNCT.Temp 1