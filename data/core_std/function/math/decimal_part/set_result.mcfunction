#>core_std:math/decimal_part/set_result
#
# @input
#   decimal_part: string
#   out_storage: #[id="storage"] string
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string

$data modify storage $(out_storage) $(out_nbt) set value 0.$(decimal_part)
