require("utils.utils")

local BURNER_MINER_PERFORMANCE = 200

local burnerMiner = table.deepcopy(data.raw["mining-drill"]["burner-mining-drill"])
local electricMiner = table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"])

-- burner-mining-drill
burnerMiner.name = burnerMiner.name .. "-big"
burnerMiner.mining_speed = burnerMiner.mining_speed * BURNER_MINER_PERFORMANCE
burnerMiner.resource_searching_radius = burnerMiner.resource_searching_radius * 2
update_energy_usage(burnerMiner, BURNER_MINER_PERFORMANCE)

burnerMiner.radius_visualisation_picture = table.deepcopy(electricMiner.radius_visualisation_picture)

local burnerMinerItem = table.deepcopy(data.raw["item"]["burner-mining-drill"])
burnerMinerItem.name = burnerMinerItem.name .. "-big"
burnerMinerItem.place_result = burnerMinerItem.place_result .. "-big"

local burnerMinerRecipe = table.deepcopy(data.raw["recipe"]["burner-mining-drill"])
burnerMinerRecipe.name = burnerMinerRecipe.name .. "-big"

if burnerMinerRecipe.normal == nil then
    burnerMinerRecipe.result = burnerMinerRecipe.result .. "-big"
else
    burnerMinerRecipe.normal.result = burnerMinerRecipe.normal.result .. "-big"
    burnerMinerRecipe.expensive.result = burnerMinerRecipe.expensive.result .. "-big"
end

-- electric-mining-drill
electricMiner.name = electricMiner.name .. "-big"
electricMiner.mining_speed = electricMiner.mining_speed * BURNER_MINER_PERFORMANCE * 2
electricMiner.resource_searching_radius = electricMiner.resource_searching_radius * 5
update_energy_usage(electricMiner, BURNER_MINER_PERFORMANCE * 2)

local electricMinerItem = table.deepcopy(data.raw["item"]["electric-mining-drill"])
electricMinerItem.name = electricMinerItem.name .. "-big"
electricMinerItem.place_result = electricMinerItem.place_result .. "-big"

local electricMinerRecipe = table.deepcopy(data.raw["recipe"]["electric-mining-drill"])
electricMinerRecipe.name = electricMinerRecipe.name .. "-big"

if electricMinerRecipe.normal == nil then
    electricMinerRecipe.result = electricMinerRecipe.result .. "-big"
else
    electricMinerRecipe.normal.result = electricMinerRecipe.normal.result .. "-big"
    electricMinerRecipe.expensive.result = electricMinerRecipe.expensive.result .. "-big"
end


data:extend{
    burnerMiner, burnerMinerItem, burnerMinerRecipe,
    electricMiner, electricMinerItem, electricMinerRecipe,
}
