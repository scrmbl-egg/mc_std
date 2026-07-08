#>std:math/lerp
#
# Linearly interpolates between two values by the factor defined in `weight`.
# The operation follows this formula:
# `lerp(from, to, weight) = from + (to - from) * weight`
#
# @authors scrmbl-egg
# @input
#   from: double
#       First value of the interpolation.
#   to: double
#       Second value of the interpolation.
#   weight: double
#       Weight of the interpolation. This number should usually be between 0.0
#       and 1.0, but it can be out of that range to represent extrapolation.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   Interpolated value in the specified NBT location.

# formula:
# lerp(a, b, t) = a + (b - a) * t

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function std.core:out/print_error/math_entity_not_summoned { \
        function:"std:math/lerp", \
    }

# set up local data
$data modify storage std:temp lerp set value { \
    formula_args:[ \
        { \
            x:$(to), \
            y:$(from), \
            out_storage:"std:temp", \
            out_nbt:"lerp.formula_args[1].x", \
        }, \
        { \
            x:0, \
            y:$(weight), \
            out_storage:"std:temp", \
            out_nbt:"lerp.formula_args[2].y", \
        }, \
        { \
            x:$(from), \
            y:0, \
            out_storage:"$(out_storage)", \
            out_nbt:"$(out_nbt)", \
        }, \
    ], \
}

# b - a
function std:math/subtract \
    with storage std:temp lerp.formula_args[0]
# (b - a) * t
function std:math/multiply \
    with storage std:temp lerp.formula_args[1]
# a + ((b - a) * t)
function std:math/add \
    with storage std:temp lerp.formula_args[2]

# free memory
data remove storage std:temp lerp
