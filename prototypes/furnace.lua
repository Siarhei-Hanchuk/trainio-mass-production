require("utils.scale")

local stoneFurnace, stoneFurnaceRecipe, stoneFurnaceItem = create_big_version("stone-furnace", "furnace")
stoneFurnace.next_upgrade = "steel-furnace-big"
local steelFurnace, steelFurnaceRecipe, steelFurnaceItem = create_big_version("steel-furnace", "furnace")
local electricFurnace, electricFurnaceRecipe, electricFurnaceItem = create_big_version("electric-furnace", "furnace")

table.insert(data.raw.technology["advanced-material-processing"].effects, {
    type = "unlock-recipe",
    recipe = "steel-furnace-big",
})

table.insert(data.raw.technology["advanced-material-processing-2"].effects, {
    type = "unlock-recipe",
    recipe = "electric-furnace-big",
})


data:extend{
    stoneFurnace, stoneFurnaceRecipe, stoneFurnaceItem,
    steelFurnace, steelFurnaceRecipe, steelFurnaceItem,
    electricFurnace, electricFurnaceRecipe, electricFurnaceItem
}
