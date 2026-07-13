#>std:math/floor
#
# Rounds down a value.
#
# This function generates the same result as using the following command:
#
# ```mcfunction
# execute store result ... int 1 run data get storage my_storage value
# ```
#
# @input
#   x: double
#       Number.
# @returns
#   Result: the floor of the passed value as an integer

## NOTE:
# Like the documentation implies, this function is a bit redundant, but since
# this library already has the `std:math/ceil` function, and the `/function`
# module allows for dynamic dispatch, I think it's best to keep this function
# here, just as a helper.
#
# -scrmbl-egg

## NOTE:
# Code is inspired by gibbsly's "gm" library function:
# https://github.com/gibbsly/gm/blob/main/data/gm/function/floor.mcfunction

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function std.core:out/print_error/math_entity_not_summoned { \
        function:"std:math/floor", \
    }
# yeah yeah, the entity function is not really necessary, but you never really
# know...

# set up local data
$data modify storage std:temp floor set value { \
    value:$(x), \
}

execute store result storage std:main null \
    int 1 \
    run \
    data get storage std:temp floor.value 1

# free memory and return value
data remove storage std:temp floor
return run \
    data get storage std:main null
