#>docs_std:function/call
#
# Calls a function from a name or tag.
#
# @input
#   function: #[id="function"] string
#       Function name or tag that will be called.
# @returns
#   Result: same as the specified function.
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:function/call",color:"green"}, \
    "\n\n", \
    "Calls a function from a name or tag.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"function: ",color:"yellow"}, \
    {text:"#[id=\"function\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Function name or tag that will be called.", \
    "\n", \
    {text:"args: ",color:"yellow"}, \
    {text:"any\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "SNBT structure containing the arguments of the function.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "same as the specified function.", \
]

