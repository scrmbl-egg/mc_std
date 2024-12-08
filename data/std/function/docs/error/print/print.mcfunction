# function name
tellraw @a ["",{"text":"[mc_std]: ","bold":true,"color":"gold"},{"text":"std:error/print","color":"green"},"\n"]

# description
tellraw @a ["","Prints an error message into the game chat. The caller must specify which specific function has caused an error, and detail the *why* in the message.","\n"]

# parameters
tellraw @a ["","Parameters:","\n"]

tellraw @a ["",{"text":"fn","color":"yellow"}," -- Function that failed."]
tellraw @a ["",{"text":"msg","color":"yellow"}," -- Error message."]