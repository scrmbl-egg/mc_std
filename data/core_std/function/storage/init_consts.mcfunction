#>core_std:storage/init_consts
#
# Initialises all constants in the datapack/library.
#
# @authors scrmbl-egg

# reset
data remove storage std:main consts

## TYPE CONSTANTS

# boolean (true or false, byte with just 1b or 0b)
data modify storage std:main consts.boolean set value { \
    name: "boolean", \
    bits:8, \
    bytes:1, \
    true_value:true, \
    false_value:false, \
    true_string:"true", \
    false_string:"false", \
}

# byte (signed 8 bit number)
data modify storage std:main consts.byte set value { \
    name:"byte", \
    bits:8, \
    bytes:1, \
    min:-128b, \
    max:127b, \
}

# short (signed 16 bit number)
data modify storage std:main consts.short set value { \
    name:"short", \
    bits:16, \
    bytes:2, \
    min:-32768s, \
    max:32767s, \
}

# int (signed 32 bit number)
data modify storage std:main consts.int set value { \
    name:"int", \
    bits:32, \
    bytes:4, \
    min:-2147483648, \
    max:2147483647, \
}

# long (signed 64 bit number)
data modify storage std:main consts.long set value { \
    name:"long", \
    bits:64, \
    bytes:8, \
    min:-9223372036854775808l, \
    max:9223372036854775807l, \
}

# float (single precision floating point number, 32 bits)
data modify storage std:main consts.float set value { \
    name:"float", \
    bits:32, \
    bytes:4, \
    min:-3.4e-38f, \
    max:3.4e+38f, \
    epsilon:1.401298e-45f, \
    pi:3.1415926535897931f, \
    tau:6.2831853071795864f, \
    phi:1.618033988749894f, \
    euler:2.718281828459045235360f, \
}

# double (double precision floating point number, 64 bits)
data modify storage std:main consts.double set value { \
    name:"double", \
    bits:64, \
    bytes:8, \
    min:-1.7e+308, \
    max:1.7e+308, \
    epsilon:4.94065645841247e-324d, \
    pi:3.1415926535897931d, \
    tau:6.2831853071795864d, \
    phi:1.618033988749894d, \
    euler:2.718281828459045235360d, \
}
