#>std:command/run_from_nbt
#
# Runs a command from a string stored in a storage location. Useful for event
# systems, where some behaviour i.e. commands (which are usually function calls)
# are defined somewhere in memory, and called when some conditions are met.
#
# NOTES:
# Don't save command strings with the starting "/" character, since
# commands with this starting character don't work in .mcfunction files.
#
# @authors scrmbl-egg
# @input
#   command_storage: #[id="storage"] string
#       Storage where the command that will be executed is located.
#   command_nbt: #[nbt_path=minecraft:storage[[command_storage]]] string
#       Storage NBT path where the command that will be executed is located.

# fail function if infinite recursion is attempted
$execute if data storage std:temp run_command_from_nbt.last_location{\
        storage:'$(command_storage)', \
        nbt:'$(command_nbt)', \
    } \
    run \
    function core_std:error/print { \
        function:"std:command/run_from_nbt", \
        text:[ \
           "Can't recursively call this function on the previous NBT ", \
           "location: '$(command_storage) $(command_nbt)'. ", \
           "This is to prevent exceeding command limit, crashes, or any ", \
           "stack overflow-like errors.", \
        ], \
    }
$execute if data storage std:temp run_command_from_nbt.last_location{\
        storage:'$(command_storage)', \
        nbt:'$(command_nbt)', \
    } \
    run \
    return fail

# set specified location as the current
$data modify storage std:temp run_command_from_nbt.last_location set value { \
    storage:'$(command_storage)', \
    nbt:'$(command_nbt)', \
}

# get referenced command
$data modify storage std:temp run_command_from_nbt.run_params.command \
    set from storage $(command_storage) $(command_nbt)

# run command
function core_std:command/run_raw \
    with storage std:temp run_command_from_nbt.run_params

# free memory
data remove storage std:temp run_command_from_nbt
