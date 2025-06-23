#>core_std:binary/shifting/shift_left_once
#
# @params
    # bit_arr_st
    # bit_arr_path

$data modify storage $(bit_arr_st) $(bit_arr_path) append value 0
$data remove storage $(bit_arr_st) $(bit_arr_path)[0]
