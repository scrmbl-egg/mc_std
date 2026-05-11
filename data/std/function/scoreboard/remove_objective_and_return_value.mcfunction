#>std:scoreboard/remove_objective_and_return_value
#
# Dynamically removes a scoreboard objective and returns a value right after so
# that it can be propagated. It is recommended to use this function with the
# `return run` syntax.
#
# @authors scrmbl-egg
# @input
#   objective: #[objective] string
#       Name of the scoreboard objective that is going to be removed.
#   value: int
#       Value returned by this function.
# @returns
#   Result: the number specified in the `value` parameter.

$scoreboard objectives remove $(objective)

$return $(value)
