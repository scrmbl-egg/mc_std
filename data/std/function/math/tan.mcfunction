#>std:math/tan
#
# Calculates the tangent of a number in degrees.
#
# @input
#   x: double
#       Number in degrees.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The tangent of the number in the specified location.

## NOTE:
# tan(x) = sin(x) / cos(x)

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function core_std:out/print_error/math_entity_not_summoned { \
        function:"std:math/tan", \
    }

# set up local data
$data modify storage std:temp tan set value { \
    sin_args:{ \
        x:$(x), \
        out_storage:"std:temp", \
        out_nbt:"tan.divide_args.x", \
    }, \
    cos_args:{ \
        x:$(x), \
        out_storage:"std:temp", \
        out_nbt:"tan.divide_args.y", \
    }, \
    divide_args:{ \
        x:0, \
        y:0, \
        out_storage:"$(out_storage)", \
        out_nbt:"$(out_nbt)", \
    }, \
}

# perform operations
function std:math/sin \
    with storage std:temp tan.sin_args

function std:math/cos \
    with storage std:temp tan.cos_args

function std:math/divide \
    with storage std:temp tan.divide_args

# free memory
data remove storage std:temp tan
