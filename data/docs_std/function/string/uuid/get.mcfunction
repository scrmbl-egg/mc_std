#>docs_std:string/uuid/get
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:string/uuid/get",color:"green"}, \
    "\n\n", \
    "This function returns an entity's UUID separated by underscores. ", \
    "For example, if the UUID is [I;-111,222,-333,-444], the result is ", \
    "\"-111_222_-333_-444\", this is useful when using tags with macros.", \
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
    "Writes:", \
    "\n", \
    "UUID string at specified NBT path.", \
]
