#>docs_std:math/min
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:math/min",color:"green"}, \
    "\n\n", \
    "Returns the smallest of two numbers.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"first: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "First number.", \
    "\n", \
    {text:"second: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Second number.", \
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
    "The smallest number in the specified NBT path.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "0 if the numbers are equal, 1 if 'first' is the smallest, 2 if 'second is the smallest.'", \
]
