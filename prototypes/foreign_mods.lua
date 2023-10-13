local miniloader = table.deepcopy(data.raw["recipe"]["miniloader"])

miniloader.ingredients = {
    { "underground-belt", 1},
    { "steel-plate", 8},
    { "inserter", 1},
}

data:extend{miniloader}
