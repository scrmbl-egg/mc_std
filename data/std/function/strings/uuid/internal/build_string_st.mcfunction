#>std:strings/uuid/internal/build_string_st
#
# @authors scrmbl-egg, MARO-445
# @storage
    # local_target_uuid_0
    # local_target_uuid_1
    # local_target_uuid_2
    # local_target_uuid_3
# @generates
    # local_uuid_str

$data modify storage minecraft:std local_uuid_str set value "$(local_target_uuid_0)_$(local_target_uuid_1)_$(local_target_uuid_2)_$(local_target_uuid_3)"
