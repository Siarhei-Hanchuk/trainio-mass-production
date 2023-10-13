local railWorld = table.deepcopy(data.raw["map-gen-presets"]["default"]["rail-world"])

for _, params in pairs(railWorld["basic_settings"]["autoplace_controls"]) do
    params["frequency"] = 0.16666667
    params["size"] = 6
    params["richness"] = 6
end

data.raw["map-gen-presets"].default["trainio"] = railWorld
