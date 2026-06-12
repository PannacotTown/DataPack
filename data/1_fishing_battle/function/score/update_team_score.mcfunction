#> 1_fishing_battle:score/update_team_score
#
# FishingBattle：チームスコアと個人スコアの操作
#
# @within function 1_fishing_battle:_main/game_state/3_play/



# 個人→合計に反映
    ## 赤チーム
        execute if entity @s[team=1FSBT.Player.Team.Red] unless score @s 1FSBT.Player.Score > $PNCT.1FSBT.Score.Total.Red 1FSBT.Player.Score run scoreboard players operation $PNCT.1FSBT.Score.Total.Red 1FSBT.Player.Score = @s 1FSBT.Player.Score
    ## 青チーム
        execute if entity @s[team=1FSBT.Player.Team.Blue] unless score @s 1FSBT.Player.Score > $PNCT.1FSBT.Score.Total.Blue 1FSBT.Player.Score run scoreboard players operation $PNCT.1FSBT.Score.Total.Blue 1FSBT.Player.Score = @s 1FSBT.Player.Score
    ## 黃チーム
        execute if entity @s[team=1FSBT.Player.Team.Yellow] unless score @s 1FSBT.Player.Score > $PNCT.1FSBT.Score.Total.Yellow 1FSBT.Player.Score run scoreboard players operation $PNCT.1FSBT.Score.Total.Yellow 1FSBT.Player.Score = @s 1FSBT.Player.Score
    ## 緑チーム
        execute if entity @s[team=1FSBT.Player.Team.Green] unless score @s 1FSBT.Player.Score > $PNCT.1FSBT.Score.Total.Green 1FSBT.Player.Score run scoreboard players operation $PNCT.1FSBT.Score.Total.Yellow 1FSBT.Player.Score = @s 1FSBT.Player.Score
    ## 紫チーム
        execute if entity @s[team=1FSBT.Player.Team.Purple] unless score @s 1FSBT.Player.Score > $PNCT.1FSBT.Score.Total.Purple 1FSBT.Player.Score run scoreboard players operation $PNCT.1FSBT.Score.Total.Yellow 1FSBT.Player.Score = @s 1FSBT.Player.Score

# 合計→個人に反映
    ## 赤チーム
        execute if entity @s[team=1FSBT.Player.Team.Red] unless score @s 1FSBT.Player.Score < $PNCT.1FSBT.Score.Total.Red 1FSBT.Player.Score run scoreboard players operation @s 1FSBT.Player.Score = $PNCT.1FSBT.Score.Total.Red 1FSBT.Player.Score
    ## 青チーム
        execute if entity @s[team=1FSBT.Player.Team.Blue] unless score @s 1FSBT.Player.Score < $PNCT.1FSBT.Score.Total.Blue 1FSBT.Player.Score run scoreboard players operation @s 1FSBT.Player.Score = $PNCT.1FSBT.Score.Total.Blue 1FSBT.Player.Score
    ## 黃チーム
        execute if entity @s[team=1FSBT.Player.Team.Yellow] unless score @s 1FSBT.Player.Score < $PNCT.1FSBT.Score.Total.Yellow 1FSBT.Player.Score run scoreboard players operation @s 1FSBT.Player.Score = $PNCT.1FSBT.Score.Total.Yellow 1FSBT.Player.Score
    ## 緑チーム
        execute if entity @s[team=1FSBT.Player.Team.Green] unless score @s 1FSBT.Player.Score < $PNCT.1FSBT.Score.Total.Green 1FSBT.Player.Score run scoreboard players operation @s 1FSBT.Player.Score = $PNCT.1FSBT.Score.Total.Green 1FSBT.Player.Score
    ## 紫チーム
        execute if entity @s[team=1FSBT.Player.Team.Purple] unless score @s 1FSBT.Player.Score < $PNCT.1FSBT.Score.Total.Purple 1FSBT.Player.Score run scoreboard players operation @s 1FSBT.Player.Score = $PNCT.1FSBT.Score.Total.Purple 1FSBT.Player.Score


#**マルチプレイ時テスト必須