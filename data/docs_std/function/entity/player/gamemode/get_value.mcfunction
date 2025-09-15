#>docs_std:entity/player/gamemode/get_value
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:entity/player/gamemode/get_value",color:"green"}, \
    "\n\n", \
    "Returns the player's current game mode as an integer value..", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "0 if survival, 1 if creative, 2 if adventure, 3 if spectator.", \
]
