#>core_std:array/get_element_unsafe
#
# @authors scrmbl-egg
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array that will be iterated through is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array that will be iterated through is
#       located.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
#   source_path: (any | int)
#       Source NBT. Can be a structure to query data, or an integer to specify
#       the array or list index.
# @writes
#   Array or list element at specified destination.

$data modify storage $(out_storage) $(out_nbt) \
    set from storage $(array_storage) $(array_nbt)[$(source_path)]
