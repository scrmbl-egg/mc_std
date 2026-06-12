#>core_std:out/print_error/math_entity_not_summoned
#
# Prints an error for math functions when the floating-point math entity is
# not summoned.
#
# @input
#   function: #[id="function"] string
#       Function from which the error came from.

$function core_std:out/print_error { \
    function:"$(function)", \
    text:[ \
        "The entity that allows floating-point math isn't summoned. Use ", \
        {text:"/reload",color:"gray"}, \
        " to summon it and allow math functions.", \
    ], \
}
