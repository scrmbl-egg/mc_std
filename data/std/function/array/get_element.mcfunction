#>std:array/get_element
#
# Gets an element of an array or list. This function does checks to ensure the
# passed data location is an array and also returns a result if an error occurs
# If you're completely sure there's an array or list at the specified location,
# see `std:array/get_element_unsafe`.
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array or list is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array or list is located.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
#   source_path: (any | int)
#       Source NBT. Can be a structure to query data, or an integer to specify
#       the array or list index.
# @writes
#   Array or list element at specified destination.
# @returns
#   Result: 1 if element is retrieved, 0 if there was a failure.

data modify storage std:temp get_element set value { \
    is_array:false, \
}

# assert nbt_path is an array or list
$execute store result storage std:temp get_element.is_array \
    byte 1 \
    run \
    function std:assert/is_array { \
        array_storage:'$(array_storage)', \
        array_nbt:'$(array_nbt)', \
    }

# print error message if assertion fails
$execute if data storage std:temp get_element{is_array:false} \
    run \
    function std.core:out/print_error { \
        function:"std:array/get_element", \
        text:[ \
            "Path '$(array_nbt)' in storage '$(array_storage)' doesn't ", \
            "contain an array or list.", \
        ], \
    }
execute if data storage std:temp get_element{is_array:false} \
    run \
    return run \
    function std:storage/remove_data_and_fail { \
        storage:"std:temp", \
        nbt:"get_element", \
    }

$data modify storage $(out_storage) $(out_nbt) \
    set from storage $(array_storage) $(array_nbt)[$(source_path)]

# free memory
data remove storage std:temp get_element

# return 1 for success
return 1
