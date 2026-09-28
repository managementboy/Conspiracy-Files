-- Structural checks shared by every saved root: safe values only, and a
-- conservative size estimate. (The Dead Air schema check went with Dead Air.)
local Validator = {}

Validator.MAX_DEPTH = 64
-- NOT A LIMIT IN NO HELP. The owner lifted the save ceiling on 2026-09-27
-- ("No limit at all"; SaveBudget.checkMany never compares against it). Kept
-- only as validateCombined's default for callers that pass none; No Help code
-- must not call validateCombined without an explicit limit.
Validator.MAX_ENCODED_BYTES = 1000000

local function fail(path, message)
    return false, path .. ": " .. message
end

local function validateSafeValue(value, path, depth, seen)
    local valueType = type(value)
    if valueType == "string" or valueType == "boolean" then
        return true
    end
    if valueType == "number" then
        if value ~= value or value == math.huge or value == -math.huge then
            return fail(path, "number must be finite")
        end
        return true
    end
    if valueType ~= "table" then
        return fail(path, "unsupported value type " .. valueType)
    end
    if depth > Validator.MAX_DEPTH then
        return fail(path, "maximum table depth is " .. Validator.MAX_DEPTH)
    end
    if getmetatable(value) ~= nil then
        return fail(path, "metatables are forbidden")
    end
    if seen[value] then
        return fail(path, "cycles and shared-table aliases are forbidden")
    end
    seen[value] = true
    for key, child in pairs(value) do
        local keyType = type(key)
        if keyType ~= "string" and keyType ~= "number" then
            return fail(path, "unsupported key type " .. keyType)
        end
        if keyType == "number" and (key ~= key or key == math.huge or key == -math.huge) then
            return fail(path, "numeric keys must be finite")
        end
        local ok, message = validateSafeValue(child, path .. "[" .. tostring(key) .. "]", depth + 1, seen)
        if not ok then
            return false, message
        end
    end
    return true
end

-- This is deliberately conservative, not a reproduction of PZ's serializer.
-- Strings are charged at four bytes per source byte plus delimiters; numbers
-- receive a fixed worst-case textual allowance; tables include key/value tags
-- and separators. It is a deterministic preflight ceiling for P4-R17.
local function estimateValue(value)
    local valueType = type(value)
    if valueType == "string" then return 2 + (4 * string.len(value)) end
    if valueType == "number" then return 32 end
    if valueType == "boolean" then return 5 end
    local bytes = 2
    for key, child in pairs(value) do
        bytes = bytes + 3 + estimateValue(key) + estimateValue(child)
    end
    return bytes
end

function Validator.estimateEncodedBytes(root)
    local ok, message = Validator.validateStructure(root)
    if not ok then return nil, message end
    return estimateValue(root)
end

function Validator.validateStructure(value)
    return validateSafeValue(value, "root", 1, {})
end

-- Validate each independently stored canonical root before accounting for the
-- whole save. Reject unsafe peers instead of letting a different writer bypass
-- the aggregate limit. No engine dependencies.
function Validator.validateCombined(roots,limit)
    local total=0
    for name,root in pairs(roots) do
        local ok,why=Validator.validateStructure(root)
        if not ok then return false,tostring(name)..": "..tostring(why) end
        total=total+Validator.estimateEncodedBytes(root)
    end
    if total>(limit or Validator.MAX_ENCODED_BYTES) then
        return false,"combined canonical save budget exceeded ("..total.." bytes)"
    end
    return true,total
end

return Validator
