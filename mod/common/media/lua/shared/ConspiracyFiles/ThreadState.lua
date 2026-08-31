local Content = require("ConspiracyFiles.Content")
local Ids = require("ConspiracyFiles.Ids")
local Renderer = require("ConspiracyFiles.Renderer")
local Validator = require("ConspiracyFiles.Validator")

local ThreadState = {}

local function copy(value, copies)
    if type(value) ~= "table" then return value end
    copies = copies or {}
    if copies[value] then return copies[value] end
    local result = {}
    copies[value] = result
    for key, child in pairs(value) do result[copy(key, copies)] = copy(child, copies) end
    return result
end

local function freshRoot()
    return {
        schemaVersion = 1,
        threadId = Content.thread.threadId,
        contentRevision = Content.thread.contentRevision,
        assetMaterialisation = {},
        confirmedLocationIds = {},
        evidence = {},
        journal = {}
    }
end

local function contains(list, value)
    for _, candidate in ipairs(list) do if candidate == value then return true end end
    return false
end

local function sameValue(left, right)
    if type(left) ~= type(right) then return false end
    if type(left) ~= "table" then return left == right end
    for key, value in pairs(left) do if not sameValue(value, right[key]) then return false end end
    for key, _ in pairs(right) do if left[key] == nil then return false end end
    return true
end

local function isMonotonicExtension(current, proposed)
    if current.entryOpportunityUsed ~= nil and proposed.entryOpportunityUsed ~= current.entryOpportunityUsed then
        return false, "root.entryOpportunityUsed: committed opportunity cannot regress or change"
    end
    for assetId, status in pairs(current.assetMaterialisation) do
        if proposed.assetMaterialisation[assetId] ~= status then return false, "root.assetMaterialisation: committed state cannot regress" end
    end
    if #proposed.confirmedLocationIds < #current.confirmedLocationIds then return false, "root.confirmedLocationIds: history cannot be truncated" end
    for index = 1, #current.confirmedLocationIds do
        if proposed.confirmedLocationIds[index] ~= current.confirmedLocationIds[index] then return false, "root.confirmedLocationIds: history cannot be reordered" end
    end
    if #proposed.evidence < #current.evidence then return false, "root.evidence: history cannot be truncated" end
    for index = 1, #current.evidence do
        if not sameValue(current.evidence[index], proposed.evidence[index]) then return false, "root.evidence: discovery facts are immutable" end
    end
    if #proposed.journal < #current.journal then return false, "root.journal: history cannot be truncated" end
    for index = 1, #current.journal do
        if not sameValue(current.journal[index], proposed.journal[index]) then return false, "root.journal: entries are append-only and immutable" end
    end
    return true
end

local function findEvidenceByAsset(root, assetId)
    for _, evidence in ipairs(root.evidence) do
        if evidence.assetId == assetId then return evidence end
    end
    return nil
end

local function findMarkIntent(root, markIntentId)
    for _, evidence in ipairs(root.evidence) do
        if evidence.markIntentId == markIntentId then return evidence end
    end
    return nil
end

local function hasJournalKind(root, kind)
    for _, entry in ipairs(root.journal) do if entry.kind == kind then return true end end
    return false
end

local function appendJournal(root, kind, subjectId, relatedId)
    local ordinal = #root.journal + 1
    local entry = { entryId = Ids.journal(ordinal), ordinal = ordinal, kind = kind, subjectId = subjectId }
    if relatedId ~= nil then entry.relatedId = relatedId end
    root.journal[ordinal] = entry
    return entry
end

local function maybeAppendContradiction(root)
    if findEvidenceByAsset(root, Content.ids.d5)
        and findEvidenceByAsset(root, Content.ids.d6)
        and not hasJournalKind(root, "contradiction-surfaced") then
        appendJournal(root, "contradiction-surfaced", Content.ids.d6, Content.ids.d5)
    end
end

