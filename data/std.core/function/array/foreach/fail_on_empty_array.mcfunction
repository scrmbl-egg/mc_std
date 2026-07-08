#>std.core:array/foreach/fail_on_empty_array
#
# @authors scrmbl-egg

# free memory
data remove storage std:temp foreach

# remove scoreboard
scoreboard objectives remove __std.foreach

# propagate error
return fail
