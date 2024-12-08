# function name
tellraw @a ["",{"text":"[mc_std]: ","bold":true,"color":"gold"},{"text":"std:aabb/cast","color":"green"},"\n"]

# description
tellraw @a ["","Casts an invisible axis-aligned bounding box that can detect entities. This box is not cast from two points in space, but rather, the center of its position, so when the caller specifies, for example, a Y size of 1, the box will expand 0.5 units above its center, and other 0.5 units under.\n\nWhen the bounding box detects an entity inside of its collider, it executes a command specified by the caller.","\n"]

# parameters
tellraw @a ["","Parameters:","\n"]

tellraw @a ["",{"text":"selector","color":"yellow"}," -- Entity selector."]
tellraw @a ["",{"text":"dx","color":"yellow"}," -- X size."]
tellraw @a ["",{"text":"dy","color":"yellow"}," -- Y size."]
tellraw @a ["",{"text":"dz","color":"yellow"}," -- Z size."]
tellraw @a ["",{"text":"cmd","color":"yellow"}," -- Command executed when a 'selector' entity is detected."]
