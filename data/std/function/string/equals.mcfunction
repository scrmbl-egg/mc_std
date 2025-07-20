#>std:string/equals
#
# Checks if two strings are equal.
#
# @authors scrmbl-egg
# @input
#   first: string
#       First string to check.
#   second: string
#       Second string to check.
# @returns
#   Result: 1 if the two strings are equal, 0 if not.

# save parameters
$data modify storage std:temp compare set value { \
    first:'$(first)', \
    second:'$(second)', \
}

# attempt to copy data with a match
$data modify storage std:temp compare_cpy \
    set from storage std:temp compare{ \
        first:'$(first)', \
        second:'$(first)' \
    }

# if no data could be copied, fail function
execute unless data storage std:temp compare_cpy \
    run \
    return run \
    function std:fail { \
        score_objectives:[], \
        nbt_paths:[ \
            {storage:"std:temp",nbt:"compare"}, \
        ], \
        entity_selectors:[], \
    }

# otherwise, free data normally
data remove storage std:temp compare
data remove storage std:temp compare_cpy

# return 1 (success)
return 1
