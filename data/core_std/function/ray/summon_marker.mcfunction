#>core_std:ray/summon_marker
# 
# @authors scrmbl-egg
# @params
    # data
    # selector
    # origin_x
    # origin_y
    # origin_z
    # pitch
    # yaw
    # max_distance
    # steps_per_block
    # dx
    # dy
    # dz
    # collision_mask
    # pierce
    # on_entity_found_cmd
    # on_collision_cmd
    # on_step_cmd

# HACK: marker currently holds the ray's 'data' property in its own 'data'
# property
$summon marker $(origin_x) $(origin_y) $(origin_z) \
    {Tags:["std_ray"],Rotation:[$(yaw),$(pitch)],data:$(data)}
