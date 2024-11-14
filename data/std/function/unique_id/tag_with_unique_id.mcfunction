# Generates an unique id based on UUID and tags an entity with it

# Get data
data modify storage minecraft:std local_target_uuid_0 set from entity @s UUID[0]
data modify storage minecraft:std local_target_uuid_1 set from entity @s UUID[1]
data modify storage minecraft:std local_target_uuid_2 set from entity @s UUID[2]
data modify storage minecraft:std local_target_uuid_3 set from entity @s UUID[3]

# Generate string
execute as @s run function std:unique_id/set_string_st with storage minecraft:std

# Tag entity
execute as @s run function std:unique_id/give_auto_tag_st with storage minecraft:std