#>std:array/pick_random
# Picks a random element from a passed array and stores it in the specified
# destination.
#
# @authors scrmbl-egg
# @params
    # arr_st    -- Storage where the array is stored.
    # arr_path  -- NBT path where the array is stored.
    # dest_st   -- Destination storage where the result will be stored.
    # dest_path -- NBT path where the result will be stored.
# @generates
    # A random element from the passed array into the specified location.
# @returns
    # Result: Index of the element that was randomly picked.

# assertions
$execute unless data storage $(arr_st) $(arr_path) \
    run return run \
    function std:error/print { \
        fn:"std:array/pick_random", \
        msg:"Path '$(arr_path)' in storage '$(arr_st)' doesn't contain data." \
        }

$execute unless data storage $(arr_st) $(arr_path)[0] \
    run return run \
    function std:error/print { \
        fn:"std:array/pick_random", \
        msg:"Path '$(arr_path)' in storage '$(arr_st)' doesn't contain elements or is not an array." \
        }

# create local scoreboard
scoreboard objectives add std_local_pick_random dummy

# store 1, useful for later
scoreboard players set $one std_local_pick_random 1

# store array size
$execute store result \
    score $arr_size std_local_pick_random run \
    data get storage $(arr_st) $(arr_path)

# store random value, limit from 0 to (arr_size - 1)
execute store result \
    score $random_index std_local_pick_random run random value 0..2147483646
scoreboard players operation \
    $arr_size std_local_pick_random -= $one std_local_pick_random
scoreboard players operation \
    $random_index std_local_pick_random %= $arr_size std_local_pick_random

# set function params
execute store result \
    storage std:temp get_at_index_params.idx int 1 \
    run scoreboard players get $random_index std_local_pick_random
$data modify storage std:temp get_at_index_params.arr_st \
    set value '$(arr_st)'
$data modify storage std:temp get_at_index_params.arr_path \
    set value '$(arr_path)'
$data modify storage std:temp get_at_index_params.dest_st \
    set value '$(dest_st)'
$data modify storage std:temp get_at_index_params.dest_path \
    set value '$(dest_path)'

#>_
# @in:
    # get_at_index_params
        # arr_st
        # arr_path
        # dest_st
        # dest_path
        # idx
function core_std:array/get_at_index \
    with storage std:temp get_at_index_params

# free data
data remove storage std:temp get_at_index_params
scoreboard objectives remove std_local_pick_random
