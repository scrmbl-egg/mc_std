#>core_std:set_data/set_value
#
# @authors scrmbl-egg
# @input
#   out_storage: #[id="storage"] string
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#   value: any

$data modify storage $(out_storage) $(out_nbt) set value $(value)
