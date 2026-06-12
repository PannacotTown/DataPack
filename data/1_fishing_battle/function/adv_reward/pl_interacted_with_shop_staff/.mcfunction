#> 1_fishing_battle:adv_reward/pl_interacted_with_shop_staff/
#
# FishingBattle：advacement報酬/村人を右クリックした時
# 
# @within advancement 1_fishing_battle:pl_interacted_with_shop_staff

#> Temp Tag
# @private
    #define tag XXXTemp_GetCatchItem
        # プレイヤーが釣ったときに付与されるタグ



# advancementを削除
    advancement revoke @s only 1_fishing_battle:pl_interacted_with_shop_staff

# GameState処理
    execute if data storage 1_fishing_battle:system {System:{GameState:"Ready"}} run function 1_fishing_battle:adv_reward/pl_interacted_with_shop_staff/game_state/1_ready
    execute if data storage 1_fishing_battle:system {System:{GameState:"Play"}}


say *debug*_interact_villager