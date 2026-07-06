#>docs_std:return_value
#
# A function that returns the input value, and removes/deletes all temporary
# data that the user needs to remove. It is recommended to use this function
# with the 'return run' command syntax.
#
# @authors scrmbl-egg
# @input
#   value: int
#       Value that the function is going to return.
#   score_objectives: [#[objective] string]
#       List of score objectives to be deleted.
#   nbt_paths: [struct {storage: #[id="storage"] string, nbt: #[nbt_path=minecraft:storage[[storage]]] string}]
#       List of storage NBT paths to be deleted.
#   entity_selectors: [#[entity] #[selector] string]
#       List of entity selectors that will be killed, along with their
#       passengers.
# @returns
#   Result: the number specified in the 'value' parameter.
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:return_value",color:"green"}, \
    "\n\n", \
    "A function that returns the input value, and removes/deletes all temporary ", \
    "data that the user needs to remove. It is recommended to use this function ", \
    "with the 'return run' command syntax.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"value: ",color:"yellow"}, \
    {text:"int\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Value that the function is going to return.", \
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
    {text:"Result: ",color:"gold"}, \
    "the number specified in the 'value' parameter.", \
]
