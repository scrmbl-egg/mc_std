#>std:storage/remove_data_and_fail
#
# Dynamically removes a piece of data from a storage and returns failure right
# after so that it can be propagated. It is recommended to use this function
# with the `return run` syntax.
#
# @authors scrmbl-egg
# @input
#   storage: #[id="storage"] string
#       Storage where the data will be removed.
#   nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path of the data that will be removed.
# @returns
#   Success: always fails

$data remove storage $(storage) $(nbt)

return fail
