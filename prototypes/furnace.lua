require("utils.scale")

local stoneFurnace = table.deepcopy(data.raw["furnace"]["stone-furnace"])
scale_entity(stoneFurnace)

local steelFurnace = table.deepcopy(data.raw["furnace"]["steel-furnace"])
scale_entity(steelFurnace)

local electricFurnace = table.deepcopy(data.raw["furnace"]["electric-furnace"])
scale_entity(electricFurnace)

data:extend{
    stoneFurnace,
    steelFurnace,
    electricFurnace,
}
