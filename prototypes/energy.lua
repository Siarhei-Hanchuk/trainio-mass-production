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

local boilerRecipe = table.deepcopy(data.raw["recipe"]["boiler-big"])
local steamEngineRecipe = table.deepcopy(data.raw["recipe"]["steam-engine-big"])
local offshorePumpRecipe = table.deepcopy(data.raw["recipe"]["offshore-pump-big"])
local pipeToGroundRecipe = table.deepcopy(data.raw["recipe"]["pipe-to-ground-big"])

replace_ingredient_in_recipe(boilerRecipe, "pipe", "pipe-big")
replace_ingredient_in_recipe(boilerRecipe, "stone-furnace", "stone-furnace-big")
replace_ingredient_in_recipe(steamEngineRecipe, "pipe", "pipe-big")
replace_ingredient_in_recipe(offshorePumpRecipe, "pipe", "pipe-big")
replace_ingredient_in_recipe(pipeToGroundRecipe, "pipe", "pipe-big")


data:extend{
    boiler, boilerRecipe,
    steamEngine, steamEngineRecipe,
    offshorePump, offshorePumpRecipe,
    pipe,
    pipeToGround, pipeToGroundRecipe,
}
