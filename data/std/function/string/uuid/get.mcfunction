#>std:string/uuid/get
#
# This function returns an entity's UUID separated by underscores.
# For example, if the UUID is [I;-111,222,-333,-444], the result is
# "-111_222_-333_-444", this is useful when using tags with macros.
#
# @authors scrmbl-egg, MARO-445
# @input
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   UUID string at specified NBT path.

# process params
$data modify storage std:temp get_uuid set value { \
    out_storage:'$(out_storage)', \
    out_nbt:'$(out_nbt)', \
}

# get UUID integers
data modify storage std:temp get_uuid.uuid_0 set from entity @s UUID[0]
data modify storage std:temp get_uuid.uuid_1 set from entity @s UUID[1]
data modify storage std:temp get_uuid.uuid_2 set from entity @s UUID[2]
data modify storage std:temp get_uuid.uuid_3 set from entity @s UUID[3]

# std:array/to_nbt could be used here, but we leave it this way to remove
# overhead

# generate string
#>_
# @in
#   get_uuid
#       out_storage
#       out_nbt
#       uuid_0
#       uuid_1
#       uuid_2
#       uuid_3
execute as @s \
    run \
    function core_std:string/uuid/get/build_and_set \
    with storage std:temp get_uuid

# free memory
data remove storage std:temp get_uuid
