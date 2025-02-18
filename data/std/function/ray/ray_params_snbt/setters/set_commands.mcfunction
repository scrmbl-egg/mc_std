#>std:ray/ray_params_snbt/setters/set_commands
# Sets the commands of the ray_params_snbt object.
#
# @params
    # params_st             -- ray_params_snbt object storage.
    # params_path           -- ray_params_snbt object path.
    # on_entity_found_cmd   -- Commands executed when an entity from 'selector'
    #                          is found.
    # on_collision_cmd      -- Commands executed when the ray collides with a
    #                          block in 'collision_mask'.
    # on_step_cmd           -- Commands executed each step.

# data structure assertions
$function core_std:ray/error/assert_obj_structure \
    {fn:"std:ray/ray_params_snbt/setters/set_commands",params_st:"$(params_st)",params_path:"$(params_path)"}

# set value
$data modify storage $(params_st) $(params_path).on_entity_found_cmd set value '$(on_entity_found_cmd)'
$data modify storage $(params_st) $(params_path).on_collision_cmd set value '$(on_collision_cmd)'
$data modify storage $(params_st) $(params_path).on_step_cmd set value '$(on_step_cmd)'
