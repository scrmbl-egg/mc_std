#>core_std:assert/fail
#
# @authors scrmbl-egg
# @returns
#   Success: always fails.

# free memory
scoreboard objectives remove __std.assert
data remove storage std:temp assert

# propagate failure
return fail
