#>docs_std:math/multiply
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:math/multiply",color:"green"}, \
    "\n\n", \
    "Multiplies a number by another. Keeps precision for floating point number ", \
    "types (float & double).", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"first: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "First number of the multiplication, or multiplicand.", \
    "\n", \
    {text:"second: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Second number of the multiplication, or multiplier.", \
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
    "The product (double) of the multiplication in the specified NBT location.", \
]
