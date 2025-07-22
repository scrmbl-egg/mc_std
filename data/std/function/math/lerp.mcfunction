#>std:math/lerp
#
# Linearly interpolates between two values by the factor defined in
# 'weight'. The operation follows this formula:
# 'lerp(from, to, weight) = from + (to - from) * weight'
#
# @authors scrmbl-egg
# @input
#   from: double
#       First value (double) of the interpolation.
#   to: double
#       Second value (double) of the interpolation.
#   weight: double
#       Weight of the interpolation. This number should usually be between 0.0
#       and 1.0, but it can be out of that range to represent extrapolation.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
    # Interpolated value (double) in the specified NBT location

# general formula
# lerp(a, b, t) = a + (b - a) * t

# create local score
scoreboard objectives add __std.lerp dummy

# set 1000 constant for later
scoreboard players set __$std_scale __std.lerp 1000

# save parameters so they can be scaled later
$data modify storage std:temp lerp.a set value $(from)
$data modify storage std:temp lerp.b set value $(to)
$data modify storage std:temp lerp.t set value $(weight)

# get data as scores
execute \
    store result score __$std_a __std.lerp \
    run data get storage std:temp lerp.a 1000
execute \
    store result score __$std_b __std.lerp \
    run data get storage std:temp lerp.b 1000
execute \
    store result score __$std_t __std.lerp \
    run data get storage std:temp lerp.t 1000

# (b - a)
scoreboard players operation __$std_b __std.lerp -= __$std_a __std.lerp

# (b - a) * t
# multiply by scaled t, then divide by 1000 to simulate decimal multiplication
scoreboard players operation __$std_b __std.lerp *= __$std_t __std.lerp
scoreboard players operation __$std_b __std.lerp /= __$std_scale __std.lerp

# a + ((b - a) * t)
scoreboard players operation __$std_a __std.lerp += __$std_b __std.lerp

# store a (scale back)
$execute store result storage $(out_storage) $(out_nbt) double 0.001 \
    run \
    scoreboard players get __$std_a __std.lerp

# free memory
scoreboard objectives remove __std.lerp
data remove storage std:temp lerp
