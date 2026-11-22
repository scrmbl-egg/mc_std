#>std:array/pick_random
#
# Picks a random element from a passed array or list and stores it in the
# specified destination.
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array or list is stored.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array or list is stored.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   A random element from the passed array into the specified location.
# @returns
#   Result: index of the element that was randomly picked.

# setup data
$data modify storage std:temp pick_random set value { \
    type:0, \
    is_array:false, \
    size:0, \
    get_element_unsafe_args:{ \
        array_storage:'$(array_storage)', \
        array_nbt:'$(array_nbt)', \
        out_storage:'$(out_storage)', \
        out_nbt:'$(out_nbt)', \
        source_path:0, \
    }, \
    success_free_data_and_return_args:{ \
        value:0, \
        storage:"std:temp", \
        nbt:"pick_random", \
    }, \
}

$execute store result storage std:temp pick_random.type \
    int 1 \
    run \
    function std:storage/get_type_tag { \
        storage:"$(array_storage)", \
        nbt:"$(array_nbt)", \
    }

execute if predicate { \
    type:"minecraft:int_value_check", \
    test:"std:types/byte/true", \
    value:{ \
        type:"minecraft:number_dispatcher", \
        cases:[ \
            { \
                condition:{ \
                    type:"minecraft:int_value_check", \
                    test:"std:types/list/type_tag", \
                    value:{ \
                        type:"minecraft:storage", \
                        storage:"std:temp", \
                        path:"pick_random.type", \
                    }, \
                }, \
                value:"std:types/byte/true", \
            }, \
            { \
                condition:{ \
                    type:"minecraft:int_value_check", \
                    test:"std:types/byte_array/type_tag", \
                    value:{ \
                        type:"minecraft:storage", \
                        storage:"std:temp", \
                        path:"pick_random.type", \
                    }, \
                }, \
                value:"std:types/byte/true", \
            }, \
            { \
                condition:{ \
                    type:"minecraft:int_value_check", \
                    test:"std:types/int_array/type_tag", \
                    value:{ \
                        type:"minecraft:storage", \
                        storage:"std:temp", \
                        path:"pick_random.type", \
                    }, \
                }, \
                value:"std:types/byte/true", \
            }, \
            { \
                condition:{ \
                    type:"minecraft:int_value_check", \
                    test:"std:types/long_array/type_tag", \
                    value:{ \
                        type:"minecraft:storage", \
                        storage:"std:temp", \
                        path:"pick_random.type", \
                    }, \
                }, \
                value:"std:types/byte/true", \
            }, \
        ], \
        default:"std:types/byte/false", \
    }, \
} \
    run \
    data modify storage std:temp pick_random.is_array set value true

# print error message and return NOTHING if function fails
$execute if data storage std:temp pick_random{is_array:false} \
    run \
    function std.core:out/print_error { \
        function:"std:array/pick_random", \
        text:[ \
            "Path '$(array_nbt)' in storage '$(array_storage)' doesn't ", \
            "contain an array or list.", \
        ], \
    }
execute if data storage std:temp pick_random{is_array:false} \
    run \
    return run \
    function std:storage/remove_data_and_fail { \
        storage:"std:temp", \
        nbt:"pick_random", \
    }

data get storage std:main consts.types.long.max

## if it's array...
# store array size
$execute store result storage std:temp pick_random.size \
    int 1 \
    run \
    data get storage $(array_storage) $(array_nbt)

# get random index and store in necessary
data modify storage std:temp pick_random.get_element_unsafe_args.source_path \
    set compute default integer { \
        type:"minecraft:uniform", \
        min:0, \
        max:{ \
            type:"minecraft:sub", \
            left:{ \
                type:"minecraft:storage", \
                storage:"std:temp", \
                path:"pick_random.size", \
            }, \
            right:1, \
        }, \
    }
data modify storage \
    std:temp pick_random.success_free_data_and_return_args.value \
    set from storage \
    std:temp pick_random.get_element_unsafe_args.source_path

#>_
# @in
#   pick_random.get_element_unsafe_args
#       array_storage
#       array_nbt
#       out_storage
#       out_nbt
#       source_path
function std:array/get_element_unsafe \
    with storage std:temp pick_random.get_element_unsafe_args

#>_
# @in
#   pick_random.get_element_unsafe_args
#       value
#       storage
#       nbt
return run function std:storage/remove_data_and_return_value \
    with storage std:temp pick_random.success_free_data_and_return_args
# this function frees leftover data
