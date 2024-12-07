# params:
    # resolution
    # pitch_increment_per_layer
    # radius
    # iterations
    # draw_cmd

# WARNING: this function WILL be changed in the future, use isn't recommended.

scoreboard objectives add std_local_draw dummy

$data modify storage minecraft:std local_radius_assertion set value $(radius)

# function assertions
$scoreboard players set $res std_local_draw $(resolution)
execute store result score $rad std_local_draw run data get storage minecraft:std local_radius_assertion 1000

data remove storage minecraft:std local_radius_assertion

execute if score $res std_local_draw matches ..1 run return run function std:draw/sphere/internal/error/fail_resolution_assertion
execute if score $rad std_local_draw matches ..0 run return run function std:draw/sphere/internal/error/fail_radius_assertion

# save info
$data modify storage minecraft:std local_resolution set value $(resolution)
$data modify storage minecraft:std local_pitch_increment_per_layer set value $(pitch_increment_per_layer)
$data modify storage minecraft:std local_radius set value $(radius)
$data modify storage minecraft:std local_iterations set value $(iterations)
$data modify storage minecraft:std local_draw_cmd set value '$(draw_cmd)'

# init math values
scoreboard players set $360 std_local_draw 360000000
execute store result score $angle std_local_draw run data get storage minecraft:std local_resolution 1000

# calculate angle
execute store result storage minecraft:std local_yaw_increment double 0.001 run scoreboard players operation $360 std_local_draw /= $angle std_local_draw

# summon marker
summon marker ~ ~ ~ {Tags:["me_sphere"]}

# draw

$function std:repeat/run {score_obj:local_std_iter,score_holder:"$std_holder",times:$(iterations),cmd:"execute as @n[type=minecraft:marker,tag=me_sphere] at @s run function std:draw/sphere/internal/iteration_st with storage minecraft:std"}

# kill marker
kill @n[type=minecraft:marker,tag=me_sphere]

# free memory
data remove storage minecraft:std local_resolution
data remove storage minecraft:std local_pitch_increment_per_layer
data remove storage minecraft:std local_radius
data remove storage minecraft:std local_iterations
data remove storage minecraft:std local_draw_cmd
data remove storage minecraft:std local_yaw_increment
scoreboard objectives remove std_local_draw