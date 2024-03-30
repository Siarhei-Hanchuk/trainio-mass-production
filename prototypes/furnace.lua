require("utils.scale")

stoneFurnace = create_big_version("furnace", "stone-furnace")
steelFurnace = create_big_version("furnace", "steel-furnace")
electricFurnace = create_big_version("furnace", "electric-furnace")

stoneFurnace.next_upgrade = "steel-furnace-big"

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
