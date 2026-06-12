#> 1_fishing_battle:adv_reward/event_detection/pl_interacted_with_shop_staff/
#
# FishingBattle：advacement報酬/村人を右クリックした時
# 
# @within advancement 1_fishing_battle:pl_interacted_with_shop_staff

#> Temp Tag
# @private
    #define tag XXXTemp_GetCatchItem
        # プレイヤーが釣ったときに付与されるタグ



# 音声
    playsound entity.villager.ambient voice @s ~ ~ ~ 1.0 1.0

# 会話
    execute if predicate 1_fishing_battle:player.loocing_at.shop_staff/double run tellraw @s [""," [店員] ","釣り竿ってね、2つになると効果倍になるんですよ。"]
    execute if predicate 1_fishing_battle:player.loocing_at.shop_staff/lure run tellraw @s [""," [店員] ","こいつがありゃ美女も魚も釣り放題だ！"]
    execute if predicate 1_fishing_battle:player.loocing_at.shop_staff/rich run tellraw @s [""," [店員] ","これ使うとリッチな音が聞こえるんだ。"]
    execute if predicate 1_fishing_battle:player.loocing_at.shop_staff/gambling run tellraw @s [""," [店員] ","りっちょく！"]
    execute if predicate 1_fishing_battle:player.loocing_at.shop_staff/slot run tellraw @s [""," [店員] ","ただのおじさんです。本当にただのおじさんです。"]


# degub msg
    tellraw MVrasame {translate:"*debug* %s",with:[{text:"talk"}]}