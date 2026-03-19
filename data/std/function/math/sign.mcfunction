#>std:math/sign
#
# Returns a number that represents the sign of the passed value.
#
# NOTES:
# Beware of accidentally passing a string, since it can produce unexpected
# results.
#
# @authors scrmbl-egg
# @input
#   value: (byte | int | short | long | float | double)
#       Number whose sign is going to be checked.
# @returns
#   Result: 0 if `value` is 0, 1 if `value` is positive, -1 if `value` is
#       negative.

## NOTES:
# "minecraft:value_check" predicate can't be used because it rounds the values
# to integers, making range checking between epsilons and beyond useless
# (in this implementation, an input of -0.5 was considered positive!).
# Instead, the function must treat the input as a string, so that we can check
# if the first character is a hyphen "-" indicating the number is a negative
# value. If there is no hyphen, we can then make a storage check if the number
# is zero, and if it isn't, then it MUST be positive. That way we cover all
# possible cases.

# setup data (saving `value` as a string allows support for i64/long)
$data modify storage std:temp sign set value { \
    value:"$(value)", \
    first_char:"", \
}

# get first character of `value` parameter
data modify storage std:temp sign.first_char \
    set string storage std:temp sign.value 0 1

## if first character is "-", value must be negative
execute if data storage std:temp sign{first_char:"-"} \
    run \
    return run \
    function core_std:util/free_data_and_return { \
        value:-1, \
        storage:"std:temp", \
        nbt:"sign", \
    }
# frees leftover memory

## check if value is 0
# (0.0 or -0 end up working due to macro insertions)
execute if data storage std:temp sign{value:"0"} \
    run \
    return run \
    function core_std:util/free_data_and_return { \
        value:0, \
        storage:"std:temp", \
        nbt:"sign", \
    }
# frees leftover memory

## last possible case, value is positive
return run \
    function core_std:util/free_data_and_return { \
        value:1, \
        storage:"std:temp", \
        nbt:"sign", \
    }
# frees leftover memory
