# storage:
    # local_selector
    # local_dx
    # local_dy
    # local_dz
    # local_cmd
    # local_origin_offset_x
    # local_origin_offset_y
    # local_origin_offset_z

# NOTE: The previous calculations decide whether a two selector intersection is necessary or not,
# because in minecraft, when dx, dy & dz are 0, it is equal to the volume of a block, instead of a
# small point in space. So when we want a really small detection, we use an intersecting block
# that is [-1,-1,-1] relative to the origin of the box.

execute store result score $do_intersection local_std_aabb run data get storage minecraft:hipochallenge local_do_intersection 1

$execute if score $do_intersection local_std_aabb matches 1 positioned ~$(local_origin_offset_x) ~$(local_origin_offset_y) ~$(local_origin_offset_z) as $(local_selector) if entity @s[dx=$(local_dx),dy=$(local_dy),dz=$(local_dz)] positioned ~-0.999 ~-0.999 ~-0.999 if entity @s[dx=$(local_dx),dy=$(local_dy),dz=$(local_dz)] run $(local_cmd)
$execute unless score $do_intersection local_std_aabb matches 1 positioned ~$(local_origin_offset_x) ~$(local_origin_offset_y) ~$(local_origin_offset_z) as $(local_selector) if entity @s[dx=$(local_dx),dy=$(local_dy),dz=$(local_dz)] run $(local_cmd)
