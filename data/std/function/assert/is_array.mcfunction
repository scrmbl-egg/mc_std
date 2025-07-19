#>std:assert/is_array
#
# Checks if an NBT path is an array or list.
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the alleged array is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the alleged array that is located.
# @returns
#   Success: if the specified NBT path is an array or list.

# make local scoreboard
scoreboard objectives add __std.assert dummy

# try to copy referenced data
$execute store success score __$std_can_be_copied __std.assert \
    run \
    data modify storage std:temp assert.data_cpy \
    set from storage $(array_storage) $(array_nbt)

# if can't copy, run std:fail
execute if score __$std_can_be_copied __std.assert matches 0 \
    run \
    return run \
    function core_std:assert/fail

# try to append a number (it must be a number so it can be appended in both
# arrays and NBT lists)
execute store success score $can_append __std.assert \
    run \
    data modify storage std:temp assert.data_cpy append value 1

# if can't append, run std:fail
execute if score $can_append __std.assert matches 0 \
    run \
    return run \
    function core_std:assert/fail

# free memory
scoreboard objectives remove __std.assert
data remove storage std:temp assert

# return success
return 1
