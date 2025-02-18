#>std:ray/ray_params_snbt/setters/set_pierce_to_false
#
# Sets the pierce property of the ray_params_snbt object to false.
#
# @params
    # params_st     -- Destination storage.
    # params_path   -- Destination path.

# data structure assertions
$function core_std:ray/error/assert_obj_structure \
    {fn:"std:ray/ray_params_snbt/setters/set_origin",params_st:"$(params_st)",params_path:"$(params_path)"}

# set value
$data modify storage $(params_st) $(params_path).pierce set value false
