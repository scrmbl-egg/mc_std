#>docs_std:math/lerp
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:math/lerp",color:"green"}, \
    "\n\n", \
    "Linearly interpolates between two values by the factor defined in", \
    "'weight'. The operation follows this formula:\n\n", \
    "lerp(from, to, weight) = from + (to - from) * weight", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"from: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "First value of the interpolation.", \
    "\n", \
    {text:"to: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Second value of the interpolation.", \
    "\n", \
    {text:"weight: ",color:"yellow"}, \
    {text:"double\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Weight of the interpolation. This number should usually be between 0.0 ", \
    "and 1.0, but it can be out of that range to represent extrapolation.", \
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
    "Interpolated value (double) in the specified NBT location", \
]

