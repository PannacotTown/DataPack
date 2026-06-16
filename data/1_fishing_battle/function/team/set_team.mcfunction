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
        execute unless entity @a[tag=PNCT.1FSBT.Player,team=1FSBT.Player.Team.Red] run execute store result score $XXX.Team_Count PNCT.Temp run data get storage 1_fishing_battle:rule Rule.Team.Count

# チーム分け
    ## 振り分け 
        execute if score $XXX.Team_Count PNCT.Temp matches 1.. run team join 1FSBT.Player.Team.Red @r[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted]
        execute if score $XXX.Team_Count PNCT.Temp matches 2.. run team join 1FSBT.Player.Team.Blue @r[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted]
        execute if score $XXX.Team_Count PNCT.Temp matches 3.. run team join 1FSBT.Player.Team.Yellow @r[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted]
        execute if score $XXX.Team_Count PNCT.Temp matches 4.. run team join 1FSBT.Player.Team.Green @r[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted]
        execute if score $XXX.Team_Count PNCT.Temp matches 5.. run team join 1FSBT.Player.Team.Purple @r[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted]
    ## 振り分けたプレイヤーにタグ付け
        execute as @a[tag=PNCT.1FSBT.Player,team=1FSBT.Player.Team.Red] run tag @s add XXXTemp_TeamSetted
        execute as @a[tag=PNCT.1FSBT.Player,team=1FSBT.Player.Team.Blue] run tag @s add XXXTemp_TeamSetted
        execute as @a[tag=PNCT.1FSBT.Player,team=1FSBT.Player.Team.Yellow] run tag @s add XXXTemp_TeamSetted
        execute as @a[tag=PNCT.1FSBT.Player,team=1FSBT.Player.Team.Green] run tag @s add XXXTemp_TeamSetted
        execute as @a[tag=PNCT.1FSBT.Player,team=1FSBT.Player.Team.Purple] run tag @s add XXXTemp_TeamSetted

# ループ再帰
    execute if entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run function 1_fishing_battle:team/set_team

# ループ終了
    ## プレイヤーに通知
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,team=1FSBT.Player.Team.Red] run tellraw @s ["",{"text":"━━━━━━━━━━━━━━━━━━","color":"dark_red","strikethrough":true},"\n",{"text":"あなたは ","color":"white"},{"text":"【赤チーム】","color":"red","bold":true},{"text":" です！","color":"white"},{"text":"\n\n【チームメンバー】\n","color":"yellow","bold":true},{"selector":"@a[team=1FSBT.Player.Team.Red]"},{"text":"\n━━━━━━━━━━━━━━━━━━","color":"dark_red","strikethrough":true}]
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,team=1FSBT.Player.Team.Blue] run tellraw @s ["",{"text":"━━━━━━━━━━━━━━━━━━","color":"dark_blue","strikethrough":true},"\n",{"text":"あなたは ","color":"white"},{"text":"【青チーム】","color":"blue","bold":true},{"text":" です！","color":"white"},{"text":"\n\n【チームメンバー】\n","color":"yellow","bold":true},{"selector":"@a[team=1FSBT.Player.Team.Blue]"},{"text":"\n━━━━━━━━━━━━━━━━━━","color":"dark_blue","strikethrough":true}]
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,team=1FSBT.Player.Team.Yellow] run tellraw @s ["",{"text":"━━━━━━━━━━━━━━━━━━","color":"#AAAA00","strikethrough":true},"\n",{"text":"あなたは ","color":"white"},{"text":"【黄チーム】","color":"yellow","bold":true},{"text":" です！","color":"white"},{"text":"\n\n【チームメンバー】\n","color":"yellow","bold":true},{"selector":"@a[team=1FSBT.Player.Team.Yellow]"},{"text":"\n━━━━━━━━━━━━━━━━━━","color":"#AAAA00","strikethrough":true}]
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,team=1FSBT.Player.Team.Green] run tellraw @s ["",{"text":"━━━━━━━━━━━━━━━━━━","color":"dark_green","strikethrough":true},"\n",{"text":"あなたは ","color":"white"},{"text":"【緑チーム】","color":"green","bold":true},{"text":" です！","color":"white"},{"text":"\n\n【チームメンバー】\n","color":"yellow","bold":true},{"selector":"@a[team=1FSBT.Player.Team.Green]"},{"text":"\n━━━━━━━━━━━━━━━━━━","color":"dark_green","strikethrough":true}]
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,team=1FSBT.Player.Team.Purple] run tellraw @s ["",{"text":"━━━━━━━━━━━━━━━━━━","color":"dark_purple","strikethrough":true},"\n",{"text":"あなたは ","color":"white"},{"text":"【紫チーム】","color":"light_purple","bold":true},{"text":" です！","color":"white"},{"text":"\n\n【チームメンバー】\n","color":"yellow","bold":true},{"selector":"@a[team=1FSBT.Player.Team.Purple]"},{"text":"\n━━━━━━━━━━━━━━━━━━","color":"dark_purple","strikethrough":true}]
    ## プレイヤーを発光
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run effect give @a[tag=PNCT.1FSBT.Player] glowing 10 0 false
    ## Tempスコア削除
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run scoreboard players reset $XXX.Team_Count PNCT.Temp
    ## Tempタグ削除
        execute unless entity @a[tag=PNCT.1FSBT.Player,tag=!XXXTemp_TeamSetted] run execute as @a[tag=PNCT.1FSBT.Player,tag=XXXTemp_TeamSetted] run tag @s remove XXXTemp_TeamSetted


#**マルチプレイ時テスト必須
