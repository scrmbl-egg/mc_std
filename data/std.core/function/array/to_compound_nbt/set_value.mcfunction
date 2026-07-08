#>std.core:array/to_compound_nbt/set_value
#
# Sets a single value when converting an array to a compound NBT. This function
# is necessary because if the normal commands were to be used with macros, in
# strings with spaces would invalidate them.
#
# When a string is passed to this function, it should be surrounded by escaped
# quotes inside the string itself.
#
# @authors scrmbl-egg
# @input
#   out_storage: #[id="storage"] string
#       Output storage.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Output NBT path.
#   value: any
#       Value.

$data modify storage $(out_storage) $(out_nbt) set value $(value)
