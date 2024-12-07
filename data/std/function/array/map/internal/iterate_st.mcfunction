# storage:
    # local_array_storage
    # local_array_path
    # local_function
    # local_function_storage
    # local_element_path

# turn current iteration into data for next caption
execute store result storage minecraft:std local_idx int 1 run scoreboard players get $local_i std_local_map

# update caller's element path
# in:
    # local_array_storage
    # local_array_path
    # local_idx
function std:array/map/internal/update_element_path_st with storage minecraft:std

# free local_idx
data remove storage minecraft:std local_idx

# in:
    # local_function
    # local_element_path
function std:array/map/internal/run_function_with_element_st with storage minecraft:std

# free copied array element

# TODO: this line must be changed with a macro that references the user's function path
$data remove storage $(local_function_storage) $(local_element_path)

# add one to current iteration
scoreboard players add $local_i std_local_map 1

# reiterate if local_i < local_size
execute if score $local_i std_local_map < $local_size std_local_map run function std:array/map/internal/iterate_st with storage minecraft:std