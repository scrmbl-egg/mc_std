#>core_std:binary/8_bit_array/get_string/populate_string
#
# @params
    # dest_st
    # dest_path
    # 0, 1, 2, 3, 4, 5, 6, 7

$data modify storage $(dest_st) $(dest_path) \
    set value '$(0)$(1)$(2)$(3)$(4)$(5)$(6)$(7)'
