#>std:string/slice
#
# Dynamically slices a string.
#
# @authors scrmbl-egg
# @input
#   string: string
#       String which is going to be sliced.
#   start: int
#       Start index of the slice of the string.
#   end: int
#       End index of the slice of the string.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   The sliced string in the specified location.

# save string
$data modify storage std:temp slice set value { \
    string:'$(string)', \
}

$data modify storage $(out_storage) $(out_nbt) \
    set string storage std:temp slice.string $(start) $(end)

# free memory
data remove storage std:temp slice
