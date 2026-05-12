#>std:scoreboard/remove_objective
#
# Dynamically removes a scoreboard objective and returns failure right after so
# that it can be propagated. It is recommended to use this function with the
# `return run` syntax.
#
# @authors scrmbl-egg
# @input
#   objective: #[objective] string
#       Name of the scoreboard objective that is going to be removed.

$scoreboard objectives remove $(objective)
