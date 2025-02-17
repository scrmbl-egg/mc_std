#>core_std:array/map/save_element_in_storage_copy
#
# @authors scrmbl-egg
# @params
    # arr_st
    # arr_path
    # fn
    # fn_st
    # elem_macro
    # current_index
# @generates
    # local_map_func_memory
        # storage_cpy
            # $(elem_macro)

$data modify storage minecraft:std \ 
    local_map_func_memory.storage_cpy.$(elem_macro) \ 
    set from storage $(arr_st) $(arr_path)[$(current_index)]
