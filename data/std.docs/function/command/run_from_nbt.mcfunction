#>docs_std:command/run_from_nbt
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:command/run_from_nbt",color:"green"}, \
    "\n\n", \
    "Runs a command from a string stored in a storage location. Useful for ", \
    "event systems, where some behaviour i.e. commands (which are usually ", \
    "function calls) are defined somewhere in memory, and called when some ", \
    "conditions are met.", \
    "\n\n", \
    "NOTES:\n", \
    "Don't save command strings with the starting \"/\" character, since ", \
    "commands with this starting character don't work in .mcfunction files.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"command_storage: ",color:"yellow"}, \
    {text:"#[id=\"storage\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage where the command that will be executed is located.", \
    "\n", \
    {text:"command_nbt: ",color:"yellow"}, \
    {text:"#[nbt_path=minecraft:storage[[command_storage]]] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage NBT path where the command that will be executed is located.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "same as the specified command.", \
]
