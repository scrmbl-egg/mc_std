#>docs_std:assert/is_array
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:assert/is_array",color:"green"}, \
    "\n\n", \
    "Checks if an NBT path is an array or list.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"array_storage: ",color:"yellow"}, \
    {text:"#[id=\"storage\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage where the alleged array or list is located.", \
    "\n", \
    {text:"array_nbt: ",color:"yellow"}, \
    {text:"#[nbt_path=minecraft:storage[[array_storage]]] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage NBT path where the alleged array or list is located.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Success: ",color:"gold"}, \
    "if the specified NBT path is an array or list.", \
]
