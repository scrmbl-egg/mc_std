# storage:
    # local_pitch_increment_per_layer

$tp @s ~ ~ ~ ~$(local_yaw_increment) ~$(local_pitch_increment_per_layer)
$execute positioned ^ ^ ^$(local_radius) run $(local_draw_cmd)

# fix pitch
execute as @n[type=marker,nbt={Tags:["me_sphere"]}] store result score @s std_local_draw run data get entity @s Rotation[1]

execute as @n[type=marker,nbt={Tags:["me_sphere"]}] at @s if score @s std_local_draw matches 90 run return run tp @s ~ ~ ~ ~ -90
execute as @n[type=marker,nbt={Tags:["me_sphere"]}] at @s if score @s std_local_draw matches -90 run return run tp @s ~ ~ ~ ~ 90