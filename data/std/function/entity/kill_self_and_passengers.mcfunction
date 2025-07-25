#>std:entity/kill_self_and_passengers
#
# Kills the caller entity and all of its passengers, or "children" if you were
# to think of entities as node trees.
#
# @authors scrmbl-egg

execute as @s at @s on passengers \
    run \
    function std:entity/kill_self_and_passengers

kill @s
