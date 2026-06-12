#>std:math/multiply
#
# Multiplies two numbers.
#
# @input
#   x: double
#       First number (or multiplicand).
#   y: double
#       Second number (or multiplier).
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.

## NOTE:
# Code is inspired by gibbsly's "gm" library function:
# https://github.com/gibbsly/gm/blob/main/data/gm/function/multiply.mcfunction

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function core_std:out/print_error/math_entity_not_summoned { \
        function:"std:math/multiply", \
    }

# save local data
$data modify storage std:temp multiply set value { \
    transform:[ \
        0f, 0f, 0f, $(x)f, \
        0f, 1f, 0f, 0f, \
        0f, 0f, 1f, 0f, \
        0f, 0f, 0f, 1f, \
    ], \
}

# perform operations
$data merge entity 2-0-0-9-deadbeef { \
    transformation:[ \
        0f, 0f, 0f, 1f, \
        0f, 1f, 0f, 0f, \
        0f, 0f, 1f, 0f, \
        0f, 0f, 0f, $(y)f, \
    ], \
}
data modify storage std:temp multiply.transform[-1] \
    set from entity 2-0-0-9-deadbeef transformation.translation[0]
data modify entity 2-0-0-9-deadbeef transformation \
    set from storage std:temp multiply.transform

# get result
$data modify storage $(out_storage) $(out_nbt) \
    set from entity 2-0-0-9-deadbeef transformation.translation[0]

# free memory
data remove storage std:temp multiply
