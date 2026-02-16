#>core_std:array/to_nbt/turn_index_into_nbt_key
#
# @input
#   array_storage: #[id="storage"] string
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#   out_storage: #[id="storage"] string
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#   index_prefix: string
#   element: any
#   index: int
# @writes
#   Specified key and value into the specified NBT path.

# setup data
data modify storage std:temp index_to_nbt_key set value { \
    is_value_string:false, \
}

$execute store result storage std:temp index_to_nbt_key.is_value_string \
    byte 1 \
    run \
    function std:assert/is_string { \
        string_storage:'$(array_storage)', \
        string_nbt:'$(array_nbt)[$(index)]', \
    }

$execute if data storage std:temp index_to_nbt_key{is_value_string:false} \
    run \
    function core_std:array/to_nbt/set_value { \
        out_storage:'$(out_storage)', \
        out_nbt:'$(out_nbt).$(index_prefix)$(index)', \
        value:'$(element)', \
    }

$execute if data storage std:temp index_to_nbt_key{is_value_string:true} \
    run \
    function core_std:array/to_nbt/set_value { \
        out_storage:'$(out_storage)', \
        out_nbt:'$(out_nbt).$(index_prefix)$(index)', \
        value:'\'$(element)\'', \
    }

# free memory
data remove storage std:temp index_to_nbt_key
