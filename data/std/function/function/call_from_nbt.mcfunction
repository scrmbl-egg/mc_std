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
#   args: any
#       SNBT structure containing the arguments of the function.
# @returns
#   Result: same as the specified function.

# setup temp data
$data modify storage std:temp call_nbt set value { \
    call_args:{ \
        function:"", \
        args:$(args), \
    }, \
    free_data_and_return_args:{ \
        storage:"std:temp", \
        nbt:"call_nbt", \
        value:0, \
    }, \
}
# `return_value` is not specified because it can be null, if it exists, it will
# be copied in `free_data_and_return_args.value`

# get function name
$data modify storage std:temp call_nbt.call_args.function \
    set from storage $(function_storage) $(function_nbt)

# run function and try to store result
execute store result storage std:temp call_nbt.return_value \
    int 1 \
    run \
    function std:function/call \
    with storage std:temp call_nbt.call_args

# if `return_value` was stored, free and return value through helper function
execute if data storage std:temp call_nbt.return_value \
    run \
    data modify storage std:temp call_nbt.free_data_and_return_args.value \
    set from storage std:temp call_nbt.return_value
execute if data storage std:temp call_nbt.return_value \
    run \
    return run \
    function core_std:util/free_data_and_return \
    with storage std:temp call_nbt.free_data_and_return_args
# this function frees leftover data
# else...

# free memory
data remove storage std:temp call_nbt
