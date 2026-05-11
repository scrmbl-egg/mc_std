#>std:entity/player/get_height
#
# Gets the current full height of the player. The returned value scales with
# the player's `minecraft:scale` attribute.
#
# @input
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   Height value in specified location.

# cancel if a player is not executing this
execute unless entity @s[type=minecraft:player] \
    run \
    return run \
    function core_std:out/print_error { \
        function:"std:entity/player/get_height", \
        text:{text:"Executing entity is not a player."}, \
    }

## NOTE:
# Hitbox sizes available in: https://minecraft.wiki/w/Player

# create local scoreboard
scoreboard objectives add __std.get_height dummy

scoreboard players set __$std_1000 __std.get_height 1000
scoreboard players set __$std_base __std.get_height 1800

# get current scale
execute store result score __$std_scale __std.get_height \
    run \
    attribute @s minecraft:scale get 1000

# base * scale (divided by 1000 to compensate int scales)
scoreboard players operation \
    __$std_base __std.get_height *= __$std_scale __std.get_height
scoreboard players operation \
    __$std_base __std.get_height /= __$std_1000 __std.get_height

# save in output
$execute store result storage $(out_storage) $(out_nbt) \
    double 0.001 \
    run \
    scoreboard players get __$std_base __std.get_height

# free memory
scoreboard objectives remove __std.get_height
