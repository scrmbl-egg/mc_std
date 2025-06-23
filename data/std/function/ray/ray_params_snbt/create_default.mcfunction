#>std:ray/parameters/create_default
# Creates a new ray_params_snbt object with default values. These default
# values result in parameters that, if casted, would result in a ray that
# doesn't collide with any blocks, doesn't contain data, does 40 steps in 10
# blocks, and runs no commands.
#
# @params
    # dest_st   -- Destination storage.
    # dest_path -- Destination path.

$data remove storage $(dest_st) $(dest_path)
$data modify storage $(dest_st) $(dest_path).data set value {}
$data modify storage $(dest_st) $(dest_path).selector set value '@a'
$data modify storage $(dest_st) $(dest_path).origin_x set value 0
$data modify storage $(dest_st) $(dest_path).origin_y set value 0
$data modify storage $(dest_st) $(dest_path).origin_z set value 0
$data modify storage $(dest_st) $(dest_path).pitch set value 0
$data modify storage $(dest_st) $(dest_path).yaw set value 0
$data modify storage $(dest_st) $(dest_path).max_distance set value 10
$data modify storage $(dest_st) $(dest_path).steps_per_block set value 4
$data modify storage $(dest_st) $(dest_path).collision_mask set value 'stone'
$data modify storage $(dest_st) $(dest_path).pierce set value false
$data modify storage $(dest_st) $(dest_path).on_entity_found_cmd set value 'say player found!'
$data modify storage $(dest_st) $(dest_path).on_collision_cmd set value 'function std:entity/kill_self_and_passengers'
$data modify storage $(dest_st) $(dest_path).on_step_cmd set value 'function std:empty'
$data modify storage $(dest_st) $(dest_path).dx set value 0.2
$data modify storage $(dest_st) $(dest_path).dy set value 0.2
$data modify storage $(dest_st) $(dest_path).dz set value 0.2
