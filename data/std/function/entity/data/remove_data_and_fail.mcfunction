#>std:entity/data/remove_data_and_fail
#
# Dynamically a piece of data from an entity and returns failure right after
# so that it can be propagated. It is recommended to use this function with
# the `return run` syntax.
#
# @authors scrmbl-egg
# @input
#   entity: #[entity] #[selector] string
#       Entity that contains the data that is going to be removed.
#   nbt: #[nbt_path=minecraft:storage[[out_storage]]] string
#       Entity NBT path of the data that is going to be removed.
# @returns
#   Success: always fails

$function std:entity/data/remove_data { \
    entity:"$(entity)", \
    nbt:"$(nbt)", \
}

return fail
