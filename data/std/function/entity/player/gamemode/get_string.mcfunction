#>std:entity/player/gamemode/get_string
#
# Returns the player's current game mode as a string.
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
    function core_std:out/print_error { \
        function:"std:entity/player/gamemode/get_string", \
        text:{text:"Executing entity is not a player."}, \
    }

# survival
$execute if entity @s[gamemode=survival] \
    run \
    data modify storage $(out_storage) $(out_nbt) set value "survival"
execute if entity @s[gamemode=survival] run return 0

# creative
$execute if entity @s[gamemode=creative] \
    run \
    data modify storage $(out_storage) $(out_nbt) set value "creative"
execute if entity @s[gamemode=creative] run return 1

# adventure
$execute if entity @s[gamemode=adventure] \
    run \
    data modify storage $(out_storage) $(out_nbt) set value "adventure"
execute if entity @s[gamemode=adventure] run return 2

# spectator
$execute if entity @s[gamemode=spectator] \
    run \
    data modify storage $(out_storage) $(out_nbt) set value "spectator"
execute if entity @s[gamemode=spectator] run return 3
