require("utils.utils")

replace_entity_with_big("boiler", "boiler")
replace_entity_with_big("generator", "steam-engine")
replace_entity_with_big("offshore-pump", "offshore-pump")
replace_entity_with_big("pipe", "pipe")
replace_entity_with_big("pipe-to-ground", "pipe-to-ground")

local boiler = table.deepcopy(data.raw["boiler"]["boiler-big"])
local steamEngine = table.deepcopy(data.raw["generator"]["steam-engine-big"])
local offshorePump = table.deepcopy(data.raw["offshore-pump"]["offshore-pump-big"])
local pipe = table.deepcopy(data.raw["pipe"]["pipe-big"])
local pipeToGround = table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground-big"])

update_energy_consumption(boiler, 100 * 5)

pipe.fluid_box.height = (pipe.fluid_box.height or 1) * 100
pipeToGround.fluid_box.height = (pipeToGround.fluid_box.height or 1) * 100

steamEngine.fluid_usage_per_tick = steamEngine.fluid_usage_per_tick * 100

offshorePump.pumping_speed = offshorePump.pumping_speed * 100
offshorePump.fluid_box.height = (offshorePump.fluid_box.height or 2) * 100

boiler.fluid_box.height = (boiler.fluid_box.height or 1) * 100

data:extend{
    boiler,
    steamEngine,
    offshorePump,
    pipe,
    pipeToGround,
}
