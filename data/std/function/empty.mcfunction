#>std:empty
# Intentionally blank function.
#
# USE CASES:
#
# Use this function when any function, either from this datapack or any other,
# needs a function reference as a parameter, but for special cases where it's
# not necessary for said function reference to do any operations.
#
# EXAMPLES:
#
# When using raycasts, you can decide functions that are executed in different
# steps, for example, each raycast step, when finding an entity, or when
# colliding with a block. When it is desired for the raycast to do nothing when
# these conditions are met, this function can be used.
#
# function std:ray/cast {on_step_cmd:"function std:empty",...}
#
# @authors scrmbl-egg
