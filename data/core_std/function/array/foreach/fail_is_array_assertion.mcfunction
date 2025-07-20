#>core_std:array/foreach/fail_is_array_assertion
#
# @authors scrmbl-egg
# @returns
#   Success: always fails.

# delete success tracking objective
scoreboard objectives remove __std.foreach

# propagate error
return fail
