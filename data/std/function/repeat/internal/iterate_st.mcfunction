# storage:
    # local_score
    # local_command

# run command
$execute if score $local_i $(local_score) < $local_times $(local_score) run $(local_command)

# add one to current iteration
$scoreboard players add $local_i $(local_score) 1

# reiterate if local_i < local_times
$execute if score $local_i $(local_score) < $local_times $(local_score) run function std:repeat/internal/iterate_st with storage minecraft:std