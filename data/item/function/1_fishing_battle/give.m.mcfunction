#> item:1_fishing_battle/give.m
#
# item：1_fishing_battleのアイテムの入手
#
# @private

#> Temp storage
# @private
    #define storage xxx_temp_xxx:get_id
    #   ID取得用

    

# storage初期化
    $data modify storage xxx_temp_xxx:get_id ID set value $(ID)

# item
    ## 釣竿
        execute if data storage xxx_temp_xxx:get_id {ID:1} run loot give @s loot item:1_fishing_battle/item/fishing_rod/normal
        execute if data storage xxx_temp_xxx:get_id {ID:2} run loot give @s loot item:1_fishing_battle/item/fishing_rod/double
        execute if data storage xxx_temp_xxx:get_id {ID:3} run loot give @s loot item:1_fishing_battle/item/fishing_rod/lure
        execute if data storage xxx_temp_xxx:get_id {ID:4} run loot give @s loot item:1_fishing_battle/item/fishing_rod/rich
        execute if data storage xxx_temp_xxx:get_id {ID:5} run loot give @s loot item:1_fishing_battle/item/fishing_rod/gambling
        execute if data storage xxx_temp_xxx:get_id {ID:6} run loot give @s loot item:1_fishing_battle/item/fishing_rod/slot
        execute if data storage xxx_temp_xxx:get_id {ID:7} run loot give @s loot item:1_fishing_battle/item/fishing_rod/slot10
    ## 釣果
        execute if data storage xxx_temp_xxx:get_id {ID:8} run loot give @s loot item:1_fishing_battle/item/catch_item/1_common/tara
        execute if data storage xxx_temp_xxx:get_id {ID:9} run loot give @s loot item:1_fishing_battle/item/catch_item/1_common/aji
        execute if data storage xxx_temp_xxx:get_id {ID:10} run loot give @s loot item:1_fishing_battle/item/catch_item/1_common/karei
        execute if data storage xxx_temp_xxx:get_id {ID:11} run loot give @s loot item:1_fishing_battle/item/catch_item/1_common/syake
        execute if data storage xxx_temp_xxx:get_id {ID:12} run loot give @s loot item:1_fishing_battle/item/catch_item/1_common/ika
        execute if data storage xxx_temp_xxx:get_id {ID:13} run loot give @s loot item:1_fishing_battle/item/catch_item/1_common/sanma

        execute if data storage xxx_temp_xxx:get_id {ID:14} run loot give @s loot item:1_fishing_battle/item/catch_item/2_high-grade/hotate
        execute if data storage xxx_temp_xxx:get_id {ID:15} run loot give @s loot item:1_fishing_battle/item/catch_item/2_high-grade/hugu
        execute if data storage xxx_temp_xxx:get_id {ID:16} run loot give @s loot item:1_fishing_battle/item/catch_item/2_high-grade/hirame
        execute if data storage xxx_temp_xxx:get_id {ID:17} run loot give @s loot item:1_fishing_battle/item/catch_item/2_high-grade/sazae
        execute if data storage xxx_temp_xxx:get_id {ID:18} run loot give @s loot item:1_fishing_battle/item/catch_item/2_high-grade/unagi
        execute if data storage xxx_temp_xxx:get_id {ID:19} run loot give @s loot item:1_fishing_battle/item/catch_item/2_high-grade/uni
        execute if data storage xxx_temp_xxx:get_id {ID:20} run loot give @s loot item:1_fishing_battle/item/catch_item/2_high-grade/maguro

        execute if data storage xxx_temp_xxx:get_id {ID:21} run loot give @s loot item:1_fishing_battle/item/catch_item/3_different/caffe_latte
        execute if data storage xxx_temp_xxx:get_id {ID:22} run loot give @s loot item:1_fishing_battle/item/catch_item/3_different/mitarasi
        execute if data storage xxx_temp_xxx:get_id {ID:23} run loot give @s loot item:1_fishing_battle/item/catch_item/3_different/hamburg_sushi
        execute if data storage xxx_temp_xxx:get_id {ID:24} run loot give @s loot item:1_fishing_battle/item/catch_item/3_different/sioramyon
        execute if data storage xxx_temp_xxx:get_id {ID:25} run loot give @s loot item:1_fishing_battle/item/catch_item/3_different/takoyaki
        execute if data storage xxx_temp_xxx:get_id {ID:26} run loot give @s loot item:1_fishing_battle/item/catch_item/3_different/mattya_ice/mattya_ice
        execute if data storage xxx_temp_xxx:get_id {ID:27} run loot give @s loot item:1_fishing_battle/item/catch_item/3_different/mattya_ice/mattya_ice_secret
        execute if data storage xxx_temp_xxx:get_id {ID:28} run loot give @s loot item:1_fishing_battle/item/catch_item/3_different/kaisendon
        execute if data storage xxx_temp_xxx:get_id {ID:29} run loot give @s loot item:1_fishing_battle/item/catch_item/3_different/yota_chiki
        execute if data storage xxx_temp_xxx:get_id {ID:30} run loot give @s loot item:1_fishing_battle/item/catch_item/3_different/koimoyou

        execute if data storage xxx_temp_xxx:get_id {ID:31} run loot give @s loot item:1_fishing_battle/item/catch_item/4_treasure/asuneli
        execute if data storage xxx_temp_xxx:get_id {ID:32} run loot give @s loot item:1_fishing_battle/item/catch_item/4_treasure/yotan_cloth
        execute if data storage xxx_temp_xxx:get_id {ID:33} run loot give @s loot item:1_fishing_battle/item/catch_item/4_treasure/green_note
        execute if data storage xxx_temp_xxx:get_id {ID:34} run loot give @s loot item:1_fishing_battle/item/catch_item/4_treasure/shark_peel

        execute if data storage xxx_temp_xxx:get_id {ID:35} run loot give @s loot item:1_fishing_battle/item/catch_item/5_miss/gomi
        execute if data storage xxx_temp_xxx:get_id {ID:36} run loot give @s loot item:1_fishing_battle/item/catch_item/5_miss/gomitan

# debug_item
    execute if data storage xxx_temp_xxx:get_id {ID:0.01} if entity @s[tag=PNCT.Staff] run loot give @s loot item:1_fishing_battle/item/_debug/system_config
    execute if data storage xxx_temp_xxx:get_id {ID:0.02} if entity @s[tag=PNCT.Staff] run loot give @s loot item:1_fishing_battle/item/_debug/fishing_rod

# Temp削除
    scoreboard players reset $XXX.Item.ID PNCT.Temp
    data remove storage xxx_temp_xxx:get_id ID