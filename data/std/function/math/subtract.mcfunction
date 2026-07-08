#>std:math/subtract
#
# Subtracts one number from another.
#
# @input
#   x: double
#       First number (or minuend).
#   y: double
#       Second number (or subtrahend).
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The difference in the specified location.

## NOTE:
# This function is easy, we just negate `y` and add it to `x`.

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function std.core:out/print_error/math_entity_not_summoned { \
        function:"std:math/subtract", \
    }

# setup local data
$data modify storage std:temp subtract set value { \
    negate_multiplication_args:{ \
        x:$(y), \
        y:-1, \
        out_storage:"std:temp", \
        out_nbt:"subtract.add_args.y", \
    }, \
    add_args:{ \
        x:$(x), \
        y:0, \
        out_storage:"$(out_storage)", \
        out_nbt:"$(out_nbt)", \
    }, \
}

# negate y
function std:math/multiply \
    with storage std:temp subtract.negate_multiplication_args

# add the numbers together
function std:math/add \
    with storage std:temp subtract.add_args
# this function generates the user's output

# free memory
data remove storage std:temp subtract
