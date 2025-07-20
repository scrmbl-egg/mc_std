#>core_std:memory/free_data
#
# Processes a single data location for removal.
#
# @authors scrmbl-egg
# @input
#   data_location: struct {storage: #[id="storage"] string, nbt: #[nbt_path=minecraft:storage[[storage]]] string]

$function core_std:fail/free_storage_nbt $(data_location)
