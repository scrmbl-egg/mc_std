# doc:
#
# Executes a function for each element of an array, binding a custom macro as
# a parameter for said function.
#
# params:
    # arr_st        -- Array storage.
    # arr_path      -- Array path.
    # fn            -- Function that will be executed for each element of the
    #                  array.
    # fn_st         -- Storage that the 'fn' function will use.
    # elem_macro    -- Macro that the 'fn' function will use as the current 
    #                  element in the array.

# assertions
$execute unless data storage $(arr_st) $(arr_path) run return run function std:error/print {fn:"std:array/map/run",msg:"Path '$(arr_path)' in storage '$(arr_st)' doesn't contain data."}

scoreboard objectives add std_local_map dummy

# save the parameters as local
$data modify storage minecraft:std local_array_storage set value '$(arr_st)'
$data modify storage minecraft:std local_array_path set value '$(arr_path)'
$data modify storage minecraft:std local_function set value '$(fn)'
$data modify storage minecraft:std local_function_storage set value '$(fn_st)'
$data modify storage minecraft:std local_element_path set value '$(elem_macro)'

# obtain size from referenced array
scoreboard players set $local_i std_local_map 0
$execute store result score $local_size std_local_map run data get storage $(arr_st) $(arr_path)

# NOTE: "execute if/unless entity" detects whether or not an entity is running
# this command. This is so that, if there's no entity running this command, the
# server will take care of it.
  
# execute recursive function
# in:
    # local_score_objective
    # local_score_holder
    # local_command
execute if entity @s run function std:array/map/internal/iterate_st with storage minecraft:std
execute unless entity @s run function std:array/map/internal/iterate_st with storage minecraft:std

# free memory
scoreboard objectives remove std_local_map
data remove storage minecraft:std local_array_storage
data remove storage minecraft:std local_array_path
data remove storage minecraft:std local_function
data remove storage minecraft:std local_function_storage
data remove storage minecraft:std local_element_path