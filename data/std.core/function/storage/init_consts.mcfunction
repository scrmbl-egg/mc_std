#>std.core:storage/init_consts
#
# Initializes all constants in the datapack/library.
#
# @authors scrmbl-egg

# reset
data remove storage std:main consts

## TYPE CONSTANTS
data modify storage std:main consts.types set value { \
    byte:{ \
        name:"byte", \
        type_tag:1, \
        size:1, \
        min:-128b, \
        max:127b, \
        false:false, \
        true:true, \
    }, \
    short:{ \
        name:"short", \
        type_tag:2, \
        size:2, \
        min:-32768s, \
        max:32767s, \
    }, \
    int:{ \
        name:"int", \
        type_tag:3, \
        size:4, \
        min:-2147483648, \
        max:2147483647, \
    }, \
    long:{ \
        name:"long", \
        type_tag:4, \
        size:8, \
        min:-9223372036854775808l, \
        max:9223372036854775807l, \
    }, \
    float:{ \
        name:"float", \
        type_tag:5, \
        size:4, \
        min:-3.4e+38f, \
        max:3.4e+38f, \
        positive_epsilon:1.401298e-45f, \
        negative_epsilon:-1.401298e-45f, \
    }, \
    double:{ \
        name:"double", \
        type_tag:6, \
        size:8, \
        min:-1.7e+308d, \
        max:1.7e+308d, \
        positive_epsilon:4.94065645841247e-324d, \
        negative_epsilon:-4.94065645841247e-324d, \
    }, \
    byte_array:{ \
        name:"byte array", \
        type_tag:7, \
        type_indicator:"B", \
    }, \
    string:{ \
        name:"string", \
        type_tag:8, \
        character_size:1, \
        true:"true", \
        false:"false", \
    }, \
    nbt_compound:{ \
        name:"nbt compound", \
        type_tag:9, \
    }, \
    list:{ \
        name:"list", \
        type_tag:10, \
    }, \
    int_array:{ \
        name:"int array", \
        type_tag:11, \
        type_indicator:"I", \
    }, \
    long_array:{ \
        name:"long array", \
        type_tag:12, \
        type_indicator:"L", \
    }, \
}

## MATH CONSTANTS
data modify storage std:main consts.math set value { \
    pi:3.1415926535897931d, \
    tau:6.2831853071795864d, \
    phi:1.618033988749894d, \
    euler:2.718281828459045235360d, \
    ln_2:0.693147180559945309d, \
    ln_10:2.302585092994045684d, \
    sqrt_2:1.4142135623730950488d, \
    sqrt_3:1.73205080756887729352d, \
    degrees_to_radians:0.017453292519943295d, \
    radians_to_degrees:57.29577951308232d, \
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
