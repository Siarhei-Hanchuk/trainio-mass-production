require("utils")


local boiler = table.deepcopy(data.raw["boiler"]["boiler"])
local steamEngine = table.deepcopy(data.raw["generator"]["steam-engine"])
local offshorePump = table.deepcopy(data.raw["offshore-pump"]["offshore-pump"])

update_energy_consumption(boiler, 100 * 5)

steamEngine.fluid_usage_per_tick = steamEngine.fluid_usage_per_tick * 100

offshorePump.pumping_speed = offshorePump.pumping_speed * 100

data:extend{boiler,steamEngine,offshorePump}
