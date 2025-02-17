#>std:array/map
# Executes a function for each element of an array, binding a custom macro as
# a parameter for said function.
#
# @authors scrmbl-egg
# @params
    # arr_st        -- Array storage.
    # arr_path      -- Array path.
    # fn            -- Function that will be executed for each element of the
    #                  array.
    # fn_st         -- Storage that the 'fn' function will use.
    # elem_macro    -- Macro that the 'fn' function will use as the current 
    #                  element in the array.

# assertions
$execute \
    unless \
    data storage $(arr_st) $(arr_path) \
    run \
    return run \ 
    function std:error/print \
    {fn:"std:array/map/run",msg:"Path '$(arr_path)' in storage '$(arr_st)' doesn't contain data."}
\

# create local scoreboard
scoreboard objectives add std_local_map dummy

# save the parameters as local
$data modify storage minecraft:std local_map_func_memory.arr_st set value '$(arr_st)'
$data modify storage minecraft:std local_map_func_memory.arr_path set value '$(arr_path)'
$data modify storage minecraft:std local_map_func_memory.fn set value '$(fn)'
$data modify storage minecraft:std local_map_func_memory.elem_macro set value '$(elem_macro)'

# create copy of storage, so that the macro can be added later.
$data modify storage minecraft:std local_map_func_memory.storage_cpy set from storage $(fn_st)

# init current index to 0
scoreboard players set $current_iter_index std_local_map 0

# save array size in $arr_size scoreholder
$execute store result score $arr_size std_local_map \
    run data get storage $(arr_st) $(arr_path)

# execute recursive function
#
# "execute if/unless entity" detects whether or not an entity is running
# this command. This is so that, if there's no entity running this command, the
# server will take care of it.
#> 
# @in
    # local_map_func_memory
        # arr_st
        # arr_path
        # fn
        # fn_st
        # elem_macro
        # storage_cpy
execute \
    if entity @s \
    run \
    function core_std:array/map/iterate \ 
    with storage minecraft:std local_map_func_memory
execute \
    unless entity @s \ 
    run \
    function core_std:array/map/iterate \ 
    with storage minecraft:std local_map_func_memory
\

# free memory
scoreboard objectives remove std_local_map
data remove storage minecraft:std local_map_func_memory
