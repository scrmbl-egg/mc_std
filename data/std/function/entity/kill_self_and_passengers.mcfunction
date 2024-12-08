# doc:
#
# Kills the caller entity and all of its passengers, or \"children\" if you were
# to think of entities as node trees.

execute as @s on passengers run function std:entity/kill_self_and_passengers
kill @s