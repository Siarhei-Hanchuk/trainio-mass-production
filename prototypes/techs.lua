techs = {
    'automation', 'logistics', 'steel-processing', 'automation', 'railway', 'automated-rail-transportation',
    'optics', 'electric-energy-distribution-1', 'miniloader', 'engine', 'rail-signals',
    -- 'ultra-fast-configurable-inserter'
}

local ingredients = { { "automation-science-pack", 1, }, }

for _, tech in ipairs(techs) do
    local tech = table.deepcopy(data.raw["technology"][tech])
    tech.prerequisites = {}
    tech.unit.count = 1
    tech.unit.ingredients = ingredients
    tech.enabled = true
    data:extend{tech}
end
