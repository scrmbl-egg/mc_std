#>docs_std:array/map/run
# function name
tellraw @a ["",{"text":"[mc_std]: ","bold":true,"color":"gold"},{"text":"std:array/map/run","color":"green"},"\n"]

# description
tellraw @a ["","Executes a function for each element of an array, binding a custom macro as a parameter for said function.","\n"]

# parameters
tellraw @a ["","Parameters:","\n"]

tellraw @a ["",{"text":"arr_st","color":"yellow"}," -- Array storage."]
tellraw @a ["",{"text":"arr_path","color":"yellow"}," -- Array path."]
tellraw @a ["",{"text":"fn","color":"yellow"}," -- Function that will be executed for each element of the array."]
tellraw @a ["",{"text":"fn_st","color":"yellow"}," -- Storage that the 'fn' function will use."]
tellraw @a ["",{"text":"elem_macro","color":"yellow"}," -- Macro that the 'fn' function will use as the current element in the array."]
