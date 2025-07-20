#>std:math/min
#
# Returns the smallest of two numbers.
#
# @authors scrmbl-egg
# @input
#   first: double
#       First number.
#   second: double
#       Second number.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The smallest number in the specified NBT path
# @returns
#   Result: 0 if numbers are equal, 1 if `first` is the smallest, 2 if `second`
#       is the smallest.

# create local scoreboard
scoreboard objectives add __std.min dummy

# save parameters
$data modify storage std:temp min set value { \
    first:$(first), \
    second:$(second), \
}

# get parameters as scores
execute store result score __$std_first __std.min \
    run \
    data get storage std:temp min.first 1000
execute store result score __$std_second __std.min \
    run \
    data get storage std:temp min.second 1000

# output second if first is larger (returns 2)
$execute if score __$std_first __std.min > __$std_second __std.min \
    run \
    data modify storage $(out_storage) $(out_nbt) \
    set from storage std:temp min.second
execute if score __$std_first __std.min > __$std_second __std.min \
    run \
    return run \
    function std:return_value { \
        value:2, \
        score_objectives:["__std.min"], \
        nbt_paths:[{storage:"std:temp",nbt:"min"}], \
        entity_selectors:[], \
    }
# function frees data

# output first if second is larger (returns 1)
$execute if score __$std_first __std.min < __$std_second __std.min \
    run \
    data modify storage $(out_storage) $(out_nbt) \
    set from storage std:temp min.first
execute if score __$std_first __std.min < __$std_second __std.min \
    run \
    return run \
    function std:return_value { \
        value:1, \
        score_objectives:["__std.min"], \
        nbt_paths:[{storage:"std:temp",nbt:"min"}], \
        entity_selectors:[], \
    }
# function frees data

# output nothing if both are equal (returns 0)
execute if score __$std_first __std.min = __$std_second __std.min \
    run \
    return run \
    function std:return_value { \
        value:0, \
        score_objectives:["__std.min"], \
        nbt_paths:[{storage:"std:temp",nbt:"min"}], \
        entity_selectors:[], \
    }
# function frees data
