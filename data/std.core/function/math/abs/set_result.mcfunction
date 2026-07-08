#>std.core:math/abs/set_result
#
# @input
#   value: string
#   out_storage: #[id="storage"] string
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string

$data modify storage $(out_storage) $(out_nbt) set value $(value)
