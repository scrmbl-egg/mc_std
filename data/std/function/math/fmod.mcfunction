#>std:math/fmod
#
# Calculates the floating-point euclidean division remainder of two numbers.
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

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function core_std:out/print_error/math_entity_not_summoned { \
        function:"std:math/fmod", \
    }

# set up local data
$data modify storage std:temp fmod set value { \
    divide_args:{ \
        x:$(x), \
        y:$(y),\
        out_storage:"std:temp", \
        out_nbt:"fmod.value_to_truncate", \
    }, \
    value_to_truncate:0f, \
    multiply_args:{ \
        x:0, \
        y:$(y), \
        out_storage:"std:temp", \
        out_nbt:"fmod.subtract_args.y", \
    }, \
    subtract_args:{ \
        x:$(x), \
        y:0, \
        out_storage:"$(out_storage)", \
        out_nbt:"$(out_nbt)", \
    }, \
}

## perform operations
# first, divide the arguments
function std:math/divide \
    with storage std:temp fmod.divide_args

# truncate result, and use for later multiplication
execute store result storage std:temp fmod.multiply_args.x \
    long 1 \
    run \
    data get storage std:temp fmod.value_to_truncate 1

# multiply truncated value with original divisor
function std:math/multiply \
    with storage std:temp fmod.multiply_args

# get difference between the multiplied truncated value and dividend, i.e. the
# result
function std:math/subtract \
    with storage std:temp fmod.subtract_args

# free memory
data remove storage std:temp fmod
