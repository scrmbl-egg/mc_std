#>std:string/join
#
# Concatinates a list of strings into one string, each one being separated with
# a separator. Passing an empty list of strings produces an empty string.
#
# @authors scrmbl-egg
# @input
#   parts: [string]
#       Strings will be concatinated.
#   separator: string
#       String that will separate the strings contained in `parts`.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The concatinated string in the specified output.
# @returns
#   Result: length of the result string.

# save args
$data modify storage std:temp join set value { \
    parts:$(parts), \
    parts_len:0, \
    for_each_args:{ \
        array_storage:"std:temp", \
        array_nbt:"join.parts", \
        function:"std.core:string/join/accumulate", \
        context_args:{ \
            accumulation:"", \
            separator:"$(separator)", \
            next:"", \
            out_storage:"$(out_storage)", \
            out_nbt:"$(out_nbt)", \
        }, \
        element_macro:"next", \
        index_macro:"__index__", \
    }, \
    remove_data_and_return_string_length_args:{ \
        value:0, \
        storage:"std:temp", \
        nbt:"join", \
    }, \
}

# if there are no elements, just output an empty string and return 0
$execute unless data storage std:temp join.parts[0] \
    run \
    data modify storage $(out_storage) $(out_nbt) set value ""
execute unless data storage std:temp join.parts[0] \
    run \
    return run \
    function std:storage/remove_data_and_return_value { \
        value:0, \
        storage:"std:temp", \
        nbt:"join", \
    }
# otherwise, if there are elements in `parts`...

# set first element as if accumulated, consume it from `parts`
data modify storage std:temp join.for_each_args.context_args.accumulation \
    set from storage std:temp join.parts[0]
data remove storage std:temp join.parts[0]

# if there are no elements, just return the "current accumulation" (which is
# just the first original string)
$execute unless data storage std:temp join.parts[0] \
    run \
    data modify storage $(out_storage) $(out_nbt) \
    set from storage std:temp join.for_each_args.context_args.accumulation
# get length
$execute store result storage \
    std:temp join.remove_data_and_return_string_length_args.value \
    int 1 \
    run \
    data get storage $(out_storage) $(out_nbt)
#
# else, if there are more elements

## really accumulate the next strings
function std:array/for_each \
    with storage std:temp join.for_each_args
# this generates the output

# free memory
data remove storage std:temp join

# return length of the result string
$return run \
    data get storage $(out_storage) $(out_nbt)
