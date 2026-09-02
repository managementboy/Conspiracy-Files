local Content = require("ConspiracyFiles/Content")
local Ids = require("ConspiracyFiles/Ids")

local Journal = {}

local BASE_FIELDS = {
    entryId = true,
    ordinal = true,
    kind = true,
    subjectId = true
}

-- This is the complete schema-2 event language. A field omitted from a kind's
-- specification is forbidden for that kind, even when another kind uses it.
Journal.SPECS = {
    ["asset-discovered"] = { related = false },
    ["thread-introduced"] = { related = true },
    ["marked-interesting"] = { related = false },
    ["evidence-updated"] = { related = true },
    ["location-confirmed"] = { related = false },
    ["contradiction-surfaced"] = { related = true }
}

local function fail(path, message)
    return false, path .. ": " .. message
end

local function append(root, kind, subjectId, relatedId)
    local spec = Journal.SPECS[kind]
    assert(spec, "unknown journal kind")
    assert(type(subjectId) == "string" and subjectId ~= "", "journal subject ID is required")
    if spec.related then
        assert(type(relatedId) == "string" and relatedId ~= "", "journal related ID is required")
    else
        assert(relatedId == nil, "journal kind forbids a related ID")
    end
    local ordinal = #root.journal + 1
    local entry = {
        entryId = Ids.journal(ordinal),
        ordinal = ordinal,
        kind = kind,
        subjectId = subjectId
    }
    if spec.related then entry.relatedId = relatedId end
    root.journal[ordinal] = entry
    return entry
end

function Journal.appendAssetDiscovered(root, assetId)
    return append(root, "asset-discovered", assetId)
end

function Journal.appendThreadIntroduced(root, assetId)
    return append(root, "thread-introduced", Content.thread.threadId, assetId)
end

function Journal.appendMarkedInteresting(root, evidenceId)
    return append(root, "marked-interesting", evidenceId)
end

function Journal.appendEvidenceUpdated(root, evidenceId, assetId)
    return append(root, "evidence-updated", evidenceId, assetId)
end

function Journal.appendLocationConfirmed(root, locationId)
    return append(root, "location-confirmed", locationId)
end

function Journal.appendContradictionSurfaced(root)
    return append(root, "contradiction-surfaced", Content.ids.d6, Content.ids.d5)
end

local function validateEntryShape(entry, index)
    local path = "root.journal[" .. index .. "]"
    if type(entry) ~= "table" then return fail(path, "record must be a table") end
    local spec = Journal.SPECS[entry.kind]
    if not spec then return fail(path .. ".kind", "unknown event kind") end
    for key, _ in pairs(entry) do
        if type(key) ~= "string" or (not BASE_FIELDS[key] and not (key == "relatedId" and spec.related)) then
            return fail(path, "unexpected field " .. tostring(key) .. " for " .. entry.kind)
        end
    end
    for key, _ in pairs(BASE_FIELDS) do
        if entry[key] == nil then return fail(path, "missing required field " .. key) end
    end
    if entry.entryId ~= Ids.journal(index) or entry.ordinal ~= index then
        return fail(path, "IDs and ordinals must be contiguous")
    end
    if type(entry.subjectId) ~= "string" or not Ids.isAuthored(entry.subjectId) then
        return fail(path .. ".subjectId", "invalid subject ID")
    end
    if spec.related then
        if type(entry.relatedId) ~= "string" or not Ids.isAuthored(entry.relatedId) then
            return fail(path .. ".relatedId", "invalid or missing related ID")
        end
    elseif entry.relatedId ~= nil then
        return fail(path .. ".relatedId", "field is forbidden for " .. entry.kind)
    end
    return true
end

local function expectDerived(journal, index, kind, subjectId, relatedId, message)
    local entry = journal[index]
    if not entry or entry.kind ~= kind or entry.subjectId ~= subjectId or entry.relatedId ~= relatedId then
        return false, message
    end
    return true
end

