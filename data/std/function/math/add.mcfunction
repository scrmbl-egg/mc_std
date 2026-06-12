#>std:math/add
#
# Adds two floating-point numbers.
#
# @input
#   x: double
#       First number (or addend).
#   y: double
#       Second number (or addend).
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The sum of the numbers in the specified location.

## NOTE:
# Code is inspired by gibbsly's "gm" library function:
# https://github.com/gibbsly/gm/blob/main/data/gm/function/add.mcfunction

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function core_std:out/print_error/math_entity_not_summoned { \
        function:"std:math/add", \
    }

# perform operation
$execute as 2-0-0-9-deadbeef \
    at @s \
    run \
    tp @s ~ $(x) ~
$execute as 2-0-0-9-deadbeef \
    at @s \
    run \
    tp @s ~ ~$(y) ~


# get result
$data modify storage $(out_storage) $(out_nbt) \
    set from entity 2-0-0-9-deadbeef Pos[1]
