#>std.docs:math/abs
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:math/abs",color:"green"}, \
    "\n\n", \
    "Gets the absolute value of a passed number", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"value: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Number whose absolute value is going to be calculated.", \
    "\n", \
    {text:"out_storage: ",color:"yellow"}, \
    {text:"#[id=\"storage\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage where the result will be stored.", \
    "\n", \
    {text:"out_nbt: ",color:"yellow"}, \
    {text:"#[nbt_path=minecraft:storage[[out_storage]]] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage NBT path where the result will be stored.", \
    "\n\n", \
    "Writes:", \
    "\n", \
    "The absolute value in the specified location.", \
]
