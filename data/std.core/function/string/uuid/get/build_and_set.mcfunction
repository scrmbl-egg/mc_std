#>std.core:string/uuid/get/build_and_set
#
# Builds the stringified version of the passed UUID.
#
# @authors scrmbl-egg, MARO-445
# @input
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
#   uuid_0: int
#       First number of the UUID.
#   uuid_1: int
#       Second number of the UUID.
#   uuid_2: int
#       Third number of the UUID.
#   uuid_3: int
#       Fourth number of the UUID.
# @writes
#   UUID string at specified storage and path.

$data modify storage $(out_storage) $(out_nbt) set value \
    "$(uuid_0)_$(uuid_1)_$(uuid_2)_$(uuid_3)"
