require("utils.scale")

replace_entity_with_big("furnace", "stone-furnace")
replace_entity_with_big("furnace", "steel-furnace")
replace_entity_with_big("furnace", "electric-furnace")

local stoneFurnace = table.deepcopy(data.raw["furnace"]["stone-furnace-big"])
stoneFurnace.next_upgrade = "steel-furnace-big"
local steelFurnace = table.deepcopy(data.raw["furnace"]["steel-furnace-big"])
local electricFurnace = table.deepcopy(data.raw["furnace"]["electric-furnace-big"])

table.insert(data.raw.technology["advanced-material-processing"].effects, {
    type = "unlock-recipe",
    recipe = "steel-furnace-big",
})

table.insert(data.raw.technology["advanced-material-processing-2"].effects, {
    type = "unlock-recipe",
    recipe = "electric-furnace-big",
})


data:extend{
    stoneFurnace,
    steelFurnace,
    electricFurnace,
}
