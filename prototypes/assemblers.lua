require("utils.scale")

for i=1,1 do
    local entity = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-" .. tostring(i)])
    scale_entity(entity)
    entity.next_upgrade = nil

    data:extend{entity}
end
