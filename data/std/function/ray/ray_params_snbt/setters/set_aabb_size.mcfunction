#>std:ray/ray_params_snbt/setters/set_aabb_size
# Sets the AABB size of a ray_params_snbt object.
#
# @params
    # params_st     -- ray_params_snbt object storage.
    # params_path   -- ray_params_snbt object path.
    # dx            -- New AABB size X value.
    # dy            -- New AABB size Y value.
    # dz            -- New AABB size Z value.

# data structure assertions
$function core_std:ray/error/assert_obj_structure \
    {fn:"std:ray/ray_params_snbt/setters/set_aabb_size",params_st:"$(params_st)",params_path:"$(params_path)"}

$data modify storage $(params_st) $(params_path).dx set value $(dx)
$data modify storage $(params_st) $(params_path).dy set value $(dy)
$data modify storage $(params_st) $(params_path).dz set value $(dz)
