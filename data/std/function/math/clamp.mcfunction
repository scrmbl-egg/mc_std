#>std:math/clamp
#
# Clamps a 'value' between a minimum and a maximum value.
#
# @authors scrmbl-egg
# @input
#   value: double
#       Number to be clamped.
#   min: double
#       Minimum value.
#   max: double
#       Maximum value.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   Clamped number (double) in the specified destination.

# create local score
scoreboard objectives add __std.clamp dummy

# store params
$data modify storage std:temp clamp set value { \
    value:$(value), \
    min:$(min), \
    max:$(max), \
}

# get data as scores
execute store result score __$std_value __std.clamp \
    run data get storage std:temp clamp.value 10000
execute store result score __$std_min __std.clamp \
    run data get storage std:temp clamp.min 10000
execute store result score __$std_max __std.clamp \
    run data get storage std:temp clamp.max 10000

# assert that min isn't greater than max. if that's the case, abort function
# and free data
execute if score __$std_min __std.clamp > __$std_max __std.clamp \
    run \
    function core_std:error/print { \
        function:"std:math/clamp", \
        text:{ \
            translate:"", \
            fallback:"'min' parameter can't be greater than the 'max' parameter ('min'=%1$s,'max'=%2$s).", \
            with:[ \
                {storage:"std:temp",nbt:"clamp.min"}, \
                {storage:"std:temp",nbt:"clamp.max"}, \
            ], \
        }, \
    }
execute if score __$std_min __std.clamp > __$std_max __std.clamp \
    run \
    return run \
    function std:fail { \
        score_objectives:["__std.clamp"], \
        nbt_paths:[ \
            {storage:"std:temp",nbt:"clamp"}, \
        ], \
        entity_selectors:[], \
    }

# set result storage, change values later if necessary
$data modify storage $(out_storage) $(out_nbt) \
    set value $(value)

# less than minimum case
$execute if score __$std_min __std.clamp > __$std_value __std.clamp \
    run data modify storage $(out_storage) $(out_nbt) \
    set value $(min)

# greater than maximum case
$execute if score __$std_max __std.clamp < __$std_value __std.clamp \
    run data modify storage $(out_storage) $(out_nbt) \
    set value $(max)

# free memory
scoreboard objectives remove __std.clamp
data remove storage std:temp clamp
