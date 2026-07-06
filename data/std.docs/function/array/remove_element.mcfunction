#>std.docs:array/remove_element
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:array/remove_element",color:"green"}, \
    "\n\n", \
    "Removes an element from the array or list.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"array_storage: ",color:"yellow"}, \
    {text:"#[id=\"storage\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage where the array or list is located.", \
    "\n", \
    {text:"array_nbt: ",color:"yellow"}, \
    {text:"#[nbt_path=minecraft:storage[[array_storage]]] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage NBT path where the array or list is located.", \
    "\n", \
    {text:"source_path: ",color:"yellow"}, \
    {text:"(any | int)\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Source NBT. Can be a structure to query data, or an integer to specify ", \
    "the array or list index.", \
]
