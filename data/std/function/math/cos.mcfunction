#>std:math/cos
#
# Calculates the cosine of a number in degrees.
#
# @input
#   x: double
#       Number in degrees.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The cosine of the number in the specified location.

## NOTE:
# Code is inspired by gibbsly's "gm" library functions:
# https://github.com/gibbsly/gm/blob/main/data/gm/function/cos.mcfunction
# https://github.com/gibbsly/gm/blob/main/data/gm/function/zzz/cos_handling.mcfunction

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function std.core:out/print_error/math_entity_not_summoned { \
        function:"std:math/cos", \
    }

## NOTE:
# to get the cosine, we teleport the entity to 0 0 0, we rotate horizontally
# with the  specified angle, and we teleport it one block forward. Once we do
# that, we get the Z axis position to get the cosine.
$execute rotated $(x) 0 \
    positioned 0.0 0.0 0.0 \
    positioned ^ ^ ^1 \
    as 2-0-0-9-deadbeef \
    run \
    tp @s ~ ~ ~
$data modify storage $(out_storage) $(out_nbt) \
    set from entity 2-0-0-9-deadbeef Pos[2]

# teleport back to regular position
tp 2-0-0-9-deadbeef -29999999 0 -29999999
