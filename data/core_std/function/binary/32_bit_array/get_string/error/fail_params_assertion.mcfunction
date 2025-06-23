#>core_std:binary/32_bit_array/get_string/error/fail_params_assertion
#
# @params
    # fn
    # param_st
    # param_path

$function std:error/print \
    {fn:"$(fn)",msg:"Path '$(param_path)' in storage '$(param_st)' doesn't contain data."}

# free memory
scoreboard objectives remove std_local_bin32str
