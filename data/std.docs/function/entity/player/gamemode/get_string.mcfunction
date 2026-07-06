#>docs_std:entity/player/gamemode/get_string
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:entity/player/gamemode/get_string",color:"green"}, \
    "\n\n", \
    "Returns the player's current game mode as a string. If only the ", \
    "integer value is wanted, do one of these commands:", \
    "\n\n", \
    [ \
        {text:"data get entity ",color:"gray"}, \
        {text:"@s ",color:"aqua"}, \
        {text:"playerGameType",color:"yellow"}, \
    ], \
    "\n", \
    [ \
        {text:"data get entity ",color:"gray"}, \
        {text:"@s ",color:"aqua"}, \
        {text:"previousPlayerGameType",color:"yellow"}, \
    ], \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"out_storage: ",color:"yellow"}, \
    {text:"#[id=\"storage\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage where the result will be stored.", \
    "\n", \
    {text:"out_nbt: ",color:"yellow"}, \
    {text:"#[nbt_path=minecraft:storage[[out_storage]]] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage NBT path where the result will be stored.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "0 if survival, 1 if creative, 2 if adventure, 3 if spectator.", \
]
