#>core_std:assert/is_string/build_string_query
#
# @input
#   string: string
#   out_storage: string
#   out_nbt: string
# @writes
#   "{string:"$(string)"}" in specified NBT path.

$data modify storage $(out_storage) $(out_nbt) set value '{string:"$(string)"}'
