#>std.docs:string/from_data
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:string/from_data",color:"green"}, \
    "\n\n", \
    "Converts any specified piece of data to a string.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"data: ",color:"yellow"}, \
    {text:"any\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Piece of data that will be converted to a string, can be of any type.", \
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
    "A string representing the data in the specified destination.", \
]
