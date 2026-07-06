#>std.docs:array/get_element
tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"std:array/get_element",color:"green"}, \
    "\n\n", \
    "Gets an element of an array or list. This function does checks to ", \
    "ensure the passed data location is an array and also returns a result ", \
    "if an error occurs. If you're completely sure there's an array or list", \
    "at the specified location, see ", \
    { \
        text:"std:array/get_element_unsafe", \
        color:"green", \
        click_event:{ \
            action:"run_command", \
            command:"function std.docs:array/get_element_unsafe", \
        }, \
        hover_event:{ \
            action:"show_text", \
            value:"See docs.", \
        }, \
    }, \
    ".", \
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
    {text:"source_path: ",color:"yellow"}, \
    {text:"(any | int)\n",color:"#3ad8cb"}, \
    {text:"└ ",color:"yellow"}, \
    "Source NBT. Can be a structure to query data, or an integer to specify ", \
    "the array or list index.", \
    "\n\n", \
    "Writes:", \
    "\n", \
    "Array or list element at specified destination.", \
    "\n\n", \
    "Returns:", \
    "\n", \
    {text:"Result: ",color:"gold"}, \
    "1 if element is retrieved, 0 if there was a failure.", \
]
