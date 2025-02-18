#>std:ray/cast
# Casts a ray by passing a ray_params_snbt object. ray_params_snbt is the name
# of a data structure defined with SNBT that represents the parameters
# of this function. It was created for easy modification in the case of
# modifying its properties during any raycasting steps.
#
# @params
    # params_st     -- ray_params_snbt object storage.
    # params_path   -- ray_params_snbt object path.

# object assertions
function core_std:ray/error/assert_obj_structure \
    {fn:"std:ray/cast",params_st:"$(params_st)",params_path:"$(params_path)"}

# new score for operations
scoreboard objectives add std_local_ray_cast dummy

# summon marker (tag: std_ray)
$function core_std:ray/summon_marker \
    with storage $(params_st) $(params_path)

# __ determine repeat parameters __

# determine number of steps the raycast will take, which will be the amount of
# iterations in the repeat functions
# FORMULA:
# number of steps: max_distance (*1000) * steps_per_block (*1000) (/1000000)
$execute store result score $max_distance std_local_ray_cast run data get storage $(params_st) $(params_path).max_distance 1000
$execute store result score $steps_per_block std_local_ray_cast run data get storage $(params_st) $(params_path).steps_per_block 1000
scoreboard players operation $max_distance std_local_ray_cast *= $steps_per_block std_local_ray_cast
execute store result storage minecraft:std local_repeat_params.times int 0.000001 run scoreboard players get $max_distance std_local_ray_cast

# calculate step length and add it to the ray/parameters object (this will be
# deleted later inside the object)
# FORMULA: step_length = 1 / steps_per_block
scoreboard players set $step_length std_local_ray_cast 1000
scoreboard players operation $step_length std_local_ray_cast /= $steps_per_block std_local_ray_cast
$execute store result storage $(params_st) $(params_path).step_length double 1 run scoreboard players get $step_length std_local_ray_cast

# set the rest of repeat function parameters
data modify storage minecraft:std local_repeat_params.score_obj set value "std_local_ray_cast_iter"
data modify storage minecraft:std local_repeat_params.score_holder set value "@s"
$data modify storage minecraft:std local_repeat_params.cmd set value 'function std:ray/internal/take_step with storage $(params_st) $(params_path)'

# repeat steps with previously determined parameters
execute as @n[type=marker,tag=std_ray] run function std:repeat with storage minecraft:std local_repeat_params

# kill marker
kill @n[type=marker,tag=std_ray]

# free memory
scoreboard objectives remove std_local_ray_cast
data remove storage minecraft:std local_repeat_params
$data remove storage $(params_st) $(params_path).step_length
