# params:
    # selector  (entity selector)
    # dx        (size x)
    # dy        (size y)
    # dz        (size z)
    # cmd       (command executed on success) 

scoreboard objectives add std_local_aabb dummy
scoreboard players set $one_scaled_block std_local_aabb 1000

# save params
$data modify storage minecraft:std local_selector set value "$(selector)"
$data modify storage minecraft:std local_dx set value $(dx)
$data modify storage minecraft:std local_dy set value $(dy)
$data modify storage minecraft:std local_dz set value $(dz)
$data modify storage minecraft:std local_cmd set value "$(cmd)"

# get origin offset
execute store result storage minecraft:std local_origin_offset_x double -0.5 run data get storage minecraft:std local_dx
execute store result storage minecraft:std local_origin_offset_y double -0.5 run data get storage minecraft:std local_dy
execute store result storage minecraft:std local_origin_offset_z double -0.5 run data get storage minecraft:std local_dz

# check if doing a two volume intersection is necessary (all components must be < 1)

# check if dx, dy and dz >= 1
execute store result score $dx std_local_aabb run data get storage minecraft:std local_dx 1000
execute store result score $dy std_local_aabb run data get storage minecraft:std local_dy 1000
execute store result score $dz std_local_aabb run data get storage minecraft:std local_dz 1000
execute if score $dx std_local_aabb >= $one_scaled_block std_local_aabb run scoreboard players add $less_than_1_components std_local_aabb 1
execute if score $dy std_local_aabb >= $one_scaled_block std_local_aabb run scoreboard players add $less_than_1_components std_local_aabb 1
execute if score $dz std_local_aabb >= $one_scaled_block std_local_aabb run scoreboard players add $less_than_1_components std_local_aabb 1

# if all components (3) are less than 1, subtract 1 from all and set 'local_do_intersection' to
# false, otherwise, set it to true 
execute if score $less_than_1_components std_local_aabb matches 3 run scoreboard players remove $dx std_local_aabb 1000
execute if score $less_than_1_components std_local_aabb matches 3 run scoreboard players remove $dy std_local_aabb 1000
execute if score $less_than_1_components std_local_aabb matches 3 run scoreboard players remove $dz std_local_aabb 1000
execute if score $less_than_1_components std_local_aabb matches 3 run execute store result storage minecraft:std local_dx double 0.001 run scoreboard players get $dx std_local_aabb
execute if score $less_than_1_components std_local_aabb matches 3 run execute store result storage minecraft:std local_dy double 0.001 run scoreboard players get $dx std_local_aabb
execute if score $less_than_1_components std_local_aabb matches 3 run execute store result storage minecraft:std local_dz double 0.001 run scoreboard players get $dx std_local_aabb
execute if score $less_than_1_components std_local_aabb matches 3 run data modify storage minecraft:std local_do_intersection set value false

execute unless score $less_than_1_components std_local_aabb matches 3 run data modify storage minecraft:std local_do_intersection set value true

# in:
    # local_selector
    # local_dx
    # local_dy
    # local_dz
    # local_cmd
    # local_origin_offset_x
    # local_origin_offset_y
    # local_origin_offset_z
function std:aabb/internal/test_and_run_cmd_st with storage minecraft:std

# free memory
scoreboard objectives remove std_local_aabb
data remove storage minecraft:std local_selector
data remove storage minecraft:std local_dx
data remove storage minecraft:std local_dy
data remove storage minecraft:std local_dz
data remove storage minecraft:std local_cmd
data remove storage minecraft:std local_origin_offset_x
data remove storage minecraft:std local_origin_offset_y
data remove storage minecraft:std local_origin_offset_z
data remove storage minecraft:std local_do_intersection