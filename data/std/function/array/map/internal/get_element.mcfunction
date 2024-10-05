# storage:
    # local_array_storage
    # local_array_name
    # local_idx
# generates:
    # local_element

$data modify storage minecraft:std local_element set from storage $(local_array_storage) $(local_array_name)[$(local_idx)]