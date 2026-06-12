#>std:math/inverse_lerp
#
# Calculates the linear factor between two values for a given target value.
#
# This function is the inverse of `std:math/lerp` because it calculates the
# percentage the `weight` parameter of that function needs to be in order
# to match this function's own `weight` parameter.
#
# @input
#   from: double
#       First value of the interpolation.
#   to: double
#       Second value of the interpolation.
#   weight: double
#       Weight of the interpolation. This number should usually be between
#       `from` and `to`, but it can be out of that range to represent
#       extrapolation
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   Interpolated value in the specified NBT location.

# formula:
# inverse_lerp(a, b, t) = (t - a) / (b - a)

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function core_std:out/print_error/math_entity_not_summoned { \
        function:"std:math/inverse_lerp", \
    }

# set up local data
$data modify storage std:temp inverse_lerp set value { \
    from:$(from), \
    to:$(to), \
    formula_args:[ \
        { \
            x:$(weight), \
            y:$(from), \
            out_storage:"std:temp", \
            out_nbt:"inverse_lerp.formula_args[2].x", \
        }, \
        { \
            x:$(to), \
            y:$(from), \
            out_storage:"std:temp", \
            out_nbt:"inverse_lerp.formula_args[2].y", \
        }, \
        { \
            x:0, \
            y:0, \
            out_storage:"$(out_storage)", \
            out_nbt:"$(out_nbt)", \
        }, \
    ], \
}

# we must check if both values are 0, but for that, we need to convert whatever
# value was passed into doubles.
execute store result storage std:temp inverse_lerp.from \
    double 1 \
    run \
    data get storage std:temp inverse_lerp.from 1
execute store result storage std:temp inverse_lerp.to \
    double 1 \
    run \
    data get storage std:temp inverse_lerp.to 1

# check if both are 0, so no zero division occurs. if both are 0, just output
# 0 and free the memory early
$execute if data storage std:temp inverse_lerp{from:0.0,to:0.0} \
    run \
    data modify storage $(out_storage) $(out_nbt) set value 0.0
execute if data storage std:temp inverse_lerp{from:0.0,to:0.0} \
    run \
    return run \
    data remove storage std:temp inverse_lerp

# otherwise, perform formula operations

# t - a
function std:math/subtract \
    with storage std:temp inverse_lerp.formula_args[0]
# b - a
function std:math/subtract \
    with storage std:temp inverse_lerp.formula_args[1]

# (t - a) / (b - a)
function std:math/divide \
    with storage std:temp inverse_lerp.formula_args[2]

# free memory
data remove storage std:temp inverse_lerp
