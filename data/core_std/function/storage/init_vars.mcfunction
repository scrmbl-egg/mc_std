#>core_std:storage/init_vars
#
# Initializes all global variables in the datapack/library.
#
# @authors scrmbl-egg

# reset
data remove storage std:main vars

## GLOBAL VARIABLES

data modify storage std:main vars set value { \
    show_reload_message:true, \
}
