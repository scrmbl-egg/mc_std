# storage:
    # local_score
    # local_command

# run command
$execute if score $std_local_i $(local_score) < $std_local_times $(local_score) run $(local_command)

# add one to current iteration
$scoreboard players add $std_local_i $(local_score) 1

# reiterate if std_local_i < std_local_times
$execute if score $std_local_i $(local_score) < $std_local_times $(local_score) run function std:repeat/internal/iterate_st with storage minecraft:std