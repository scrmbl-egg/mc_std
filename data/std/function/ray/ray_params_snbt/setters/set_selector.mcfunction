#>std:ray/ray_params_snbt/setters/set_selector
#
# Sets the entity selector the ray_params_snbt object.
#
# @params
    # params_st     -- ray_params_snbt object storage.
    # params_path   -- ray_params_snbt object path.
    # selector      -- New value.

# data structure assertions
$function core_std:ray/error/assert_obj_structure \
    {fn:"std:ray/ray_params_snbt/setters/set_selector",params_st:"$(params_st)",params_path:"$(params_path)"}

# set value
$data modify storage $(params_st) $(params_path).selector set value '$(selector)'
