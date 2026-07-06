#>docs_std:array/to_nbt
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:array/to_nbt",color:"green"}, \
    "\n\n", \
    "Converts an array or list into an NBT component whose keys match the indeces ", \
    "of the original array or list.", \
    "\n\n", \
    "Examples:", \
    "\n", \
    "[1.]\n", \
    "- Array: [L; 22l, 4l, 55l]\n", \
    "- std:array/to_nbt {...index_prefix:\"index_\"}\n", \
    "- Output: {0:22l,1:4l,2:55l}\n\n", \
    "[2.]\n", \
    "- List: [\"hello\", \"beautiful\", \"world!\"]\n", \
    "- std:array/to_nbt {...index_prefix:\"\"}\n", \
    "- Output: {index_0:\"hello\",index_1:\"beautiful\",index_2:\"world!\"}", \
    "\n\n", \
    "Parameters:", \
    "\n", \
    {text:"array_storage: ",color:"yellow"}, \
    {text:"#[id=\"storage\"] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage where the array or list is located.", \
    "\n", \
    {text:"array_nbt: ",color:"yellow"}, \
    {text:"#[nbt_path=minecraft:storage[[array_storage]]] string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Storage NBT path where the array or list is located.", \
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
    "\n", \
    {text:"index_prefix: ",color:"yellow"}, \
    {text:"string\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Prefix that is going to be applied to the NBT keys that indicate the ", \
    "original array index. Can be left empty if the user wants the keys ", \
    "to be just the index numbers.", \
    "\n\n", \
    "Writes:", \
    "\n", \
    "The constructed NBT component in the specified location.", \
]
