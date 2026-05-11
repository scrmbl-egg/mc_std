#>std:entity/kill_selector
#
# Kills entities from a selector. The selected entities die along with their
# passengers.
#
# @authors scrmbl-egg
# @input
#   selector: #[entity] #[selector] string
#       Entity selector which will determine the entities that will be killed.

$execute as $(selector) \
    at @s \
    run \
    function std:entity/kill_self_and_passengers
