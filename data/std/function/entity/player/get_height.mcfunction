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
    function std.core:out/print_error { \
        function:"std:entity/player/get_height", \
        text:["Executing entity is not a player."], \
    }

## NOTE:
# Hitbox sizes available in: https://minecraft.wiki/w/Player

data modify storage std:temp get_height set value {scale:0}
# get scale
execute store result storage std:temp get_height.scale \
    float 0.00000625 \
    run \
    attribute @s minecraft:scale get 160000

# compute height
$data modify storage $(out_storage) $(out_nbt) \
    set compute default float { \
        type:"minecraft:mul", \
        inputs:[ \
            1.8, \
            { \
                type:"minecraft:storage", \
                storage:"std:temp", \
                path:"get_height.scale", \
                fallback:1, \
            }, \
        ], \
    }

# free memory
data remove storage std:temp get_height
