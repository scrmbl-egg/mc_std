#>std:assert/is_number_array
#
# Checks if an NBT path is a number array.
#
# NOTE:
# This function may fail even when the specified collection is full of numeric
# elements. This function searches for the initial character that determines
# the type of the number array, not the elements themselves.
#
# NOT DETECTED: [1, 2, 3, 4], [1.2f, 2, 3.0]
# DETECTED: [I; 1, 2], [B; 1b, 2b], [L; 1l, 2l]
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the alleged array or list is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the alleged array or list that is located.
# @returns
#   Result: 0 if it's not a number array, 1 if it's a byte array, 2 if it's an
#       int array, and 3 if it's a long array.

# add local scoreboard
scoreboard objectives add __std.assert_num_array dummy

# first, check if it's an array
$execute store result score __$std_is_array __std.assert_num_array \
    run \
    function std:assert/is_array { \
        array_storage:"$(array_storage)", \
        array_nbt:"$(array_nbt)", \
    }
execute unless score __$std_is_array __std.assert_num_array matches 1 \
    run \
    return run \
    function std:scoreboard/remove_objective_and_fail { \
        objective:"__std.assert_num_array", \
    }

# set up temp data
data modify storage std:temp is_number_array set value { \
    string_from_data_args:{ \
        data:{}, \
        out_storage:"std:temp", \
        out_nbt:"is_number_array.out_string", \
    }, \
    out_string:"", \
    type_char:"", \
}
# copy array to string_from_data_args
$data modify storage std:temp is_number_array.string_from_data_args.data \
    set from storage $(array_storage) $(array_nbt)

# get string
function std:string/from_data \
    with storage std:temp is_number_array.string_from_data_args

# get slice that tells us the type of the array
data modify storage std:temp is_number_array.type_char \
    set string storage std:temp is_number_array.out_string 1 2

# if byte array, return 1
execute if data storage std:temp is_number_array{type_char:"B"} \
    run \
    return run \
    function std:return_value { \
        value:1, \
        objectives:["__std.assert_num_array"], \
        storage_paths:[{storage:"std:temp",nbt:"is_number_array"}], \
        entity_selectors:[], \
    }
execute if data storage std:temp is_number_array{type_char:"I"} \
    run \
    return run \
    function std:return_value { \
        value:2, \
        objectives:["__std.assert_num_array"], \
        storage_paths:[{storage:"std:temp",nbt:"is_number_array"}], \
        entity_selectors:[], \
    }
execute if data storage std:temp is_number_array{type_char:"L"} \
    run \
    return run \
    function std:return_value { \
        value:3, \
        objectives:["__std.assert_num_array"], \
        storage_paths:[{storage:"std:temp",nbt:"is_number_array"}], \
        entity_selectors:[], \
    }

# if nothing happens, free memory and return 0
data remove storage std:temp is_number_array
return 0
