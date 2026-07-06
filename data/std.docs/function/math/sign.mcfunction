#>std.docs:math/sign
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:math/sign",color:"green"}, \
    "\n\n", \
    "Returns a number that represents the sign of the passed value.", \
    "\n\n", \
    "NOTES:\n", \
    "Beware of accidentally passing a string, since it can produce ", \
    "unexpected results.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"value: ",color:"yellow"}, \
    {text:"(byte | short | int | long | float | double)\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Number whose sign is going to be checked.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "0 if 'value' is 0, 1 if 'value' is positive, -1 if 'value' is negative.", \
]
