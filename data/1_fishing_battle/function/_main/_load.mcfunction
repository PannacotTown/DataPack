#> 1_fishing_battle:_main/_load
#
# FishingBattle：ゲームモード変更時に読み込む
#
# @within tag/function minecraft:load



# coreストレージ変更
    data modify storage _pannacotown_:system System.GameEvent set value "FishingBattle"

# advancement
    advancement grant @a only 1_fishing_battle:

# scoreboard
    scoreboard objectives add 1FSBT.System.GameTimer dummy
    scoreboard objectives add 1FSBT.System.Time.Minute dummy
    scoreboard objectives add 1FSBT.System.Time.Second dummy
    scoreboard objectives add 1FSBT.System.Time.Second.Tens dummy
    scoreboard objectives add 1FSBT.System.Time.Second.Ones dummy
    scoreboard objectives add 1FSBT.Player.Score dummy
    scoreboard objectives add 1FSBT.System.Info dummy "情報"
    scoreboard objectives add 1FSBT.Player.Used.Fishing_Rod used:fishing_rod

# trigger
    scoreboard objectives add 1FSBT.Player.Achievement_Reward trigger "実績報酬"

# storage
    # System
        data modify storage 1_fishing_battle:system System set value {GameState:"Ready",Player:{Count:0}}
            #GameState:"Ready","Count","Play","Finish","End"
    # Rule
        data modify storage 1_fishing_battle:rule Rule set value {GameMode:"ScoreAttack",Rank:{Enable:0b},Timer:0,Score:0,Team:{Enable:0b,Count:2}}
            #GameMode:"ScoreAttack","TimeAttack","UncleGacha"
    # Regulation
        data modify storage 1_fishing_battle:regulation Regulation set value {ScoreAttack:{Time:6000,RodPrice:{DoubleRod:15,LureRod:70,RichRod:160,GamblingRod:180,SlotRod:230,10SlotRod:2300}},TimeAttack:{Score:5000,RodPrice:{DoubleRod:15,LureRod:70,RichRod:160,GamblingRod:180,SlotRod:230,10SlotRod:2300}},UncleGacha:{Time:6000,RodPrice:{DoubleRod:99999,LureRod:99999,RichRod:99999,GamblingRod:99999,SlotRod:0,10SlotRod:0}}}
    # Save/Ranking
        #Ranking
        #Solo/Team
        #ScoreAttack/TimeAttack/UncleGacha
        # Solo
            execute unless data storage 1_fishing_battle:save/ranking Ranking.Solo.ScoreAttack run data modify storage 1_fishing_battle:save/ranking Ranking.Solo.ScoreAttack set value {1:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},2:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},3:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},4:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},5:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},6:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0}}
            execute unless data storage 1_fishing_battle:save/ranking Ranking.Solo.TimeAttack run data modify storage 1_fishing_battle:save/ranking Ranking.Solo.TimeAttack set value {1:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0},2:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0},3:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0},4:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0},5:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0},6:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0}}
            execute unless data storage 1_fishing_battle:save/ranking Ranking.Solo.UncleGacha run data modify storage 1_fishing_battle:save/ranking Ranking.Solo.UncleGacha set value {1:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},2:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},3:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},4:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},5:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},6:{Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0}}
        # Team
            execute unless data storage 1_fishing_battle:save/ranking Ranking.Team.ScoreAttack run data modify storage 1_fishing_battle:save/ranking Ranking.Team.ScoreAttack set value {1:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},2:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},3:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},4:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},5:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},6:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0}}
            execute unless data storage 1_fishing_battle:save/ranking Ranking.Team.TimeAttack run data modify storage 1_fishing_battle:save/ranking Ranking.Team.TimeAttack set value {1:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0},2:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0},3:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0},4:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0},5:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0},6:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Time:0}}
            execute unless data storage 1_fishing_battle:save/ranking Ranking.Team.UncleGacha run data modify storage 1_fishing_battle:save/ranking Ranking.Team.UncleGacha set value {1:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},2:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},3:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},4:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},5:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0},6:{Color:"null",Player:[{Name:null,UUID:[I; 0, 0, 0, 0]}],Score:0}}
    # ShopPrice
        data modify storage 1_fishing_battle:shop_price ShopPrice set value {FishingRod:{Double:15,Lure:70,Rich:160,Gambling:180,Slot:230}}
            #DefaultValue:{Double:15,Lure:70,Rich:160,Gambling:180,Slot:230}

