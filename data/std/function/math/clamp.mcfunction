#>std:math/clamp
#
# Clamps a `value` between a minimum (`min`) and a maximum (`max`) value. An
# error is printed and no output is generated if the `min` value is greater than
# `max`.
#
# @authors scrmbl-egg
# @input
#   x: double
#       Number to be clamped.
#   min: double
#       Minimum value.
#   max: double
#       Maximum value.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   Clamped number (double) in the specified destination.

## NOTE:
# This formula clamps the value without using conditionals
#
# clamp(x, a, b) = max(a, min(x, b))

## NOTE:
# to assert min is smaller than max, we do the following subtraction: max - min,
# and std:math/sign must return 1 and no other number when using the result of
# the subtraction as an argument. This way, we ensure min < max

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function core_std:out/print_error/math_entity_not_summoned { \
        function:"std:math/clamp", \
    }

# set up local data
$data modify storage std:temp clamp set value { \
    op_args:[ \
        { \
            x:$(max), \
            y:$(min), \
            out_storage:"std:temp", \
            out_nbt:"clamp.difference_sign_args.x", \
        }, \
        { \
            x:$(x), \
            y:$(max), \
            out_storage:"std:temp", \
            out_nbt:"clamp.op_args[2].y", \
        }, \
        { \
            x:$(min), \
            y:0, \
            out_storage:"$(out_storage)", \
            out_nbt:"$(out_nbt)", \
        }, \
    ], \
    difference_sign_args:{x:0}, \
    difference_sign:0, \
}

# get sign
function std:math/subtract \
    with storage std:temp clamp.op_args[0]
execute store result storage std:temp clamp.difference_sign \
    int 1 \
    run \
    function std:math/sign \
    with storage std:temp clamp.difference_sign_args


# if sign result is not 1, return early with an error
$execute unless data storage std:temp clamp{difference_sign:1} \
    run \
    function core_std:out/print_error { \
        function:"std:math/clamp", \
        text:{ \
            translate:"", \
            fallback:"'min' parameter can't be greater than the 'max' parameter ('min'=%1$s,'max'=%2$s).", \
            with:[ \
                "$(min)", \
                "$(max)", \
            ], \
        }, \
    }
execute unless data storage std:temp clamp{difference_sign:1} \
    run \
    return run \
    function std:storage/remove_data_and_fail { \
        storage:"std:temp", \
        nbt:"clamp", \
    }

# otherwise, perform ops
function std:math/min \
    with storage std:temp clamp.op_args[1]
function std:math/max \
    with storage std:temp clamp.op_args[2]
# ^this function generates the output in the user's specified location


# free memory
data remove storage std:temp clamp
