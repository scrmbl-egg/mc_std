#>core_std:memory/free_storage_nbt
#
# Removes the data from an NBT path.
#
# @authors scrmbl-egg
# @input
#   storage: #[id="storage"] string
#       Storage in which the NBT is located.
#   nbt: #[nbt_path=minecraft:storage[[storage]]] string
#       NBT path that will be deleted.

$data remove storage $(storage) $(nbt)
