#> __core__:__main__/__tick__
#
# __core__：ワールド起動中、常時読み込む
#
# @within tag/function minecraft:tick



# 企画
    ## TreasurePondFishing
        execute if data storage _pannacotown_:system {System:{GameEvent:"FishingBattle"}} run function 1_fishing_battle:_main/_tick

# voidkill
    execute as @e if predicate __core__:-500_void_kill run say kill
    execute as @e if predicate __core__:-500_void_kill run kill @s

# リセット
    execute unless entity @a run function __core__:__main__/_reset