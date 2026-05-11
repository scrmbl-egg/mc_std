#>core_std:array/for_each/bind_macro
#
# Dynamically sets a key/field along with its string value in an NBT structure
# in a storage. The output is turned into a string to ensure it's properly
# passed to the called function.
#
# @authors scrmbl-egg
# @input
#   storage: #[id="storage"] string
#       Storage where the result will be stored.
#   nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
#   key: string
#       Key that will contain the value.
#   value: any
#       Value that will be contained in the key.

$data modify storage $(storage) $(nbt)."$(key)" set value '$(value)'
