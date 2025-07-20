#>docs_std:empty
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:empty",color:"green"}, \
    "\n\n", \
    "Empty function. Use this function when any function, either from this ", \
    "datapack or any other, needs a command as a parameter, but for special ", \
    "cases where no operations are needed", \
    "\n\n", \
    "Example: ", \
    "\n\n", \
    "function std:aabb/cast_centered {on_detection_command:\"function std:empty\",...}", \
]
