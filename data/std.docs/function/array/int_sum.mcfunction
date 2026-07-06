#>std.docs:array/int_sum
#
# Sums all elements of an int array.
#
# NOTE:
# This function also works with byte arrays, however, it doesn't allow long
# arrays since 64-bit number operations are not supported in Minecraft.
#
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array or list that will be iterated through is
#       located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array or list that will be iterated through
#       is located.
# @returns
#   Result: sum of the elements of the number array.
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:array/int_sum",color:"green"}, \
    "\n\n", \
    "Sums all elements of an int array.", \
    "\n\n", \
    "NOTE:\n", \
    "This function also works with byte arrays, however, it doesn't allow for long arrays since 64-bit number operations are not supported in Minecraft.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"array_storage: ",color:"yellow"}, \
    {text:"#[id=\"storage\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage where the array that will be iterated through is located.", \
    "\n", \
    {text:"array_nbt: ",color:"yellow"}, \
    {text:"#[nbt_path=minecraft:storage[[array_storage]]] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage NBT path where the array that will be iterated through is located.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "sum of the elements of the number array.", \
]
