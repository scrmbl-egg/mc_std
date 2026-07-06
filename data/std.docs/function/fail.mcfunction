#>docs_std:fail
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:fail",color:"green"}, \
    "\n\n", \
    "A function that always fails, and removes/deletes all temporary data ", \
    "that the user needs to remove.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"score_objectives: ",color:"yellow"}, \
    {text:"[#[objective] string]\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "List of score objectives to be deleted.", \
    "\n", \
    {text:"nbt_paths: ",color:"yellow"}, \
    {text:"[struct {storage: #[id=\"storage\"] string, nbt: #[nbt_path=minecraft:storage[[storage]]] string}]\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "List of storage NBT paths to be deleted.", \
    "\n", \
    {text:"entity_selectors: ",color:"yellow"}, \
    {text:"[#[entity] #[selector] string]\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "List of entity selectors that will be killed, along with their passengers.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Success: ",color:"gold"}, \
    "never, this is so that the failure can be propagated.", \
]

