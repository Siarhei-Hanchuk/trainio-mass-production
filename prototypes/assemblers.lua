require("utils.scale")

for i=1,1 do
    local entity, recipe, item = create_big_version("assembling-machine-" .. tostring(i), "assembling-machine")
    recipe.enabled = true
    entity.next_upgrade = nil

    data:extend{entity, recipe, item}
end
