#>std:math/divide
#
# Divides one number by another.
#
# @input
#   x: double
#       First number (or dividend).
#   y: double
#       Second number (or divisor).
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.

## NOTE:
# Code is inspired by gibbsly's "gm" library function:
# https://github.com/gibbsly/gm/blob/main/data/gm/function/zzz/divide_handling.mcfunction

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function std.core:out/print_error/math_entity_not_summoned { \
        function:"std:math/divide", \
    }

# set transformation matrix
$data merge entity 2-0-0-9-deadbeef { \
    transformation:[ \
        0f, 0f, 0f, $(x)f, \
        0f, 1f, 0f, 0f, \
        0f, 0f, 1f, 0f, \
        0f, 0f, 0f, $(y)f, \
    ], \
}

# get result
$data modify storage $(out_storage) $(out_nbt) \
    set from entity 2-0-0-9-deadbeef transformation.translation[0]
