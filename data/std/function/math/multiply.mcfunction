#>std:math/multiply
#
# Multiplies a number by another. Keeps precision for floating point number
# types (float & double).
#
# @authors scrmbl-egg
# @input
#   first: (int | double)
#       First number of the multiplication, or multiplicand.
#   second: (int | double)
#       Second number of the multiplication, or multiplier.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The product (double) of the multiplication in the specified NBT location.

$data modify storage $(out_storage) $(out_nbt) set value $(first)

$execute store result storage $(out_storage) $(out_nbt) double $(second) \
    run \
    data get storage $(out_storage) $(out_nbt) 1
