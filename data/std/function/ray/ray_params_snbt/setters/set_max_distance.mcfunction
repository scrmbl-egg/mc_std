#>std:ray/ray_params_snbt/setters/set_max_distance
# Sets the max distance value of the ray_params_snbt object.
#
# @params
    # params_st     -- ray_params_snbt object storage.
    # params_path   -- ray_params_snbt object path.
    # max_distance  -- New max distance value.

# data structure assertions
$function core_std:ray/error/assert_obj_structure \
    {fn:"std:ray/ray_params_snbt/setters/set_max_distance",params_st:"$(params_st)",params_path:"$(params_path)"}

# set value
$data modify storage $(params_st) $(params_path).max_distance set value $(max_distance)