-- Replay the journal as the exact sequence of public domain mutations that can
-- generate it. Source mutations consume the next canonical Evidence or
-- confirmed Location record; derived entries are accepted only at the causal
-- position where the mutation constructor emits them.
function Journal.validateHistory(root)
    local journal = root.journal
    for index = 1, #journal do
        local ok, message = validateEntryShape(journal[index], index)
        if not ok then return false, message end
    end

    local evidenceIndex = 0
    local locationIndex = 0
    local discovered = {}
    local marked = {}
    local introduced = false
    local contradiction = false
    local b37Updated = false
    local index = 1

    while index <= #journal do
        local entry = journal[index]
        if entry.kind == "asset-discovered" then
            evidenceIndex = evidenceIndex + 1
            local evidence = root.evidence[evidenceIndex]
            local asset = Content.assets[entry.subjectId]
            if not asset or asset.assetKind ~= "document" or not asset.autoRecordEvidence then
                return fail("root.journal[" .. index .. "]", "asset-discovered subject must resolve to an authored document")
            end
            if discovered[entry.subjectId] then
                return fail("root.journal[" .. index .. "]", "duplicate asset-discovered event")
            end
            if not evidence or evidence.kind ~= "authored-asset" or evidence.assetId ~= entry.subjectId
                or evidence.discoveryOrdinal ~= evidenceIndex then
                return fail("root.journal[" .. index .. "]", "asset discovery does not match Evidence discovery order")
            end
            discovered[entry.subjectId] = true
            index = index + 1

            if (entry.subjectId == Content.ids.d1 or entry.subjectId == Content.ids.d2) and not introduced then
                local expectedRole = entry.subjectId == Content.ids.d1 and "anchor" or "fallback"
                local ok, message = expectDerived(journal, index, "thread-introduced",
                    Content.thread.threadId, entry.subjectId,
                    "thread introduction must immediately follow and reference the first D1/D2 discovery")
                if not ok then return fail("root.journal", message) end
                if root.entryOpportunityUsed ~= expectedRole then
                    return fail("root.entryOpportunityUsed", "does not match committed thread introduction")
                end
                introduced = true
                index = index + 1
            end

            if entry.subjectId == Content.ids.d6 then
                local keyEvidenceId = nil
                for evidenceId, assetId in pairs(marked) do
                    if assetId == Content.ids.key then keyEvidenceId = evidenceId end
                end
                if keyEvidenceId then
                    local ok, message = expectDerived(journal, index, "evidence-updated",
                        keyEvidenceId, Content.ids.d6,
                        "B-37 recontextualisation must immediately follow the triggering D6 discovery")
                    if not ok then return fail("root.journal", message) end
                    b37Updated = true
                    index = index + 1
                end
            end

            if (entry.subjectId == Content.ids.d5 or entry.subjectId == Content.ids.d6)
                and discovered[Content.ids.d5] and discovered[Content.ids.d6] and not contradiction then
                local ok, message = expectDerived(journal, index, "contradiction-surfaced",
                    Content.ids.d6, Content.ids.d5,
                    "contradiction must immediately follow its completing discovery and same-trigger B-37 update")
                if not ok then return fail("root.journal", message) end
                contradiction = true
                index = index + 1
            end
        elseif entry.kind == "marked-interesting" then
            evidenceIndex = evidenceIndex + 1
            local evidence = root.evidence[evidenceIndex]
            if not evidence or evidence.kind ~= "marked-object" or evidence.evidenceId ~= entry.subjectId
                or evidence.discoveryOrdinal ~= evidenceIndex then
                return fail("root.journal[" .. index .. "]", "marked event does not match Evidence discovery order")
            end
            if marked[evidence.evidenceId] then
                return fail("root.journal[" .. index .. "]", "duplicate marked-interesting event")
            end
            marked[evidence.evidenceId] = evidence.assetId or false
            index = index + 1
        elseif entry.kind == "location-confirmed" then
            locationIndex = locationIndex + 1
            if root.confirmedLocationIds[locationIndex] ~= entry.subjectId then
                return fail("root.journal[" .. index .. "]", "location event does not match confirmed Location order")
            end
            index = index + 1
        else
            return fail("root.journal[" .. index .. "]",
                "derived event " .. entry.kind .. " has no domain mutation at this position")
        end
    end

    if evidenceIndex ~= #root.evidence then return fail("root.journal", "Evidence history is incomplete") end
    if locationIndex ~= #root.confirmedLocationIds then return fail("root.journal", "confirmed Location history is incomplete") end
    if (discovered[Content.ids.d1] or discovered[Content.ids.d2]) and not introduced then
        return fail("root.journal", "D1/D2 discovery requires exactly one thread introduction")
    end
    if discovered[Content.ids.d5] and discovered[Content.ids.d6] and not contradiction then
        return fail("root.journal", "D5/D6 discovery requires exactly one contradiction event")
    end
    local markedKeyBeforeD6 = false
    if discovered[Content.ids.d6] then
        -- If the replay saw a key before D6 it necessarily consumed the update;
        -- an update cannot otherwise appear because derived entries are rejected
        -- as top-level events.
        for _, assetId in pairs(marked) do if assetId == Content.ids.key then markedKeyBeforeD6 = true end end
    end
    if b37Updated and not markedKeyBeforeD6 then
        return fail("root.journal", "B-37 recontextualisation has no prior marked key")
    end
    return true
end

return Journal
