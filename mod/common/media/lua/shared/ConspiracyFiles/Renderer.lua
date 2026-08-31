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

function Renderer.renderEntry(snapshot, journalIndex)
    local entry = snapshot.journal[journalIndex]
    assert(entry, "unknown JournalEntry index")
    local text
    local major = false
    if entry.kind == "asset-discovered" then
        text = assert(Content.assets[entry.subjectId], "missing static Asset ID").journalText
    elseif entry.kind == "thread-introduced" then
        local asset = assert(Content.assets[entry.relatedId], "missing introduction Asset ID")
        local lead = assert(Content.locations[(asset.leadLocationIds or {})[1]], "missing ordinary-text lead")
        text = "Dead Air began with " .. asset.displayName .. ". Its paperwork points toward " .. lead.preArrivalLabel .. "."
        major = true
    elseif entry.kind == "marked-interesting" then
        local evidence = assert(findEvidence(snapshot, entry.subjectId), "missing marked Evidence ID")
        local label = evidence.assetId and Content.assets[evidence.assetId].displayName or evidence.subjectLabel
        text = "Marked interesting: " .. label .. ". " .. evidence.contextText
    elseif entry.kind == "evidence-updated" then
        text = "The red B-37 key I marked earlier matches the relay paperwork. Pike says it came off Rourke's receiver ring and belongs with property record 4471."
    elseif entry.kind == "location-confirmed" then
        local location = assert(Content.locations[entry.subjectId], "missing static Location ID")
        text = "Confirmed " .. location.confirmedLabel .. "."
        major = entry.subjectId == Content.ids.relay and wasRelayReferencedBefore(snapshot, journalIndex)
    elseif entry.kind == "contradiction-surfaced" then
        text = "Pike's shift note says the advance CSS memo was not available when the receiver was taken, although the memo is dated earlier. Both records remain unresolved."
        major = true
    else
        error("unknown JournalEntry kind")
    end
    return { entryId = entry.entryId, ordinal = entry.ordinal, text = text, major = major, kind = entry.kind }
end

function Renderer.renderJournal(snapshot)
    local result = {}
    for index = 1, #snapshot.journal do result[index] = Renderer.renderEntry(snapshot, index) end
    return result
end

return Renderer
