#>std:math/int_factorial
#
# Returns the factorial of a positive integer, i.e. the product of all positive
# integers less than or equal to the passed positive integer. The function will
# print an error if the passed argument would give a result out of the bounds
# of the `int` range.
#
# This function has no output parameters and just returns the result instead of
# writing it to a storage, however, it means that the result can only be of
# type `int`. Use `std:math/long_factorial` for getting the result as a `long`,
# in exchange of having to specify output parameters.
#
# NOTE:
# For an unsafe, but performant way to obtain a factorial if the number is
# already a known positive integer, do the following command:
#
# ```mcfunction
# # we already know we want the 10th factorial
# data get storage std:main consts.math.int_factorial_lookup[10]
# ```
#
# @input
#   x: int
#       Value whose factorial is going to be calculated. Value will be
#       internally rounded.

# set up local data
$data modify storage std:temp int_factorial set value { \
    x:$(x), \
    get_element_unsafe_args:{ \
        array_storage:"std:main", \
        array_nbt:"consts.math.int_factorial_lookup", \
        out_storage:"std:temp", \
        out_nbt:"int_factorial.remove_data_and_return_value_args.value", \
        source_path:$(x), \
    }, \
    remove_data_and_return_value_args:{ \
        value:1, \
        storage:"std:temp", \
        nbt:"int_factorial", \
    }, \
}

# truncate value for lookup
execute store result storage \
    std:temp int_factorial.get_element_unsafe_args.source_path \
    int 1 \
    run \
    data get storage \
    std:temp int_factorial.get_element_unsafe_args.source_path 1

# check if value is negative
execute if predicate { \
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
        path:"int_factorial.get_element_unsafe_args.source_path", \
    }, \
} \
    run \
    function std.core:out/print_error { \
        function:"std:math/int_factorial", \
        text:[ \
            "Can't get the factorial of a negative number ('x'=", \
            { \
                storage:"std:temp", \
                nbt:"int_factorial.x", \
            }, \
            ",floor=", \
            { \
                storage:"std:temp", \
                nbt:"int_factorial.get_element_unsafe_args.source_path", \
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
        min:13, \
        max:{ \
            type:"minecraft:storage", \
            storage:"std:main", \
            path:"consts.types.int.max", \
        }, \
    }, \
    value:{ \
        type:"minecraft:storage", \
        storage:"std:temp", \
        path:"int_factorial.get_element_unsafe_args.source_path", \
    }, \
} \
    run \
    function std.core:out/print_error { \
        function:"std:math/int_factorial", \
        text:[ \
            "The factorial of ", \
            { \
                storage:"std:temp", \
                nbt:"int_factorial.get_element_unsafe_args.source_path", \
            }, \
            " exceeds the max value an ", \
            {text:"int",color:"#3ad8cb"}, \
            " can hold (", \
            {storage:"std:main",nbt:"consts.types.int.max"}, \
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
                path:"int_factorial.get_element_unsafe_args.source_path", \
            }, \
        }, \
        { \
            condition:"minecraft:value_check", \
            range:{ \
                min:13, \
                max:{ \
                    type:"minecraft:storage", \
                    storage:"std:main", \
                    path:"consts.types.int.max", \
                }, \
            }, \
            value:{ \
                type:"minecraft:storage", \
                storage:"std:temp", \
                path:"int_factorial.get_element_unsafe_args.source_path", \
            }, \
        }, \
    ], \
} \
    run \
    return run \
    function std:storage/remove_data_and_fail { \
        storage:"std:temp", \
        nbt:"int_factorial", \
    }

# all went correct by this point, get the damn factorial
function std:array/get_element_unsafe \
    with storage std:temp int_factorial.get_element_unsafe_args

# free memory and return values
return run \
    function std:storage/remove_data_and_return_value \
    with storage std:temp int_factorial.remove_data_and_return_value_args
