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
    function std.core:out/print_error { \
        function:"std:array/int_sum", \
        text:{text:"Path '$(array_nbt)' in storage '$(array_storage)' is not a number array."}, \
    }
execute if score __$std_is_number_array __std.int_sum matches 0 \
    run \
    return run \
    function std:scoreboard/remove_objective_and_fail { \
        objective:"__std.int_sum", \
    }

# if it's a long array, print special error message and fail
$execute if score __$std_is_number_array __std.int_sum matches 3 \
    run \
    function std.core:out/print_error { \
        function:"std:array/int_sum", \
        text:{text:"Path '$(array_nbt)' in storage '$(array_storage)' is a long (64-bit number) array, which is not supported for this function."}, \
    }
execute if score __$std_is_number_array __std.int_sum matches 3 \
    run \
    return run \
    function std:scoreboard/remove_objective_and_fail { \
        objective:"__std.int_sum", \
    }

# set temp data
data modify storage std:temp int_sum set value { \
    remove_data_and_return_value_args:{ \
        value:0, \
        storage:"std:temp", \
        nbt:"int_sum", \
    }, \
}

# init accumulator and last number
scoreboard players set __$std_accum __std.int_sum 0
scoreboard players set __$std_current __std.int_sum 0

# accumulate
$function std:array/for_each { \
    array_storage:"$(array_storage)", \
    array_nbt:"$(array_nbt)", \
    function:"std.core:array/int_sum/accumulate", \
    context_args:{}, \
    element_macro:"number", \
    index_macro:"__index__", \
}

# get result in return value function
execute store result storage \
    std:temp int_sum.remove_data_and_return_value_args.value \
    int 1 \
    run \
    scoreboard players get __$std_accum __std.int_sum

# remove scoreboard
scoreboard objectives remove __std.int_sum

# return value (frees leftover data)
return run \
    function std:storage/remove_data_and_return_value \
    with storage std:temp int_sum.remove_data_and_return_value_args
