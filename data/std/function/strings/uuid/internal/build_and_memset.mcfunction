#>std:strings/uuid/internal/build_and_memset
#
# @authors scrmbl-egg, MARO-445
# @params
    # dest_st
    # dest_path
    # uuid_0
    # uuid_1
    # uuid_2
    # uuid_3
# @generates
    # UUID string at specified storage and path.

$data modify storage $(dest_st) $(dest_path) set value "$(uuid_0)_$(uuid_1)_$(uuid_2)_$(uuid_3)"
