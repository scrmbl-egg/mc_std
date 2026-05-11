#>std:array/for_each_unwrap
#
# Calls a function for each NBT object of a list. Unlike `std:array/for_each`,
# this function "unwraps" each object, i.e. every field of the object becomes
# a macro for the specified callback function.
#
# The callback function receives the following macros (from lower precedence
# to higher precedence):
#
# 1. Macros named after each field of the "context_args" argument.
# 2. A macro whose identifier matches the string specified in the "index_macro"
#    argument.
# 3. Macros named after each field of the current NBT object of the list.
#
# Example:
#
# If we have the following list at custom:storage person_array:
# [{id:999, name:"Jane"}, {id:995, name:"John"}]
#
# If we do the following function call:
#
# ```mcfunction
# function std:array/for_each_unwrap { \
#     array_storage:"custom:storage", \
#     array_nbt:"person_array", \
#     function:"custom:person/go_to_city", \
#     context_args:{city:"Madrid"}, \
#     index_macro:"person_index", \
# }
# ```
# This means the `custom:person/go_to_city` function receives the following
# macros in order (later macros may override previous ones):
#
# 1. $(city) expands to: Madrid (remains every iteration)
# 2. $(person_index) expands to: 0 (current index)
# 3. $(id) expands to: 999 (current id); $(name) expands to: Jane (current name)
#
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array or list that will be iterated through is
#       located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array or list that will be iterated through
#       is located.
#   function: #[id="function"] string
#       Callback function that is going to be called for each element of the
#       array or list.
#   context_args: any
#       NBT structure that contains the arguments passed to every function
#       call.
#   index_macro: string
#       Name of the function macro that will represent the current
#       iteration index.

## NOTE:
# To support recursive calls to this function, local data will be stored in an
# array (or more precisely, a stack) instead of a single temporary structure.
# Score holders must be temporary because if they were kept, they would be
# overriden constantly.

# add local scoreboard (if there is NO elements in the for_each_unwrap_scopes
# array)
execute unless data storage std:temp for_each_unwrap_scopes[0] \
    run \
    scoreboard objectives add __std.for_each_unwrap dummy

# check if location is an array
$execute store result score __$std_is_array __std.for_each_unwrap \
    run \
    function std:assert/is_array { \
        array_storage:"$(array_storage)", \
        array_nbt:"$(array_nbt)", \
    }
$execute if score __$std_is_array __std.for_each_unwrap matches 0 \
    run \
    function core_std:out/print_error { \
        function:"std:array/for_each_unwrap", \
        text:{text:"Path '$(array_nbt)' in storage '$(array_storage)' doesn't contain an array or list."}, \
    }
execute if score __$std_is_array __std.for_each_unwrap matches 0 \
    run \
    return run \
    function std:scoreboard/remove_objective_and_fail { \
        objective:"__std.for_each_unwrap", \
    }

# if length is 0, cancel function
$execute store result score __$std_len __std.for_each_unwrap \
    run \
    data get storage $(array_storage) $(array_nbt)
execute if score __$std_len __std.for_each_unwrap matches 0 \
    run \
    return run \
    function std:scoreboard/remove_objective { \
        objective:"__std.for_each_unwrap", \
    }

## NOTE:
# Iteration number is stored in "get_element_unsafe_args.source_path". That
# data location is the one that keeps track of the actual index.
# set up local data
$data modify storage std:temp for_each_unwrap_scopes append value { \
    array:[], \
    has_next:{}, \
    call_function_args:{ \
        function:"$(function)", \
        args:{}, \
    }, \
    context_args:$(context_args), \
    get_element_unsafe_args:{ \
        array_storage:"std:temp", \
        array_nbt:"for_each_unwrap_scopes[-1].array", \
        out_storage:"std:temp", \
        out_nbt:"for_each_unwrap_scopes[-1].current_element", \
        source_path:0, \
    }, \
    current_element:{}, \
    bind_index_macro_args:{ \
        storage:"std:temp", \
        nbt:"for_each_unwrap_scopes[-1].call_function_args.args", \
        key:"$(index_macro)", \
        value:0, \
    }, \
}
# set array
$data modify storage std:temp for_each_unwrap_scopes[-1].array \
    set from storage $(array_storage) $(array_nbt)

## RECURSION REGION HERE!!
# iterate
function core_std:array/for_each/iterate_last_unwrap_scope
## end of recursion

# free memory (if there are no scopes left)
data remove storage std:temp for_each_unwrap_scopes[-1]
execute unless data storage std:temp for_each_unwrap_scopes[0] \
    run \
    scoreboard objectives remove __std.for_each_unwrap
execute unless data storage std:temp for_each_unwrap_scopes[0] \
    run \
    data remove storage std:temp for_each_unwrap_scopes
