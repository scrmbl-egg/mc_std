#>docs_std:command/run
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:command/run",color:"green"}, \
    "\n\n", \
    "Runs a command from a string. Useful for ", \
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
    {text:"command: ",color:"yellow"}, \
    {text:"#[command(max_length=32500)] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Command string that is going to be executed.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "same as the specified command.", \
]
