#>std.core:ray/cast/take_step
#
# Makes the ray take a single step.
#
# @context minecraft:marker (raycast)
# @input
#   entity_selector: #[entity] #[selector] string
#       Entity selector which the ray will detect.
#   aabb_size: [double @ 0..] @ 3
#       Size of the AABB that will be cast for each step of the ray's path.
#   step_distance: double @ 0..
#       Distance the ray will traverse when it makes a single processing step.
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

# TODO: execute on step command if success

# TODO: find entities and execute detection command

# TODO: bounce or stop on collision

# TODO: take step

# TODO: do again if possible
#function std.core:ray/cast/take_step
