#>core_std:aabb/abs
#
# Returns an equivalent AABB's coordinates, but with the most negative
# coordinates as its new origin, and its most positives as the end, so that
# the size is always positive.
#
# @input
#   origin: [double] @ 3
#   end: [double] @ 3
#   out_storage: string
#   out_nbt: string
# @writes
#   The modified AABB positions in the specified NBT location.

# save parameters
$data modify storage std:temp aabb_abs set value { \
    old_origin:$(origin), \
    old_end:$(end), \
    new_origin:[0.0d, 0.0d, 0.0], \
    new_end:[0.0d, 0.0d, 0.0], \
}

# setup min parameters
data modify storage std:temp aabb_abs.func_params.out_storage \
    set value "std:temp"

## new origin x
data modify storage std:temp aabb_abs.func_params.out_nbt \
    set value "aabb_abs.new_origin[0]"
data modify storage std:temp aabb_abs.func_params.first \
    set from storage std:temp aabb_abs.old_origin[0]
data modify storage std:temp aabb_abs.func_params.second \
    set from storage std:temp aabb_abs.old_end[0]
function std:math/min with storage std:temp aabb_abs.func_params
#>_
# @out
#   aabb_abs
#       new_origin[0]

## new origin y
data modify storage std:temp aabb_abs.func_params.out_nbt \
    set value "aabb_abs.new_origin[1]"
data modify storage std:temp aabb_abs.func_params.first \
    set from storage std:temp aabb_abs.old_origin[1]
data modify storage std:temp aabb_abs.func_params.second \
    set from storage std:temp aabb_abs.old_end[1]
function std:math/min with storage std:temp aabb_abs.func_params
#>_
# @out
#   aabb_abs
#       new_origin[1]

## new origin y
data modify storage std:temp aabb_abs.func_params.out_nbt \
    set value "aabb_abs.new_origin[2]"
data modify storage std:temp aabb_abs.func_params.first \
    set from storage std:temp aabb_abs.old_origin[2]
data modify storage std:temp aabb_abs.func_params.second \
    set from storage std:temp aabb_abs.old_end[2]
function std:math/min with storage std:temp aabb_abs.func_params
#>_
# @out
#   aabb_abs
#       new_origin[2]

## new end x
data modify storage std:temp aabb_abs.func_params.out_nbt \
    set value "aabb_abs.new_end[0]"
data modify storage std:temp aabb_abs.func_params.first \
    set from storage std:temp aabb_abs.old_origin[0]
data modify storage std:temp aabb_abs.func_params.second \
    set from storage std:temp aabb_abs.old_end[0]
function std:math/max with storage std:temp aabb_abs.func_params
#>_
# @out
#   aabb_abs
#       new_end[0]

## new end y
data modify storage std:temp aabb_abs.func_params.out_nbt \
    set value "aabb_abs.new_end[1]"
data modify storage std:temp aabb_abs.func_params.first \
    set from storage std:temp aabb_abs.old_origin[1]
data modify storage std:temp aabb_abs.func_params.second \
    set from storage std:temp aabb_abs.old_end[1]
function std:math/max with storage std:temp aabb_abs.func_params
#>_
# @out
#   aabb_abs
#       new_end[1]

## new end z
data modify storage std:temp aabb_abs.func_params.out_nbt \
    set value "aabb_abs.new_end[2]"
data modify storage std:temp aabb_abs.func_params.first \
    set from storage std:temp aabb_abs.old_origin[2]
data modify storage std:temp aabb_abs.func_params.second \
    set from storage std:temp aabb_abs.old_end[2]
function std:math/max with storage std:temp aabb_abs.func_params
#>_
# @out
#   aabb_abs
#       new_end[2]

# set result
$data modify storage $(out_storage) $(out_nbt).origin \
    set from storage std:temp aabb_abs.new_origin
$data modify storage $(out_storage) $(out_nbt).end \
    set from storage std:temp aabb_abs.new_end

# free memory
data remove storage std:temp aabb_abs
