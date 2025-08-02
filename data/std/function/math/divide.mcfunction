# Input:
# in_storage - storage where the dividend is stored
# in_path - storage NBT path where the dividend is stored
# divisor - the number by which to divide, cant be higher than 21474
# out_storage - storage where the result will be stored
# out_path - storage NBT path where the result will be stored

# NOTE: Maximum scoreboard value is 2147483647 (2^31 - 1)

# create local score
scoreboard objectives add __std.divide dummy

# assgn divisor to a score
$scoreboard players set __$std_divisor __std.divide $(divisor)

# assign constants to do an inversion
scoreboard players set __$std_result __std.divide 100000

# return fail if divisor is ..-21475 or 21475..
execute if score __$std_divisor __std.divide matches ..-21475 run return fail
execute if score __$std_divisor __std.divide matches 21475.. run return fail

# perform inversion of divisor
scoreboard players operation __$std_result __std.divide /= __$std_divisor __std.divide

# store dividend in a storage
execute store result storage std:temp divide.divisor double 0.00001 \
    run scoreboard players get __$std_result __std.divide

# store inputs in storage
$data modify storage std:temp divide.in_storage set value "$(in_storage)"
$data modify storage std:temp divide.in_path set value "$(in_path)"
$data modify storage std:temp divide.out_storage set value "$(out_storage)"
$data modify storage std:temp divide.out_path set value "$(out_path)"

# perform division
function core_std:divide/execute with storage std:temp divide

# free memory
scoreboard objectives remove __std.divide
data remove storage std:temp divide

# TODO

# return fail if dividend is not a number
# return fail if divisor is not a number
# docs
# get format from input and use it to store the result in: data\core_std\function\divide\execute.mcfunction

# TODO improvements:
# add scale factor as input
