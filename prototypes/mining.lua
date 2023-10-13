require("utils")

local BURNER_MINER_PERFORMANCE = 200

local burnerMiner = table.deepcopy(data.raw["mining-drill"]["burner-mining-drill"])
local electricMiner = table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"])

burnerMiner.mining_speed = burnerMiner.mining_speed * BURNER_MINER_PERFORMANCE
burnerMiner.resource_searching_radius = burnerMiner.resource_searching_radius * 2
update_energy_usage(burnerMiner, BURNER_MINER_PERFORMANCE)

burnerMiner.radius_visualisation_picture = table.deepcopy(electricMiner.radius_visualisation_picture)

electricMiner.mining_speed = electricMiner.mining_speed * BURNER_MINER_PERFORMANCE * 2
electricMiner.resource_searching_radius = electricMiner.resource_searching_radius * 5
update_energy_usage(electricMiner, BURNER_MINER_PERFORMANCE * 2)

-- electricMiner.energy_usage = "300MW"


local stoneFurnace = table.deepcopy(data.raw["furnace"]["stone-furnace"])
local steelFurnace = table.deepcopy(data.raw["furnace"]["steel-furnace"])
local electricFurnace = table.deepcopy(data.raw["furnace"]["electric-furnace"])

stoneFurnace.crafting_speed = stoneFurnace.crafting_speed * 100
update_energy_usage(stoneFurnace, 100)
steelFurnace.crafting_speed = steelFurnace.crafting_speed * 100
update_energy_usage(steelFurnace, 100)
electricFurnace.crafting_speed = electricFurnace.crafting_speed * 100
update_energy_usage(electricFurnace, 100)


data:extend{burnerMiner, electricMiner, stoneFurnace, steelFurnace, electricFurnace}
