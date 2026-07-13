#>std.core:storage/init_consts
#
# Initializes all constants in the datapack/library.
#
# @authors scrmbl-egg

# reset
data remove storage std:main consts

## TYPE CONSTANTS
data modify storage std:main consts.types set value { \
    boolean:{ \
        name:"boolean", \
        bits:8, \
        bytes:1, \
        true_value:true, \
        false_value:false, \
        true_string:"true", \
        false_string:"false", \
    }, \
    byte:{ \
        name:"byte", \
        bits:8, \
        bytes:1, \
        min:-128b, \
        max:127b, \
        array_type_indicator:"B", \
    }, \
    short:{ \
        name:"short", \
        bits:16, \
        bytes:2, \
        min:-32768s, \
        max:32767s, \
    }, \
    int:{ \
        name:"int", \
        bits:32, \
        bytes:4, \
        min:-2147483648, \
        max:2147483647, \
        array_type_indicator:"I", \
    }, \
    long:{ \
        name:"long", \
        bits:64, \
        bytes:8, \
        min:-9223372036854775808l, \
        max:9223372036854775807l, \
        array_type_indicator:"L", \
    }, \
    float:{ \
        name:"float", \
        bits:32, \
        bytes:4, \
        min:-3.4e+38f, \
        max:3.4e+38f, \
        positive_epsilon:1.401298e-45f, \
        negative_epsilon:-1.401298e-45f, \
    }, \
    double:{ \
        name:"double", \
        bits:64, \
        bytes:8, \
        min:-1.7e+308d, \
        max:1.7e+308d, \
        positive_epsilon:4.94065645841247e-324d, \
        negative_epsilon:-4.94065645841247e-324d, \
    }, \
}

## MATH CONSTANTS
data modify storage std:main consts.math set value { \
    pi:3.1415926535897931d, \
    tau:6.2831853071795864d, \
    phi:1.618033988749894d, \
    euler:2.718281828459045235360d, \
    int_factorial_lookup:[I; \
        1, \
        1, \
        2, \
        6, \
        24, \
        120, \
        720, \
        5040, \
        40320, \
        362880, \
        3628800, \
        39916800, \
        479001600, \
    ], \
    long_factorial_lookup:[L; \
        1l, \
        1l, \
        2l, \
        6l, \
        24l, \
        120l, \
        720l, \
        5040l, \
        40320l, \
        362880l, \
        3628800l, \
        39916800l, \
        479001600l, \
        6227020800l, \
        87178291200l, \
        1307674368000l, \
        20922789888000l, \
        355687428096000l, \
        6402373705728000l, \
        121645100408832000l, \
        2432902008176640000l, \
    ] \
}
