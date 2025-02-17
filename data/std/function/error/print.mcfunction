#>std:error/print
# Prints an error message into the game chat. The caller must specify which
# specific function has caused an error, and detail the *why* in the message.
# 
# @authors scrmbl-egg
# @params
    # fn    -- Function that failed.
    # msg   -- Error message.

$tellraw @a ["",{"text":"[mc_std] ","color":"gold","bold":true},{"text":"ERROR: ","color":"red","bold":true},{"text":"In function '$(fn)': $(msg)","color":"red"}]
