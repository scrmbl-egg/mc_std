# params
    # arr_st        (array storage)
    # arr_data      (array data)
    # function_st   (this function must have an $(local_element) param/macro)

scoreboard objectives add local_std_map dummy

# save the parameters as local
$data modify storage minecraft:std local_array_storage set value "$(arr_st)"
$data modify storage minecraft:std local_array_name set value "$(arr_data)"
$data modify storage minecraft:std local_function_st set value "$(function_st)"

# obtain size from referenced array
scoreboard players set $local_i local_std_map 0
$execute store result score $local_size local_std_map run data get storage $(arr_st) $(arr_data)

# execute recursive function
execute as @s run function std:array/map/internal/iterate

# free memory
scoreboard objectives remove local_std_map
data remove storage minecraft:std local_array_storage
data remove storage minecraft:std local_array_name
data remove storage minecraft:std local_function_st