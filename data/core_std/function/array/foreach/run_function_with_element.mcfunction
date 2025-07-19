#>core_std:array/foreach/run_function_with_element
#
# @authors scrmbl-egg
# @input
#   arr: [any]
#   func: #[id="function"] string
#   func_st: (#[id="storage"] string | "std:none")
#   func_st_nbt: (#[nbt_path=minecraft:storage[[func_st]]] string | "none")
#   elem_macro: string
#   idx_macro: string
#   storage_cpy: any
#       ... (user storage)
#       $(elem_macro)
#       $(idx_macro)

# run function with 'function_storage' copy as the parameters.
$function $(func) with storage std:temp foreach.storage_cpy
