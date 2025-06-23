#>core_std:storage/init_consts
# Initialises all constants in the datapack/library.
#
# @authors scrmbl-egg

# reset
data remove storage std:main consts

## TYPE CONSTANTS

# boolean (true or false, byte with just 1b or 0b)
data modify storage std:main consts.boolean.name set value "boolean"
data modify storage std:main consts.boolean.bits set value 8
data modify storage std:main consts.boolean.bytes set value 1
data modify storage std:main consts.boolean.true set value true
data modify storage std:main consts.boolean.false set value false

# byte (signed 8 bit number)
data modify storage std:main consts.byte.name set value "byte"
data modify storage std:main consts.byte.bits set value 8
data modify storage std:main consts.byte.bytes set value 1
data modify storage std:main consts.byte.min set value -128b
data modify storage std:main consts.byte.max set value 127b

# short (signed 16 bit number)
data modify storage std:main consts.short.name set value "short"
data modify storage std:main consts.short.bits set value 16
data modify storage std:main consts.short.bytes set value 2
data modify storage std:main consts.short.min set value -32768s
data modify storage std:main consts.short.max set value 32767s

# int (signed 32 bit number)
data modify storage std:main consts.int.name set value "int"
data modify storage std:main consts.int.bits set value 32
data modify storage std:main consts.int.bytes set value 4
data modify storage std:main consts.int.min set value -2147483648
data modify storage std:main consts.int.max set value 2147483647

# long (signed 64 bit number)
data modify storage std:main consts.long.name set value "long"
data modify storage std:main consts.long.bits set value 64
data modify storage std:main consts.long.bytes set value 8
data modify storage std:main consts.long.min set value -9223372036854775808l
data modify storage std:main consts.long.max set value 9223372036854775807l

# float (single precision floating point number, 32 bits)
data modify storage std:main consts.float.name set value "float"
data modify storage std:main consts.float.bits set value 32b
data modify storage std:main consts.float.bytes set value 4b
data modify storage std:main consts.float.min set value -3.4e-38f
data modify storage std:main consts.float.max set value 3.4e+38f
data modify storage std:main consts.float.epsilon set value 1.401298e-45f
data modify storage std:main consts.float.pi set value 3.1415926535897931f
data modify storage std:main consts.float.tau set value 6.2831853071795864f
data modify storage std:main consts.float.phi set value 1.618033988749894f
data modify storage std:main consts.float.euler set value 2.718281828459045235360f

# double (double precision floating point number, 64 bits)
data modify storage std:main consts.double.name set value "double"
data modify storage std:main consts.double.bits set value 64
data modify storage std:main consts.double.bytes set value 8
data modify storage std:main consts.double.min set value -1.7e+308
data modify storage std:main consts.double.max set value 1.7e+308
data modify storage std:main consts.double.epsilon set value 4.94065645841247e-324d
data modify storage std:main consts.double.pi set value 3.1415926535897931d
data modify storage std:main consts.double.tau set value 6.2831853071795864d
data modify storage std:main consts.double.phi set value 1.618033988749894d
data modify storage std:main consts.double.euler set value 2.718281828459045235360d

## VECTOR CONSTANTS
