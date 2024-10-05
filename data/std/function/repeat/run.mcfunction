# params
    # times (times the command will be executed)
    # cmd   (command executed each iteration)

scoreboard objectives add local_std_repeat dummy

$data modify storage minecraft:std local_command set value "$(cmd)"

$scoreboard players set $local_i local_std_repeat $(i)
$scoreboard players set $local_size local_std_repeat $(size)

# execute recursive function
# in:
    # local_command
execute as @s run function std:repeat/internal/iterate_st with storage minecraft:std

# free memory
scoreboard objectives remove local_std_repeat
data remove storage minecraft:std local_command