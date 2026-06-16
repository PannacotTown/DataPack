#> -pnct.core:-main/__tick__
#
# -pnct.core：ワールド起動中、常時読み込む
#
# @within tag/function minecraft:tick



# 企画
    ## TreasurePondFishing
        execute if data storage _pannacotown_:system {System:{GameEvent:"FishingBattle"}} run function 1_fishing_battle:_main/_tick

# voidkill
    # debug msg
        execute as @e if predicate -pnct.core:-500_void_kill run tellraw @a {"translate":"[DEBUG/%s] %s","with":[{selector:"@s"},{"text":"VoidKill"}]}
    execute as @e if predicate -pnct.core:-500_void_kill run kill @s

# リセット
    execute unless entity @a run function -pnct.core:-main/_reset