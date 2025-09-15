#>std:entity/player/gamemode/get_value
#
# Returns the player's current game mode as an integer value.
#
# @context player
# @returns
#   Result: 0 if survival, 1 if creative, 2 if adventure, 3 if spectator.

# survival
execute if entity @s[gamemode=survival] run return 0

# creative
execute if entity @s[gamemode=creative] run return 1

# adventure
execute if entity @s[gamemode=adventure] run return 2

# spectator
execute if entity @s[gamemode=spectator] run return 3
