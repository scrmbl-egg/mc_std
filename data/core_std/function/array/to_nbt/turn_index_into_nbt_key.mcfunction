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

$execute store success score __$std_is_key_data_string __std.to_nbt \
    run \
    function std:assert/is_string { \
        string_storage:'$(array_storage)', \
        string_nbt:'$(array_nbt)[$(index)]', \
    }

$execute if score __$std_is_key_data_string __std.to_nbt matches 0 \
    run \
    function core_std:array/to_nbt/set_value { \
        out_storage:'$(out_storage)', \
        out_nbt:'$(out_nbt).$(index_prefix)$(index)', \
        value:'$(element)', \
    }

$execute if score __$std_is_key_data_string __std.to_nbt matches 1 \
    run \
    function core_std:array/to_nbt/set_value { \
        out_storage:'$(out_storage)', \
        out_nbt:'$(out_nbt).$(index_prefix)$(index)', \
        value:'\'$(element)\'', \
    }
