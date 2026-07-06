#>std.docs:aabb/cast_centered
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:aabb/cast_centered",color:"green"}, \
    "\n\n", \
    "Casts an invisible axis-aligned bounding box that can detect entities. When ", \
    "the bounding box detects an entity inside of its collider, it executes a ", \
    "command specified by the caller.", \
    "This box is not cast from two points in space, but rather, the center of a ", \
    "position, so when the caller specifies, for example, a Y size (size[1]) of 1, ", \
    "the box will expand 0.5 units above its center, and other 0.5 units under. ", \
    "Due to this implementation it is NOT recommended to use this function in ", \
    "isolation, but instead, in an 'execute' command that specifies an entity's ", \
    "or absolute position.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"entity_selector: ",color:"yellow"}, \
    {text:"#[entity] #[selector] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Selector of the entity (or entities) whose collider(s) will trigger ", \
    "the command execution if they are inside the bounding box.", \
    "\n", \
    {text:"on_detection_command: ",color:"yellow"}, \
    {text:"#[command(max_length=32500)] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Command that will be executed when the bounding box detects a specified ", \
    "entity.", \
    "\n", \
    {text:"size: ",color:"yellow"}, \
    {text:"[double] @ 3\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "3D vector that describes the size of the box.", \
]
