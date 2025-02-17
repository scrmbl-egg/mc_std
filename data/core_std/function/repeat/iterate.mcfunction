#>core_std:repeat/iterate
#
# @authors scrmbl-egg
# @params
    # score_objective
    # score_holder
    # command

# run command
$execute \
    if score $(score_holder) $(score_objective) < $std_local_times $(score_objective) \
    run \
    $(command)

# add one to current iteration
$scoreboard players add $(score_holder) $(score_objective) 1

# reiterate if local_score_holder < std_local_times
$execute \
    if score $(score_holder) $(score_objective) < $std_local_times $(score_objective) \
    run \
    function std:repeat/internal/iterate_st \
    with storage minecraft:std 
