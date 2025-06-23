#>core_std:binary/shifting/shift_right_once
#
# @params
    # bit_arr_st
    # bit_arr_path

$data modify storage $(bit_arr_st) $(bit_arr_path) prepend from storage $(bit_arr_st) $(bit_arr_path)[0]
$data remove storage $(bit_arr_st) $(bit_arr_path)[-1]
