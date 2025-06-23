#>std:math/clamp
# Clamps a 'value' between a minimum and a maximum value.
#
# @authors scrmbl-egg
# @params
    # result_st     -- Storage where the result will be stored.
    # result_path   -- NBT path where the result will be stored.
    # value         -- Number to be clamped.
    # min           -- Minimum value.
    # max           -- Maximum value.
# @generates
    # Clamped number (double) in the specified location.

# create local score
scoreboard objectives add std_local_clamp dummy

# store params
$data modify storage std:temp clamp.value set value $(value)
$data modify storage std:temp clamp.min set value $(min)
$data modify storage std:temp clamp.max set value $(max)

# get data as scores
execute \
    store result score $value std_local_clamp \
    run data get storage std:temp clamp.value 10000
execute \
    store result score $min std_local_clamp \
    run data get storage std:temp clamp.min 10000
execute \
    store result score $max std_local_clamp \
    run data get storage std:temp clamp.max 10000

# assert that min isn't greater than max. if that's the case, abort function
# and free data
$execute \
    if score $min std_local_clamp > $max std_local_clamp \
    run \
    function core_std:math/clamp/error/fail_params_assertion \
    {min:$(min),max:$(max)}

# set result storage, change values later if necessary
$data modify storage $(result_st) $(result_path) set value $(value)

# less than minimum case
$execute \
    if score $min std_local_clamp > $value std_local_clamp \
    run data modify storage $(result_st) $(result_path) set value $(min)

# greater than maximum case
$execute \
    if score $max std_local_clamp < $value std_local_clamp \
    run data modify storage $(result_st) $(result_path) set value $(max)

# free memory
scoreboard objectives remove std_local_clamp
data remove storage std:temp clamp
