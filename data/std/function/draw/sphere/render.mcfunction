# params:
    # resolution
    # pitch_increment_per_layer
    # radius
    # iterations
    # draw_cmd

scoreboard objectives add local_sp_draw dummy

$data modify storage minecraft:std local_radius_assertion set value $(radius)

# function assertions
$scoreboard players set $res local_sp_draw $(resolution)
execute store result score $rad local_sp_draw run data get storage minecraft:std local_radius_assertion 1000

data remove storage minecraft:std local_radius_assertion

execute if score $res local_sp_draw matches ..1 run return fail
execute if score $rad local_sp_draw matches ..0 run return fail

# save info
$data modify storage minecraft:std local_resolution set value $(resolution)
$data modify storage minecraft:std local_pitch_increment_per_layer set value $(pitch_increment_per_layer)
$data modify storage minecraft:std local_radius set value $(radius)
$data modify storage minecraft:std local_iterations set value $(iterations)
$data modify storage minecraft:std local_draw_cmd set value "$(draw_cmd)"

# init math values
scoreboard players set $360 local_sp_draw 360000000
execute store result score $angle local_sp_draw run data get storage minecraft:std local_resolution 1000

# calculate angle
execute store result storage minecraft:std local_yaw_increment double 0.001 run scoreboard players operation $360 local_sp_draw /= $angle local_sp_draw

# summon marker
summon marker ~ ~ ~ {Tags:["me_sphere"]}

# draw

scoreboard objectives add local_std_iter dummy
$function std:repeat/run {score:0,times:$(iterations),cmd:"execute as @n[type=minecraft:marker,tag=me] at @s run function std:draw/sphere/iteration_st with storage minecraft:std"}
scoreboard objectives remove local_std_iter

# kill marker
kill @n[type=minecraft:marker,tag=me_sphere]

# free memory
data remove storage minecraft:std local_resolution
data remove storage minecraft:std local_pitch_increment_per_layer
data remove storage minecraft:std local_radius
#data remove storage minecraft:std local_iterations
data remove storage minecraft:std local_draw_cmd
data remove storage minecraft:std local_yaw_increment
scoreboard objectives remove local_sp_draw