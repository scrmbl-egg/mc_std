#>docs_std:repeat
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:repeat",color:"green"}, \
    "\n\n", \
    "Repeats a command a specified amount of times. The name of a new score ", \
    "objective and a score holder must be specified, so that they can store ", \
    "the iteration count and allow nested loops.", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"score_objective: ",color:"yellow"}, \
    {text:"#[objective] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "New score objective where the current iteration will be stored. Will ", \
    "be removed after operations are completed. Useful for nested loops.", \
    "\n", \
    {text:"score_holder: ",color:"yellow"}, \
    {text:"#[score_holder] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Score holder.", \
    "\n", \
    {text:"times: ",color:"yellow"}, \
    {text:"int @ 0..\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Amount of times the command will be executed..", \
    "\n", \
    {text:"command: ",color:"yellow"}, \
    {text:" #[command(max_length=32500)] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Command executed each iteration.", \
]
