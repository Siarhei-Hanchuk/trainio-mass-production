require("utils.scale")

local lab = table.deepcopy(data.raw["lab"]["lab"])
scale_entity_lab(lab)

data:extend{
    lab,
}
