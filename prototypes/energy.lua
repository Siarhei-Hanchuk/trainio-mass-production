require("utils.utils")


local boiler = table.deepcopy(data.raw["boiler"]["boiler"])
local steamEngine = table.deepcopy(data.raw["generator"]["steam-engine"])
local offshorePump = table.deepcopy(data.raw["offshore-pump"]["offshore-pump"])
local pipe = table.deepcopy(data.raw["pipe"]["pipe"])
local pipeToGround = table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])

boiler.name = boiler.name .. "-big"
steamEngine.name = steamEngine.name .. "-big"
offshorePump.name = offshorePump.name .. "-big"
pipe.name = pipe.name .. "-big"
pipeToGround.name = pipeToGround.name .. "-big"

boilerRecipe = copy_recepi("boiler", "big")
steamEngineRecipe = copy_recepi("steam-engine", "big")
offshorePumpRecipe = copy_recepi("offshore-pump", "big")
pipeRecipe = copy_recepi("pipe", "big")
pipeToGroundRecipe = copy_recepi("pipe-to-ground", "big")

boilerItem = copy_item("boiler", "big")
steamEngineItem = copy_item("steam-engine", "big")
offshorePumpItem = copy_item("offshore-pump", "big")
pipeItem = copy_item("pipe", "big")
pipeToGroundItem = copy_item("pipe-to-ground", "big")

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
