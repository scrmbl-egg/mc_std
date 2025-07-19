#>std:array/pick_random
#
# Picks a random element from a passed array and stores it in the specified
# destination.
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array or list is stored.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array or list is stored.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]]
#       Storage NBT path where the result will be stored.
# @writes
#   A random element from the passed array into the specified location.
# @returns
#   Result: index of the element that was randomly picked.

# create local scoreboard
scoreboard objectives add __std.pick_random dummy

# assert nbt_path is array
$execute store success score __$std_is_array __std.pick_random \
    run \
    function std:assert/is_array { \
        array_storage:'$(array_storage)', \
        array_nbt:'$(array_nbt)', \
    }

# print error message and fail if assertion fails
$execute if score __$std_is_array __std.pick_random matches 0 \
    run \
    function core_std:error/print { \
        function:"std:array/pick_random", \
        text:{text:"Path '$(array_nbt)' in storage '$(array_storage)' doesn't contain an array or list."}, \
    }
execute if score __$std_is_array __std.pick_random matches 0 \
    run \
    return run \
    function std:fail { \
        score_objectives:["__std.pick_random"], \
        nbt_paths:[], \
        entity_selectors:[], \
    }

# store array size
$execute store result score __$std_arr_size __std.pick_random \
    run \
    data get storage $(array_storage) $(array_nbt)

# store random value, limit from 0 to arr_size (exclusive)
execute store result score $random_index __std.pick_random \
    run \
    random value 0..2147483646
scoreboard players operation \
    $random_index __std.pick_random %= __$std_arr_size __std.pick_random

# set function params
$data modify storage std:temp get_element set value { \
    array_storage:'$(array_storage)', \
    array_nbt:'$(array_nbt)', \
    out_storage:'$(out_storage)', \
    out_nbt:'$(out_nbt)', \
}
execute store result storage std:temp get_element.source_path int 1 \
    run scoreboard players get $random_index __std.pick_random

#>_
# @in
#   get_element
#       array_storage
#       array_nbt
#       out_storage
#       out_nbt
#       source_path
function core_std:array/get_element_unsafe with storage std:temp get_element

# set return parameters
data modify storage std:temp return_index set value { \
    score_objectives:["__std.pick_random"], \
    nbt_paths:[ \
        {storage:"std:temp",nbt:"get_element"}, \
        {storage:"std:temp",nbt:"return_index"}, \
    ], \
    entity_selectors:[], \
}
execute store result storage std:temp return_index.value int 1 \
    run scoreboard players get $random_index __std.pick_random

# return index of the obtained
#>_
# @in
#   get_element
#       index
return run function std:return_value with storage std:temp return_index
# this function frees leftover data
