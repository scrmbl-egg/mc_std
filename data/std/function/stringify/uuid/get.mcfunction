# params:
    # dest_st   (destination storage)
    # dest_path (destination path)

# process params
data modify storage minecraft:std local_destination_storage set value "$(dest_st)"
data modify storage minecraft:std local_destination_path set value "$(dest_path)"

# get data
data modify storage minecraft:std local_target_uuid_0 set from entity @s UUID[0]
data modify storage minecraft:std local_target_uuid_1 set from entity @s UUID[1]
data modify storage minecraft:std local_target_uuid_2 set from entity @s UUID[2]
data modify storage minecraft:std local_target_uuid_3 set from entity @s UUID[3]

# generate string
# in:
    # local_target_uuid_0
    # local_target_uuid_1
    # local_target_uuid_2
    # local_target_uuid_3
execute as @s run function std:stringify/uuid/internal/build_string_st with storage minecraft:std
# gives ownership of:
    # local_uuid_str

# set destination memory
# in:
    # local_destination_storage
    # local_destination_path
    # local_uuid_str
return run function std:stringify/uuid/internal/memset_st with storage minecraft:std

# free memory
data remove storage minecraft:std local_target_uuid_0
data remove storage minecraft:std local_target_uuid_1
data remove storage minecraft:std local_target_uuid_2
data remove storage minecraft:std local_target_uuid_3
data remove storage minecraft:std local_uuid_str
data remove storage minecraft:std local_destination_storage
data remove storage minecraft:std local_destination_path