require("utils")

for i=1,3 do
    local machine = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-" .. tostring(i)])
    machine.crafting_speed = machine.crafting_speed * 100
    update_energy_usage(machine, 100)

    data:extend{machine}
end
