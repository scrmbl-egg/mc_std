#>std:strings/uuid/get
# This function returns an entity's UUID separated by underscores.
# For example, if the UUID is [I;-111111111,222222222,-3333333333,-4444444444], 
# the result is "-111111111_222222222_-3333333333_-4444444444", this is useful
# when using tags with macros.
#
# @authors scrmbl-egg, MARO-445
# @params
    # dest_path -- Destination NBT path.
    # dest_st   -- Destination storage.
# @generates
    # UUID string at specified storage and path.

# process params
$data modify storage minecraft:std local_get_uuid_params.dest_st set value '$(dest_st)'
$data modify storage minecraft:std local_get_uuid_params.dest_path set value '$(dest_path)'

# get data
data modify storage minecraft:std local_get_uuid_params.uuid_0 set from entity @s UUID[0]
data modify storage minecraft:std local_get_uuid_params.uuid_1 set from entity @s UUID[1]
data modify storage minecraft:std local_get_uuid_params.uuid_2 set from entity @s UUID[2]
data modify storage minecraft:std local_get_uuid_params.uuid_3 set from entity @s UUID[3]

# generate string
#> 
# @in
    # local_get_uuid_params
        # dest_st
        # dest_path
        # uuid_0
        # uuid_1
        # uuid_2
        # uuid_3
execute as @s run function core_std:strings/uuid/get/build_and_memset \
    with storage minecraft:std local_get_uuid_params
\

# free memory
data remove storage minecraft:std local_get_uuid_params
