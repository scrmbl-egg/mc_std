# storage:
    # local_command

# add one to current iteration
scoreboard players add $local_i local_std_repeat 1

# run command and reiterate if local_i < local_times
$execute if score $local_i local_std_repeat < $local_times local_std_repeat run $(local_command)
execute if score $local_i local_std_repeat < $local_times local_std_repeat as @s run function std:repeat/internal/iterate_st with storage minecraft:std