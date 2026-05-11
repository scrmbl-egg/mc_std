#>std:entity/player/gamemode/set
#
# Sets the player's current gamemode. Accepts both string and integer value
# as parameter.
#
# @context player
# @input
#   gamemode: ("survival" | "creative" | "adventure" | "spectator" | int @ 0..3)
#       Game mode name or integer code.

# cancel if a player is not executing this
execute unless entity @s[type=minecraft:player] \
    run \
    return run \
    function core_std:out/print_error { \
        function:"std:entity/player/gamemode/set", \
        text:{text:"Executing entity is not a player."}, \
    }

# save parameter
$data modify storage std:temp set_gamemode set value { \
    gamemode:$(gamemode), \
}

## check any possible parameter variants

# survival
execute if data storage std:temp set_gamemode{gamemode:0} \
    run \
    gamemode survival
execute if data storage std:temp set_gamemode{gamemode:"survival"} \
    run \
    gamemode survival

# creative
execute if data storage std:temp set_gamemode{gamemode:1} \
    run \
    gamemode creative
execute if data storage std:temp set_gamemode{gamemode:"creative"} \
    run \
    gamemode creative

# adventure
execute if data storage std:temp set_gamemode{gamemode:2} \
    run \
    gamemode adventure
execute if data storage std:temp set_gamemode{gamemode:"adventure"} \
    run \
    gamemode adventure

# spectator
execute if data storage std:temp set_gamemode{gamemode:3} \
    run \
    gamemode spectator
execute if data storage std:temp set_gamemode{gamemode:"spectator"} \
    run \
    gamemode spectator

# free memory
data remove storage std:temp set_gamemode
