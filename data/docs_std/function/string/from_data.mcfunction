#>docs_std:string/from_data
#
# Converts any specified piece of data to a string.
#
# @authors scrmbl-egg
# @input
#   data: any
#       Piece of data that will be converted to a string, can be of any type.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   A string in the specified destination.
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
    "A string in the specified destination.", \
]
