#>std:entity/player/gamemode/get_value
#
# Returns the player's current game mode as an integer value.
#
# @context player
# @returns
#   Result: 0 if survival, 1 if creative, 2 if adventure, 3 if spectator.

# cancel if a player is not executing this
execute unless entity @s[type=minecraft:player] \
    run \
    return run \
    function core_std:error/print { \
        function:"std:entity/player/gamemode/get_value", \
        text:{text:"Executing entity is not a player."}, \
    }

# survival
execute if entity @s[gamemode=survival] run return 0

# creative
execute if entity @s[gamemode=creative] run return 1

# adventure
execute if entity @s[gamemode=adventure] run return 2

# spectator
execute if entity @s[gamemode=spectator] run return 3
