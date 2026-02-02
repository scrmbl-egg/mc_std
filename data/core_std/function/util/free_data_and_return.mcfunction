#>core_std:util/free_data_and_return
#
# @authors scrmbl-egg
# @input
#   value: int
#   storage: #[id="storage"] string
#   nbt: string

# free memory
$data remove storage $(storage) $(nbt)

# return value
$return $(value)
