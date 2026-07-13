#>std:math/long_factorial
#
# Returns the factorial of a positive integer, i.e. the product of all positive
# integers less than or equal to the passed positive integer.
#
# This function writes a `long`, which can hold big factorials, however,
# bigger factorials than those obtained with `std:math/int_factorial` can't
# be contained within scores, and thus, don't allow operations.
#
# NOTE:
# For an unsafe, but performant way to obtain a big factorial if the number is
# already a known positive integer, do the following command:
#
# ```mcfunction
# # we already know we want the 15th factorial
# data modify storage custom:storage 15th_factorial \
#     set from consts.math.long_factorial_lookup[15]
# ```
#
# @input
#   x: int
#       Value whose factorial is going to be calculated. Value will be
#       internally rounded.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.

# set up local data
$data modify storage std:temp long_factorial set value { \
    x:$(x), \
    get_element_unsafe_args:{ \
        array_storage:"std:main", \
        array_nbt:"consts.math.long_factorial_lookup", \
        out_storage:"$(out_storage)", \
        out_nbt:"$(out_nbt)", \
        source_path:$(x), \
    }, \
}

# truncate value for lookup
execute store result storage \
    std:temp long_factorial.get_element_unsafe_args.source_path \
    int 1 \
    run \
    data get storage \
    std:temp long_factorial.get_element_unsafe_args.source_path 1

# check if value is negative
execute if predicate { \
    condition:"minecraft:value_check", \
    range:{ \
        min:{ \
            type:"minecraft:storage", \
            storage:"std:main", \
            path:"consts.types.long.min", \
        }, \
        max:-1, \
    }, \
    value:{ \
        type:"minecraft:storage", \
        storage:"std:temp", \
        path:"long_factorial.get_element_unsafe_args.source_path", \
    }, \
} \
    run \
    function std.core:out/print_error { \
        function:"std:math/long_factorial", \
        text:[ \
            "Can't get the factorial of a negative number ('x'=", \
            { \
                storage:"std:temp", \
                nbt:"long_factorial.x", \
            }, \
            ",floor=", \
            { \
                storage:"std:temp", \
                nbt:"long_factorial.get_element_unsafe_args.source_path", \
            }, \
            ").", \
        ], \
    }
# TODO: If a gamma function is ever implemented, specify that it exists in
# this error.

# check if value exceeds array length
execute if predicate { \
    condition:"minecraft:value_check", \
    range:{ \
        min:21, \
        max:{ \
            type:"minecraft:storage", \
            storage:"std:main", \
            path:"consts.types.int.max", \
        }, \
    }, \
    value:{ \
        type:"minecraft:storage", \
        storage:"std:temp", \
        path:"long_factorial.get_element_unsafe_args.source_path", \
    }, \
} \
    run \
    function std.core:out/print_error { \
        function:"std:math/long_factorial", \
        text:[ \
            "The factorial of ", \
            { \
                storage:"std:temp", \
                nbt:"long_factorial.get_element_unsafe_args.source_path", \
            }, \
            " exceeds the max value a ", \
            {text:"long",color:"#3ad8cb"}, \
            " can hold (", \
            {storage:"std:main",nbt:"consts.types.long.max"}, \
            ").", \
        ], \
    }

# if any of the errors happened, free data and return fail
execute if predicate { \
    condition:"minecraft:any_of", \
    terms:[ \
        { \
            condition:"minecraft:value_check", \
            range:{ \
                min:{ \
                    type:"minecraft:storage", \
                    storage:"std:main", \
                    path:"consts.types.int.min", \
                }, \
                max:-1, \
            }, \
            value:{ \
                type:"minecraft:storage", \
                storage:"std:temp", \
                path:"long_factorial.get_element_unsafe_args.source_path", \
            }, \
        }, \
        { \
            condition:"minecraft:value_check", \
            range:{ \
                min:21, \
                max:{ \
                    type:"minecraft:storage", \
                    storage:"std:main", \
                    path:"consts.types.int.max", \
                }, \
            }, \
            value:{ \
                type:"minecraft:storage", \
                storage:"std:temp", \
                path:"long_factorial.get_element_unsafe_args.source_path", \
            }, \
        }, \
    ], \
} \
    run \
    return run \
    function std:storage/remove_data_and_fail { \
        storage:"std:temp", \
        nbt:"long_factorial", \
    }

# all went correct by this point, get the damn factorial
function std:array/get_element_unsafe \
    with storage std:temp long_factorial.get_element_unsafe_args

# free memory
data remove storage std:temp long_factorial
