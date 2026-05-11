#>std:entity/data/remove_data_and_return_value
#
# Dynamically removes a piece of data from a storage and returns the specified
# value right after so that it can be propagated. It is recommended to use this
# function with the `return run` syntax.
#
# @authors scrmbl-egg
# @input
#   entity: #[entity] #[selector] string
#       Entity that contains the data that is going to be removed.
#   nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Entity NBT path of the data that is going to be removed.
#   value: int
#       Value returned by this function.
# @returns
#   Result: the number specified in the `value` parameter.

$function std:entity/data/remove_data { \
    entity:"$(entity)", \
    nbt:"$(nbt)", \
}

$return $(value)
