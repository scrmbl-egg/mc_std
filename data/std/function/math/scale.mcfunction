# Input:
# in_storage - storage where the target value is stored
# in_path - storage NBT path where the target value is stored
# out_storage - storage where the result will be stored
# out_path - storage NBT path where the result will be stored
# factor - the number by which to scale the target value
# up - whether to scale up (1) or down (0)

# create local score
scoreboard objectives add __std.scale dummy

# declare inputs
$data modify storage std:temp scale.value set from storage $(in_storage) $(in_path)
$scoreboard players set __$std_up __std.scale $(up)

# decide if scaliung up or down
data modify storage std:temp scale.scaler set value 1000

data modify storage std:temp scale.multiplier set value 0.01
execute if score __$std_up __std.scale matches 0 run data modify storage std:temp scale.multiplier set value 0.0001

$function std:repeat {score_objective:"__std.scale.loop", score_holder:"__$std_scale", times:$(factor), command:\
"function core_std:scale/execute with storage std:temp scale"\
}

# store result in output
$data modify storage $(out_storage) $(out_path) set from storage std:temp scale.value

# free memory
scoreboard objectives remove __std.scale
data remove storage std:temp scale

# TODO
# security checks
# docs
