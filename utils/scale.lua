require("utils.utils")

local adjust_visuals = require("big-factories.scripts.adjustVisuals")

function scale_size(entity, size_factor, speed_factor)
    local old_size = entity.selection_box[2][1]
    local old_collision = entity.collision_box[2][1]

    local collision_offset = old_size - old_collision
    local new_size = old_size * size_factor
    local new_collision = new_size - collision_offset

    entity.collision_box = {{ -new_collision, -new_collision }, { new_collision, new_collision }}
    entity.selection_box = {{ -new_size, -new_size }, { new_size, new_size }}

    adjust_visuals(entity, size_factor, 1 / speed_factor)
end

function scale_entity(entity)
    scale_size(entity, SIZE_FACTOR, SPEED_FACTOR)
    entity.crafting_speed = entity.crafting_speed * SPEED_FACTOR
    update_energy_usage(entity, SPEED_FACTOR)

    return entity
end
