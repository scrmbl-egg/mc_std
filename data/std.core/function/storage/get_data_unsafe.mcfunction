#>std.core:storage/get_data_unsafe
#
# Dynamically gets the data from a storage without any checks.
#
# @context entity
# @input
#   storage: #[id="storage"] string
#       Storage of the data that will be obtained.
#   nbt: #[nbt_path=minecraft:entity[[storage]]] string
#       NBT path of the data that will be obtained.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.

$data modify storage $(out_storage) $(out_nbt) \
    set from storage $(storage) $(nbt)
