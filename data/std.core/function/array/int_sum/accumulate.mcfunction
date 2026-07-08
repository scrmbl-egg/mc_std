#>std.core:array/int_sum/accumulate
#
# Accumulates a single number from the int array.
#
# @input
#   number: (byte | int)
#       Number that will be accumulated.

# get number
$data modify storage std:temp sum_current set value $(number)

# store in current
execute store result score __$std_current __std.int_sum \
    run \
    data get storage std:temp sum_current 1


# accumulate
scoreboard players operation \
    __$std_accum __std.int_sum += __$std_current __std.int_sum

# free memory
data remove storage std:temp sum_current
