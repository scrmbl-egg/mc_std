#>std.core:entity/get_data_unsafe
#
# Dynamically gets the data from an entity without any checks.
#
# @context entity
# @input
#   nbt: #[nbt_path=minecraft:entity[[%fallback]]] string
#       NBT path of the data that will be obtained.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.

$data modify storage $(out_storage) $(out_nbt) \
    set from entity @s $(nbt)
