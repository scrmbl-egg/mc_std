#>docs_std:repeat/run
# function name
tellraw @a ["",{"text":"[mc_std]: ","bold":true,"color":"gold"},{"text":"std:repeat/run","color":"green"},"\n"]

# description
tellraw @a ["","Repeats a command a specified amount of times. The name of a new score objective and a score holder must be specified, where the iteration count will be stored.","\n"]

# parameters
tellraw @a ["","Parameters:","\n"]

tellraw @a ["",{"text":"score_obj","color":"yellow"}," -- New score objective where the current iteration will be stored. Will be removed after operations are completed. Useful for nested loops."]
tellraw @a ["",{"text":"score_holder","color":"yellow"}," -- Name of the score holder."]
tellraw @a ["",{"text":"times","color":"yellow"}," -- Amount of times the command will be executed."]
tellraw @a ["",{"text":"cmd","color":"yellow"}," -- Command executed each iteration."]
