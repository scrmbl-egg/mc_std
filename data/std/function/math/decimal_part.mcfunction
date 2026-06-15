#>std:math/decimal_part
#
# Gets the decimal part of a number, subtracting the integer part.
#
# @authors scrmbl-egg
# @input
#   x: double
#       Number whose decimal part is going to be extracted.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The decimal part of the number in the specified location.
# @returns
#   Result: 0 when number is an integer with no decimal part, 1 if there was
#       a decimal part.

## NOTE:
# To get a precise decimal part, we do string manipulation instead of actual
# math to get maximum precision. These are the logical steps that are followed:
#
# - Get the absolute value of the passed argument.
# - We get both the string lengths of the value, and it's integer part.
# - If the lengths are equal, that means the passed number is an integer so we
#   return early.
# - Otherwise, we slice the string with those lengths as the index arguments of
#   the slice, leaving only the decimal separator and the rest of digits.
# - Return the slice as a value.
#
# Example:
#   PASSED NUMBER: -93984.439484
#   abs_value = 93984.439484
#   int_part = 93984
#
#   slice_start = strlen("93984") = 5
#   slice_end = strlen("93984.439484") = 12
#
#    0123456789ABCDEF
#   "93984.439484"
#          ^     ^end  -> "439484" -> "0." + "439484" -> 0.439484
#          |start

# create local score
scoreboard objectives add __std.dec_part dummy

# setup local data
$data modify storage std:temp dec_part set value { \
    original_value:$(x), \
    abs_value:$(x), \
    int_part_string:"", \
    abs_args:{ \
        x:$(x), \
        out_storage:"std:temp", \
        out_nbt:"dec_part.abs_value", \
    }, \
    abs_value_string_from_data_args:{ \
        data:0, \
        out_storage:"std:temp", \
        out_nbt:"dec_part.slice_string_args.string", \
    }, \
    int_part_string_from_data_args:{ \
        data:0, \
        out_storage:"std:temp", \
        out_nbt:"dec_part.int_part_string", \
    }, \
    slice_string_args:{ \
        string:"", \
        start:0, \
        end:0, \
        out_storage:"std:temp", \
        out_nbt:"dec_part.set_result_args.decimal_part", \
    }, \
    set_result_args:{ \
        decimal_part:"", \
        out_storage:'$(out_storage)', \
        out_nbt:'$(out_nbt)', \
    }, \
}

# get absolute value
function std:math/abs \
    with storage std:temp dec_part.abs_args

# turn absolute value to string so that it can be sliced later
data modify storage std:temp dec_part.abs_value_string_from_data_args.data \
    set from storage std:temp dec_part.abs_value
function std:string/from_data \
    with storage std:temp dec_part.abs_value_string_from_data_args

# get int part (or floor) of the absolute value and turn to string
execute store result storage \
    std:temp dec_part.int_part_string_from_data_args.data \
    int 1 \
    run \
    data get storage std:temp dec_part.abs_value
function std:string/from_data \
    with storage std:temp dec_part.int_part_string_from_data_args

# get lengths of the strings
execute store result score __$std_int_strlen __std.dec_part \
    run \
    data get storage std:temp dec_part.int_part_string
execute store result score __$std_value_strlen __std.dec_part \
    run \
    data get storage std:temp dec_part.slice_string_args.string

# if lengths are equal it means the passed value is an integer, so return 0.0d
$execute if score \
    __$std_int_strlen __std.dec_part = __$std_value_strlen __std.dec_part \
    run \
    data modify storage $(out_storage) $(out_nbt) set value 0.0
execute if score \
    __$std_int_strlen __std.dec_part = __$std_value_strlen __std.dec_part \
    run \
    data remove storage std:temp dec_part
execute if score \
    __$std_int_strlen __std.dec_part = __$std_value_strlen __std.dec_part \
    run \
    return run \
    function std:scoreboard/remove_objective_and_return_value { \
        value:0, \
        objective:"__std.dec_part", \
    }

# add 1 to account for separator in slicing
scoreboard players add __$std_int_strlen __std.dec_part 1

# MINECRAFT REMOVES THE 0 INTEGER IF THE NUMBER IS ONLY DECIMALS, so we check
# if the int part string is 0... if that's the case, remove 1 from the start
# index in the slice
execute if data storage std:temp dec_part{int_part_string:"0"} \
    run \
    scoreboard players remove __$std_int_strlen __std.dec_part 1

# store int_strlen + 1 (separator) as slice start
execute store result storage std:temp dec_part.slice_string_args.start \
    int 1 \
    run \
    scoreboard players get __$std_int_strlen __std.dec_part
# store value_strlen as slice end
execute store result storage std:temp dec_part.slice_string_args.end \
    int 1 \
    run \
    scoreboard players get __$std_value_strlen __std.dec_part

# slice string
function std:string/slice \
    with storage std:temp dec_part.slice_string_args

# set result (this is the function with the side-effect)
function core_std:math/decimal_part/set_result \
    with storage std:temp dec_part.set_result_args

# free memory
scoreboard objectives remove __std.dec_part
data remove storage std:temp dec_part

# return 1 for success
return 1
