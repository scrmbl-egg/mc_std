#>std:math/sqrt
#
# Calculates the square root of a number.
#
# @input
#   x: double
#       Number.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The square root in the specified location.

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function std.core:out/print_error/math_entity_not_summoned { \
        function:"std:math/sqrt", \
    }

# this function is just an alias of the following function
$function std:math/pow { \
    x:$(x), \
    y:0.5, \
    out_storage:"$(out_storage)", \
    out_nbt:"$(out_nbt)", \
}
