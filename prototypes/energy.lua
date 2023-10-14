require("utils.utils")


local boiler = table.deepcopy(data.raw["boiler"]["boiler"])
local steamEngine = table.deepcopy(data.raw["generator"]["steam-engine"])
local offshorePump = table.deepcopy(data.raw["offshore-pump"]["offshore-pump"])

update_energy_consumption(boiler, 100 * 5)

local pipe = data.raw["pipe"]["pipe"]
local pipe_to_ground = data.raw["pipe-to-ground"]["pipe-to-ground"]
pipe.fluid_box.height = (pipe.fluid_box.height or 1) * 100
pipe_to_ground.fluid_box.height = (pipe_to_ground.fluid_box.height or 1) * 100

steamEngine.fluid_usage_per_tick = steamEngine.fluid_usage_per_tick * 100

offshorePump.pumping_speed = offshorePump.pumping_speed * 100
offshorePump.fluid_box.height = (offshorePump.fluid_box.height or 2) * 100


boiler.fluid_box.height = (boiler.fluid_box.height or 1) * 100

data:extend{boiler,steamEngine,offshorePump,pipe,pipe_to_ground}
