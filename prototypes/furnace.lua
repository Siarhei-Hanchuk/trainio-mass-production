require("utils.scale")

local stoneFurnace, stoneFurnaceRecipe, stoneFurnaceItem = create_big_version("stone-furnace", "furnace")
stoneFurnace.next_upgrade = "steel-furnace-big"
stoneFurnaceRecipe.enabled = true
local steelFurnace, steelFurnaceRecipe, steelFurnaceItem = create_big_version("steel-furnace", "furnace")
local electricFurnace, electricFurnaceRecipe, electricFurnaceItem = create_big_version("electric-furnace", "furnace")

data:extend{
    stoneFurnace, stoneFurnaceRecipe, stoneFurnaceItem,
    steelFurnace, steelFurnaceRecipe, steelFurnaceItem,
    electricFurnace, electricFurnaceRecipe, electricFurnaceItem
}
