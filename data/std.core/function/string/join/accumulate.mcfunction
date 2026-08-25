#>std.core:string/join/accumulate
#
# Accumulates the next string when concatinating strings in `std:string/join`.
#
# @input
#   accumulation: string
#       String which is going to accumulate the next string.
#   separator: string
#       String separator.
#   next: string
#       Next string.
#   out_storage: #[id="storage"] string
#       Storage where the result will be stored.
#   out_nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Storage NBT path where the result will be stored.
# @writes
#   Accumulated string in the original specified output.

# HACK: this makes accumulation easier
$data modify storage std:temp for_each_scopes[-1].context_args.accumulation \
    set value "$(accumulation)$(separator)$(next)"
$data modify storage $(out_storage) $(out_nbt) \
    set from storage std:temp for_each_scopes[-1].context_args.accumulation
