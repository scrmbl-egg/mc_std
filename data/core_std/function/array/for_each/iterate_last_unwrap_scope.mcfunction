#>core_std:array/for_each_unwrap/iterate_last_scope
#
# Increments the current iteration of `std:array/for_each_unwrap`'s latest
# scope, calls the function, and attempts to do the next recursive call.
#
# @authors scrmbl-egg

## bind user macros to the std:function/call arguments
# empty the args
data modify storage \
    std:temp for_each_unwrap_scopes[-1].call_function_args.args \
    set value {}
# attempt to merge context args
data modify storage \
    std:temp for_each_unwrap_scopes[-1].call_function_args.args \
    merge from storage std:temp for_each_unwrap_scopes[-1].context_args
# bind context args
data modify storage \
    std:temp for_each_unwrap_scopes[-1].call_function_args.args \
    set from storage std:temp for_each_unwrap_scopes[-1].context_args
# bind index
function core_std:array/for_each/bind_macro \
    with storage std:temp for_each_unwrap_scopes[-1].bind_index_macro_args
# merge element
function std:array/get_element_unsafe \
    with storage std:temp for_each_unwrap_scopes[-1].get_element_unsafe_args
data modify storage \
    std:temp for_each_unwrap_scopes[-1].call_function_args.args \
    merge from storage std:temp for_each_unwrap_scopes[-1].current_element

## call function!
function std:function/call \
    with storage std:temp for_each_unwrap_scopes[-1].call_function_args

## increment iteration (stored in "get_element_unsafe_args.source_path")
execute store result score __$std_iter __std.for_each_unwrap \
    run \
    data get storage \
    std:temp for_each_unwrap_scopes[-1].get_element_unsafe_args.source_path
scoreboard players add __$std_iter __std.for_each_unwrap 1
execute store result storage \
    std:temp for_each_unwrap_scopes[-1].get_element_unsafe_args.source_path \
    int 1 \
    run \
    scoreboard players get __$std_iter __std.for_each_unwrap

# must also update it in "bind_index_macro_args.value"
execute store result storage \
    std:temp for_each_unwrap_scopes[-1].bind_index_macro_args.value \
    int 1 \
    run \
    scoreboard players get __$std_iter __std.for_each_unwrap

## check if there is a next element to iterate through
# get length of the array
execute store result score __$std_len __std.for_each_unwrap \
    run \
    data get storage std:temp for_each_unwrap_scopes[-1].array

# change "has_next" flag based on if iteration should continue
execute if score \
    __$std_iter __std.for_each_unwrap < __$std_len __std.for_each_unwrap \
    run \
    data modify storage std:temp for_each_unwrap_scopes[-1].has_next \
    set value {}
execute unless score \
    __$std_iter __std.for_each_unwrap < __$std_len __std.for_each_unwrap \
    run \
    data remove storage std:temp for_each_unwrap_scopes[-1].has_next
scoreboard players reset __$std_iter __std.for_each_unwrap
scoreboard players reset __$std_len __std.for_each_unwrap

## do the next recursion if "has_next" is true
execute if data storage std:temp for_each_unwrap_scopes[-1].has_next \
    run \
    function core_std:array/for_each/iterate_last_unwrap_scope
