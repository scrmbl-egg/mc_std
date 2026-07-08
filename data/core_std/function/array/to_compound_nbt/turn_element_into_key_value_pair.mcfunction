#>core_std:array/to_compound_nbt/turn_element_to_key_value_pair
#
# Turns an indexed element from an array into a key-value pair.
#
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array or list that will be processed is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array or list that will be processed is
#       located.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
#   index_prefix: string
#       Prefix that is going to be applied to the NBT keys that indicate the
#       original array index. Can be left empty if the user wants the keys
#       to be just the index numbers.
#   element: any
#       Element that is going to be inserted as a value in a new compound NBT
#       key.
#   index: int
#       Current index of the iteration.
# @writes
#   Specified key and value into the specified NBT path.

# setup data
data modify storage std:temp elem_to_key_val_pair set value { \
    is_value_string:false, \
}

$execute store result storage std:temp elem_to_key_val_pair.is_value_string \
    byte 1 \
    run \
    function std:assert/is_string { \
        string_storage:'$(array_storage)', \
        string_nbt:'$(array_nbt)[$(index)]', \
    }

## NOTE:
# wrapper function is neeeded because doing the macro directly may not be
# allowed when the value is a string with spaces

$execute if data storage std:temp elem_to_key_val_pair{is_value_string:false} \
    run \
    function core_std:array/to_compound_nbt/set_value { \
        out_storage:'$(out_storage)', \
        out_nbt:'$(out_nbt).$(index_prefix)$(index)', \
        value:'$(element)', \
    }
# if value is a string, set it by wrapping it in quotes
$execute if data storage std:temp elem_to_key_val_pair{is_value_string:true} \
    run \
    function core_std:array/to_compound_nbt/set_value { \
        out_storage:'$(out_storage)', \
        out_nbt:'$(out_nbt).$(index_prefix)$(index)', \
        value:'\'$(element)\'', \
    }

# free memory
data remove storage std:temp elem_to_key_val_pair
