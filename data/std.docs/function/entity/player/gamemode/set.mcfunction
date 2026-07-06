#>std.docs:entity/player/gamemode/set
#
# Sets the player's current game mode. Accepts both string and integer value
# as parameter.
#
# @input
#   gamemode: ("survival" | "creative" | "adventure" | "spectator" | int @ 0..3)
#       Game mode name or integer code.
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:entity/player/gamemode/set",color:"green"}, \
    "\n\n", \
    "Sets the player's current game mode. Accepts both string and integer ", \
    "value as parameter.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"gamemode: ",color:"yellow"}, \
    {text:"(\"survival\" | \"creative\" | \"adventure\" | \"spectator\" | int @ 0..3)\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Game mode name or integer code.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "0 if survival, 1 if creative, 2 if adventure, 3 if spectator.", \
]
