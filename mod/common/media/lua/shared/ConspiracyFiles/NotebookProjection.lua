local Content = require("ConspiracyFiles/Content")

local NotebookProjection = {}

local function contains(list, value)
    for _, candidate in ipairs(list or {}) do if candidate == value then return true end end
    return false
end

local function knownAssets(snapshot)
    local result = {}
    for _, evidence in ipairs(snapshot.evidence or {}) do
        if evidence.assetId then result[evidence.assetId] = evidence end
    end
    return result
end

local function referenceLabel(state, referenceId)
    local identity = Content.identities[referenceId]
    if identity then return identity.displayLabel .. " — " .. identity.roleDescriptor end
    if Content.organisations[referenceId] then return state.organisationLabel(referenceId) end
    if Content.locations[referenceId] then return state.locationLabel(referenceId) end
    return nil
end

local function joinLines(lines)
    if #lines == 0 then return "None known." end
    return table.concat(lines, "\n")
end

function NotebookProjection.evidence(state)
    local snapshot = state.snapshot()
    local known = knownAssets(snapshot)
    local rows = {}
    for _, evidence in ipairs(snapshot.evidence) do
        local resolved = assert(state.resolveEvidence(evidence.evidenceId))
        local isDocument = evidence.kind == "authored-asset"
        local location = evidence.foundLocationId and state.locationLabel(evidence.foundLocationId) or "Location not recorded"
        local leads, connections = {}, {}
        local asset = evidence.assetId and Content.assets[evidence.assetId] or nil

        for _, locationId in ipairs(asset and asset.leadLocationIds or {}) do
            if not contains(snapshot.confirmedLocationIds, locationId) then
                leads[#leads + 1] = state.locationLabel(locationId) .. " — unresolved"
            end
        end
        if isDocument then
            for _, referenceId in ipairs(resolved.references or {}) do
                local label = referenceLabel(state, referenceId)
                if label then connections[#connections + 1] = label end
            end
        end
        for _, otherId in ipairs(asset and asset.contradictsAssetIds or {}) do
            if known[otherId] then
                connections[#connections + 1] = "Unresolved contradiction with " .. Content.assets[otherId].displayName
            end
        end
        for _, otherId in ipairs(asset and asset.recontextualisesAssetIds or {}) do
            if known[otherId] then
                connections[#connections + 1] = "Adds context to " .. Content.assets[otherId].displayName
            end
        end
        if evidence.assetId == Content.ids.key and known[Content.ids.d6] then
            connections[#connections + 1] = "Pike's shift note links this label to Rourke's receiver ring."
        end

        local typeLabel = isDocument and "Document" or "Marked object"
        local statusLabel = isDocument and "Inspected" or "Marked interesting"
        local body = isDocument and resolved.bodyText or "No document text. This object remains recorded because you marked it interesting."
        local whatThisIs = isDocument and (asset.contextText or "No additional context recorded.") or nil
        rows[#rows + 1] = {
            id = evidence.evidenceId,
            ordinal = evidence.discoveryOrdinal,
            title = resolved.displayName,
            typeLabel = typeLabel,
            statusLabel = statusLabel,
            locationLabel = location,
            contextText = evidence.contextText,
            whatThisIs = whatThisIs,
            bodyText = body,
            leads = leads,
            connections = connections,
            summary = typeLabel .. " - " .. statusLabel .. " - Found: " .. location,
            detailText = resolved.displayName
                .. "\n\nTYPE: " .. typeLabel
                .. "\nSTATUS: " .. statusLabel
                .. "\nFOUND: " .. location
                .. "\nDISCOVERY: " .. tostring(evidence.discoveryOrdinal)
                .. (whatThisIs and "\n\nWHAT THIS IS\n" .. whatThisIs or "")
                .. "\n\nORIGINAL CONTEXT\n" .. evidence.contextText
                .. "\n\nUNRESOLVED LEADS\n" .. joinLines(leads)
                .. "\n\nKNOWN CONNECTIONS\n" .. joinLines(connections)
                .. "\n\nFULL TEXT\n" .. body
        }
    end
    return rows
end

function NotebookProjection.journal(state)
    local rows = {}
    for _, rendered in ipairs(state.renderJournal()) do
        rows[#rows + 1] = {
            id = rendered.entryId,
            ordinal = rendered.ordinal,
            title = rendered.text,
            summary = (rendered.major and "Major" or "Journal") .. " - " .. rendered.kind,
            detailText = rendered.text .. "\n\nEVENT: " .. rendered.kind .. (rendered.major and "\nSTATUS: Major" or "")
        }
    end
    return rows
end

return NotebookProjection
