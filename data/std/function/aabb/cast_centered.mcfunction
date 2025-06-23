#>std:aabb/cast_centered
# Casts an invisible axis-aligned bounding box that can detect entities. This
# box is not cast from two points in space, but rather, the center of its
# position, so when the caller specifies, for example, a Y size of 1, the box
# will expand 0.5 units above its center, and other 0.5 units under.
#
# When the bounding box detects an entity inside of its collider, it executes
# a command specified by the caller.
#
# @authors scrmbl-egg
# @params
    # selector  -- Entity selector.
    # dx        -- X size.
    # dy        -- Y size.
    # dz        -- Z size.
    # cmd       -- Command executed when a 'selector' entity is detected.

scoreboard objectives add std_local_aabb dummy
scoreboard players set $1 std_local_aabb 1000

# save params
$data modify storage std:temp aabb_params.selector set value '$(selector)'
$data modify storage std:temp aabb_params.dx set value $(dx)
$data modify storage std:temp aabb_params.dy set value $(dy)
$data modify storage std:temp aabb_params.dz set value $(dz)
$data modify storage std:temp aabb_params.cmd set value '$(cmd)'

# get origin offset
execute \
    store result storage std:temp aabb_params.origin_offset_x \
    double -0.5 \
    run data get storage std:temp aabb_params.dx
execute \
    store result storage std:temp aabb_params.origin_offset_y \
    double -0.5 \
    run data get storage std:temp aabb_params.dy
execute \
    store result storage std:temp aabb_params.origin_offset_z \
    double -0.5 \
    run data get storage std:temp aabb_params.dz

# check if doing a two volume intersection is necessary
# (all components must be < 1)

# check if dx, dy and dz >= 1
execute \
    store result score $dx std_local_aabb \
    run data get storage std:temp aabb_params.dx 1000
execute \
    store result score $dy std_local_aabb \
    run data get storage std:temp aabb_params.dy 1000
execute \
    store result score $dz std_local_aabb \
    run data get storage std:temp aabb_params.dz 1000

execute \
    if score $dx std_local_aabb >= $1 std_local_aabb \
    run scoreboard players add $greater_than_1_components std_local_aabb 1
execute \
    if score $dy std_local_aabb >= $1 std_local_aabb \
    run scoreboard players add $greater_than_1_components std_local_aabb 1
execute \
    if score $dz std_local_aabb >= $1 std_local_aabb \
    run scoreboard players add $greater_than_1_components std_local_aabb 1

# if all components (3) are greater than 1, subtract 1 from all and set
# 'local_do_intersection' to false, otherwise, set it to true

# remove 1.0 from dx, dy & dz scores
execute \
    if score $greater_than_1_components std_local_aabb matches 3 \
    run scoreboard players remove $dx std_local_aabb 1000
execute \
    if score $greater_than_1_components std_local_aabb matches 3 \
    run scoreboard players remove $dy std_local_aabb 1000
execute \
    if score $greater_than_1_components std_local_aabb matches 3 \
    run scoreboard players remove $dz std_local_aabb 1000

# get scores back as data as doubles
execute \
    if score $greater_than_1_components std_local_aabb matches 3 \
    run execute store result storage std:temp aabb_params.dx \
    double 0.001 \
    run scoreboard players get $dx std_local_aabb
execute \
    if score $greater_than_1_components std_local_aabb matches 3 \
    run execute store result storage std:temp aabb_params.dy \
    double 0.001 \
    run scoreboard players get $dx std_local_aabb
execute \
    if score $greater_than_1_components std_local_aabb matches 3 \
    run execute store result storage std:temp aabb_params.dz \
    double 0.001 \
    run scoreboard players get $dx std_local_aabb

# finally, set do_intersection to false
execute \
    if score $greater_than_1_components std_local_aabb matches 3 \
    run \
    data modify storage std:temp aabb_params.do_intersection \
    set value false

# if the previous conditions aren't met, just set do_intersection to true
execute \
    unless score $greater_than_1_components std_local_aabb matches 3 \
    run \
    data modify storage std:temp aabb_params.do_intersection \
    set value true

#>_
# @in:
    # aabb_params
        # selector
        # dx
        # dy
        # dz
        # cmd
        # origin_offset_x
        # origin_offset_y
        # origin_offset_z
function core_std:aabb/check_collision_and_run_cmd \
    with storage std:temp aabb_params

# free memory
scoreboard objectives remove std_local_aabb
data remove storage std:temp aabb_params
