#>std:array/to_compound_nbt
#
# Converts an array or list into an NBT component whose keys match the indeces
# of the original array or list.
#
# Examples:
#
# 1.
# - Array: [L; 22l, 4l, 55l]
# - std:array/to_compound_nbt {...index_prefix:""}
# - Output: {0:22l,1:4l,2:55l}
#
# 2.
# - List: ["hello", "beautiful", "world!"]
# - std:array/to_compound_nbt {...index_prefix:"index_"}
# - Output: {index_0:"hello",index_1:"beautiful",index_2:"world!"}
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array or list that will be processed is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array or list that will be processed is
#       located.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
#   index_prefix: string
#       Prefix that is going to be applied to the NBT keys that indicate the
#       original array index. Can be left empty if the user wants the keys
#       to be just the index numbers.
# @writes
#   The constructed NBT component in the specified location.

# setup data
$data modify storage std:temp to_compound_nbt set value { \
    is_array:false, \
    for_each_args:{ \
        array_storage:"$(array_storage)", \
        array_nbt:"$(array_nbt)", \
        function:"std.core:array/to_compound_nbt/turn_element_into_key_value_pair", \
        context_args:{ \
            array_storage:"$(array_storage)", \
            array_nbt:"$(array_nbt)", \
            out_storage:"$(out_storage)", \
            out_nbt:"$(out_nbt)", \
            index_prefix:"$(index_prefix)", \
        }, \
        element_macro:"element", \
        index_macro:"index", \
    }, \
}

# assert nbt_path is an array or list
$execute store result storage std:temp to_compound_nbt.is_array \
    byte 1 \
    run \
    function std:assert/is_array { \
        array_storage:'$(array_storage)', \
        array_nbt:'$(array_nbt)', \
    }

# print error and return NOTHING if it's not an array
$execute if data storage std:temp to_compound_nbt{is_array:false} \
    run \
    function std.core:out/print_error { \
        function:"std:array/to_compound_nbt", \
        text:[ \
            "Path '$(array_nbt)' in storage '$(array_storage)' doesn't ", \
            "contain an array or list.", \
        ], \
    }
execute if data storage std:temp to_compound_nbt{is_array:false} \
    run \
    return run \
    data remove storage std:temp to_compound_nbt

# conversion loop
function std:array/for_each \
    with storage std:temp to_compound_nbt.for_each_args

# free memory
data remove storage std:temp to_compound_nbt
