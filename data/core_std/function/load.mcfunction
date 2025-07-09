#>core_std:load
#
# @authors scrmbl-egg, MARO-445

# init constants
function core_std:storage/init_consts

## __ KEEP AT BOTTOM OF FILE __
# reload message
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"gold"}, \
    "Reloaded!", \
]
