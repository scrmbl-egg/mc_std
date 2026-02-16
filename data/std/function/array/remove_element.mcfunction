#>std:array/remove_element
#
# Removes an element from the array or list.
#
# @input
#   array_storage: #[id="storage"] string
#       Storage where the array or list is located.
#   array_nbt: #[nbt_path=minecraft:storage[[array_storage]]] string
#       Storage NBT path where the array or list is located.
#   source_path: (any | int)
#       Source NBT. Can be a structure to query data, or an integer to specify
#       the array or list index.

$data remove storage $(array_storage) $(array_nbt)[$(source_path)]
