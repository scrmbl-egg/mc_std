#>core_std:ray/take_step
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
    # step_length (added for this function)
    # dx
    # dy
    # dz
    # collision_mask
    # pierce
    # on_entity_found_cmd
    # on_collision_cmd
    # on_step_cmd

# TODO: implement all parameters

# on step command
$execute as @s run $(on_step_cmd)

# check entity
$execute \
    as @s \
    at @s \
    run \
    function std:aabb/cast_centered \
    {selector:'$(selector)',dx:$(dx),dy:$(dy),dz:$(dz),cmd:'$(on_entity_found_cmd)'}

# check collision
$execute as @s at @s if block ~ ~ ~ $(collision_mask) run $(on_collision_cmd)

# tp forward
$execute as @s at @s run tp @s ^ ^ ^$(step_length)
