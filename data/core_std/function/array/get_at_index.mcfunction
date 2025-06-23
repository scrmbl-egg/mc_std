#>core_std:array/get_at_index
#
# @authors scrmbl-egg
# @params
    # arr_st
    # arr_path
    # dest_st
    # dest_path
    # idx
# @generates
    # Array element at specified destination.

$data modify storage $(dest_st) $(dest_path) \
    set from storage $(arr_st) $(arr_path)[$(idx)]
