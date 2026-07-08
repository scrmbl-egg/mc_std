#>std:entity/player/gamemode/get_string
#
# Returns the player's current game mode as a string. If only the integer value
# is wanted, do one of these commands:
#
# ```mcfunction
# data get entity @s playerGameType
# data get entity @s previousPlayerGameType
# ```
#
# @context player
# @input
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @returns
#   Result: 0 if survival, 1 if creative, 2 if adventure, 3 if spectator.

# cancel if a player is not executing this
execute unless entity @s[type=minecraft:player] \
    run \
    return run \
    function std.core:out/print_error { \
        function:"std:entity/player/gamemode/get_string", \
        text:{text:"Executing entity is not a player."}, \
    }

# survival
$execute if entity @s[gamemode=survival] \
    run \
    data modify storage $(out_storage) $(out_nbt) set value "survival"

# creative
$execute if entity @s[gamemode=creative] \
    run \
    data modify storage $(out_storage) $(out_nbt) set value "creative"

# adventure
$execute if entity @s[gamemode=adventure] \
    run \
    data modify storage $(out_storage) $(out_nbt) set value "adventure"

# spectator
$execute if entity @s[gamemode=spectator] \
    run \
    data modify storage $(out_storage) $(out_nbt) set value "spectator"

# return mode
return run data get entity @s playerGameType
