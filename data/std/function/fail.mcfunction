#>std:fail
#
# A function that always fails, and removes/deletes all temporary data that
# the user needs to remove.
#
# @authors scrmbl-egg
# @input
#   objectives: [#[objective] string]
#       List of score objectives to be deleted.
#   storage_paths: [
#       struct {
#           storage: #[id="storage"] string,
#           nbt: #[nbt_path=minecraft:storage[[storage]]] string,
#       }
#   ]
#       List of storage NBT paths to be deleted.
#   entity_selectors: [#[entity] #[selector] string]
#       List of entity selectors that will be killed, along with their
#       passengers.
# @returns
#   Success: never, this is so that the failure can be propagated.

# save arrays
$data modify storage std:temp fail_arrays set value { \
    objectives:$(objectives), \
    storage_paths:$(storage_paths), \
    entity_selectors:$(entity_selectors), \
}

# remove scores
function std:array/for_each { \
    array_storage:"std:temp", \
    array_nbt:"fail_arrays.objectives", \
    function:"std:scoreboard/remove_objective", \
    context_args:{}, \
    element_macro:"objective", \
    index_macro:"__index__", \
}

# remove storage
function std:array/for_each_unwrap { \
    array_storage:"std:temp", \
    array_nbt:"fail_arrays.storage_paths", \
    function:"std:storage/remove_data_and_return_value", \
    context_args:{ \
        value:0, \
    }, \
    index_macro:"__index__", \
}

# kill entities
function std:array/for_each { \
    array_storage:"std:temp", \
    array_nbt:"fail_arrays.entity_selectors", \
    function:"std:entity/kill_selector", \
    context_args:{}, \
    element_macro:"selector", \
    index_macro:"__index__", \
}

# free data
data remove storage std:temp fail_arrays

# return fail to propagate error.
return fail
