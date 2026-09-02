local Content = require("ConspiracyFiles.Content")

local Renderer = {}

local function findEvidence(snapshot, evidenceId)
    for _, evidence in ipairs(snapshot.evidence) do
        if evidence.evidenceId == evidenceId then return evidence end
    end
    return nil
end

local function wasRelayReferencedBefore(snapshot, journalIndex)
    for index = 1, journalIndex - 1 do
        local entry = snapshot.journal[index]
        if entry.kind == "asset-discovered" then
            local asset = Content.assets[entry.subjectId]
            if asset then
                for _, referenceId in ipairs(asset.references or {}) do
                    if referenceId == Content.ids.relay then return true end
                end
                for _, leadId in ipairs(asset.leadLocationIds or {}) do
                    if leadId == Content.ids.relay then return true end
                end
            end
        end
    end
    return false
end

local function renderEntry(snapshot, journalIndex, relayReferencedBefore)
    local entry = snapshot.journal[journalIndex]
    assert(entry, "unknown JournalEntry index")
    local text
    local major = false
    if entry.kind == "asset-discovered" then
        text = assert(Content.assets[entry.subjectId], "missing static Asset ID").journalText
    elseif entry.kind == "thread-introduced" then
        local asset = assert(Content.assets[entry.relatedId], "missing introduction Asset ID")
        local lead = assert(Content.locations[(asset.leadLocationIds or {})[1]], "missing ordinary-text lead")
        text = string.format(Content.strings.threadIntroduced, Content.thread.title, asset.displayName, lead.preArrivalLabel)
        major = true
    elseif entry.kind == "marked-interesting" then
        local evidence = assert(findEvidence(snapshot, entry.subjectId), "missing marked Evidence ID")
        local label = evidence.subjectLabel
        if evidence.assetId then
            label = assert(Content.assets[evidence.assetId], "missing marked static Asset ID").displayName
        end
        assert(type(label) == "string" and label ~= "", "missing marked Evidence label")
        text = string.format(Content.strings.markedInteresting, label, evidence.contextText)
    elseif entry.kind == "evidence-updated" then
        text = Content.strings.evidenceUpdated
    elseif entry.kind == "location-confirmed" then
        local location = assert(Content.locations[entry.subjectId], "missing static Location ID")
        text = string.format(Content.strings.locationConfirmed, location.confirmedLabel)
        major = entry.subjectId == Content.ids.relay and relayReferencedBefore
    elseif entry.kind == "contradiction-surfaced" then
        text = Content.strings.contradictionSurfaced
        major = true
    else
        error("unknown JournalEntry kind")
    end
    return { entryId = entry.entryId, ordinal = entry.ordinal, text = text, major = major, kind = entry.kind }
end

function Renderer.renderEntry(snapshot, journalIndex)
    return renderEntry(snapshot, journalIndex, wasRelayReferencedBefore(snapshot, journalIndex))
end

function Renderer.renderJournal(snapshot)
    local result = {}
    local relayReferenced = false
    for index = 1, #snapshot.journal do
        result[index] = renderEntry(snapshot, index, relayReferenced)
        local entry = snapshot.journal[index]
        if entry.kind == "asset-discovered" then
            local asset = Content.assets[entry.subjectId]
            if asset then
                for _, referenceId in ipairs(asset.references or {}) do
                    if referenceId == Content.ids.relay then relayReferenced = true end
                end
                for _, leadId in ipairs(asset.leadLocationIds or {}) do
                    if leadId == Content.ids.relay then relayReferenced = true end
                end
            end
        end
    end
    return result
end

return Renderer
