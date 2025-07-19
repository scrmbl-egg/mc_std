#>core_std:load
#
# @authors scrmbl-egg, MARO-445

# init constants
function core_std:storage/init_consts

# init global variables if not defined
execute unless data storage std:main vars \
    run \
    function core_std:storage/init_vars

## __ KEEP AT BOTTOM OF FILE __
# reload message
execute if predicate core_std:should_show_message \
    run \
    tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"gold"}, \
    "Reloaded!", \
]
