#>docs_std:math/clamp
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:math/clamp",color:"green"}, \
    "\n\n", \
    "Clamps a value between a minimum and a maximum value.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"value: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Number to be clamped.", \
    "\n", \
    {text:"min: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Minimum value.", \
    "\n", \
    {text:"max: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Maximum value.", \
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
    "Clamped number (double) in the specified destination.", \
]
