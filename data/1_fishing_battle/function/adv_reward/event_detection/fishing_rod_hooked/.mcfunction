#> 1_fishing_battle:adv_reward/event_detection/fishing_rod_hooked/
#
# FishingBattle：advacement報酬/釣った時
# 
# @within advancement 1_fishing_battle:event_detection/fishing_rod_hooked

#> Temp Tag
# @private
    #define tag XXXTemp_GetCatchItem
        # プレイヤーが釣ったときに付与されるタグ



# advancementを削除
    advancement revoke @s only 1_fishing_battle:event_detection/fishing_rod_hooked

# ゲーム中でない場合、終了
    execute unless data storage 1_fishing_battle:system {System:{GameState:"Play"}} run return fail

# プレイヤーにタグを付与
    tag @s add XXXTemp_GetCatchItem

# 0.6t後に、functionを実行
    schedule function 1_fishing_battle:adv_reward/event_detection/fishing_rod_hooked/handling_catch_item 0.6t

# debug msg
    tellraw @a {"translate":"[DEBUG/%s] %s","with":[{"text":"FishingRod"},{"text":"釣り上げ判定"}]}