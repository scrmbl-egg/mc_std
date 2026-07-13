#>std:math/ceil
#
# Rounds up a value.
#
# @input
#   x: double
#       Number.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @returns
#   Result: the floor of the passed value as an integer

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function std.core:out/print_error/math_entity_not_summoned { \
        function:"std:math/ceil", \
    }

# set up local data
$data modify storage std:temp ceil set value { \
    has_decimal_part:false, \
    decimal_part_args:{ \
        x:$(x), \
        out_storage:"std:main", \
        out_nbt:"null", \
    }, \
}

# check if passed value has decimal part. If it doesn't, just return the passed
# value.
execute store result storage std:temp ceil.has_decimal_part \
    byte 1 \
    run \
    function std:math/decimal_part \
    with storage std:temp ceil.decimal_part_args
$execute if data storage std:temp ceil{has_decimal_part:false} \
    run \
    return run \
    function std:storage/remove_data_and_return_value { \
        value:$(x), \
        storage:"std:temp", \
        nbt:"ceil", \
    }
# otherwise...

# create local scoreboard
scoreboard objectives add __std.ceil dummy

# do floor + 1 (regular method, no helper function needed)
execute store result score __$std_ceil __std.ceil \
    run \
    data get storage std:temp ceil.decimal_part_args.x 1
scoreboard players add __$std_ceil __std.ceil 1
# store as double in specified location
execute store result storage std:main null \
    int 1 \
    run \
    scoreboard players get __$std_ceil __std.ceil

# free memory and return value
scoreboard objectives remove __std.ceil
data remove storage std:temp ceil
return run \
    data get storage std:main null
