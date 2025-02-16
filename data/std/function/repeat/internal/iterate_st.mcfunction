#>std:repeat/internal/iterate_st
#
# @authors scrmbl-egg
# @storage
    # local_score_objective
    # local_score_holder
    # local_command

# run command
$execute \
    if score $(local_score_holder) $(local_score_objective) < $std_local_times $(local_score_objective) \
    run \
    $(local_command)
\

# add one to current iteration
$scoreboard players add $(local_score_holder) $(local_score_objective) 1

# reiterate if local_score_holder < std_local_times
$execute \
    if score $(local_score_holder) $(local_score_objective) < $std_local_times $(local_score_objective) \
    run \
    function std:repeat/internal/iterate_st \
    with storage minecraft:std
