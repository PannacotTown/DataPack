#> __core__:__main__/__load__
#
# __core__：ワールド起動時に読み込む
#
# @within tag/function minecraft:load



# scoreboard
    scoreboard objectives add PNCT.Const dummy
    scoreboard objectives add PNCT.Temp dummy
    scoreboard objectives add PNCT.Player.ID dummy

# 定数
    function __core__:const

# storage
    execute unless data storage _pannacotown_:system System run data modify storage _pannacotown_:system System set value {GameEvent:"None",Staff:[]}
        #GameEvent: "None","FishingBattle"

# reset
    ## Tempスコア
        scoreboard players reset * PNCT.Temp
    ## function
        function __core__:__main__/_reset
