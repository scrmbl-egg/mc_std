#>std:ray/ray_params_snbt/setters/set_steps_per_block
#
# Sets the amount of steps per block of the ray_params_snbt object.
#
# @params
    # params_st         -- ray_params_snbt object storage.
    # params_path       -- ray_params_snbt object path.
    # steps_per_block   -- New steps per block value.

# data structure assertions
$function core_std:ray/error/assert_obj_structure \
    {fn:"std:ray/ray_params_snbt/setters/set_steps_per_block",params_st:"$(params_st)",params_path:"$(params_path)"}

# set value
$data modify storage $(params_st) $(params_path).steps_per_block set value $(steps_per_block)
