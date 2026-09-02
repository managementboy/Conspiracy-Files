local Content = require("ConspiracyFiles/Content")
local Ids = require("ConspiracyFiles/Ids")
local Journal = require("ConspiracyFiles/Journal")

local Validator = {}

Validator.MAX_DEPTH = 64
Validator.MAX_ENCODED_BYTES = 500 * 1024
Validator.CURRENT_SCHEMA_VERSION = 2
Validator.PZ_MINOR_LINE = "42.20"
Validator.MAX_CONTEXT_TEXT_BYTES = 4096
Validator.MAX_SUBJECT_LABEL_BYTES = 256
Validator.MAX_MARK_INTENT_ID_BYTES = 128

Validator.MATERIALISATION_STATES = {
    pending = true, placing = true, placed = true, unavailable = true, conflict = true
}

Validator.PHYSICAL_AVAILABILITY_STATES = {
    untracked = true, unknown = true, available = true, unavailable = true, conflict = true
}

local ROOT_FIELDS = {
    schemaVersion = true, threadId = true, contentRevision = true, pzMinorLine = true,
    entryOpportunityUsed = true, assetMaterialisation = true, physicalAvailability = true,
    confirmedLocationIds = true, evidence = true, journal = true
}

local EVIDENCE_FIELDS = {
    evidenceId = true, kind = true, assetId = true, discoveryOrdinal = true,
    contextText = true, foundLocationId = true, playerMarkedInteresting = true,
    markIntentId = true, subjectLabel = true
}

local function fail(path, message)
    return false, path .. ": " .. message
end

local function isInteger(value)
    return type(value) == "number" and value >= 1 and value == math.floor(value)
end

local function checkBoundedString(value, maximum, path)
    if type(value) ~= "string" or value == "" then return fail(path, "must be a non-empty string") end
    if string.len(value) > maximum then return fail(path, "exceeds " .. maximum .. " bytes") end
    return true
end

local function checkAllowedFields(value, allowed, path)
    for key, _ in pairs(value) do
        if type(key) ~= "string" or not allowed[key] then
            return fail(path, "unexpected field " .. tostring(key))
        end
    end
    return true
end

local function checkDenseArray(value, path)
    local count = 0
    for key, _ in pairs(value) do
        if not isInteger(key) then
            return fail(path, "must be a dense array")
        end
        count = count + 1
    end
    for index = 1, count do
        if value[index] == nil then
            return fail(path, "must be a dense array")
        end
    end
    return true, count
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

