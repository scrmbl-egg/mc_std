#>std:math/max
#
# Returns the biggest of two numbers.
#
# @authors scrmbl-egg
# @input
#   first: double
#   second: double
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The biggest number in the specified NBT path.
# @returns
#   Result: 0 if numbers are equal, 1 if `first` is the biggest, 2 if `second`
#       is the biggest.

# create local scoreboard
scoreboard objectives add __std.max dummy

# save parameters
$data modify storage std:temp max set value { \
    first:$(first), \
    second:$(second), \
}

# get parameters as scores
execute store result score __$std_first __std.max \
    run \
    data get storage std:temp max.first 1000
execute store result score __$std_second __std.max \
    run \
    data get storage std:temp max.second 1000

# output first if first is larger (returns 1)
$execute if score __$std_first __std.max > __$std_second __std.max \
    run \
    data modify storage $(out_storage) $(out_nbt) \
    set from storage std:temp max.first
execute if score __$std_first __std.max > __$std_second __std.max \
    run \
    return run \
    function std:return_value { \
        value:1, \
        score_objectives:["__std.max"], \
        nbt_paths:[{storage:"std:temp",nbt:"max"}], \
        entity_selectors:[], \
    }
# function frees data

# output second if second is larger (returns 2)
$execute if score __$std_first __std.max < __$std_second __std.max \
    run \
    data modify storage $(out_storage) $(out_nbt) \
    set from storage std:temp max.second
execute if score __$std_first __std.max < __$std_second __std.max \
    run \
    return run \
    function std:return_value { \
        value:2, \
        score_objectives:["__std.max"], \
        nbt_paths:[{storage:"std:temp",nbt:"max"}], \
        entity_selectors:[], \
    }
# function frees data

# output nothing if both are equal (returns 0)
execute if score __$std_first __std.max = __$std_second __std.max \
    run \
    return run \
    function std:return_value { \
        value:0, \
        score_objectives:["__std.max"], \
        nbt_paths:[{storage:"std:temp",nbt:"max"}], \
        entity_selectors:[], \
    }
# function frees data
