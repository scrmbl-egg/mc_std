#>std:aabb/cast_absolute
#
# Casts an invisible axis-aligned bounding box that can detect entities. When
# the bounding box detects an entity inside of its collider, it executes a
# command specified by the caller.
#
# This box is cast from two points in space which must be specified in the
# parameters.
#
# @authors scrmbl-egg
# @input
#   entity_selector: #[entity] #[selector] string
#       Selector of the entity (or entities) whose collider(s) will trigger
#       the command execution if they are inside the bounding box.
#   on_detection_command: #[command(max_length=32500)] string
#       Command that will be executed when the bounding box detects a specified
#       entity.
#   origin: [double] @ 3
#       Coordinate that defines the origin corner of the axis-aligned bounding
#       box.
#   end: [double] @ 3
#       Coordinate that defines the opposite corner to the origin of the
#       axis-aligned bounding box.

# create local scoreboard
scoreboard objectives add __std.aabb dummy
scoreboard players set __$std_1 __std.aabb 1000

# save user parameters and set future ones
$data modify storage std:temp aabb set value { \
    abs_params:{ \
        origin:$(origin), \
        end:$(end), \
        out_storage:"std:temp", \
        out_nbt:"aabb.abs", \
    }, \
    check_params: { \
        selector:'$(entity_selector)', \
        on_detection_command:'$(on_detection_command)', \
    }, \
}

# get absolute AABB
function core_std:aabb/abs with storage std:temp aabb.abs_params
#>_
# @out
#   std:temp aabb
#       abs

# save origin coordinates into parameters
data modify storage std:temp aabb.check_params.origin_x \
    set from storage std:temp aabb.abs.origin[0]
data modify storage std:temp aabb.check_params.origin_y \
    set from storage std:temp aabb.abs.origin[1]
data modify storage std:temp aabb.check_params.origin_z \
    set from storage std:temp aabb.abs.origin[2]

# save coordinates into scores, to eventually get size of the aabb (dx, dy & dz)
execute store result score __$std_end_x __std.aabb \
    run \
    data get storage std:temp aabb.abs.end[0] 1000
execute store result score __$std_end_y __std.aabb \
    run \
    data get storage std:temp aabb.abs.end[1] 1000
execute store result score __$std_end_z __std.aabb \
    run \
    data get storage std:temp aabb.abs.end[2] 1000
execute store result score __$std_origin_x __std.aabb \
    run \
    data get storage std:temp aabb.abs.origin[0] 1000
execute store result score __$std_origin_y __std.aabb \
    run \
    data get storage std:temp aabb.abs.origin[1] 1000
execute store result score __$std_origin_z __std.aabb \
    run \
    data get storage std:temp aabb.abs.origin[2] 1000

# get size as scores
scoreboard players \
    operation __$std_end_x __std.aabb -= __$std_origin_x __std.aabb
scoreboard players \
    operation __$std_end_y __std.aabb -= __$std_origin_y __std.aabb
scoreboard players \
    operation __$std_end_z __std.aabb -= __$std_origin_z __std.aabb

# check if all size components are greater than 1
execute if score __$std_end_x __std.aabb > __$std_1 __std.aabb \
    run \
    scoreboard players add __$std_greater_than_1_components __std.aabb 1
execute if score __$std_end_y __std.aabb > __$std_1 __std.aabb \
    run \
    scoreboard players add __$std_greater_than_1_components __std.aabb 1
execute if score __$std_end_z __std.aabb > __$std_1 __std.aabb \
    run \
    scoreboard players add __$std_greater_than_1_components __std.aabb 1

# if all components (3) are greater than 1, subtract 1 from all and set
# 'local_do_intersection' to false, otherwise, set it to true

# remove 1.0 from dx, dy & dz scores
execute if score __$std_greater_than_1_components __std.aabb matches 3 \
    run \
    scoreboard players remove __$std_end_x __std.aabb 1000
execute if score __$std_greater_than_1_components __std.aabb matches 3 \
    run \
    scoreboard players remove __$std_end_y __std.aabb 1000
execute if score __$std_greater_than_1_components __std.aabb matches 3 \
    run \
    scoreboard players remove __$std_end_z __std.aabb 1000

# get scores back as data as doubles
execute store result storage std:temp aabb.check_params.dx double 0.001 \
    run \
    scoreboard players get __$std_end_x __std.aabb
execute store result storage std:temp aabb.check_params.dy double 0.001 \
    run \
    scoreboard players get __$std_end_y __std.aabb
execute store result storage std:temp aabb.check_params.dz double 0.001 \
    run \
    scoreboard players get __$std_end_z __std.aabb

# finally, set __$std_do_intersection to 0 if all components are greater than 1
execute if score __$std_greater_than_1_components __std.aabb matches 3 \
    run \
    scoreboard players set __$std_do_intersection __std.aabb 0

# if the previous conditions aren't met, just set __$std_do_intersection to 1
execute unless score __$std_greater_than_1_components __std.aabb matches 3 \
    run \
    scoreboard players set __$std_do_intersection __std.aabb 1

# call function
function core_std:aabb/cast_absolute/check_collision_and_run_command \
    with storage std:temp aabb.check_params

# free memory
scoreboard objectives remove __std.aabb
data remove storage std:temp aabb
