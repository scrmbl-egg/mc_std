#>std:array/foreach
#
# Executes a function for each element of an array, binding a custom macro as
# a parameter for said function.
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array that will be iterated through is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array that will be iterated through is
#       located.
#   function: #[id="function"] string
#       Function that is going to be executed for each element of the array.
#   function_storage: (#[id="storage"] string | "std:none")
#       Function storage that the function will use, see `function_storage_nbt`.
#   function_storage_nbt: (#[nbt_path=minecraft:storage[[function_storage]]] string | "none")
#       Function storage NBT path that contains the arguments that will be
#       passed to the function.
#   element_macro: string
#       Name of the function macro that will represent the current element.
#   index_macro: string
#       Name of the function macro that will represent the current iteration
#       index.

# create local scoreboard
scoreboard objectives add __std.foreach dummy

# assert nbt_path is an array or list
$execute store success score __$std_is_array __std.foreach \
    run \
    function std:assert/is_array { \
        array_storage:'$(array_storage)', \
        array_nbt:'$(array_nbt)', \
    }

# print error message if assertion fails
$execute if score __$std_is_array __std.foreach matches 0 \
    run \
    function core_std:error/print { \
        function:"std:array/foreach", \
        text:{text:"Path '$(array_nbt)' in storage '$(array_storage)' doesn't contain an array or list."}, \
    }

execute if score __$std_is_array __std.foreach matches 0 \
    run \
    return run \
    function core_std:array/foreach/fail_is_array_assertion
# std:fail can't be used, since std:fail relies on std:array/foreach

# save the parameters as local
$data modify storage std:temp foreach set value { \
    func:'$(function)', \
    func_st:'$(function_storage)', \
    func_st_nbt:'$(function_storage_nbt)', \
    elem_macro:'$(element_macro)', \
    idx_macro:'$(index_macro)', \
}
$data modify storage std:temp foreach.arr \
    set from storage $(array_storage) $(array_nbt)

# create copy of storage, so that the macro can be added later.
$data modify storage std:temp foreach.storage_cpy \
    set from storage $(function_storage) $(function_storage_nbt)

# init current index to 0
scoreboard players set __$std_current_iter_index __std.foreach 0

# save array size in __$std_arr_size scoreholder
execute store result score __$std_arr_size __std.foreach \
    run \
    data get storage std:temp foreach.arr

# execute recursive function
#
# "execute if/unless entity" detects whether or not an entity is running
# this command. This is so that, if there's no entity running this command, the
# server will take care of it.
#>_
# @in
#   foreach
#       arr
#       func
#       func_st
#       func_st_nbt
#       elem_macro
#       idx_macro
#       storage_cpy
execute if entity @s \
    run \
    function core_std:array/foreach/iterate with storage std:temp foreach
execute unless entity @s \
    run \
    function core_std:array/foreach/iterate with storage std:temp foreach

# free memory
scoreboard objectives remove __std.foreach
data remove storage std:temp foreach
