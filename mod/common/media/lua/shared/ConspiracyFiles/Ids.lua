local Ids = {}

local PREFIX = "dead-air:"

function Ids.isAuthored(value)
    if type(value) ~= "string" or string.sub(value, 1, string.len(PREFIX)) ~= PREFIX then return false end
    local segments = 0
    for segment in string.gmatch(value, "([^:]+)") do
        segments = segments + 1
        if string.match(segment, "^[a-z0-9][a-z0-9%-]*$") == nil then return false end
    end
    return segments >= 2 and string.find(value, "::", 1, true) == nil and string.sub(value, -1) ~= ":"
end

function Ids.journal(ordinal)
    assert(type(ordinal) == "number" and ordinal >= 1 and ordinal == math.floor(ordinal), "invalid journal ordinal")
    -- %04d is a minimum width, not a cap; ordinals intentionally widen at 10000.
    return string.format("dead-air:journal:%04d", ordinal)
end

function Ids.markedEvidence(ordinal)
    assert(type(ordinal) == "number" and ordinal >= 1 and ordinal == math.floor(ordinal), "invalid marked Evidence ordinal")
    -- The `marked` evidence namespace is reserved for runtime records.
    return string.format("dead-air:evidence:marked:%04d", ordinal)
end

function Ids.authoredEvidence(assetId)
    assert(Ids.isAuthored(assetId), "invalid authored Asset ID")
    local slug = string.match(assetId, "^dead%-air:asset:(.+)$")
    assert(slug, "authored Evidence requires a Dead Air Asset ID")
    assert(slug ~= "marked" and string.sub(slug, 1, 7) ~= "marked:", "authored Asset slug uses reserved marked namespace")
    return "dead-air:evidence:" .. slug
end

return Ids
