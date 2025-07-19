#>std:assert/is_string
#
# Checks if an NBT path is a string.
#
# @authors scrmbl-egg
# @input
#   string_storage: #[id="storage"] string
#       Storage where the alleged string is located.
#   string_nbt: #[nbt_path=minecraft:storage[[string_storage]]] string
#       Storage NBT path where the alleged string is located.
# @returns
#   Success: if the specified NBT path contains a string.

# add local scoreboard
scoreboard objectives add __std.assert dummy

# set $is_string as 0 at first for later
scoreboard players set $is_string __std.assert 0

# save input
data modify storage std:temp assert.string_container set value [{}]
$data modify storage std:temp assert.string_container[0].string \
    set from storage $(string_storage) $(string_nbt)

# build first "get element" function params for later
# (no source_path yet)
data modify storage std:temp assert.get_element_params set value { \
    array_storage:"std:temp", \
    array_nbt:"assert.string_container", \
    out_storage:"std:temp", \
    out_nbt:"assert.obtained_string", \
}

# build "build string query" function params (get element source path)
data modify storage std:temp assert.build_query_params set value { \
    out_storage:"std:temp", \
    out_nbt:"assert.get_element_params.source_path", \
}
data modify storage std:temp assert.build_query_params.string \
    set from storage std:temp assert.string_container[0].string

# build "{string:'$(string)'}" source path parameter
#>_
# @in
#   assert.build_query_params
#       string
#       out_storage
#       out_nbt
function core_std:assert/is_string/build_string_query \
    with storage std:temp assert.build_query_params
#>_
# @out
#   assert.get_element_params
#       source_path

# get element
#>_
# @in
#   assert.get_element_params
#       array_storage
#       array_nbt
#       out_storage
#       out_nbt
#       source_path
function core_std:array/get_element_unsafe \
    with storage std:temp assert.get_element_params

# set $is_string to 1 if the output address contains data
execute if data storage std:temp assert.obtained_string \
    run \
    scoreboard players set $is_string __std.assert 1

# fail if no data was detected
execute if score $is_string __std.assert matches 0 \
    run \
    return run \
    function core_std:assert/fail

# free data if success
scoreboard objectives remove __std.assert
data remove storage std:temp assert

# return 1 for success
return 1
