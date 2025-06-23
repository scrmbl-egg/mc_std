#>core_std:aabb/check_collision_and_run_cmd
#
# @authors scrmbl-egg
# @params
    # selector
    # dx
    # dy
    # dz
    # cmd
    # origin_offset_x
    # origin_offset_y
    # origin_offset_z

# NOTE: The previous calculations decide whether a two selector intersection is
# necessary or not, because in minecraft, when dx, dy & dz are 0, it is equal to
# the volume of a block, instead of a small point in space. So when we want a
# really small detection, we use an intersecting block that is [-1,-1,-1]
# relative to the origin of the box.

execute \
    store result score $do_intersection std_local_aabb \
    run \
    data get storage std:temp aabb_params.do_intersection 1

# do 2 intersecting volume checks if do_intersection score is 1
$execute \
    if score $do_intersection std_local_aabb matches 1 \
    positioned ~$(origin_offset_x) ~$(origin_offset_y) ~$(origin_offset_z) \
    as $(selector) \
    if entity @s[dx=$(dx),dy=$(dy),dz=$(dz)] \
    positioned ~-0.999 ~-0.999 ~-0.999 \
    if entity @s[dx=$(dx),dy=$(dy),dz=$(dz)] \
    run \
    $(cmd)

# if do_intersection score is 0, do a simple volume check
$execute \
    unless score $do_intersection std_local_aabb matches 1 \
    positioned ~$(origin_offset_x) ~$(origin_offset_y) ~$(origin_offset_z) \
    as $(selector) \
    if entity @s[dx=$(dx),dy=$(dy),dz=$(dz)] \
    run \
    $(cmd)
