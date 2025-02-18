#>std:ray/parameters/create
# Creates a new ray_params_snbt object. Caller has to specify all properties.
#
# @params
    # dest_st               -- Destination storage.
    # dest_path             -- Destination path.
    # data                  -- Custom data object.
    # selector              -- Entities the raycast will look for.
    # origin_x              -- Origin position X component.
    # origin_y              -- Origin position Y component.
    # origin_z              -- Origin position Z component.
    # pitch                 -- Raycast's X rotation angle.
    # yaw                   -- Raycast's Y rotation angle.
    # max_distance          -- Max amount of distance the raycast will travel.
    # steps_per_block       -- How many steps does it take for the raycast to
    #                          travel one block of distance?
    # collision_mask        -- Block or tag of blocks that will stop the 
    #                          raycast.
    # pierce                -- Boolean. Does the raycast stop when it finds
    #                          a selector entity?
    # on_entity_found_cmd   -- Command executed when an entity from 'selector'
    #                          is found.
    # on_collision_cmd      -- Command executed when the raycast collides with 
    #                          a block in 'collision_mask'.
    # on_step_cmd           -- Command executed each step.
    # dx                    -- Size X of the AABB.
    # dy                    -- Size Y of the AABB.
    # dz                    -- Size Z of the AABB.

$data remove storage $(dest_st) $(dest_path)
$data modify storage $(dest_st) $(dest_path).data set value $(data)
$data modify storage $(dest_st) $(dest_path).selector set value '$(selector)'
$data modify storage $(dest_st) $(dest_path).origin_x set value $(origin_x)
$data modify storage $(dest_st) $(dest_path).origin_y set value $(origin_y)
$data modify storage $(dest_st) $(dest_path).origin_z set value $(origin_z)
$data modify storage $(dest_st) $(dest_path).pitch set value $(pitch)
$data modify storage $(dest_st) $(dest_path).yaw set value $(yaw)
$data modify storage $(dest_st) $(dest_path).max_distance set value $(max_distance)
$data modify storage $(dest_st) $(dest_path).steps_per_block set value $(steps_per_block)
$data modify storage $(dest_st) $(dest_path).collision_mask set value '$(collision_mask)'
$data modify storage $(dest_st) $(dest_path).pierce set value $(pierce)
$data modify storage $(dest_st) $(dest_path).on_entity_found_cmd set value '$(on_entity_found_cmd)'
$data modify storage $(dest_st) $(dest_path).on_collision_cmd set value '$(on_collision_cmd)'
$data modify storage $(dest_st) $(dest_path).on_step_cmd set value '$(on_step_cmd)'
$data modify storage $(dest_st) $(dest_path).dx set value $(dx)
$data modify storage $(dest_st) $(dest_path).dy set value $(dy)
$data modify storage $(dest_st) $(dest_path).dz set value $(dz)
