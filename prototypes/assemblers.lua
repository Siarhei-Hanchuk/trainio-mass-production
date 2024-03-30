require("utils.scale")

for i=1,1 do
    local entity = create_big_version("assembling-machine", "assembling-machine-" .. tostring(i))
    entity.next_upgrade = nil

    data:extend{entity}
end
