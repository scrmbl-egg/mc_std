# turn current iteration into data for next caption
execute store result storage minecraft:std local_idx int 1 run scoreboard players get $local_i std_local_map

# in:
    # local_array_storage
    # local_array_name
    # local_idx
function std:array/map/internal/get_element with storage minecraft:std
# gives ownership of:
    # local_element

# free local_idx
data remove storage minecraft:std local_idx

# in:
    # local_element
    # local_function_st
function std:array/map/internal/run_function_with_element_st with storage minecraft:std

# free copied array element
data remove storage minecraft:std local_element

# add one to current iteration
scoreboard players add $local_i std_local_map 1

# reiterate if local_i < local_size
execute if score $local_i std_local_map < $local_size std_local_map as @s run function std:array/map/internal/iterate