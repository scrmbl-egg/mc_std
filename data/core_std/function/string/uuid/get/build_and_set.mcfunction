#>core_std:strings/uuid/build_and_memset
#
# @authors scrmbl-egg, MARO-445
# @input
#   out_storage: #[id="storage"] string
#   out_nbt: #[nbt_path=minecraft:storage[[dest_st]]] string
#   uuid_0: int
#   uuid_1: int
#   uuid_2: int
#   uuid_3: int
# @writes
    # UUID string at specified storage and path.

$data modify storage $(out_storage) $(out_nbt) set value \
    "$(uuid_0)_$(uuid_1)_$(uuid_2)_$(uuid_3)"
