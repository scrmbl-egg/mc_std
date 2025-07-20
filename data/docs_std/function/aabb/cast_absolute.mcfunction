#>docs_std:aabb/cast_absolute
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:aabb/cast_absolute",color:"green"}, \
    "\n\n", \
    "Casts an invisible axis-aligned bounding box that can detect entities. When", \
    "the bounding box detects an entity inside of its collider, it executes a", \
    "command specified by the caller.", \
    "\n\n", \
    "This box is cast from two points in space which must be specified in the", \
    "parameters.", \
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
    {text:"origin: ",color:"yellow"}, \
    {text:"[double] @ 3\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "3D coordinate that defines the origin corner of the axis-aligned bounding box.", \
    "\n", \
    {text:"end: ",color:"yellow"}, \
    {text:"[double] @ 3\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "3D coordinate that defines the opposite corner to the origin of the ", \
    "axis-aligned bounding box.", \
]
