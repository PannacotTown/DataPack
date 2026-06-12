#> 1_fishing_battle:adv_reward/fishing_rod_hooked/
#
# FishingBattle：advacement報酬/釣った時
# 
# @within advancement 1_fishing_battle:fishing_rod_hooked

#> Temp Tag
# @private
    #define tag XXXTemp_GetCatchItem
        # プレイヤーが釣ったときに付与されるタグ



# advancementを削除
    advancement revoke @s only 1_fishing_battle:fishing_rod_hooked

# ゲーム中でない場合、終了
    execute unless data storage 1_fishing_battle:system {System:{GameState:"Play"}} run return fail

# プレイヤーにタグを付与
    tag @s add XXXTemp_GetCatchItem

# 0.6t後に、functionを実行
    schedule function 1_fishing_battle:adv_reward/fishing_rod_hooked/handling_catch_item 0.6t

say *debug*_hit