#>std:function/call_from_nbt
#
# Calls a function from a name or tag stored in a storage.
#
# @authors scrmbl-egg
# @input
#   function_storage: #[id="storage"] string
#       Storage where the function name or tag is stored.
#   function_nbt: #[nbt_path=minecraft:storage[[function_storage]]] string
#       Storage NBT path where the function name or tag is stored.
# @returns
#   Result: same as the specified function.

# get function name
$data modify storage std:temp func_call.function \
    set from storage $(function_storage) $(function_nbt)

# setup previous return_value parameters
data modify storage std:temp func_call.return set value { \
    value:0, \
    storage:"std:temp", \
    nbt:"func_call", \
}

# call function
execute store result storage std:temp func_call.return.value \
    int 1 \
    run \
    function std:function/call with storage std:temp func_call

return run \
    function core_std:util/free_data_and_return \
    with storage std:temp func_call.return
# this function frees leftover data
