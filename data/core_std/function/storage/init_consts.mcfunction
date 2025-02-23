#>core_std:storage/init_consts
# Initialises all constants in the datapack/library.
#
# @authors scrmbl-egg

# reset
data remove storage minecraft:std consts

## TYPE CONSTANTS

# byte (signed 8 bit number)
data modify storage minecraft:std consts.byte.min set value -128b
data modify storage minecraft:std consts.byte.max set value 127b

# short (signed 16 bit number)
data modify storage minecraft:std consts.short.min set value -32768s
data modify storage minecraft:std consts.short.max set value 32767s

# int (signed 32 bit number)
data modify storage minecraft:std consts.int.min set value -2147483648
data modify storage minecraft:std consts.int.max set value 2147483647

# long (signed 64 bit number)
data modify storage minecraft:std consts.long.min set value -9223372036854775808l
data modify storage minecraft:std consts.long.max set value 9223372036854775807l

# float (single precision floating point number, 32 bits)
data modify storage minecraft:std consts.float.min set value -3.4e-38f
data modify storage minecraft:std consts.float.max set value 3.4e+38f
data modify storage minecraft:std consts.float.epsilon set value 1.401298e-45f

data modify storage minecraft:std consts.float.math.pi set value 3.1415926535897931f
data modify storage minecraft:std consts.float.math.tau set value 6.2831853071795864f
data modify storage minecraft:std consts.float.math.phi set value 1.618033988749894f
data modify storage minecraft:std consts.float.math.euler set value 2.718281828459045235360f

# double (double precision floating point number, 64 bits)
data modify storage minecraft:std consts.double.min set value -1.7e+308
data modify storage minecraft:std consts.double.max set value 1.7e+308
data modify storage minecraft:std consts.double.epsilon set value 4.94065645841247e-324d

data modify storage minecraft:std consts.double.math.pi set value 3.1415926535897931d
data modify storage minecraft:std consts.double.math.tau set value 6.2831853071795864d
data modify storage minecraft:std consts.double.math.phi set value 1.618033988749894d
data modify storage minecraft:std consts.double.math.euler set value 2.718281828459045235360d

## FUNCTION CONSTANTS

# ...
