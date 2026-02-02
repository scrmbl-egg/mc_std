#>std:ray/cast
#
# Casts a ray.
#
# @context specified location and rotation
# @input
#   selector: #[entity] #[selector] string
#       Entity selector which the ray will detect.
#   aabb_size: [double @ 0..] @ 3
#       Size of the AABB that will be cast for each step of the ray's path.
#   max_distance: double @ 0..
#       Maximum distance the ray can traverse.
#   collision_mask: #[id="block"] string
#       Block or block tag which will stop the ray path.
#   pierce: boolean
#       `true` if the raycast doesn't stop when detecting one of the entities
#       specified in `selector`.
#   on_entity_found_command: #[command(max_length=32500)] string
#       Command which will be run by the found entity when the ray detects it.
#   on_collision_command: #[command(max_length=32500)] string
#       Command which the ray will run when it collides with a `collision_mask`
#       block.
#   on_step_command: #[command(max_length=32500)] string
#       Command which the ray will run when it makes a step.

# create local scoreboard
scoreboard objectives add __std.raycast dummy

# try get executing entity UUID
data modify storage std:temp raycast.owner_uuid set from entity @s UUID

# summon marker
$summon minecraft:marker ~ ~ ~ { \
    data:{ \
        "std:ray":{ \
            selector:'$(selector)', \
            aabb_size:$(aabb_size), \
            max_distance:$(max_distance), \
            collision_mask:'$(collision_mask)', \
            pierce:$(pierce), \
            on_entity_found_command:'$(on_entity_found_command)', \
            on_collision_command:'$(on_collision_command)', \
            on_step_command:'$(on_step_command)', \
        }, \
    }, \
    Tags:["std.RayCast","std.CurrentRayCast"], \
}

# if UUID was saved (entity executed this command), set it as owner
execute if data storage std:temp raycast.owner_uuid \
    as @n[type=minecraft:marker,tag=std.CurrentRayCast] \
    run \
    data modify entity @s data."std:ray".owner_uuid \
    set from storage std:temp raycast.owner_uuid
# delete later (just in case)
data remove storage std:temp raycast.owner_uuid


# TODO: make raycast step
execute as @n[type=minecraft:marker,tag=std.CurrentRayCast] \
    at @s \
    run \
    function core_std:ray/cast/take_step

# kill marker
kill @n[type=minecraft:marker,tag=std.CurrentRayCast]

# free memory
data remove storage std:temp raycast
scoreboard objectives remove __std.raycast
