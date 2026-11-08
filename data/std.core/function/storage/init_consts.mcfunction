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
        min:-32_768s, \
        max:32_767s, \
    }, \
    int:{ \
        name:"int", \
        type_tag:3, \
        size:4, \
        min:-2_147_483_648, \
        max:2_147_483_647, \
    }, \
    long:{ \
        name:"long", \
        type_tag:4, \
        size:8, \
        min:-9_223_372_036_854_775_808l, \
        max:9_223_372_036_854_775_807l, \
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
        5_040, \
        40_320, \
        362_880, \
        3_628_800, \
        39_916_800, \
        479_001_600, \
    ], \
    long_factorial_lookup:[L; \
        1l, \
        1l, \
        2l, \
        6l, \
        24l, \
        120l, \
        720l, \
        5_040l, \
        40_320l, \
        362_880l, \
        3_628_800l, \
        39_916_800l, \
        479_001_600l, \
        6_227_020_800l, \
        87_178_291_200l, \
        1_307_674_368_000l, \
        20_922_789_888_000l, \
        355_687_428_096_000l, \
        6_402_373_705_728_000l, \
        121_645_100_408_832_000l, \
        2_432_902_008_176_640_000l, \
    ], \
}
