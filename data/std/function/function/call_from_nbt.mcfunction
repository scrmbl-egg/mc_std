#>std:function/call_from_nbt
#
# Calls a function from a name or tag stored in a storage.
#
# @authors scrmbl-egg
# @input
#   function_storage: #[id="storage"] string
#       Storage where the function name or tag is stored.
#   function_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the function name or tag is stored.
# @returns
#   Result: same as the specified function.

# get function name
$data modify storage std:temp func_call.function \
    set from storage $(function_storage) $(function_nbt)

# setup previous return_value parameters
data modify storage std:temp func_call.return set value { \
    score_objectives:[], \
    nbt_paths:[{storage:"std:temp",nbt:"func_call"}], \
    entity_selectors:[], \
}

# call function
execute store result storage std:temp func_call.return.value int 1 \
    run \
    function std:function/call with storage std:temp func_call

return \
    run \
    function std:return_value with storage std:temp func_call.return
# this function frees leftover data
