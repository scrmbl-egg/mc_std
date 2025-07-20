#>std:array/get_element
#
# Gets an element of an array or list.
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array or list is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array or list is located.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
#   source_path: (any | int)
#       Source NBT. Can be a structure to query data, or an integer to specify
#       the array or list index.
# @writes
#   Array or list element at specified destination.

# create local scoreboard
scoreboard objectives add __std.get_element dummy

# assert nbt_path is an array or list
$execute store success score __$std_is_array __std.get_element \
    run \
    function std:assert/is_array { \
        array_storage:'$(array_storage)', \
        array_nbt:'$(array_nbt)', \
    }

# print error message if assertion fails
$execute if score __$std_is_array __std.get_element matches 0 \
    run \
    function core_std:error/print { \
        function:"std:array/get_element", \
        text:{text:"Path '$(array_nbt)' in storage '$(array_storage)' doesn't contain an array or list."}, \
    }
execute if score __$std_is_array __std.get_element matches 0 \
    run \
    return run \
    function std:fail { \
        score_objectives:["__std.get_element"], \
        nbt_paths:[], \
        entity_selectors:[], \
    }

$data modify storage $(out_storage) $(out_nbt) \
    set from storage $(array_storage) $(array_nbt)[$(source_path)]

# free memory
scoreboard objectives remove __std.get_element

# return 1 for success
return 1
