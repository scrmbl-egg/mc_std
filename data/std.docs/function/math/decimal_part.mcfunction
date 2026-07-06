#>std.docs:math/decimal_part
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:math/decimal_part",color:"green"}, \
    "\n\n", \
    "Gets the decimal part of a number, subtracting the integer part.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"value: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Number whose decimal part is going to be extracted.", \
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
    "The decimal part of the number in the specified location.", \
    "\n\n", \
    {text:"Returns:",color:"gold"}, \
    "\n", \
    "0 when number is an integer with no decimal part, 1 if there was a ", \
    "decimal part", \
]

