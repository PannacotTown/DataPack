#> 1_fishing_battle:adv_reward/event_detection/pl_interacted_with_shop_staff/
#
# FishingBattle：advacement報酬/村人を右クリックした時
# 
# @within advancement 1_fishing_battle:event_detection/pl_interacted_with_shop_staff



# debug msg
    tellraw @a {"translate":"[DEBUG/%s] %s","with":[{"text":"Shop"},{"text":"村人を右クリック"}]}

# advancementを削除
    advancement revoke @s only 1_fishing_battle:event_detection/pl_interacted_with_shop_staff

# GameState処理
    execute if data storage 1_fishing_battle:system {System:{GameState:"Ready"}} run function 1_fishing_battle:adv_reward/event_detection/pl_interacted_with_shop_staff/game_state/1_ready
    execute if data storage 1_fishing_battle:system {System:{GameState:"Play"}} run function 1_fishing_battle:adv_reward/event_detection/pl_interacted_with_shop_staff/game_state/3_play