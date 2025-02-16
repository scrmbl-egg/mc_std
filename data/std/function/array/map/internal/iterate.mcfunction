# params:
    # arr_st
    # arr_path
    # fn
    # fn_st
    # elem_macro
    # storage_cpy

# turn current iteration into data for next caption
execute \
    store result storage minecraft:std local_map_func_memory.current_index \
    int 1 \
    run \
    scoreboard players get $current_iter_index std_local_map
\

# update caller's element path
# in:
    # local_map_func_memory
        # arr_st
        # arr_path
        # fn
        # fn_st
        # elem_macro
        # storage_cpy
        # current_index
# generates:
    # local_map_func_memory
        # storage_cpy
            # $(elem_macro)
function std:array/map/internal/save_element_in_storage_copy \
    with storage minecraft:std local_map_func_memory
\

# in:
    # local_map_func_memory
        # arr_st
        # arr_path
        # fn
        # fn_st
        # elem_macro
        # storage_cpy
            # ... (user storage)
            # $(elem_macro)
function std:array/map/internal/run_function_with_element \
    with storage minecraft:std local_map_func_memory
\

# add one to current iteration index
scoreboard players add $current_iter_index std_local_map 1

# reiterate if current iteration index is less than the array size
execute \
    if score $current_iter_index std_local_map < $arr_size std_local_map \ 
    run \
    function std:array/map/internal/iterate \
    with storage minecraft:std local_map_func_memory
