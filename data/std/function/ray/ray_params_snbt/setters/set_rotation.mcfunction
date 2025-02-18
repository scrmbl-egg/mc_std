#>std:ray/ray_params_snbt/setters/set_rotation
#
# Sets the rotation of the ray_params_snbt object.
#
# @params
    # params_st     -- ray_params_snbt object storage.
    # params_path   -- ray_params_snbt object path.
    # pitch         -- New pitch value.
    # yaw           -- New yaw value.

# data structure assertions
$function core_std:ray/error/assert_obj_structure \
    {fn:"std:ray/ray_params_snbt/setters/set_rotation",params_st:"$(params_st)",params_path:"$(params_path)"}

# set value
$data modify storage $(params_st) $(params_path).pitch set value $(pitch)
$data modify storage $(params_st) $(params_path).yaw set value $(yaw)
