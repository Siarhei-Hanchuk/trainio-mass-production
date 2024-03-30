require("utils.utils")

local BURNER_MINER_PERFORMANCE = 200

local function createBigMiner(minerName, performanceMultiplier, radiusMultiplier)
    local miner, copiedRecipe, minerItem = copy_entity("mining-drill", minerName)
    miner.name = miner.name .. "-big"
    miner.mining_speed = miner.mining_speed * performanceMultiplier
    miner.resource_searching_radius = miner.resource_searching_radius * radiusMultiplier
    update_energy_usage(miner, performanceMultiplier)

    return miner, minerItem, minerRecipe
end

-- burner-mining-drill
local burnerMiner, burnerMinerItem, burnerMinerRecipe = createBigMiner("burner-mining-drill", BURNER_MINER_PERFORMANCE, 2)
burnerMiner.radius_visualisation_picture = table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"].radius_visualisation_picture)

-- electric-mining-drill
local electricMiner, electricMinerItem, electricMinerRecipe = createBigMiner("electric-mining-drill", BURNER_MINER_PERFORMANCE * 2, 5)

data:extend{
    burnerMiner, burnerMinerItem, burnerMinerRecipe,
    electricMiner, electricMinerItem, electricMinerRecipe,
}
