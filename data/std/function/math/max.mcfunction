#>std:math/max
#
# Returns the biggest of two numbers.
#
# @authors scrmbl-egg
# @input
#   x: double
#       First number.
#   y: double
#       Second number.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The biggest number in the specified NBT path.
# @returns
#   Result: 0 if numbers are equal, 1 if 'x' is the biggest, 2 if 'y' is the
#       biggest.

## NOTE:
# Using std:math/sign on (x - y) will tell us which number is greater. If the
# result of the function is -1, we turn it into a 2. Every other result of the
# sign function on that number mirrors the expected behavior of this function.

# guard clause
execute unless entity 2-0-0-9-deadbeef \
    run \
    return run \
    function core_std:out/print_error/math_entity_not_summoned { \
        function:"std:math/max", \
    }

# set up local data
$data modify storage std:temp max set value { \
    op_args:[ \
        { \
            x:$(x), \
            y:$(y), \
            out_storage:"std:temp", \
            out_nbt:"max.op_args[1].x", \
        }, \
        {x:0}, \
    ], \
    remove_data_and_return_value_args:{ \
        value:0, \
        storage:"std:temp", \
        nbt:"max", \
    }, \
}

# perform subtraction and get sign of result
function std:math/subtract \
    with storage std:temp max.op_args[0]
execute store result storage \
    std:temp max.remove_data_and_return_value_args.value \
    int 1 \
    run \
    function std:math/sign \
    with storage std:temp max.op_args[1]

# if sign was -1 (meaning y is greater than x), turn the value to 2
execute if data storage \
    std:temp max.remove_data_and_return_value_args{value:-1} \
    run \
    data modify storage std:temp max.remove_data_and_return_value_args.value \
    set value 2

# if return value is 0 or 1 (numbers are equal or first number is greater),
# set the first number as output.
$execute if data storage \
    std:temp max.remove_data_and_return_value_args{value:0} \
    run \
    data modify storage $(out_storage) $(out_nbt) set value $(x)
$execute if data storage \
    std:temp max.remove_data_and_return_value_args{value:1} \
    run \
    data modify storage $(out_storage) $(out_nbt) set value $(x)
# if second number is greater, output the second number.
$execute if data storage \
    std:temp max.remove_data_and_return_value_args{value:2} \
    run \
    data modify storage $(out_storage) $(out_nbt) set value $(y)

# return from function and return value, freeing memory
function std:storage/remove_data_and_return_value \
    with storage std:temp max.remove_data_and_return_value_args
