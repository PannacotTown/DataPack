#> 1_fishing_battle:ranking/set_ranking_board
#
# FishingBattle：ランキング看板の表示を更新する
#
# @within function 1_fishing_battle:_main/game_state/1_ready


#看板座標 タイトル:[2 3 28] 1位:[1 2 28] 2位:[2 2 28] 3位:[3 2 28] 4位:[1 1 28] 5位:[2 1 28] 6位:[3 1 28]

# タイトル
    ## ScoreAttack
        execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"ScoreAttack"}} run data modify block 2 3 28 front_text set value {has_glowing_text:true,messages:["",{text:"ScoreAttack",bold:true,color:"blue"},"",""]}
    ## TimeAttack
        execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"TimeAttack"}} run data modify block 2 3 28 front_text set value {has_glowing_text:true,messages:["",{text:"TimeAttack",bold:true,color:"blue"},"",""]}
    ## UncleGacha
        execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"UncleGacha"}} run data modify block 2 3 28 front_text set value {has_glowing_text:true,messages:["",{text:"UncleGacha",bold:true,color:"blue"},"",""]}

# ソロ
    ## 1位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)"}} run data modify block 1 2 28 front_text set value {has_glowing_text:true,messages:[[{text:"1st",bold:true,color:"gold",click_event:{action:"run_command",command:"tellraw @s \"solo 1st\""}}],"",{nbt:"Ranking.Solo.$(game_mode).1.Player.Name",storage:"1_fishing_battle:save/ranking",bold:true},""]}
    ## 2位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)"}} run data modify block 2 2 28 front_text set value {has_glowing_text:true,messages:[[{text:"2nd",bold:true,color:"gray",click_event:{action:"run_command",command:"tellraw @s \"solo 2nd\""}}],"",{nbt:"Ranking.Solo.$(game_mode).2.Player.Name",storage:"1_fishing_battle:save/ranking",bold:true},""]}
    ## 3位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)"}} run data modify block 3 2 28 front_text set value {has_glowing_text:true,messages:[[{text:"3rd",bold:true,color:"dark_red",click_event:{action:"run_command",command:"tellraw @s \"solo 3rd\""}}],"",{nbt:"Ranking.Solo.$(game_mode).3.Player.Name",storage:"1_fishing_battle:save/ranking",bold:true},""]}
    ## 4位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)"}} run data modify block 1 1 28 front_text set value {has_glowing_text:true,messages:[[{text:"4th",bold:true,color:"black",click_event:{action:"run_command",command:"tellraw @s \"solo 4th\""}}],"",{nbt:"Ranking.Solo.$(game_mode).4.Player.Name",storage:"1_fishing_battle:save/ranking",bold:true},""]}
    ## 5位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)"}} run data modify block 2 1 28 front_text set value {has_glowing_text:true,messages:[[{text:"5th",bold:true,color:"black",click_event:{action:"run_command",command:"tellraw @s \"solo 5th\""}}],"",{nbt:"Ranking.Solo.$(game_mode).5.Player.Name",storage:"1_fishing_battle:save/ranking",bold:true},""]}
    ## 6位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)"}} run data modify block 3 1 28 front_text set value {has_glowing_text:true,messages:[[{text:"6th",bold:true,color:"black",click_event:{action:"run_command",command:"tellraw @s \"solo 6th\""}}],"",{nbt:"Ranking.Solo.$(game_mode).6.Player.Name",storage:"1_fishing_battle:save/ranking",bold:true},""]}
# チーム
    ## 1位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)",Team:{Enable:1b}}} run data modify block 1 2 28 front_text set value {has_glowing_text:true,messages:[[{text:"1st",bold:true,color:"gold",click_event:{action:"run_command",command:"tellraw @s \"team 1st\""}}],"",{nbt:"Ranking.Team.$(game_mode).1.Color",storage:"1_fishing_battle:save/ranking",bold:true},""]}
    ## 2位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)",Team:{Enable:1b}}} run data modify block 2 2 28 front_text set value {has_glowing_text:true,messages:[[{text:"2nd",bold:true,color:"gray",click_event:{action:"run_command",command:"tellraw @s \"team 2nd\""}}],"",{nbt:"Ranking.Team.$(game_mode).2.Color",storage:"1_fishing_battle:save/ranking",bold:true},""]}
    ## 3位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)",Team:{Enable:1b}}} run data modify block 3 2 28 front_text set value {has_glowing_text:true,messages:[[{text:"3rd",bold:true,color:"dark_red",click_event:{action:"run_command",command:"tellraw @s \"team 3rd\""}}],"",{nbt:"Ranking.Team.$(game_mode).3.Color",storage:"1_fishing_battle:save/ranking",bold:true},""]}
    ## 4位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)",Team:{Enable:1b}}} run data modify block 1 1 28 front_text set value {has_glowing_text:true,messages:[[{text:"4th",bold:true,color:"black",click_event:{action:"run_command",command:"tellraw @s \"team 4th\""}}],"",{nbt:"Ranking.Team.$(game_mode).4.Color",storage:"1_fishing_battle:save/ranking",bold:true},""]}
    ## 5位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)",Team:{Enable:1b}}} run data modify block 2 1 28 front_text set value {has_glowing_text:true,messages:[[{text:"5th",bold:true,color:"black",click_event:{action:"run_command",command:"tellraw @s \"team 5th\""}}],"",{nbt:"Ranking.Team.$(game_mode).5.Color",storage:"1_fishing_battle:save/ranking",bold:true},""]}
    ## 6位
        $execute if data storage 1_fishing_battle:rule {Rule:{GameMode:"$(game_mode)",Team:{Enable:1b}}} run data modify block 3 1 28 front_text set value {has_glowing_text:true,messages:[[{text:"6th",bold:true,color:"black",click_event:{action:"run_command",command:"tellraw @s \"team 6th\""}}],"",{nbt:"Ranking.Team.$(game_mode).6.Color",storage:"1_fishing_battle:save/ranking",bold:true},""]}