local function priorMarkedKey(root)
    for _, evidence in ipairs(root.evidence) do
        if evidence.kind == "marked-object" and evidence.assetId == Content.ids.key then return evidence end
    end
    return nil
end

function ThreadState.new(initialRoot)
    local candidate = initialRoot or freshRoot()
    local ok, message = Validator.validate(candidate)
    if not ok then return nil, message end
    local root = copy(candidate)
    local lastDiagnostic = nil
    local api = {}

    local function stage(mutator)
        local proposed = copy(root)
        local changed, result = mutator(proposed)
        if not changed then return true, result, false end
        local valid, diagnostic = Validator.validate(proposed)
        if not valid then
            lastDiagnostic = diagnostic
            return false, diagnostic, false
        end
        root = proposed
        lastDiagnostic = nil
        return true, result, true
    end

    function api.snapshot()
        return copy(root)
    end

    function api.lastDiagnostic()
        return lastDiagnostic
    end

    function api.replace(proposedRoot)
        local valid, diagnostic = Validator.validate(proposedRoot)
        if not valid then
            lastDiagnostic = diagnostic
            return false, diagnostic
        end
        valid, diagnostic = isMonotonicExtension(root, proposedRoot)
        if not valid then
            lastDiagnostic = diagnostic
            return false, diagnostic
        end
        root = copy(proposedRoot)
        lastDiagnostic = nil
        return true
    end

    function api.useEntryOpportunity(role)
        if role ~= "anchor" and role ~= "fallback" then return false, "entry opportunity must be anchor or fallback" end
        return stage(function(proposed)
            if proposed.entryOpportunityUsed ~= nil then return false, proposed.entryOpportunityUsed end
            proposed.entryOpportunityUsed = role
            return true, role
        end)
    end

    function api.materialise(assetId)
        if not Content.assets[assetId] then return false, "unknown Asset ID" end
        return stage(function(proposed)
            if proposed.assetMaterialisation[assetId] == "materialised" then return false, assetId end
            proposed.assetMaterialisation[assetId] = "materialised"
            return true, assetId
        end)
    end

    function api.discover(assetId, contextText, foundLocationId)
        local asset = Content.assets[assetId]
        if not asset or asset.assetKind ~= "document" or not asset.autoRecordEvidence then return false, "Asset is not an authored document" end
        if type(contextText) ~= "string" or contextText == "" then return false, "contextText must be non-empty" end
        if foundLocationId ~= nil and not Content.locations[foundLocationId] then return false, "unknown found Location ID" end
        return stage(function(proposed)
            local existing = findEvidenceByAsset(proposed, assetId)
            if existing then return false, existing.evidenceId end
            local evidence = {
                evidenceId = Ids.authoredEvidence(assetId),
                kind = "authored-asset",
                assetId = assetId,
                discoveryOrdinal = #proposed.evidence + 1,
                contextText = contextText,
                playerMarkedInteresting = false
            }
            if foundLocationId ~= nil then evidence.foundLocationId = foundLocationId end
            proposed.evidence[#proposed.evidence + 1] = evidence
            appendJournal(proposed, "asset-discovered", assetId)
            if (assetId == Content.ids.d1 or assetId == Content.ids.d2) and not hasJournalKind(proposed, "thread-introduced") then
                appendJournal(proposed, "thread-introduced", Content.thread.threadId, assetId)
            end
            if assetId == Content.ids.d6 then
                local keyEvidence = priorMarkedKey(proposed)
                if keyEvidence then appendJournal(proposed, "evidence-updated", keyEvidence.evidenceId, assetId) end
            end
            maybeAppendContradiction(proposed)
            return true, evidence.evidenceId
        end)
    end

    function api.markInteresting(markIntentId, subject)
        if type(markIntentId) ~= "string" or markIntentId == "" then return false, "markIntentId must be non-empty" end
        if type(subject) ~= "table" then return false, "subject must be a table" end
        if type(subject.contextText) ~= "string" or subject.contextText == "" then return false, "contextText must be non-empty" end
        if subject.assetId ~= nil then
            local asset = Content.assets[subject.assetId]
            if not asset or asset.assetKind ~= "ordinary-object" then return false, "Asset is not a markable ordinary object" end
        elseif type(subject.subjectLabel) ~= "string" or subject.subjectLabel == "" then
            return false, "generic marked object requires subjectLabel"
        end
        if subject.foundLocationId ~= nil and not Content.locations[subject.foundLocationId] then return false, "unknown found Location ID" end
        return stage(function(proposed)
            local existing = findMarkIntent(proposed, markIntentId)
            if existing then return false, existing.evidenceId end
            local markedOrdinal = 1
            for _, evidence in ipairs(proposed.evidence) do if evidence.kind == "marked-object" then markedOrdinal = markedOrdinal + 1 end end
            local evidence = {
                evidenceId = Ids.markedEvidence(markedOrdinal),
                kind = "marked-object",
                discoveryOrdinal = #proposed.evidence + 1,
                contextText = subject.contextText,
                playerMarkedInteresting = true,
                markIntentId = markIntentId
            }
            if subject.assetId ~= nil then evidence.assetId = subject.assetId else evidence.subjectLabel = subject.subjectLabel end
            if subject.foundLocationId ~= nil then evidence.foundLocationId = subject.foundLocationId end
            proposed.evidence[#proposed.evidence + 1] = evidence
            appendJournal(proposed, "marked-interesting", evidence.evidenceId)
            return true, evidence.evidenceId
        end)
    end

    function api.confirmLocation(locationId)
        if not Content.locations[locationId] then return false, "unknown Location ID" end
        return stage(function(proposed)
            if contains(proposed.confirmedLocationIds, locationId) then return false, locationId end
            proposed.confirmedLocationIds[#proposed.confirmedLocationIds + 1] = locationId
            appendJournal(proposed, "location-confirmed", locationId)
            return true, locationId
        end)
    end

    function api.renderJournal()
        return Renderer.renderJournal(root)
    end

    function api.resolveEvidence(evidenceId)
        for _, evidence in ipairs(root.evidence) do
            if evidence.evidenceId == evidenceId then
                local result = copy(evidence)
                if evidence.assetId then
                    local asset = Content.assets[evidence.assetId]
                    if not asset then return nil, "missing static Asset ID " .. evidence.assetId end
                    result.displayName = asset.displayName
                    result.bodyText = asset.bodyText
                    result.references = copy(asset.references or {})
                else
                    result.displayName = evidence.subjectLabel
                    result.references = {}
                end
                return result
            end
        end
        return nil, "unknown Evidence ID"
    end

    function api.organisationLabel(organisationId)
        local organisation = Content.organisations[organisationId]
        if not organisation then return nil, "unknown Organisation ID" end
        for _, evidence in ipairs(root.evidence) do
            for _, revealId in ipairs(organisation.specificNameRevealAssetIds) do
                if evidence.assetId == revealId then return organisation.specificLabel end
            end
        end
        return organisation.genericLabel
    end

    function api.locationLabel(locationId)
        local location = Content.locations[locationId]
        if not location then return nil, "unknown Location ID" end
        if contains(root.confirmedLocationIds, locationId) then return location.confirmedLabel end
        return location.preArrivalLabel
    end

    function api.leads()
        local result, seen = {}, {}
        for _, evidence in ipairs(root.evidence) do
            local asset = evidence.assetId and Content.assets[evidence.assetId] or nil
            for _, locationId in ipairs(asset and asset.leadLocationIds or {}) do
                if not seen[locationId] then
                    result[#result + 1] = { locationId = locationId, label = api.locationLabel(locationId), kind = "ordinary-text" }
                    seen[locationId] = true
                end
            end
        end
        return result
    end

    return api
end

ThreadState.validate = Validator.validate
ThreadState.estimateEncodedBytes = Validator.estimateEncodedBytes
ThreadState.MAX_ENCODED_BYTES = Validator.MAX_ENCODED_BYTES

return ThreadState
