#>std:entity/data/get_type_tag
#
# Gets the type tag of a referenced value inside the data of the executing
# entity.
#
# @input
#   nbt: #[nbt_path=minecraft:entity[[%unknown]]] string
#       NBT path of the data whose type is going to be checked.
# @returns
#   Result: type tag of the referenced type. 0 is returned when nothing is
#           found.

## SET UP LOCAL DATA
data modify storage std:temp ent_type set value { \
    get_data_unsafe_args:{ \
        nbt:"", \
        out_storage:"std:temp", \
        out_nbt:"ent_type.string_from_data_args.data.data", \
    }, \
    string_from_data_args:{ \
        data:{data:{"std:invalid_type":{}}}, \
        out_storage:"std:temp", \
        out_nbt:"ent_type.string", \
    }, \
    string:"", \
    sub:{ \
        start:"", \
        end:"", \
        type_chars:{}, \
    }, \
    remove_data_and_return_value_args:{ \
        value:0, \
        storage:"std:temp", \
        nbt:"ent_type", \
    }, \
}
# get passed path
$data modify storage std:temp ent_type.get_data_unsafe_args.nbt \
    set value '$(nbt)'

# if path is empty, turn it into a valid path "{}"
execute if data storage std:temp ent_type.get_data_unsafe_args{nbt:""} \
    run \
    data modify storage std:temp ent_type.get_data_unsafe_args.nbt \
    set value "{}"

# get valid data from the entity
function std.core:entity/get_data_unsafe \
    with storage std:temp ent_type.get_data_unsafe_args

# if no data was obtained, just return TAG_End (0)
execute if data storage std:temp ent_type.string_from_data_args.data{ \
    data:{"std:invalid_type":{}}, \
} \
    run \
    return run \
    function std:storage/remove_data_and_return_value \
    with storage std:temp ent_type.remove_data_and_return_value_args

# turn obtained data inside the container into a string
function std:string/from_data \
    with storage std:temp ent_type.string_from_data_args

# get substrings
data modify storage std:temp ent_type.sub.start \
    set string storage std:temp ent_type.string 6 7
data modify storage std:temp ent_type.sub.end \
    set string storage std:temp ent_type.string -2 -1

# if a list is found, try to get its type
execute if data storage std:temp ent_type.sub{start:"[",end:"]"} \
    run \
    data modify storage std:temp ent_type.sub.type_chars \
    set string storage std:temp ent_type.string 6 9


## CHECK EACH TYPE
# TAG_Byte
execute if data storage std:temp ent_type.sub{end:"b"} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/byte/type_tag

# TAG_Short
execute if data storage std:temp ent_type.sub{end:"s"} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/short/type_tag

# TAG_Long
execute if data storage std:temp ent_type.sub{end:"L"} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/long/type_tag

# TAG_Float
execute if data storage std:temp ent_type.sub{end:"f"} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/float/type_tag

# TAG_Double
execute if data storage std:temp ent_type.sub{end:"d"} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/double/type_tag

# TAG_Byte_Array
execute if data storage std:temp ent_type.sub{ \
    type_chars:"[B;", \
    start:"[", \
    end:"]", \
} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/byte_array/type_tag

# TAG_String
execute if data storage std:temp ent_type.sub{start:"'",end:"'"} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/string/type_tag
execute if data storage std:temp ent_type.sub{start:"\"",end:"\""} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/string/type_tag

# TAG_List
execute if data storage std:temp ent_type.sub{start:"[",end:"]"} \
    unless data storage std:temp ent_type.sub{type_chars:"[B;"} \
    unless data storage std:temp ent_type.sub{type_chars:"[I;"} \
    unless data storage std:temp ent_type.sub{type_chars:"[L;"} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/list/type_tag

# TAG_Compound
execute if data storage std:temp ent_type.sub{start:"{",end:"}"} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/compound/type_tag

# TAG_Int_Array
execute if data storage std:temp ent_type.sub{ \
    type_chars:"[I;", \
    start:"[", \
    end:"]", \
} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/int_array/type_tag

# TAG_Long_Array
execute if data storage std:temp ent_type.sub{ \
    type_chars:"[L;", \
    start:"[", \
    end:"]", \
} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/long_array/type_tag

# TAG_Int
execute unless data storage std:temp ent_type.sub{start:"["} \
    unless data storage std:temp ent_type.sub{start:"{"} \
    unless data storage std:temp ent_type.sub{start:"'"} \
    unless data storage std:temp ent_type.sub{start:"\""} \
    unless data storage std:temp ent_type.sub{end:"b"} \
    unless data storage std:temp ent_type.sub{end:"s"} \
    unless data storage std:temp ent_type.sub{end:"L"} \
    unless data storage std:temp ent_type.sub{end:"f"} \
    unless data storage std:temp ent_type.sub{end:"d"} \
    run \
    data modify storage \
    std:temp ent_type.remove_data_and_return_value_args.value \
    set compute default integer std:types/int/type_tag


# free memory and return
return run \
    function std:storage/remove_data_and_return_value \
    with storage std:temp ent_type.remove_data_and_return_value_args
