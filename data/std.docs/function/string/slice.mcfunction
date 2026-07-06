#>docs_std:string/slice
#
# Dynamically slices a string.
#
# @authors scrmbl-egg
# @input
#   string: string
#       String which is going to be sliced.
#   start: int
#       Start index of the slice of the string.
#   end: int
#       End index of the slice of the string.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:string/slice",color:"green"}, \
    "\n\n", \
    "Dynamically slices a string.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"string: ",color:"yellow"}, \
    {text:"string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "String which is going to be sliced.", \
    "\n", \
    {text:"start: ",color:"yellow"}, \
    {text:"int\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Start index of the slice of the string.", \
    "\n", \
    {text:"end: ",color:"yellow"}, \
    {text:"int\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "End index of the slice of the string.", \
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
    "The sliced string in the specified location.", \
]
