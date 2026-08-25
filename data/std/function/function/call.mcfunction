#>std:function/call
#
# Calls a function from a name or tag.
#
# @input
#   function: #[id(registry="function",tags="allowed")] string
#       Function name or tag that will be called.
#   args: struct {[string]: any}
#       SNBT structure containing the arguments of the function
# @returns
#   Result: same as the specified function.

## NOTE:
# due to minecraft's 'return' command behavior, we can't simply do the
# following:
#
# $return run function $(function)
#
# because if the specified function doesn't return anything, 0 is returned
# by THIS function, i.e. if you run:
#
# `function std:function/call {function:"std:empty",args:{}}`
#
# despite std:empty not returning anything, the output of std:function/call
# will be 0. So, the function running and result processing must be separated
# to get the expected propagation.

data modify storage std:temp call set value { \
    function_args:{}, \
    free_data_and_return_args:{ \
        storage:"std:temp", \
        nbt:"call", \
        value:0, \
    }, \
}
# `return_value` is not specified because it can be null, if it exists, it will
# be copied in `free_data_and_return_args.value`

# attempt to merge specified args (this allows the function to be called even
# if the macro argument is invalid data)
$data modify storage std:temp call.function_args merge value $(args)

# run function and attempt to store result
$execute store result storage std:temp call.return_value \
    int 1 \
    run \
    function $(function) with storage std:temp call.function_args
# if a result was caught, copy into freeing function arguments
execute if data storage std:temp call.return_value \
    run \
    data modify storage std:temp call.free_data_and_return_args.value \
    set from storage std:temp call.return_value

# if a result was caught, run freeing function
execute if data storage std:temp call.return_value \
    run \
    return run \
    function std:storage/remove_data_and_return_value \
    with storage std:temp call.free_data_and_return_args
# else...

# free memory (and return nothing)
data remove storage std:temp call
