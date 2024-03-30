require("utils.utils")

local BURNER_MINER_PERFORMANCE = 200

local function createBigMiner(minerName, performanceMultiplier, radiusMultiplier)
    replace_entity_with_big("mining-drill", minerName)
    local miner = table.deepcopy(data.raw["mining-drill"][minerName .. "-big"])

    miner.mining_speed = miner.mining_speed * performanceMultiplier
    miner.resource_searching_radius = miner.resource_searching_radius * radiusMultiplier
    update_energy_usage(miner, performanceMultiplier)

    return miner
end

local burnerMiner = createBigMiner("burner-mining-drill", BURNER_MINER_PERFORMANCE, 2)
burnerMiner.radius_visualisation_picture = table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"].radius_visualisation_picture)

local burnerMinerRecipe = table.deepcopy(data.raw["recipe"]["burner-mining-drill-big"])

for _, ingredients in pairs({burnerMinerRecipe.normal.ingredients, burnerMinerRecipe.expensive.ingredients}) do
    for i, ingredient in ipairs(ingredients) do
        if ingredient[1] == "stone-furnace" then
            ingredient[1] = "stone-furnace-big"
        end
    end
end

local electricMiner = createBigMiner("electric-mining-drill", BURNER_MINER_PERFORMANCE * 2, 5)

data:extend{
    burnerMiner, burnerMinerRecipe,
    electricMiner,
}
