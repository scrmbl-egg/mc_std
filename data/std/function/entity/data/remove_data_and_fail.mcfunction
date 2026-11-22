#>std:entity/data/remove_data_and_fail
#
# Dynamically a piece of data from the executing entity and returns failure
# right after so that it can be propagated. It is recommended to use this
# function with the `return run` syntax.
#
# @authors scrmbl-egg
# @context entity
# @input
#   nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Entity NBT path of the data that is going to be removed.
# @returns
#   Success: always fails

$data remove entity @s $(nbt)

return fail
