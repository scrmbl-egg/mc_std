#>docs_std:string/equals
#
# Checks if two strings are equal.
#
# @authors scrmbl-egg
# @input
#   first: string
#       First string to check.
#   second: string
#       Second string to check.
# @returns
#   Result: 1 if the two strings are equal, 0 if not.
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:string/equals",color:"green"}, \
    "\n\n", \
    "Checks if two strings are equal.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"first: ",color:"yellow"}, \
    {text:"string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "First string to check.", \
    "\n", \
    {text:"second: ",color:"yellow"}, \
    {text:"string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Second string to check.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "1 if the two strings are equal, 0 if not.", \
]
