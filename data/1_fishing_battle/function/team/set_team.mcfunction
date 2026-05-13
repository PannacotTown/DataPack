#> 1_fishing_battle:team/set_team
#
# FishingBattle team assignment
#
# @within function 1_fishing_battle:_main/game_state/2_count

#> Temp Holder
# @private
    #define score_holder $XXX.Team_Count
        # チームの数

#> Temp Tag
# @private
    #define tag XXXTemp_TeamSetted
        # チーム分け完了



# チームがOFFなら終了
    execute unless data storage 1_fishing_battle:rule {Rule:{Team:{Enable:1b}}} run return 0

# 初回実行なら、全プレイヤーをチームから外す
    execute unless score $XXX.Team_Count PNCT.Temp = $XXX.Team_Count PNCT.Temp run team leave @a

# カウント初期化
    ## チーム数
        execute unless entity @a[tag=PNCT.1FSBT.Player,team=PlayerTeamRed] run execute store result score $XXX.Team_Count PNCT.Temp run data get storage 1_fishing_battle:rule Rule.Team.Count

# チーム分け
    ## 振り分け 
        execute if score $XXX.Team_Count PNCT.Temp matches 1.. run team join PlayerTeamRed @r[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted]
        execute if score $XXX.Team_Count PNCT.Temp matches 2.. run team join PlayerTeamBlue @r[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted]
        execute if score $XXX.Team_Count PNCT.Temp matches 3.. run team join PlayerTeamYellow @r[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted]
        execute if score $XXX.Team_Count PNCT.Temp matches 4.. run team join PlayerTeamGreen @r[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted]
        execute if score $XXX.Team_Count PNCT.Temp matches 5.. run team join PlayerTeamPurple @r[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted]
    ## 振り分けたプレイヤーにタグ付け
        execute as @a[tag=PNCT.1FSBT.Player,team=PlayerTeamRed] run tag @s add XXXTemp_TeamSetted
        execute as @a[tag=PNCT.1FSBT.Player,team=PlayerTeamBlue] run tag @s add XXXTemp_TeamSetted
        execute as @a[tag=PNCT.1FSBT.Player,team=PlayerTeamYellow] run tag @s add XXXTemp_TeamSetted
        execute as @a[tag=PNCT.1FSBT.Player,team=PlayerTeamGreen] run tag @s add XXXTemp_TeamSetted
        execute as @a[tag=PNCT.1FSBT.Player,team=PlayerTeamPurple] run tag @s add XXXTemp_TeamSetted

# ループ再帰
    execute if entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run function 1_fishing_battle:team/set_team

# ループ終了
    ## プレイヤーに通知
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,team=PlayerTeamRed] run tellraw @s {"text":"あなたは赤チームです","color":"red"}
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,team=PlayerTeamBlue] run tellraw @s {"text":"あなたは青チームです","color":"blue"}
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,team=PlayerTeamYellow] run tellraw @s {"text":"あなたは黄チームです","color":"yellow"}
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,team=PlayerTeamGreen] run tellraw @s {"text":"あなたは緑チームです","color":"green"}
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,team=PlayerTeamPurple] run tellraw @s {"text":"あなたは紫チームです","color":"light_purple"}
    ## Tempタグ削除
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,tag=XXXTemp_TeamSetted] run tag @s remove XXXTemp_TeamSetted
    ## Tempスコア削除
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run scoreboard players reset $XXX.Team_Count PNCT.Temp


#####マルチプレイ時テスト必須