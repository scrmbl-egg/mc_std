#>std:string/uuid/get
#
# This function returns an entity's UUID separated by underscores.
# For example, if the UUID is [I;-111,222,-333,-444], the result is
# `-111_222_-333_-444`, this is useful when using tags with macros.
#
# @authors scrmbl-egg, MARO-445
# @context entity
# @input
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   UUID string at specified NBT path.

# process args
$data modify storage std:temp get_uuid set value { \
    build_and_set_args:{ \
        uuid_0:0, \
        uuid_1:0, \
        uuid_2:0, \
        uuid_3:0, \
        out_storage:'$(out_storage)', \
        out_nbt:'$(out_nbt)', \
    }, \
}

# get UUID integers
data modify storage std:temp get_uuid.build_and_set_args.uuid_0 \
    set from entity @s UUID[0]
data modify storage std:temp get_uuid.build_and_set_args.uuid_1 \
    set from entity @s UUID[1]
data modify storage std:temp get_uuid.build_and_set_args.uuid_2 \
    set from entity @s UUID[2]
data modify storage std:temp get_uuid.build_and_set_args.uuid_3 \
    set from entity @s UUID[3]

# generate string
execute as @s \
    run \
    function std.core:string/uuid/get/build_and_set \
    with storage std:temp get_uuid.build_and_set_args

# free memory
data remove storage std:temp get_uuid
