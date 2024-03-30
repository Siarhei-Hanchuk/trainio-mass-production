require("utils.utils")


local boiler = table.deepcopy(data.raw["boiler"]["boiler"])
local steamEngine = table.deepcopy(data.raw["generator"]["steam-engine"])
local offshorePump = table.deepcopy(data.raw["offshore-pump"]["offshore-pump"])
local pipe = table.deepcopy(data.raw["pipe"]["pipe"])
local pipeToGround = table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])

local boiler, boilerRecipe, boilerItem = copy_entity("boiler", "boiler")
local steamEngine, steamEngineRecipe, steamEngineItem = copy_entity("generator", "steam-engine")
local offshorePump, offshorePumpRecipe, offshorePumpItem = copy_entity("offshore-pump", "offshore-pump")
local pipe, pipeRecipe, pipeItem = copy_entity("pipe", "pipe")
local pipeToGround, pipeToGroundRecipe, pipeToGroundItem = copy_entity("pipe-to-ground", "pipe-to-ground")

update_energy_consumption(boiler, 100 * 5)

pipe.fluid_box.height = (pipe.fluid_box.height or 1) * 100
pipeToGround.fluid_box.height = (pipeToGround.fluid_box.height or 1) * 100

steamEngine.fluid_usage_per_tick = steamEngine.fluid_usage_per_tick * 100

offshorePump.pumping_speed = offshorePump.pumping_speed * 100
offshorePump.fluid_box.height = (offshorePump.fluid_box.height or 2) * 100

boiler.fluid_box.height = (boiler.fluid_box.height or 1) * 100

data:extend{
    boiler, boilerRecipe, boilerItem,
    steamEngine, steamEngineRecipe, steamEngineItem,
    offshorePump, offshorePumpRecipe, offshorePumpItem,
    pipe, pipeRecipe, pipeItem,
    pipeToGround, pipeToGroundRecipe, pipeToGroundItem,
}
