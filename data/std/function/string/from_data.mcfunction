#>std:string/from_data
#
# Converts any specified piece of data to a string.
#
# @authors scrmbl-egg
# @input
#   data: any
#       Piece of data that will be converted to a string, can be of any type.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   A string in the specified destination.

$data modify storage $(out_storage) $(out_nbt) set value '$(data)'
