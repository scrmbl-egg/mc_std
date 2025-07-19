#>core_std:array/foreach/bind_storage_copy
#
# @authors scrmbl-egg
# @input
#   arr: [any]
#   func: #[id="function"] string
#   func_st: (#[id="storage"] string | "std:none")
#   func_st_nbt: (#[nbt_path=minecraft:storage[[func_st]]] string | "none")
#   elem_macro: string
#   idx_macro: string
#   current_index: int
# @writes
#   std:temp foreach
#       storage_cpy: any
#           $(elem_macro): any
#           $(idx_macro): int

# bind element
$data modify storage std:temp foreach.storage_cpy.$(elem_macro) \
    set from storage std:temp foreach.arr[$(current_index)]

# bind index
$data modify storage std:temp foreach.storage_cpy.$(idx_macro) \
    set value $(current_index)
