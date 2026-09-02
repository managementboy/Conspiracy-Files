local PhysicalToken = {}

local function hash(text)
    local value = 5381
    for index = 1, string.len(text) do
        value = (value * 33 + string.byte(text, index)) % 4294967296
    end
    return string.format("%08x", value)
end

function PhysicalToken.scope(saveIdentity)
    assert(type(saveIdentity) == "string" and saveIdentity ~= "", "save identity is required")
    return "dead-air-r1-" .. hash(saveIdentity)
end

function PhysicalToken.forAsset(scope, assetId)
    assert(type(scope) == "string" and scope ~= "", "physical identity scope is required")
    assert(type(assetId) == "string" and assetId ~= "", "Asset ID is required")
    return "cf:" .. scope .. ":" .. assetId .. ":1"
end

return PhysicalToken

