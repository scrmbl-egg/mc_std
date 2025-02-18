#>std:ray/ray_params_snbt/setters/set_collision_mask
# Sets the collision mask of a ray_params_snbt object.
#
# @params
    # params_st         -- ray_params_snbt object storage.
    # params_path       -- ray_params_snbt object path.
    # collision_mask    -- Block or tag of blocks that will stop the raycast.

# data structure assertions
$function core_std:ray/error/assert_obj_structure \
    {fn:"std:ray/ray_params_snbt/setters/set_collision_mask",params_st:"$(params_st)",params_path:"$(params_path)"}

# set value
$data modify storage $(params_st) $(params_path).collision_mask set value '$(collision_mask)'
