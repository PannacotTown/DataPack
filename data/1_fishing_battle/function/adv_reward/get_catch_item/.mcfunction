#> 1_fishing_battle:adv_reward/get_catch_item/
#
# FishingBattle：釣った時のadvacementの報酬
# 
# @within advancement 1_fishing_battle:get_catch_item

#> Temp Tag
# @private
    #define tag XXXTemp_GetCatchItem
        # プレイヤーが釣ったときに付与されるタグ



# advancementを削除
    advancement revoke @s only 1_fishing_battle:get_catch_item

# ゲーム中でない場合、終了
    execute unless data storage 1_fishing_battle:system {System:{GameState:"Play"}} run return fail

# プレイヤーにタグを付与
    tag @s add XXXTemp_GetCatchItem

# 0.6t後に、functionを実行
    schedule function 1_fishing_battle:adv_reward/get_catch_item/handling_catch_item 0.6t

say *debug*_hit