# Team
    ## add
        team add 1FSBT.Player.Team.Red "赤チーム"
        team add 1FSBT.Player.Team.Blue "青チーム"
        team add 1FSBT.Player.Team.Yellow "黄チーム"
        team add 1FSBT.Player.Team.Green "緑チーム"
        team add 1FSBT.Player.Team.Purple "紫チーム"
    ## modify
        team modify 1FSBT.Player.Team.Red color red
        team modify 1FSBT.Player.Team.Blue color blue
        team modify 1FSBT.Player.Team.Yellow color yellow
        team modify 1FSBT.Player.Team.Green color green
        team modify 1FSBT.Player.Team.Purple color light_purple
    
# bossbar
    bossbar add 1_fishing_battle:game_timer "1_fishing_battle:game_timer"

    bossbar set 1_fishing_battle:game_timer color green
    bossbar set 1_fishing_battle:game_timer style notched_6
    bossbar set 1_fishing_battle:game_timer max 1
    bossbar set 1_fishing_battle:game_timer value 1
    bossbar set 1_fishing_battle:game_timer players @a

# summon
    ## kill
        ### ショップ店員
            execute as @e[type=villager] if data entity @s {data:{PNCT:{1FSBT:{Shop:{}}}}} run tp ~ -500 ~
    ## ショップ店員
        ### ダブル釣竿
            summon villager 3.5 0 21.5 {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,NoAI:1b,Rotation:[-90F,0F],CustomName:{"color":"aqua","italic":false,"text":"ダブル釣竿"},data:{PNCT:{1FSBT:{Shop:{FishingRod:"Double",Price:0}}}}}
        ### 入れ食い釣竿
            summon villager 3.5 0 18.5 {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,NoAI:1b,Rotation:[-90F,0F],CustomName:{"color":"aqua","italic":false,"text":"入れ食い釣竿"},data:{PNCT:{1FSBT:{Shop:{FishingRod:"Lure",Price:0}}}}}
        ### リッチ釣竿
            summon villager 7.5 0 15.5 {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,NoAI:1b,Rotation:[0F,0F],CustomName:{"color":"light_purple","italic":false,"text":"リッチ釣竿"},data:{PNCT:{1FSBT:{Shop:{FishingRod:"Rich",Price:0}}}}}
        ### 博打釣竿
            summon villager 11.5 0 15.5 {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,NoAI:1b,Rotation:[0F,0F],CustomName:{"color":"light_purple","italic":false,"text":"博打釣竿"},data:{PNCT:{1FSBT:{Shop:{FishingRod:"Gambling",Price:0}}}}}
        ### おじガチャ釣竿
            summon villager 14.5 0 17.5 {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,NoAI:1b,Rotation:[90F,0F],CustomName:{"color":"gold","italic":false,"text":"おじガチャ釣竿"},data:{PNCT:{1FSBT:{Shop:{FishingRod:"Slot",Price:0}}}}}
        ### 10連おじガチャ釣竿
            summon villager 14.5 0 18.5 {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,NoAI:1b,Rotation:[90F,0F],CustomName:{"color":"gold","italic":false,"text":"10連おじガチャ釣竿"},data:{PNCT:{1FSBT:{Shop:{FishingRod:"Slot-10",Price:0}}}}}

# 通知
    ## debug msg
        tellraw @a {"translate":"[DEBUG/%s] %s","with":[{"text":"TPF"},{"text":"ロード完了"}]}