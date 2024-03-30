SIZE_FACTOR = 9
SPEED_FACTOR = 100


local multipliers = {
    K = 10^3,
    M = 10^6,
    G = 10^9,
    T = 10^12,
    P = 10^15,
    E = 10^18,
    Z = 10^21,
    Y = 10^24,
}

local multipliers_keys = {"", "K", "M", "G", "T", "P", "E", "Z", "Y"}


function update_energy_usage(entity, modifier)
    entity.energy_usage = multiply_energy(entity.energy_usage, modifier)
end

function update_energy_consumption(entity, modifier)
    entity.energy_consumption = multiply_energy(entity.energy_consumption, modifier)
end

function multiply_energy(value, modifier)
    local glob = string.upper(string.sub(value, -1, -1))
    local suffix = string.upper(string.sub(value, -2, -2))
    if tonumber(suffix) then
        suffix = nil
    end
    local value = string.sub(value, 1, suffix and -3 or -2)
    local absolute_value = value * (suffix and multipliers[suffix] or 1)
    local new_value = absolute_value * modifier

    local multiplier = ""

    for _, key in ipairs(multipliers_keys) do
        local x = multipliers[key] or 1
        if new_value / x < 1000 then
            new_value = new_value / x
            new_value = math.floor(new_value * 1000) / 1000
            if math.floor(new_value) - new_value == 0 then
                new_value = math.floor(new_value)
            end
            multiplier = key
            break
        end
    end

    return tostring(new_value) .. multiplier .. glob
end


function replace_unlocked_recipe(recipeName, newRecipeName)
    for _, tech in pairs(data.raw.technology) do
        if tech.effects then
            for _, effect in ipairs(tech.effects) do
                if effect.type == "unlock-recipe" and effect.recipe == recipeName then
                    effect.recipe = newRecipeName
                end
            end
        end
    end
end

function replace_entity_with_big(entityType, entityName)
    local prefix = "-big"
    local copiedEntity = table.deepcopy(data.raw[entityType][entityName])
    copiedEntity.name = copiedEntity.name .. prefix

    copiedEntity.minable.result = copiedEntity.name

    local originalRecipe = table.deepcopy(data.raw["recipe"][entityName])
    if originalRecipe.normal == nil then
        originalRecipe.enabled = false
    else
        originalRecipe.normal.enabled = false
        originalRecipe.expensive.enabled = false
    end

    replace_unlocked_recipe(entityName, entityName .. prefix)

    local copiedRecipe = table.deepcopy(data.raw["recipe"][entityName])

    copiedRecipe.name = copiedRecipe.name .. prefix
    if copiedRecipe.normal == nil then
        copiedRecipe.result = copiedRecipe.result .. prefix
    else
        copiedRecipe.normal.result = copiedRecipe.normal.result .. prefix
        copiedRecipe.expensive.result = copiedRecipe.expensive.result .. prefix
    end

    local copiedItem = table.deepcopy(data.raw["item"][entityName])
    copiedItem.name = copiedItem.name .. prefix
    copiedItem.place_result = copiedItem.place_result .. prefix

    data:extend{copiedEntity, originalRecipe, copiedRecipe, copiedItem}
end
