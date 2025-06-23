#>core_std:binary/64_bit_array/get_string/error/fail_array_length_assertion
#
# @params
    # fn
    # param_st
    # param_path

$function std:error/print \
    {fn:"$(fn)",msg:"Bit array in path '$(param_path)' in storage '$(param_st)' must be of length 32."}

# free memory
scoreboard objectives remove std_local_bin32str
