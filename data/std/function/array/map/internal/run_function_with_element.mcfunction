#>std:array/map/internal/run_function_with_element
#
# @authors scrmbl-egg
# @params
    # local_map_func_memory
        # arr_st
        # arr_path
        # fn
        # fn_st
        # elem_macro
        # storage_cpy
            # ... (user storage)
            # $(elem_macro)

# run function with 'fn_st' storage copy as the parameters.
$function $(fn) with storage minecraft:std local_map_func_memory.storage_cpy
