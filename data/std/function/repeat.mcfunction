#>std:repeat
# Repeats a command a specified amount of times. The name of a new score
# objective and a score holder must be specified, so that they can store
# the iteration count and allow nested loops.
#
# @authors scrmbl-egg
# @params
    # score_obj     -- New score objective where the current iteration will be
    #                  stored. Will be removed after operations are completed.
    #                  Useful for nested loops.
    # score_holder  -- Name of the score holder.
    # times         -- Amount of times the command will be executed.
    # cmd           -- Command executed each iteration.

$scoreboard objectives add $(score_obj) dummy

$data modify storage std:temp repeat_params.score_objective set value '$(score_obj)'
$data modify storage std:temp repeat_params.score_holder set value '$(score_holder)'
$data modify storage std:temp repeat_params.command set value '$(cmd)'

$scoreboard players set $(score_holder) $(score_obj) 0
$scoreboard players set $std_local_times $(score_obj) $(times)

# NOTE: "execute if/unless entity" detects whether or not an entity is running
# this command. This is so that, if there's no entity running this command, the
# server will take care of it.

# execute recursive function
#>_
# @in
    # repeat_params
        # score_objective
        # score_holder
        # command
execute \
    if entity @s \
    run \
    function core_std:repeat/iterate with storage std:temp repeat_params
execute \
    unless entity @s \
    run \
    function core_std:repeat/iterate with storage std:temp repeat_params

# free memory
$scoreboard objectives remove $(score_obj)
data remove storage std:temp repeat_params
