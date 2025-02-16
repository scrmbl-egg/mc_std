#>std:strings/uuid/internal/memset_st
#
# @authors scrmbl-egg, MARO-445
# @storage
    # local_destination_storage
    # local_destination_path
    # local_uuid_str

$data modify storage $(local_destination_storage) $(local_destination_path) set value "$(local_uuid_str)"