local function validateSchema(root)
    local ok, message = checkAllowedFields(root, ROOT_FIELDS, "root")
    if not ok then return false, message end
    if root.schemaVersion ~= Validator.CURRENT_SCHEMA_VERSION then
        return fail("root.schemaVersion", "unsupported schema; expected " .. Validator.CURRENT_SCHEMA_VERSION)
    end
    if root.threadId ~= Content.thread.threadId then return fail("root.threadId", "unknown Thread ID") end
    ok, message = checkBoundedString(root.contentRevision, 128, "root.contentRevision")
    if not ok then return false, message end
    ok, message = checkBoundedString(root.pzMinorLine, 32, "root.pzMinorLine")
    if not ok then return false, message end
    if root.entryOpportunityUsed ~= nil and root.entryOpportunityUsed ~= "anchor" and root.entryOpportunityUsed ~= "fallback" then
        return fail("root.entryOpportunityUsed", "must be anchor, fallback or absent")
    end
    if type(root.assetMaterialisation) ~= "table" then return fail("root.assetMaterialisation", "must be a table") end
    if type(root.physicalAvailability) ~= "table" then return fail("root.physicalAvailability", "must be a table") end
    if type(root.confirmedLocationIds) ~= "table" then return fail("root.confirmedLocationIds", "must be a table") end
    if type(root.evidence) ~= "table" then return fail("root.evidence", "must be a table") end
    if type(root.journal) ~= "table" then return fail("root.journal", "must be a table") end

    for assetId, status in pairs(root.assetMaterialisation) do
        if not Content.assets[assetId] then return fail("root.assetMaterialisation", "unknown Asset ID " .. tostring(assetId)) end
        if not Validator.MATERIALISATION_STATES[status] then return fail("root.assetMaterialisation", "unknown placement state") end
    end
    for assetId, status in pairs(root.physicalAvailability) do
        if not Content.assets[assetId] then return fail("root.physicalAvailability", "unknown Asset ID " .. tostring(assetId)) end
        if not Validator.PHYSICAL_AVAILABILITY_STATES[status] then return fail("root.physicalAvailability", "unknown physical availability state") end
        local placement = root.assetMaterialisation[assetId]
        if placement ~= "placed" and placement ~= "conflict" then
            return fail("root.physicalAvailability", "requires placed or conflict placement state")
        end
    end

    local locationSeen = {}
    local locationOk, locationCount = checkDenseArray(root.confirmedLocationIds, "root.confirmedLocationIds")
    if not locationOk then return false, locationCount end
    for index = 1, locationCount do
        local locationId = root.confirmedLocationIds[index]
        if type(locationId) ~= "string" or not Content.locations[locationId] then return fail("root.confirmedLocationIds", "unknown Location ID") end
        if locationSeen[locationId] then return fail("root.confirmedLocationIds", "duplicate Location ID") end
        locationSeen[locationId] = true
    end

    local evidenceOk, evidenceCount = checkDenseArray(root.evidence, "root.evidence")
    if not evidenceOk then return false, evidenceCount end
    local evidenceIds = {}
    local markIntents = {}
    local markedAssets = {}
    local markedCount = 0
    for index = 1, evidenceCount do
        local evidence = root.evidence[index]
        if type(evidence) ~= "table" then return fail("root.evidence", "record must be a table") end
        ok, message = checkAllowedFields(evidence, EVIDENCE_FIELDS, "root.evidence[" .. index .. "]")
        if not ok then return false, message end
        if not Ids.isAuthored(evidence.evidenceId) then return fail("root.evidence", "invalid Evidence ID") end
        if evidenceIds[evidence.evidenceId] then return fail("root.evidence", "duplicate Evidence ID") end
        evidenceIds[evidence.evidenceId] = evidence
        if evidence.discoveryOrdinal ~= index then return fail("root.evidence", "discovery ordinals must be contiguous") end
        ok, message = checkBoundedString(evidence.contextText, Validator.MAX_CONTEXT_TEXT_BYTES, "root.evidence[" .. index .. "].contextText")
        if not ok then return false, message end
        if evidence.foundLocationId ~= nil and not Content.locations[evidence.foundLocationId] then return fail("root.evidence", "unknown found Location ID") end
        if type(evidence.playerMarkedInteresting) ~= "boolean" then return fail("root.evidence", "creation intent flag must be boolean") end
        if evidence.kind == "authored-asset" then
            local asset = Content.assets[evidence.assetId]
            if not asset or asset.assetKind ~= "document" or not asset.autoRecordEvidence then return fail("root.evidence", "authored Evidence has unknown document Asset ID") end
            if evidence.evidenceId ~= Ids.authoredEvidence(evidence.assetId) then return fail("root.evidence", "authored Evidence ID does not match Asset ID") end
            if evidence.playerMarkedInteresting or evidence.markIntentId ~= nil or evidence.subjectLabel ~= nil then return fail("root.evidence", "authored Evidence has marked-object fields") end
        elseif evidence.kind == "marked-object" then
            markedCount = markedCount + 1
            if evidence.evidenceId ~= Ids.markedEvidence(markedCount) then return fail("root.evidence", "marked Evidence IDs must be deterministic and contiguous") end
            if evidence.assetId ~= nil and (not Content.assets[evidence.assetId] or Content.assets[evidence.assetId].assetKind ~= "ordinary-object") then return fail("root.evidence", "marked Evidence Asset ID must resolve to an ordinary object") end
            if not evidence.playerMarkedInteresting then return fail("root.evidence", "marked Evidence must retain creation intent") end
            ok, message = checkBoundedString(evidence.markIntentId, Validator.MAX_MARK_INTENT_ID_BYTES, "root.evidence[" .. index .. "].markIntentId")
            if not ok then return false, message end
            if markIntents[evidence.markIntentId] then return fail("root.evidence", "duplicate mark intent") end
            markIntents[evidence.markIntentId] = true
            if evidence.assetId ~= nil then
                if markedAssets[evidence.assetId] then return fail("root.evidence", "ordinary Asset may be marked only once") end
                markedAssets[evidence.assetId] = true
            else
                ok, message = checkBoundedString(evidence.subjectLabel, Validator.MAX_SUBJECT_LABEL_BYTES, "root.evidence[" .. index .. "].subjectLabel")
                if not ok then return false, message end
            end
        else
            return fail("root.evidence", "unknown Evidence kind")
        end
    end

    local journalOk, journalCount = checkDenseArray(root.journal, "root.journal")
    if not journalOk then return false, journalCount end
    ok, message = Journal.validateHistory(root)
    if not ok then return false, message end
    return true
end

-- Serializer-informed deterministic preflight estimate. string.len already
-- measures encoded source bytes, so charging each byte four times would turn
-- P4-R17's measured 500 KB ceiling into an undocumented ~125 KB ceiling.
-- Type/tag/table allowances retain headroom; live package acceptance still
-- compares representative roots with actual Global ModData file deltas.
local function estimateValue(value)
    local valueType = type(value)
    if valueType == "string" then return 2 + string.len(value) end
    if valueType == "number" then return 9 end
    if valueType == "boolean" then return 2 end
    local bytes = 2
    for key, child in pairs(value) do
        bytes = bytes + 2 + estimateValue(key) + estimateValue(child)
    end
    return bytes
end

function Validator.estimateEncodedBytes(root)
    return estimateValue(root)
end

function Validator.validateStructure(value)
    return validateSafeValue(value, "root", 1, {})
end

function Validator.validate(root)
    if type(root) ~= "table" then return false, "root: must be a table" end
    local contentOk, contentMessage = Content.validate()
    if not contentOk then return false, "static content: " .. contentMessage end
    local ok, message = Validator.validateStructure(root)
    if not ok then return false, message end
    ok, message = validateSchema(root)
    if not ok then return false, message end
    local estimated = Validator.estimateEncodedBytes(root)
    if estimated > Validator.MAX_ENCODED_BYTES then
        return false, "capacity-exceeded: encoded-size estimate " .. estimated .. " exceeds " .. Validator.MAX_ENCODED_BYTES .. " bytes"
    end
    return true, nil, estimated
end

return Validator
