# params
    # score         (score where the current iteration will be stored, this is useful for nested loops)
    # score_holder  (holder of iterations)
        # TODO: implement score holder
    # times         (times the command will be executed)
    # cmd           (command executed each iteration)

$scoreboard objectives add $(score) dummy

$data modify storage minecraft:std local_std_score set value "$(score)"
$data modify storage minecraft:std local_std_command set value "$(cmd)"

$scoreboard players set $std_local_i $(score) 0
$scoreboard players set $std_local_times $(score) $(times)

# execute recursive function
# in:
    # local_score
    # local_command
execute if entity @s run function std:repeat/internal/iterate_st with storage minecraft:std
execute unless entity @s run function std:repeat/internal/iterate_st with storage minecraft:std

# free memory
$scoreboard objectives remove $(score)
data remove storage minecraft:std local_score
data remove storage minecraft:std local_command