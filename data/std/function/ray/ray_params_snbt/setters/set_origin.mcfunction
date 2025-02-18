#>std:ray/ray_params_snbt/setters/set_origin
# Sets the origin point of the ray_params_snbt object.
#
# @params
    # params_st     -- ray_params_snbt object storage.
    # params_path   -- ray_params_snbt object path.
    # x             -- New origin X component value.
    # y             -- New origin Y component value.
    # z             -- New origin Z component value.

# data structure assertions
$function core_std:ray/error/assert_obj_structure \
    {fn:"std:ray/ray_params_snbt/setters/set_origin",params_st:"$(params_st)",params_path:"$(params_path)"}

# set value
$data modify storage $(params_st) $(params_path).origin_x set value $(x)
$data modify storage $(params_st) $(params_path).origin_y set value $(y)
$data modify storage $(params_st) $(params_path).origin_z set value $(z)
