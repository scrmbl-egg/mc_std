# function name
tellraw @a ["",{"text":"[mc_std]: ","bold":true,"color":"gold"},{"text":"std:strings/uuid/get","color":"green"},"\n"]

# description
tellraw @a ["","This function returns an entity's UUID separated by underscores. For example, if the UUID is:\n\n[I;-111111111,222222222,-3333333333,-4444444444],\n\nthe result is:\n\n\"-111111111_222222222_-3333333333_-4444444444\",\n\nthis is useful when using tags with macros.","\n"]

# parameters
tellraw @a ["","Parameters:","\n"]

tellraw @a ["",{"text":"dest_path","color":"yellow"}," -- Destination path."]
tellraw @a ["",{"text":"dest_st","color":"yellow"}," -- Destination storage."]