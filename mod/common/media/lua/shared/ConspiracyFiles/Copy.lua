local Copy = {}

-- Callers must validate untrusted persisted state before copying it. Canonical
-- tables deliberately have value semantics: repeated table identity is
-- rejected instead of preserved, matching Validator.validateStructure.
function Copy.deep(value, seen)
    if type(value) ~= "table" then return value end
    seen = seen or {}
    assert(not seen[value], "cycles and shared-table aliases are forbidden")
    seen[value] = true
    local result = {}
    for key, child in pairs(value) do
        -- Valid canonical keys are primitive strings/numbers, so copying table
        -- keys would be both unreachable and contrary to the storage contract.
        result[key] = Copy.deep(child, seen)
    end
    return result
end

return Copy
