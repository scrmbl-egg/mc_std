#>std:array/to_nbt
#
# Converts an array or list into an NBT component whose keys match the indeces
# of the original array or list.
#
# Examples:
# [1.]
# - Array: [L; 22l, 4l, 55l]
# - std:array/to_nbt {...index_prefix:""}
# - Output: {0:22l,1:4l,2:55l}
# [2.]
# - List: ["hello", "beautiful", "world!"]
# - std:array/to_nbt {...index_prefix:"index_"}
# - Output: {index_0:"hello",index_1:"beautiful",index_2:"world!"}
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array that will be processed is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array that will be processed is located.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
#   index_prefix: string
#       Prefix that is going to be applied to the NBT keys that indicate the
#       original array index. Can be left empty if the keys are
# @writes
#   The constructed NBT component in the specified location.

# create local scoreboard
scoreboard objectives add __std.to_nbt dummy

# assert nbt_path is an array or list
$execute store success score __$std_is_array __std.to_nbt \
    run \
    function std:assert/is_array { \
        array_storage:'$(array_storage)', \
        array_nbt:'$(array_nbt)', \
    }

$execute if score __$std_is_array __std.to_nbt matches 0 \
    run \
    function core_std:error/print { \
        function:"std:array/to_nbt", \
        text:"\"Path '$(array_nbt)' in storage '$(array_storage)' doesn't contain an array or list.\"", \
    }

execute if score __$std_is_array __std.to_nbt matches 0 \
    run \
    return run \
    function std:fail { \
        score_objectives:["__std.to_nbt"], \
        nbt_paths:[], \
        entity_selectors:[], \
    }

# save foreach function storage (with array storage and nbt context)
$data modify storage std:temp to_nbt.array_storage set value '$(array_storage)'
$data modify storage std:temp to_nbt.array_nbt set value '$(array_nbt)'
$data modify storage std:temp to_nbt.out_storage set value '$(out_storage)'
$data modify storage std:temp to_nbt.out_nbt set value '$(out_nbt)'
$data modify storage std:temp to_nbt.index_prefix set value '$(index_prefix)'

# for each element, add to
$function std:array/foreach { \
    array_storage:'$(array_storage)', \
    array_nbt:'$(array_nbt)', \
    function:"core_std:array/to_nbt/turn_index_into_nbt_key", \
    function_storage:"std:temp", \
    function_storage_nbt:"to_nbt", \
    element_macro:"element", \
    index_macro:"index", \
}

# free memory
scoreboard objectives remove __std.to_nbt
data remove storage std:temp to_nbt
