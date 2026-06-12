#>std:math/abs
#
# Gets the absolute value of a passed number.
#
# @authors scrmbl-egg
# @input
#   value: double
#       Number whose absolute value is going to be calculated.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The absolute value in the specified location.

# create local scoreboard
scoreboard objectives add __std.abs dummy

# setup local data
$data modify storage std:temp abs set value { \
    value_sign:0, \
    sign_args:{ \
        value:$(value), \
    }, \
    slice_string_args:{ \
        string:"$(value)", \
        start:1, \
        end:0, \
        out_storage:"std:temp", \
        out_nbt:"abs.set_result_args.value", \
    }, \
    set_result_args:{ \
        value:"", \
        out_storage:"$(out_storage)", \
        out_nbt:"$(out_nbt)", \
    }, \
}

# get sign
execute store result storage std:temp abs.value_sign \
    int 1 \
    run \
    function std:math/sign with storage std:temp abs.sign_args

# if sign result is NOT -1 (value is 0 or positive) just set it and return
# early
$execute unless data storage std:temp abs{value_sign:-1} \
    run \
    data modify storage $(out_storage) $(out_nbt) set value $(value)
execute unless data storage std:temp abs{value_sign:-1} \
    run \
    return run \
    data remove storage std:temp abs

# otherwise, get value string length and slice the motherfucker
execute store result storage std:temp abs.slice_string_args.end \
    int 1 \
    run \
    data get storage std:temp abs.slice_string_args.string
function std:string/slice \
    with storage std:temp abs.slice_string_args

# set result
function core_std:math/abs/set_result \
    with storage std:temp abs.set_result_args

# free memory
scoreboard objectives remove __std.abs
data remove storage std:temp abs
