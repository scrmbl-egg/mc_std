# function name
tellraw @a ["",{"text":"[mc_std]: ","bold":true,"color":"gold"},{"text":"std:aabb/cast_from_consts","color":"green"},"\n"]

# description
tellraw @a ["","Casts an invisible axis-aligned bounding box that can detect entities. This box is not cast from two points in space, but rather, the center of its position, so when the caller specifies, for example, a Y size of 1, the box will expand 0.5 units above its center, and other 0.5 units under.\n\nWhen the bounding box detects an entity inside of its collider, it executes a command specified by the caller.\n\nThis alternative function is designed to accomodate data from different storages.","\n"]

# parameters
tellraw @a ["","Parameters:","\n"]

tellraw @a ["",{"text":"selector","color":"yellow"}," -- Entity selector."]
tellraw @a ["",{"text":"dx_path","color":"yellow"}," -- X size path."]
tellraw @a ["",{"text":"dy_path","color":"yellow"}," -- Y size path."]
tellraw @a ["",{"text":"dz_path","color":"yellow"}," -- Z size path."]
tellraw @a ["",{"text":"dx_st","color":"yellow"}," -- Storage that stores 'dx_path'."]
tellraw @a ["",{"text":"dy_st","color":"yellow"}," -- Storage that stores 'dy_path'."]
tellraw @a ["",{"text":"dz_st","color":"yellow"}," -- Storage that stores 'dz_path'."]
tellraw @a ["",{"text":"cmd","color":"yellow"}," -- Command executed when a 'selector' entity is detected."]