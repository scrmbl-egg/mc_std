#>std:return_value
#
# A function that returns the input value, and removes/deletes all temporary
# data that the user needs to remove. It is recommended to use this function
# with the `return run` command syntax.
#
# @authors scrmbl-egg
# @input
#   value: int
#       Value that the function is going to return.
#   score_objectives: [#[objective] string]
#       List of score objectives to be deleted.
#   nbt_paths: [struct {storage: #[id="storage"] string, nbt: #[nbt_path=minecraft:storage[[storage]]] string}]
#       List of storage NBT paths to be deleted.
#   entity_selectors: [#[entity] #[selector] string]
#       List of entity selectors that will be killed, along with their
#       passengers.
# @returns
#   Result: the number specified in the `value` parameter.

# save arrays
$data modify storage std:temp return_arrays set value { \
    score_objectives:$(score_objectives), \
    nbt_paths:$(nbt_paths), \
    entity_selectors:$(entity_selectors), \
}

# remove scores
function std:array/foreach { \
    array_storage:"std:temp", \
    array_nbt:"return_arrays.score_objectives", \
    function:"core_std:fail/free_score_objective", \
    function_storage:"std:none", \
    function_storage_nbt:"none", \
    element_macro:"objective", \
    index_macro:"__index__", \
}

# remove nbt/data
function std:array/foreach { \
    array_storage:"std:temp", \
    array_nbt:"return_arrays.nbt_paths", \
    function:"core_std:fail/free_data", \
    function_storage:"std:none", \
    function_storage_nbt:"none", \
    element_macro:"data_location", \
    index_macro:"__index__", \
}

# kill entities
function std:array/foreach { \
    array_storage:"std:temp", \
    array_nbt:"return_arrays.entity_selectors", \
    function:"core_std:fail/kill_entity", \
    function_storage:"std:none", \
    function_storage_nbt:"none", \
    element_macro:"selector", \
    index_macro:"__index__", \
}

# free data
data remove storage std:temp return_arrays

# return value integer.
$return $(value)
