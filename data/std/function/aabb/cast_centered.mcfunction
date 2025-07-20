#>std:aabb/cast_centered
#
# Casts an invisible axis-aligned bounding box that can detect entities. When
# the bounding box detects an entity inside of its collider, it executes a
# command specified by the caller.
#
# This box is not cast from two points in space, but rather, the center of a
# position, so when the caller specifies, for example, a Y size (size[1]) of 1,
# the box will expand 0.5 units above its center, and other 0.5 units under.
# Due to this implementation it is recommended to NOT use this function in
# isolation, but instead, in an 'execute' command that specifies an entity's
# or absolute position.
#
# @authors scrmbl-egg
# @input
#   entity_selector: #[entity] #[selector] string
#       Selector of the entity (or entities) whose collider(s) will trigger
#       the command execution if they are inside the bounding box.
#   on_detection_command: #[command(max_length=32500)] string
#       Command that will be executed when the bounding box detects a specified
#       entity.
#   size: [double] @ 3
#       3D Vector that describes the size of the box.

scoreboard objectives add __std.aabb dummy
scoreboard players set __$std_1 __std.aabb 1000

# save params
$data modify storage std:temp aabb set value { \
    entity_selector:'$(selector)', \
    size:$(size), \
    on_detection_command:'$(on_detection_command)', \
}

# get origin offset
execute store result storage std:temp aabb.origin_offset_x \
    double -0.5 \
    run data get storage std:temp aabb.size[0]
execute store result storage std:temp aabb.origin_offset_y \
    double -0.5 \
    run data get storage std:temp aabb.size[1]
execute store result storage std:temp aabb.origin_offset_z \
    double -0.5 \
    run data get storage std:temp aabb.size[2]

# check if doing a two volume intersection is necessary
# (all components must be < 1)

# check if dx, dy and dz >= 1
execute \
    store result score __$std_dx __std.aabb \
    run data get storage std:temp aabb.size[0] 1000
execute \
    store result score __$std_dy __std.aabb \
    run data get storage std:temp aabb.size[1] 1000
execute \
    store result score __$std_dz __std.aabb \
    run data get storage std:temp aabb.size[2] 1000

execute if score __$std_dx __std.aabb >= __$std_1 __std.aabb \
    run \
    scoreboard players add __$std_greater_than_1_components __std.aabb 1
execute if score __$std_dy __std.aabb >= __$std_1 __std.aabb \
    run \
    scoreboard players add __$std_greater_than_1_components __std.aabb 1
execute if score __$std_dz __std.aabb >= __$std_1 __std.aabb \
    run \
    scoreboard players add __$std_greater_than_1_components __std.aabb 1

# if all components (3) are greater than 1, subtract 1 from all and set
# 'local_do_intersection' to false, otherwise, set it to true

# remove 1.0 from dx, dy & dz scores
execute if score __$std_greater_than_1_components __std.aabb matches 3 \
    run \
    scoreboard players remove __$std_dx __std.aabb 1000
execute if score __$std_greater_than_1_components __std.aabb matches 3 \
    run \
    scoreboard players remove __$std_dy __std.aabb 1000
execute if score __$std_greater_than_1_components __std.aabb matches 3 \
    run \
    scoreboard players remove __$std_dz __std.aabb 1000

# get scores back as data as doubles
execute store result storage std:temp aabb.dx double 0.001 \
    run \
    scoreboard players get __$std_dx __std.aabb
execute store result storage std:temp aabb.dy double 0.001 \
    run \
    scoreboard players get __$std_dy __std.aabb
execute store result storage std:temp aabb.dz double 0.001 \
    run \
    scoreboard players get __$std_dz __std.aabb

# finally, set __$std_do_intersection to 0 if all components are greater than 1
execute if score __$std_greater_than_1_components __std.aabb matches 3 \
    run \
    scoreboard players set __$std_do_intersection __std.aabb 0

# if the previous conditions aren't met, just set __$std_do_intersection to 1
execute unless score __$std_greater_than_1_components __std.aabb matches 3 \
    run \
    scoreboard players set __$std_do_intersection __std.aabb 1

#>_
# @in
#   aabb
#       selector
#       dx
#       dy
#       dz
#       on_detection_command
#       origin_offset_x
#       origin_offset_y
#       origin_offset_z
function core_std:aabb/cast_centered/check_collision_and_run_command \
    with storage std:temp aabb

# free memory
scoreboard objectives remove __std.aabb
data remove storage std:temp aabb
