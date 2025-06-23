#>std:math/lerp
# Linearly interpolates between two values by the factor defined in
# 'weight'. The operation follows this formula:
# 'result = from + (to - from) * weight'
#
# @authors scrmbl-egg
# @params
    # result_st     -- Storage where the result will be stored.
    # result_path   -- NBT path where the result will be stored.
    # from          -- First value (double) of the interpolation.
    # to            -- Second value (double) of the interpolation.
    # weight        -- Weight of the interpolation. This number should usually
    #                  be between 0.0 and 1.0, but it can be out of that range
    #                  to represent extrapolation.
# @generates
    # Interpolated value (double) in the specified location

# general formula
# lerp(a, b, t) = a + (b - a) * t

# create local score
scoreboard objectives add std_local_lerp dummy

# set 1000 constant for later
scoreboard players set $scale std_local_lerp 1000

# save parameters so they can be scaled later
$data modify storage std:temp lerp.a set value $(from)
$data modify storage std:temp lerp.b set value $(to)
$data modify storage std:temp lerp.t set value $(weight)

# get data as scores
execute \
    store result score $a std_local_lerp \
    run data get storage std:temp lerp.a 1000
execute \
    store result score $b std_local_lerp \
    run data get storage std:temp lerp.b 1000
execute \
    store result score $t std_local_lerp \
    run data get storage std:temp lerp.t 1000

# (b - a)
scoreboard players operation $b std_local_lerp -= $a std_local_lerp

# (b - a) * t
# multiply by scaled t, then divide by 1000 to simulate decimal multiplication
scoreboard players operation $b std_local_lerp *= $t std_local_lerp
scoreboard players operation $b std_local_lerp /= $scale std_local_lerp

# a + ((b - a) * t)
scoreboard players operation $a std_local_lerp += $b std_local_lerp

# store a (scale back)
$execute \
    store result storage $(result_st) $(result_path) \
    double 0.001 \
    run scoreboard players get $a std_local_lerp

# free memory
scoreboard objectives remove std_local_lerp
data remove storage std:temp lerp
