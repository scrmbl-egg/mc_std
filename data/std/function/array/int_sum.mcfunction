#>std:array/int_sum
#
# Sums all elements of an int array.
#
# NOTE:
# This function also works with byte arrays, however, it doesn't allow long
# arrays since 64-bit number operations are not supported in Minecraft.
#
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array that will be iterated through is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array that will be iterated through is
#       located.
# @returns
#   Result: sum of the elements of the number array.

# add local scoreboard
scoreboard objectives add __std.int_sum dummy

# check if specified array is a number array
$execute store result score __$std_is_number_array __std.int_sum \
    run \
    function std:assert/is_number_array { \
        array_storage:"$(array_storage)", \
        array_nbt:"$(array_nbt)", \
    }

# if it's not a number array, send error message and fail
$execute if score __$std_is_number_array __std.int_sum matches 0 \
    run \
    function core_std:out/print_error { \
        function:"std:array/int_sum", \
        text:{text:"Path '$(array_nbt)' in storage '$(array_storage)' is not a number array."}, \
    }
execute if score __$std_is_number_array __std.int_sum matches 0 \
    run \
    return run \
    function std:fail { \
        score_objectives:["__std.int_sum"], \
        nbt_paths:[], \
        entity_selectors:[], \
    }

# if it's a long array, print special error message and fail
$execute if score __$std_is_number_array __std.int_sum matches 3 \
    run \
    function core_std:out/print_error { \
        function:"std:array/int_sum", \
        text:{text:"Path '$(array_nbt)' in storage '$(array_storage)' is a long (64-bit number) array, which is not supported for this function."}, \
    }
execute if score __$std_is_number_array __std.int_sum matches 3 \
    run \
    return run \
    function std:fail { \
        score_objectives:["__std.int_sum"], \
        nbt_paths:[], \
        entity_selectors:[], \
    }

# set temp data
data modify storage std:temp int_sum set value { \
    return_value_args:{ \
        value:0, \
        score_objectives:["__std.int_sum"], \
        nbt_paths:[{storage:"std:temp",nbt:"int_sum"}], \
        entity_selectors:[], \
    }, \
}

# init accumulator and last number
scoreboard players set __$std_accum __std.int_sum 0
scoreboard players set __$std_current __std.int_sum 0

# accumulate
$function std:array/foreach { \
    array_storage:"$(array_storage)", \
    array_nbt:"$(array_nbt)", \
    function:"core_std:array/int_sum/accumulate", \
    function_storage:"std:none", \
    function_storage_nbt:"none", \
    element_macro:"number", \
    index_macro:"__index__", \
}

# get result in return value function
execute store result storage std:temp int_sum.return_value_args.value \
    int 1 \
    run \
    scoreboard players get __$std_accum __std.int_sum

# run return_value (frees leftover data)
return run \
    function std:return_value \
    with storage std:temp int_sum.return_value_args
