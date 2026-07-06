#>docs_std:array/foreach
#
# Executes a function for each element of an array or list, binding custom
# macros as parameters for said function.
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array or list that will be iterated through is
#       located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array or list that will be iterated through
#       is located.
#   function: #[id="function"] string
#       Function that is going to be executed for each element of the array or
#       list.
#   function_storage: (#[id="storage"] string | "std:none")
#       Function storage that the function will use, see 'function_storage_nbt'.
#   function_storage_nbt: (#[nbt_path=minecraft:storage[[function_storage]]] string | "none")
#       Function storage NBT path that contains the arguments that will be
#       passed to the function.
#   element_macro: string
#       Name of the function macro that will represent the current element.
#   index_macro: string
#       Name of the function macro that will represent the current iteration
#       index.
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:array/foreach",color:"green"}, \
    "\n\n", \
    "Executes a function for each element of an array or list, binding custom ", \
    "macros as parameters for said function.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"array_storage: ",color:"yellow"}, \
    {text:"#[id=\"storage\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage where the array or list that will be iterated through is ", \
    "located.", \
    "\n", \
    {text:"array_nbt: ",color:"yellow"}, \
    {text:"#[nbt_path=minecraft:storage[[array_storage]]] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage NBT path where the array or list that will be iterated through", \
    "is located.", \
    "\n", \
    {text:"function: ",color:"yellow"}, \
    {text:"#[id=\"function\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Function that is going to be executed for each element of the array or ", \
    "list.", \
    "\n", \
    {text:"function_storage: ",color:"yellow"}, \
    {text:"(#[id=\"storage\"] string | \"std:none\")\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Function storage that the function will use, see ", \
    {text:"function_storage_nbt",color:"yellow"}, \
    ".", \
    "\n", \
    {text:"function_storage_nbt: ",color:"yellow"}, \
    {text:"(#[nbt_path=minecraft:storage[[function_storage]]] string | \"none\")\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Function storage NBT path that contains the arguments that will be ", \
    "passed to the function.", \
    "\n", \
    {text:"element_macro: ",color:"yellow"}, \
    {text:"string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Name of the function macro that will represent the current element.", \
    "\n", \
    {text:"index_macro: ",color:"yellow"}, \
    {text:"string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Name of the function macro that will represent the current iteration index.", \
]
