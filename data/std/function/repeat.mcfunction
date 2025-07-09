#>std:repeat
#
# Repeats a command a specified amount of times. The name of a new score
# objective and a score holder must be specified, so that they can store
# the iteration count and allow nested loops.
#
# @authors scrmbl-egg
# @input
#   score_objective: #[objective] string
#       New score objective where the current iteration will be stored. Will
#       be removed after operations are completed. Useful for nested loops.
#   score_holder: #[score_holder] string
#       Score holder.
#   times: int @ 0..
#       Amount of times the command will be executed.
#   command: #[command(empty="allowed",max_length=32500)] string
#       Command executed each iteration.

$scoreboard objectives add $(score_objective) dummy

$data modify storage std:temp repeat set value { \
    score_objective:'$(score_objective)', \
    score_holder:'$(score_holder)', \
    command:'$(command)', \
}

$scoreboard players set $(score_holder) $(score_objective) 0
$scoreboard players set $times $(score_objective) $(times)

# NOTE: "execute if/unless entity" detects whether or not an entity is running
# this command. This is so that, if there's no entity running this command, the
# server will take care of it.

# execute recursive function
#>_
# @in
    # repeat
        # score_objective
        # score_holder
        # command
execute if entity @s \
    run \
    function core_std:repeat/iterate with storage std:temp repeat
execute unless entity @s \
    run \
    function core_std:repeat/iterate with storage std:temp repeat

# free memory
$scoreboard objectives remove $(score_objective)
data remove storage std:temp repeat
