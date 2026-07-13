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
    is_array:false, \
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

## assert nbt_path is array
$execute store result storage std:temp pick_random.is_array \
    byte 1 \
    run \
    function std:assert/is_array { \
        array_storage:'$(array_storage)', \
        array_nbt:'$(array_nbt)', \
    }

# print error message and return NOTHING if function fails
$execute if data storage std:temp pick_random{is_array:false} \
    run \
    function std.core:out/print_error { \
        function:"std:array/pick_random", \
        text:{text:"Path '$(array_nbt)' in storage '$(array_storage)' doesn't contain an array or list."}, \
    }
execute if data storage std:temp pick_random{is_array:false} \
    run \
    return run \
    data remove storage std:temp pick_random

## if it's array...
# create local scoreboard
scoreboard objectives add __std.pick_random dummy

# store array size
$execute store result score __$std_arr_size __std.pick_random \
    run \
    data get storage $(array_storage) $(array_nbt)

# store random value, limit from 0 to arr_size (exclusive) and store in
# `get_element_unsafe.source_path` and
# `success_free_data_and_return_args.value`.
execute store result score __$std_random_index __std.pick_random \
    run \
    random value 0..2147483646
scoreboard players operation \
    __$std_random_index __std.pick_random %= __$std_arr_size __std.pick_random
execute store result storage \
    std:temp pick_random.get_element_unsafe_args.source_path \
    int 1 \
    run \
    scoreboard players get __$std_random_index __std.pick_random
execute store result storage \
    std:temp pick_random.success_free_data_and_return_args.value \
    int 1 \
    run \
    scoreboard players get __$std_random_index __std.pick_random

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

# free scoreboard
scoreboard objectives remove __std.pick_random

#>_
# @in
#   pick_random.get_element_unsafe_args
#       value
#       storage
#       nbt
return run function std:storage/remove_data_and_return_value \
    with storage std:temp pick_random.success_free_data_and_return_args
# this function frees leftover data
