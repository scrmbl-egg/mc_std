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
$data modify storage std:temp strcmp set value { \
    compare:{ \
        first:'$(first)', \
        second:'$(second)', \
    }, \
}

# attempt to copy data with a match
$data modify storage std:temp strcmp.compare_cpy \
    set from storage std:temp strcmp.compare{ \
        first:'$(first)', \
        second:'$(first)' \
    }

# if no data could be copied, fail
execute unless data storage std:temp strcmp.compare_cpy \
    run \
    return run \
    function core_std:util/free_data_and_return { \
        value:0, \
        storage:"std:temp", \
        nbt:"strcmp", \
    }

# otherwise, free data normally
data remove storage std:temp strcmp

# return 1 (success)
return 1
