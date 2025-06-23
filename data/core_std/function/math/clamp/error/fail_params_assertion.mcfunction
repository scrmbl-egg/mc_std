#>core_std:math/clamp/error/fail_params_assertion
#
# @params
    # min
    # max
# @returns
    # Success: Always fails.

$function std:error/print { \
    fn:"std:math/clamp", \
    msg:"'min' parameter can't be greater than the 'max' parameter ('min'=$(min),'max'=$(max))."\
}

scoreboard objectives remove std_local_clamp
data remove storage std:temp clamp_op

# this function must always return failure
return fail
