#>std:ray/ray_params_snbt/setters/set_data
# Sets the custom data of a ray_params_snbt object.
#
# @params
    # params_st         -- ray_params_snbt object storage.
    # params_path       -- ray_params_snbt object path.
    # data              -- Custom data object.

# data structure assertions
$function core_std:ray/error/assert_obj_structure \
    {fn:"std:ray/ray_params_snbt/setters/set_data",params_st:"$(params_st)",params_path:"$(params_path)"}

# set value
$data modify storage $(params_st) $(params_path).data set value '$(data)'
