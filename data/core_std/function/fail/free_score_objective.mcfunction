#>core_std:memory/free_score_objective
#
# Removes a specific score objective.
#
# @authors scrmbl-egg
# @input
#   objective: #[objective] string
#       Score objective that will be removed.

$scoreboard objectives remove $(objective)
