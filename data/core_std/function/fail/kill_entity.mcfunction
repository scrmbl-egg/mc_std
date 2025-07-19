#>core_std:fail/kill_entity
#
# Kills a temporary entity for the std:fail function along with its passengers.
#
# @authors scrmbl-egg
# @input
#   selector: #[entity] #[selector] string
#       Entity selector that will be killed along with its passengers.

$execute as $(selector) at @s run function std:entity/kill_self_and_passengers
