#>core_std:array/foreach/iterate
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

# turn current iteration index into data for next step
execute store result storage \
    std:temp foreach.current_index int 1 \
    run \
    scoreboard players get __$std_current_iter_index __std.foreach

# update caller's element path
#>_
# @in
#   foreach
#       arr
#       func
#       func_st
#       func_st_nbt
#       elem_macro
#       storage_cpy
#           ... (user storage)
#       current_index
# @out
#   foreach
#       storage_cpy
#           $(elem_macro)
#           $(idx_macro)
function core_std:array/foreach/bind_storage_copy with storage std:temp foreach

#>_
# @in
#   foreach
#       arr
#       func
#       func_st
#       func_st_nbt
#       elem_macro
#       idx_macro
#       storage_cpy
#           ... (user storage)
#           $(elem_macro)
#           $(idx_macro)
function core_std:array/foreach/run_function_with_element \
    with storage std:temp foreach

# add one to current iteration index
scoreboard players add __$std_current_iter_index __std.foreach 1

# reiterate if current iteration index is less than the array size
execute \
    if score __$std_current_iter_index __std.foreach < __$std_arr_size __std.foreach \
    run \
    function core_std:array/foreach/iterate with storage std:temp foreach
