#>core_std:storage/init_consts
# Initialises all constants in the datapack/library.
#
# @authors scrmbl-egg

# reset
data remove storage minecraft:std consts

## TYPE CONSTANTS

# float (single precision floating point number, 32 bits)
data modify storage minecraft:std consts.float.epsilon set value 1.401298e-45f

data modify storage minecraft:std consts.float.math.pi set value 3.1415926535897931f
data modify storage minecraft:std consts.float.math.tau set value 6.2831853071795864f
data modify storage minecraft:std consts.float.math.phi set value 1.618033988749894f

# double (double precision floating point number, 64 bits)
data modify storage minecraft:std consts.double.epsilon set value 4.94065645841247e-324d

data modify storage minecraft:std consts.double.math.pi set value 3.1415926535897931d
data modify storage minecraft:std consts.double.math.tau set value 6.2831853071795864d
data modify storage minecraft:std consts.double.math.phi set value 1.618033988749894d

## FUNCTION CONSTANTS

# ...
