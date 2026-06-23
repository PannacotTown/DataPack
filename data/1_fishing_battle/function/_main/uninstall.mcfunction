#> 1_fishing_battle:_main/reset
#
# FishingBattle：リセット時に読み込む
#
# @within tag/function minecraft:load



# advancement
    advancement revoke @a only 1_fishing_battle:

# scoreboard
    scoreboard objectives remove 1FSBT.System.GameTimer
    scoreboard objectives remove 1FSBT.System.Time.Minute
    scoreboard objectives remove 1FSBT.System.Time.Second
    scoreboard objectives remove 1FSBT.System.Time.Second.Tens
    scoreboard objectives remove 1FSBT.System.Time.Second.Ones
    scoreboard objectives remove 1FSBT.Player.Score
    scoreboard objectives remove 1FSBT.System.Info
    scoreboard objectives remove 1FSBT.Player.Achievement_Reward
    scoreboard objectives remove 1FSBT.Player.Used.Fishing_Rod

    scoreboard players reset * PNCT.Temp

# storage
    data remove storage 1_fishing_battle:system System
    data remove storage 1_fishing_battle:rule Rule
    data remove storage 1_fishing_battle:regulation Regulation
    data remove storage 1_fishing_battle:shop_price ShopPrice
    data modify storage _pannacotown_:system System.GameEvent set value "None"

# bossbar
    bossbar remove 1_fishing_battle:game_timer

# effect
    effect clear @a saturation
    effect clear @a resistance

# tag
    tag @a remove PNCT.1FSBT.Player

# title
    title @a reset
