#>core_std:repeat/iterate
#
# Does a single iteration of the repeat command, and recursively runs the next.
#
# @authors scrmbl-egg
# @input
    # score_objective
    # score_holder
    # command

# run command
$execute if score \
    $(score_holder) $(score_objective) < $times $(score_objective) \
    run \
    $(command)

# add one to current iteration
$scoreboard players add $(score_holder) $(score_objective) 1

# reiterate if score_holder < times
$execute if score \
    $(score_holder) $(score_objective) < $times $(score_objective) \
    run \
    function core_std:repeat/iterate with storage std:temp repeat
