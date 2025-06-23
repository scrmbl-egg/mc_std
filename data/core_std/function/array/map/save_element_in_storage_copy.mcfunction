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
    # map
        # storage_cpy
            # $(elem_macro)

$data modify storage std:temp \
    map.storage_cpy.$(elem_macro) \
    set from storage $(arr_st) $(arr_path)[$(current_index)]
