#>docs_std:function/call_from_nbt
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:function/call_from_nbt",color:"green"}, \
    "\n\n", \
    "Calls a function from a name or tag stored in a storage.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"function_storage: ",color:"yellow"}, \
    {text:"#[id=\"storage\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage where the function name or tag is stored.", \
    "\n", \
    {text:"function_nbt: ",color:"yellow"}, \
    {text:"#[nbt_path=minecraft:storage[[function_storage]]] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage NBT path where the function name or tag is stored.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "same as the specified function.", \
]
