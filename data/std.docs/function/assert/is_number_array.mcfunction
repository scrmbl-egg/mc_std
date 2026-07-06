#>std.docs:assert/is_number_array
#
# Checks if an NBT path is a number array.
#
# NOTE:
# This function may fail even when the specified collection is full of numeric
# elements. This function searches for the initial character that determines
# the type of the number array, not the elements themselves.
#
# NOT DETECTED: [1, 2, 3, 4], [1.2f, 2, 3.0]
# DETECTED: [I; 1, 2], [B; 1b, 2b], [L; 1l, 2l]
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the alleged array or list is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the alleged array or list that is located.
# @returns
#   Result: 0 if it's not a number array, 1 if it's a byte array, 2 if it's an
#       int array, and 3 if it's a long array.
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:assert/is_number_array",color:"green"}, \
    "\n\n", \
    "Checks if an NBT path is a number array.", \
    "\n\n", \
    "NOTE:\n", \
    "This function may fail even when the specified collection is full of ", \
    "numeric elements. This function searches for the initial character ", \
    "that determines the type of the number array, not the elements ", \
    "themselves.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"array_storage: ",color:"yellow"}, \
    {text:"#[id=\"storage\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage where the alleged array or list is located.", \
    "\n", \
    {text:"array_nbt: ",color:"yellow"}, \
    {text:"#[nbt_path=minecraft:storage[[array_storage]]] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage NBT path where the alleged array or list is located.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "0 if it's not a number array, 1 if it's a byte array, 2 if it's an int ", \
    "array, and 3 if it's a long array.", \
]
