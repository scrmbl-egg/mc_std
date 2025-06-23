#>core_std:array/map/run_function_with_element
#
# @authors scrmbl-egg
# @params
    # map
        # arr_st
        # arr_path
        # fn
        # fn_st
        # elem_macro
        # storage_cpy
            # ... (user storage)
            # $(elem_macro)

# run function with 'fn_st' storage copy as the parameters.
$function $(fn) with storage std:temp map.storage_cpy
