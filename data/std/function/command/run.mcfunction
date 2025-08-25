#>std:command/run
#
# Runs a command from a string. Useful for event systems, where some behaviour
# i.e. commands (which are usually function calls) are defined somewhere in
# memory, and called when some conditions are met.
#
# NOTES:
# Don't save command strings with the starting "/" character, since
# commands with this starting character don't work in .mcfunction files.
#
# @authors scrmbl-egg
# @input
#   command: #[command(max_length=32500)] string
#       Command string that is going to be executed.
# @returns
#   Result: same as the specified command.

# pass command to run raw function
$return run function core_std:command/run_raw {command:'$(command)'}
