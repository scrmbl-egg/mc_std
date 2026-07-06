#>docs_std:assert/is_string
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:assert/is_string",color:"green"}, \
    "\n\n", \
    "Checks if an NBT path is a string.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"string_storage: ",color:"yellow"}, \
    {text:"#[id=\"storage\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage where the alleged string is located.", \
    "\n", \
    {text:"string_nbt: ",color:"yellow"}, \
    {text:"#[nbt_path=minecraft:storage[[string_storage]]] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage NBT path where the alleged string is located.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Success: ",color:"gold"}, \
    "if the specified NBT path is a string.", \
]
