# doc:
#
# Repeats a command a specified amount of times. The name of a new score
# objective and a score holder must be specified, so that they can store
# the iteration count and allow nested loops.
#
# params:
    # score_obj     -- New score objective where the current iteration will be 
    #                  stored. Will be removed after operations are completed.
    #                  Useful for nested loops.
    # score_holder  -- Name of the score holder.
    # times         -- Amount of times the command will be executed.
    # cmd           -- Command executed each iteration.

$scoreboard objectives add $(score_obj) dummy

$data modify storage minecraft:std local_score_objective set value '$(score_obj)'
$data modify storage minecraft:std local_score_holder set value '$(score_holder)'
$data modify storage minecraft:std local_command set value '$(cmd)'

$scoreboard players set $(score_holder) $(score_obj) 0
$scoreboard players set $std_local_times $(score_obj) $(times)

# NOTE: "execute if/unless entity" detects whether or not an entity is running
# this command. This is so that, if there's no entity running this command, the
# server will take care of it.
  
# execute recursive function
# in:
    # local_score_objective
    # local_score_holder
    # local_command
execute if entity @s run function std:repeat/internal/iterate_st with storage minecraft:std
execute unless entity @s run function std:repeat/internal/iterate_st with storage minecraft:std

# free memory
$scoreboard objectives remove $(score_obj)
data remove storage minecraft:std local_score_objective
data remove storage minecraft:std local_score_holder
data remove storage minecraft:std local_command