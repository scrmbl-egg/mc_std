#>core_std:aabb/cast_centered/check_collision_and_run_command
#
# @authors scrmbl-egg
# @input
#   entity_selector: #[entity] #[selector] string
#   origin_offset_x: double
#   origin_offset_y: double
#   origin_offset_z: double
#   dx: double @ 0..
#   dy: double @ 0..
#   dz: double @ 0..
#   on_detection_command: #[command(max_length=32500)] string

# NOTE: The previous calculations decide whether a two selector intersection is
# necessary or not, because in minecraft, when dx, dy & dz are 0, it is equal to
# the volume of a block, instead of a small point in space. So when we want a
# really small detection, we use an intersecting block that is [-1,-1,-1]
# relative to the origin of the box.

# do 2 intersecting volume checks if __$std_do_intersection score is 1
$execute if score __$std_do_intersection __std.aabb matches 1 \
    positioned ~$(origin_offset_x) ~$(origin_offset_y) ~$(origin_offset_z) \
    as $(entity_selector) \
    if entity @s[dx=$(dx),dy=$(dy),dz=$(dz)] \
    positioned ~-0.999 ~-0.999 ~-0.999 \
    if entity @s[dx=$(dx),dy=$(dy),dz=$(dz)] \
    run \
    $(on_detection_command)
#$execute if score __$std_do_intersection __std.aabb matches 1 \
    positioned ~$(origin_offset_x) ~$(origin_offset_y) ~$(origin_offset_z) \
    as $(entity_selector) \
    if entity @s[dx=$(dx),dy=$(dy),dz=$(dz)] \
    positioned ~-0.999 ~-0.999 ~-0.999 \
    if entity @s[dx=$(dx),dy=$(dy),dz=$(dz)] \
    run \
    function hipochallenge:msg/debug/send_info { \
        text:"AABB_SUCCESS_INTERSECTION", \
    }

# if do_intersection score is 0, do a simple volume check
$execute if score __$std_do_intersection __std.aabb matches 0 \
    positioned ~$(origin_offset_x) ~$(origin_offset_y) ~$(origin_offset_z) \
    as $(entity_selector) \
    if entity @s[dx=$(dx),dy=$(dy),dz=$(dz)] \
    run \
    $(on_detection_command)
#$execute if score __$std_do_intersection __std.aabb matches 0 \
    positioned ~$(origin_offset_x) ~$(origin_offset_y) ~$(origin_offset_z) \
    as $(entity_selector) \
    if entity @s[dx=$(dx),dy=$(dy),dz=$(dz)] \
    run \
    function hipochallenge:msg/debug/send_info { \
        text:"\"AABB_SUCCESS_NO_INTERSECTION dx:$(dx) dy:$(dy) dz:$(dz)\"", \
    }
