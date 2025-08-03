#>std:run_command
#
# Runs a command. Useful for event systems, where some behaviour i.e. commands
# (which are usually function calls) are defined somewhere in memory, and
# called when some conditions are met.
#
# NOTES:
# Don't save command strings with the starting "/" character, since
# commands with this starting character don't work in .mcfunction files.
#
# EXAMPLE:
# In this example, we have the custom:storage storage with the following data:
#   {
#       on_start_command:"function custom:build_structure", \
#       on_timeout_command:"function custom:destroy_structure", \
#   }
#
# @authors scrmbl-egg
# @input
#   command_storage: #[id="storage"] string
#       Storage where the command that will be executed is located.
#   command_nbt: #[nbt_path=minecraft:storage[[command_storage]]] string
#       Storage NBT path where the command that will be executed is located.

## NOTE:
# to help prevent the function from calling itself, when getting the command
# string, we turn the original address into an empty object when calling the
# run_raw function. when recursion occurs, the function won't be able to be
# instantiated, due to a syntax error.

# fail function if infinite recursion is attempted
$execute if data storage \
    std:test run_command.last_location{\
        storage:'$(command_storage)', \
        nbt:'$(command_nbt)', \
    } \
    run \
    function core_std:error/print { \
        function:"std:run_command", \
        text:[ \
           "Can't recursively call this function on the previous NBT ", \
           "location: '$(command_storage) $(command_nbt)'. ", \
           "This is to prevent exceeding command limit, crashes, or any ", \
           "stack overflow-like errors.", \
        ], \
    }
$execute if data storage \
    std:test run_command.last_location{\
        storage:'$(command_storage)', \
        nbt:'$(command_nbt)', \
    } \
    run \
    return fail

# set specified location as the current
$data modify storage std:test run_command.last_location set value { \
    storage:'$(command_storage)', \
    nbt:'$(command_nbt)', \
}

# get referenced command
$data modify storage std:temp run_command.run_params.command \
    set from storage $(command_storage) $(command_nbt)

# run command
function core_std:run_command/run_raw \
    with storage std:temp run_command.run_params

# free memory
data remove storage std:temp run_command
