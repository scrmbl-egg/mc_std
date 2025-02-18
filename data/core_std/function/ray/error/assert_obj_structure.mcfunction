#>core_std:ray/error/assert_obj_structure
#
# @authors scrmbl-egg
# @params
    # params_st
    # params_path
    # fn

# assert data exists in the location
$execute \
    unless data storage $(params_st) $(params_path) \
    run \
    return run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' doesn't contain any data."}

# check every necessary property is present
$execute unless data storage $(params_st) $(params_path).data \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).selector \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).origin_x \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).origin_y \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).origin_z \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).pitch \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).yaw \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).max_distance \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).steps_per_block \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).dx \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).dy \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).dz \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).collision_mask \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).pierce \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).on_entity_found_cmd \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).on_collision_cmd \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
$execute unless data storage $(params_st) $(params_path).on_step_cmd \
    run return \
    run \
    function std:error/print \
    {fn:"$(fn)",msg:"Path '$(params_path)' in storage '$(params_st)' isn't a valid ray_params_snbt object."}
