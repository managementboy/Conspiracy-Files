local Copy = {}

-- Callers must validate untrusted persisted state before copying it. The
-- copies table also makes this helper terminate defensively if a trusted
-- caller accidentally supplies an alias or cycle.
function Copy.deep(value, copies)
    if type(value) ~= "table" then return value end
    copies = copies or {}
    if copies[value] then return copies[value] end
    local result = {}
    copies[value] = result
    for key, child in pairs(value) do
        result[Copy.deep(key, copies)] = Copy.deep(child, copies)
    end
    return result
end

return Copy
