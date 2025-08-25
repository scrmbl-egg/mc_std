#>core_std:command/run_raw
#
# Runs a successfully parsed command macro.
#
# @authors scrmbl-egg
# @input
#   command: #[command(max_length=32500)]
#       Command that will be run.
# @returns
#   Result: same as the specified command.

$return run $(command)
