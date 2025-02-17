#>std:strings/uuid/get
#
# @doc
# This function returns an entity's UUID separated by underscores.
# For example, if the UUID is [I;-111111111,222222222,-3333333333,-4444444444], 
# the result is "-111111111_222222222_-3333333333_-4444444444", this is useful
# when using tags with macros.
#
# @authors scrmbl-egg, MARO-445
# @params
    # dest_path -- Destination path.
    # dest_st   -- Destination storage.

# process params
$data modify storage minecraft:std local_destination_storage set value '$(dest_st)'
$data modify storage minecraft:std local_destination_path set value '$(dest_path)'

# get data
data modify storage minecraft:std local_target_uuid_0 set from entity @s UUID[0]
data modify storage minecraft:std local_target_uuid_1 set from entity @s UUID[1]
data modify storage minecraft:std local_target_uuid_2 set from entity @s UUID[2]
data modify storage minecraft:std local_target_uuid_3 set from entity @s UUID[3]

# generate string
#>@in:
    # local_target_uuid_0
    # local_target_uuid_1
    # local_target_uuid_2
    # local_target_uuid_3
# @generates:
    # local_uuid_str
execute as @s run function std:strings/uuid/internal/build_string_st with storage minecraft:std

# set destination memory
#>@in:
    # local_destination_storage
    # local_destination_path
    # local_uuid_str
function std:strings/uuid/internal/memset_st with storage minecraft:std

# free memory
data remove storage minecraft:std local_target_uuid_0
data remove storage minecraft:std local_target_uuid_1
data remove storage minecraft:std local_target_uuid_2
data remove storage minecraft:std local_target_uuid_3
data remove storage minecraft:std local_uuid_str
data remove storage minecraft:std local_destination_storage
data remove storage minecraft:std local_destination_path
