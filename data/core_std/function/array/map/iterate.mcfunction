#>core_std:array/map/iterate
#
# @authors scrmbl-egg
# @params
    # arr_st
    # arr_path
    # fn
    # fn_st
    # elem_macro
    # storage_cpy

# turn current iteration index into data for next step
execute \
    store result storage std:temp map.current_index \
    int 1 \
    run \
    scoreboard players get $current_iter_index std_local_map

# update caller's element path
#>_
# @in
    # map
        # arr_st
        # arr_path
        # fn
        # fn_st
        # elem_macro
        # storage_cpy
        # current_index
# @generates
    # map
        # storage_cpy
            # $(elem_macro)
function core_std:array/map/save_element_in_storage_copy \
    with storage std:temp map

#>_
# @in
    # map
        # arr_st
        # arr_path
        # fn
        # fn_st
        # elem_macro
        # storage_cpy
            # ... (user storage)
            # $(elem_macro)
function core_std:array/map/run_function_with_element \
    with storage std:temp map

# add one to current iteration index
scoreboard players add $current_iter_index std_local_map 1

# reiterate if current iteration index is less than the array size
execute \
    if score $current_iter_index std_local_map < $arr_size std_local_map \
    run \
    function core_std:array/map/iterate \
    with storage std:temp map
