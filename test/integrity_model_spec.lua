local CF = require("ConspiracyFiles")
local ids = CF.Content.ids

local function copy(value, seen)
    if type(value) ~= "table" then return value end
    seen = seen or {}
    if seen[value] then return seen[value] end
    local result = {}
    seen[value] = result
    for key, child in pairs(value) do result[copy(key, seen)] = copy(child, seen) end
    return result
end

local function storageWith(initial)
    local roots = {}
    if initial ~= nil then roots[CF.PersistenceAdapter.DEFAULT_TAG] = initial end
    local replacements = 0
    return {
        roots = roots,
        get = function(tag) return roots[tag] end,
        replace = function(tag, value) roots[tag], replacements = value, replacements + 1 end,
        replacementCount = function() return replacements end
    }
end

local function persistenceRejects(candidate, label)
    local before = copy(candidate)
    local storage = storageWith(candidate)
    local adapter = CF.PersistenceAdapter.new({ storage = storage })
    local ok = adapter.load(false)
    assertFalse(ok, label .. " must reject")
    assertFalse(adapter.isLoaded(), label .. " must keep the adapter inactive")
    assertEqual(nil, adapter.snapshot(), label .. " must expose no staged snapshot")
    assertEqual(0, storage.replacementCount(), label .. " must not replace storage")
    assertEqual(candidate, storage.roots[CF.PersistenceAdapter.DEFAULT_TAG], label .. " must retain the root reference")
    assertDeepEqual(before, candidate, label .. " must preserve storage bytes/logical shape")
end

local function publicRoundTrip(state, label)
    local root = state.snapshot()
    local valid, message = CF.Validator.validate(root)
    assertTrue(valid, label .. ": " .. tostring(message))
    local reconstructed, reconstructionMessage = CF.ThreadState.new(root)
    assertTrue(reconstructed ~= nil, label .. ": " .. tostring(reconstructionMessage))
    assertDeepEqual(root, reconstructed.snapshot(), label .. " reconstructed root")
    local storage = storageWith(root)
    local adapter = CF.PersistenceAdapter.new({ storage = storage })
    assertTrue(adapter.load(false), label .. " persistence round trip")
    assertEqual(0, storage.replacementCount(), label .. " valid load must not normalize storage")
    assertDeepEqual(root, adapter.snapshot(), label .. " persisted root")
end

local function renumber(root)
    for index, entry in ipairs(root.journal) do
        entry.ordinal = index
        entry.entryId = CF.Ids.journal(index)
    end
end

local function fullPublicState()
    local state = assert(CF.ThreadState.new())
    assertTrue(state.discover(ids.d1, "D1 model context", ids.relay))
    assertTrue(state.markInteresting("model-key", { assetId = ids.key, contextText = "B-37 model context" }))
    assertTrue(state.markInteresting("model-generic", { subjectLabel = "Uncatalogued receiver", contextText = "Generic context" }))
    assertTrue(state.discover(ids.d5, "D5 model context", ids.police))
    assertTrue(state.discover(ids.d6, "D6 model context", ids.police))
    assertTrue(state.confirmLocation(ids.relay))
    assertTrue(state.confirmLocation(ids.police))
    return state
end

test("integrity model accepts public roots and rejects systematic root and journal mutations without persistence writes", function()
    local generated = {}
    generated[#generated + 1] = { "fresh", assert(CF.ThreadState.new()) }

    local anchor = assert(CF.ThreadState.new())
    assertTrue(anchor.useEntryOpportunity("anchor"))
    generated[#generated + 1] = { "selected-anchor", anchor }

    local discovered = assert(CF.ThreadState.new())
    assertTrue(discovered.discover(ids.d1, "Anchor context", ids.relay))
    generated[#generated + 1] = { "anchor-discovered", discovered }

    local terminalFallback = assert(CF.ThreadState.new())
    assertTrue(terminalFallback.ensureMaterialisation(ids.d1))
    assertTrue(terminalFallback.markPlacementUnavailable(ids.d1))
    assertTrue(terminalFallback.materialise(ids.d2))
    generated[#generated + 1] = { "terminal-fallback", terminalFallback }

    local conclusiveFallback = assert(CF.ThreadState.new())
    assertTrue(conclusiveFallback.materialise(ids.d1))
    assertTrue(conclusiveFallback.materialise(ids.d2))
    assertTrue(conclusiveFallback.reconcilePhysical(ids.d1, "unavailable"))
    generated[#generated + 1] = { "conclusive-fallback", conclusiveFallback }

    local recoveredFallback = assert(CF.ThreadState.new(conclusiveFallback.snapshot()))
    assertTrue(recoveredFallback.reconcilePhysical(ids.d1, "available"))
    generated[#generated + 1] = { "sticky-fallback-after-recovery", recoveredFallback }
    generated[#generated + 1] = { "complete-event-language", fullPublicState() }

    for _, candidate in ipairs(generated) do publicRoundTrip(candidate[2], candidate[1]) end

    local canonical = fullPublicState().snapshot()
    local mutations = {
        { "root/unexpected", function(root) root.unexpected = true end },
        { "schema/missing", function(root) root.schemaVersion = nil end },
        { "schema/wrong", function(root) root.schemaVersion = 999 end },
        { "thread/missing", function(root) root.threadId = nil end },
        { "thread/unknown", function(root) root.threadId = "dead-air:unknown" end },
        { "revision/missing", function(root) root.contentRevision = nil end },
        { "revision/empty", function(root) root.contentRevision = "" end },
        { "revision/type", function(root) root.contentRevision = {} end },
        { "pz-line/missing", function(root) root.pzMinorLine = nil end },
        { "pz-line/type", function(root) root.pzMinorLine = 42.20 end },
        { "entry/unknown", function(root) root.entryOpportunityUsed = "side-door" end },
        { "materialisation/type", function(root) root.assetMaterialisation = "placed" end },
        { "materialisation/unknown-asset", function(root) root.assetMaterialisation["dead-air:asset:unknown"] = "pending" end },
        { "materialisation/unknown-state", function(root) root.assetMaterialisation[ids.d3] = "lost" end },
        { "availability/type", function(root) root.physicalAvailability = "available" end },
        { "availability/unknown-asset", function(root) root.physicalAvailability["dead-air:asset:unknown"] = "unknown" end },
        { "availability/unknown-state", function(root) root.assetMaterialisation[ids.d3] = "placed"; root.physicalAvailability[ids.d3] = "lost" end },
        { "availability/without-placement", function(root) root.physicalAvailability[ids.d3] = "available" end },
        { "locations/type", function(root) root.confirmedLocationIds = "relay" end },
        { "locations/duplicate", function(root) root.confirmedLocationIds[3] = root.confirmedLocationIds[1] end },
        { "locations/unknown", function(root) root.confirmedLocationIds[1] = "dead-air:location:unknown" end },
        { "locations/sparse", function(root) root.confirmedLocationIds[1] = nil end },
        { "evidence/type", function(root) root.evidence = "evidence" end },
        { "evidence/unexpected", function(root) root.evidence[1].unexpected = true end },
        { "evidence/duplicate-id", function(root) root.evidence[2].evidenceId = root.evidence[1].evidenceId end },
        { "evidence/ordinal", function(root) root.evidence[1].discoveryOrdinal = 9 end },
        { "evidence/context", function(root) root.evidence[1].contextText = "" end },
        { "evidence/sparse", function(root) root.evidence[1] = nil end },
        { "journal/type", function(root) root.journal = "journal" end },
        { "journal/order", function(root) root.journal[1], root.journal[2] = root.journal[2], root.journal[1]; renumber(root) end }
    }
    for _, mutation in ipairs(mutations) do
        local hostile = copy(canonical)
        mutation[2](hostile)
        persistenceRejects(hostile, mutation[1])
    end

    local kinds = {
        "asset-discovered", "thread-introduced", "marked-interesting",
        "evidence-updated", "location-confirmed", "contradiction-surfaced"
    }
    local semanticMutations = {
        ["asset-discovered"] = function(entry) entry.subjectId = ids.relay end,
        ["thread-introduced"] = function(entry) entry.subjectId = ids.d1 end,
        ["marked-interesting"] = function(entry) entry.subjectId = ids.d1 end,
        ["evidence-updated"] = function(entry) entry.relatedId = ids.d5 end,
        ["location-confirmed"] = function(entry) entry.subjectId = ids.d1 end,
        ["contradiction-surfaced"] = function(entry) entry.relatedId = ids.d4 end
    }
    for _, kind in ipairs(kinds) do
        local index
        for candidateIndex, entry in ipairs(canonical.journal) do
            if entry.kind == kind then index = candidateIndex; break end
        end
        assertTrue(index ~= nil, "model history lacks " .. kind)
        for _, field in ipairs({ "entryId", "ordinal", "kind", "subjectId" }) do
            local missing = copy(canonical)
            missing.journal[index][field] = nil
            persistenceRejects(missing, "journal/" .. kind .. "/missing-" .. field)
            local wrong = copy(canonical)
            wrong.journal[index][field] = {}
            persistenceRejects(wrong, "journal/" .. kind .. "/wrong-" .. field)
        end
        local extra = copy(canonical)
        extra.journal[index].unexpected = "forbidden"
        persistenceRejects(extra, "journal/" .. kind .. "/extra")
        local duplicated = copy(canonical)
        table.insert(duplicated.journal, index, copy(duplicated.journal[index]))
        renumber(duplicated)
        persistenceRejects(duplicated, "journal/" .. kind .. "/duplicate")
        local association = copy(canonical)
        semanticMutations[kind](association.journal[index])
        persistenceRejects(association, "journal/" .. kind .. "/association")
        local related = kind == "thread-introduced" or kind == "evidence-updated" or kind == "contradiction-surfaced"
        local relation = copy(canonical)
        if related then relation.journal[index].relatedId = nil else relation.journal[index].relatedId = ids.d3 end
        persistenceRejects(relation, "journal/" .. kind .. "/required-forbidden-relation")
    end

    -- Root contentRevision is intentionally informational under P4-R47. This
    -- mutation remains valid; item-carrier display compatibility is the stricter
    -- and separate allowlist tested below.
    local informationalRevision = copy(canonical)
    informationalRevision.contentRevision = "dead-air-r2-informational-only"
    assertTrue(CF.Validator.validate(informationalRevision))
    assertTrue(CF.ThreadState.new(informationalRevision) ~= nil)
end)

local function terminalFallback()
    local state = assert(CF.ThreadState.new())
    assertTrue(state.ensureMaterialisation(ids.d1))
    assertTrue(state.markPlacementUnavailable(ids.d1))
    assertTrue(state.materialise(ids.d2))
    assertEqual("fallback", state.snapshot().entryOpportunityUsed)
    return state
end

local function conclusiveFallback()
    local state = assert(CF.ThreadState.new())
    assertTrue(state.materialise(ids.d1))
    assertTrue(state.materialise(ids.d2))
    assertTrue(state.reconcilePhysical(ids.d1, "unavailable"))
    assertEqual("fallback", state.snapshot().entryOpportunityUsed)
    return state
end

test("integrity fallback eligibility and Evidence subject truth tables preserve every rejected root", function()
    publicRoundTrip(terminalFallback(), "fallback/terminal")
    publicRoundTrip(conclusiveFallback(), "fallback/conclusive")

    for _, availability in ipairs({ "untracked", "unknown", "available", "unavailable", "conflict" }) do
        local state = conclusiveFallback()
        if availability ~= "unavailable" then assertTrue(state.reconcilePhysical(ids.d1, availability)) end
        publicRoundTrip(state, "fallback/post-loss-" .. availability)
    end

    local fallbackConflict = conclusiveFallback()
    assertTrue(fallbackConflict.reconcilePhysical(ids.d2, "conflict"))
    publicRoundTrip(fallbackConflict, "fallback/D2-post-selection-conflict")

    local introduced = conclusiveFallback()
    assertTrue(introduced.discover(ids.d2, "Fallback introduction", ids.police))
    assertTrue(introduced.discover(ids.d1, "Recovered anchor discovered later", ids.relay))
    publicRoundTrip(introduced, "fallback/D2-introduction-before-late-D1")

    local eligibleWithoutCommit = terminalFallback().snapshot()
    eligibleWithoutCommit.entryOpportunityUsed = nil
    persistenceRejects(eligibleWithoutCommit, "fallback/eligible-without-commit")

    local fresh = assert(CF.ThreadState.new()).snapshot()
    local ineligible = {
        { "fresh", nil, nil, nil },
        { "D1-pending", "pending", "placed", nil },
        { "D1-placing", "placing", "placed", nil },
        { "D2-absent", "unavailable", nil, nil },
        { "D2-pending", "unavailable", "pending", nil },
        { "D2-placing", "unavailable", "placing", nil },
        { "D2-unavailable", "unavailable", "unavailable", nil },
        { "D1-placed-without-loss-history", "placed", "placed", nil }
    }
    for _, candidate in ipairs(ineligible) do
        local root = copy(fresh)
        root.entryOpportunityUsed = "fallback"
        if candidate[2] then root.assetMaterialisation[ids.d1] = candidate[2] end
        if candidate[3] then root.assetMaterialisation[ids.d2] = candidate[3] end
        if candidate[4] then root.physicalAvailability[ids.d1] = candidate[4] end
        persistenceRejects(root, "fallback/ineligible-" .. candidate[1])
    end

    local directD2 = assert(CF.ThreadState.new())
    assertFalse(directD2.discover(ids.d2, "Ineligible direct fallback", ids.police))
    assertDeepEqual(assert(CF.ThreadState.new()).snapshot(), directD2.snapshot())

    local assetSubject = assert(CF.ThreadState.new())
    assertTrue(assetSubject.markInteresting("asset-subject", { assetId = ids.key, contextText = "Asset subject" }))
    publicRoundTrip(assetSubject, "evidence/asset-subject")
    local labelSubject = assert(CF.ThreadState.new())
    assertTrue(labelSubject.markInteresting("label-subject", { subjectLabel = "Generic subject", contextText = "Label subject" }))
    publicRoundTrip(labelSubject, "evidence/label-subject")
    assertFalse(assetSubject.markInteresting("both-input", {
        assetId = ids.key, subjectLabel = "Competing label", contextText = "Both"
    }))
    assertFalse(assetSubject.markInteresting("neither-input", { contextText = "Neither" }))

    local subjectMutations = {
        { "both", assetSubject.snapshot(), function(evidence) evidence.subjectLabel = "Competing label" end },
        { "asset-neither", assetSubject.snapshot(), function(evidence) evidence.assetId = nil end },
        { "label-neither", labelSubject.snapshot(), function(evidence) evidence.subjectLabel = nil end },
        { "empty-label", labelSubject.snapshot(), function(evidence) evidence.subjectLabel = "" end },
        { "wrong-label-type", labelSubject.snapshot(), function(evidence) evidence.subjectLabel = 37 end },
        { "wrong-asset-type", assetSubject.snapshot(), function(evidence) evidence.assetId = 37 end },
        { "unknown-asset", assetSubject.snapshot(), function(evidence) evidence.assetId = "dead-air:asset:unknown" end },
        { "document-asset", assetSubject.snapshot(), function(evidence) evidence.assetId = ids.d1 end }
    }
    for _, mutation in ipairs(subjectMutations) do
        local root = copy(mutation[2])
        mutation[3](root.evidence[1])
        persistenceRejects(root, "evidence/subject-" .. mutation[1])
    end
end)

local allAssets = {}
for _, assetId in ipairs(CF.Content.thread.documentAssetIds) do allAssets[#allAssets + 1] = assetId end
for _, assetId in ipairs(CF.Content.thread.optionalAssetIds) do allAssets[#allAssets + 1] = assetId end

local function tokenFor(assetId)
    return "cf:integrity-matrix:" .. assetId
end

local itemPort = {
    modData = function(item)
        if item.modDataMode == "throwing" then error("injected getModData failure") end
        if item.modDataMode == "nil" then return nil end
        if item.modDataMode == "non-table" then return "invalid ModData value" end
        return item.modData
    end,
    setName = function(item, value) item.name, item.nameWrites = value, item.nameWrites + 1 end,
    setCustomName = function(item, value) item.customName, item.customWrites = value, item.customWrites + 1 end,
    displayName = function(item) return item.name end,
    itemType = function(item) return item.itemType end
}

local function item(assetId, owned)
    local value = {
        inventoryItem = true,
        owned = owned ~= false,
        itemType = assetId and CF.Content.assets[assetId].pzItemType or "Base.Junk",
        modData = {}, name = "Ordinary loot", customName = false,
        nameWrites = 0, customWrites = 0
    }
    function value:getModData() return self.modData end
    function value:setName(name) self.name, self.nameWrites = name, self.nameWrites + 1 end
    function value:setCustomName(flag) self.customName, self.customWrites = flag, self.customWrites + 1 end
    function value:getDisplayName() return self.name end
    function value:getFullType() return self.itemType end
    return value
end

local function stamped(assetId, token)
    local value = item(assetId, true)
    assertTrue(CF.ItemProjection.apply(value, assetId, token or tokenFor(assetId), itemPort))
    value.nameWrites, value.customWrites = 0, 0
    return value
end

local function addLegacyMirror(value, mismatch)
    local nested = value.modData.ConspiracyFiles
    local fields = CF.ItemPresentation.LEGACY_FIELDS
    value.modData[fields.schema] = nested.schemaVersion
    value.modData[fields.physicalItemId] = nested.physicalToken
    value.modData[fields.assetId] = nested.assetId
    value.modData[fields.title] = nested.resolvedTitle
    value.modData[fields.description] = nested.resolvedDescription
    value.modData[fields.body] = mismatch and "conflicting mirror body" or nested.resolvedBody
end

local function carrier(assetId, state, otherAssetId, tokenProvider)
    local tokens = tokenProvider or tokenFor
    if state == "throwing" or state == "nil" or state == "non-table" then
        local value = item(assetId, true)
        value.name = CF.Content.assets[assetId].displayName
        value.modDataMode = state
        return value
    end
    if state == "hostile-table" then
        local value = item(assetId, true)
        value.name = CF.Content.assets[assetId].displayName
        value.modData = setmetatable({}, {
            __index = function() error("injected hostile ModData access") end
        })
        return value
    end
    if state == "malformed-nested-access" then
        local value = item(assetId, true)
        value.name = CF.Content.assets[assetId].displayName
        value.modData.ConspiracyFiles = setmetatable({}, {
            __index = function() error("injected hostile nested carrier access") end
        })
        return value
    end
    if state == "unreadable-legacy" then
        local value = stamped(assetId, tokens(assetId))
        value.modData = setmetatable(value.modData, {
            __index = function() error("injected hostile legacy mirror access") end
        })
        return value
    end
    if state == "absent" then return item(assetId, true) end
    if state == "authored-absent" then
        local value = item(assetId, true)
        value.name = CF.Content.assets[assetId].displayName
        return value
    end
    if state == "partial" then
        local value = item(assetId, true)
        value.name = CF.Content.assets[assetId].displayName
        value.modData.ConspiracyFiles = {
            schemaVersion = CF.ItemPresentation.SCHEMA_VERSION,
            assetId = assetId,
            physicalToken = tokens(assetId)
        }
        return value
    end
    local value = stamped(assetId, state == "cross-pair" and tokens(otherAssetId) or tokens(assetId))
    local nested = value.modData.ConspiracyFiles
    if state == "asset-only" then nested.physicalToken = nil
    elseif state == "token-only" then nested.assetId = nil
    elseif state == "malformed" then nested.unexpected = "malformed"
    elseif state == "conflicting-mirror" then addLegacyMirror(value, true)
    elseif state == "unknown-asset" then nested.assetId = "dead-air:asset:unknown"
    elseif state == "wrong-save" then nested.physicalToken = "cf:another-save:" .. assetId
    elseif state == "supported-old" then
        nested.contentRevision = "dead-air-r0-compatible"
        nested.resolvedTitle = "Compatible older title"
        nested.resolvedDescription = "Compatible older description"
        nested.resolvedBody = "Compatible older body"
        value.name = nested.resolvedTitle
    elseif state == "unknown-revision" then nested.contentRevision = "dead-air-r0-unknown"
    elseif state == "future-revision" then nested.contentRevision = "dead-air-r999-future"
    end
    return value
end

test("integrity revision compatibility and all-Asset gateway matrix are explicit and mutation-free on rejection", function()
    assertTrue(CF.ItemPresentation.isCompatibleOlderRevision("dead-air-r0-compatible"))
    assertTrue(CF.ItemPresentation.isCompatibleOlderRevision("dead-air-r0-compatible-text"))
    assertFalse(CF.ItemPresentation.isCompatibleOlderRevision("dead-air-r0-unknown"))
    assertFalse(CF.ItemPresentation.isCompatibleOlderRevision("dead-air-r999-future"))

    local gateway = CF.ItemIdentityGateway.new({ itemPort = itemPort, tokenFor = tokenFor })
    local rejectedStates = {
        "cross-pair", "asset-only", "token-only", "authored-absent", "throwing", "nil", "non-table",
        "hostile-table", "malformed-nested-access", "unreadable-legacy", "partial", "malformed",
        "conflicting-mirror", "unknown-asset", "wrong-save", "unknown-revision", "future-revision"
    }
    for index, assetId in ipairs(allAssets) do
        local otherAssetId = allAssets[(index % #allAssets) + 1]
        local current = carrier(assetId, "current", otherAssetId)
        assertEqual("verified", gateway.verify(current, assetId).status)

        for _, revision in ipairs({ "dead-air-r0-compatible", "dead-air-r0-compatible-text" }) do
            local older = carrier(assetId, "supported-old", otherAssetId)
            older.modData.ConspiracyFiles.contentRevision = revision
            addLegacyMirror(older, false)
            local instance = older
            local token = older.modData.ConspiracyFiles.physicalToken
            local beforeVerify = copy(older)
            local verified = gateway.verify(older, assetId)
            assertEqual("verified", verified.status)
            assertEqual("stale-compatible", verified.identity.presentationState)
            assertDeepEqual(beforeVerify, older, "compatibility classification must be read-only")
            local refreshed, message, changed = gateway.refresh(older, assetId)
            assertTrue(refreshed, tostring(message))
            assertTrue(changed)
            assertEqual(instance, older)
            assertEqual(assetId, older.modData.ConspiracyFiles.assetId)
            assertEqual(token, older.modData.ConspiracyFiles.physicalToken)
            assertEqual(CF.Content.thread.contentRevision, older.modData.ConspiracyFiles.contentRevision)
            assertEqual(token, older.modData[CF.ItemPresentation.LEGACY_FIELDS.physicalItemId])
        end

        local absent = carrier(assetId, "absent", otherAssetId)
        assertEqual("other", gateway.verify(absent, assetId, { authoredTarget = true }).status,
            "ordinary unrelated loot must remain harmless")
        local sameNameDifferentType = carrier(assetId, "authored-absent", otherAssetId)
        sameNameDifferentType.itemType = "Base.UnrelatedType"
        assertEqual("other", gateway.verify(sameNameDifferentType, assetId, { authoredTarget = true }).status,
            "canonical name on another item type must remain unrelated loot")
        for _, state in ipairs(rejectedStates) do
            local hostile = carrier(assetId, state, otherAssetId)
            local before = copy(hostile)
            local result = gateway.verify(hostile, assetId, { authoredTarget = true })
            assertTrue(result.status == "collision" or result.status == "rejected", assetId .. "/" .. state)
            assertDeepEqual(before, hostile, assetId .. "/" .. state .. " gateway preservation")
        end

        local wrongTarget = allAssets[(index % #allAssets) + 1]
        local validElsewhere = carrier(assetId, "current", wrongTarget)
        assertEqual("other", gateway.verify(validElsewhere, wrongTarget, { authoredTarget = true }).status,
            assetId .. " valid pair at the wrong authored target")
        for _, state in ipairs({ "throwing", "nil", "non-table", "hostile-table", "malformed-nested-access" }) do
            local unreadableElsewhere = carrier(assetId, state, wrongTarget)
            assertEqual("other", gateway.verify(unreadableElsewhere, wrongTarget, { authoredTarget = true }).status,
                assetId .. "/" .. state .. " wrong-target non-claim")
        end
    end
end)

test("integrity refresh fails before display writes when a verified carrier becomes unreadable", function()
    local value = carrier(ids.d1, "current", ids.d2)
    local reads = 0
    local flakyPort = {
        modData = function(subject)
            reads = reads + 1
            if reads > 1 then error("injected second getModData failure") end
            return subject.modData
        end,
        setName = itemPort.setName,
        setCustomName = itemPort.setCustomName,
        displayName = itemPort.displayName,
        itemType = itemPort.itemType
    }
    local gateway = CF.ItemIdentityGateway.new({ itemPort = flakyPort, tokenFor = tokenFor })
    local refreshed, message, changed = gateway.refresh(value, ids.d1)
    assertFalse(refreshed)
    assertEqual("moddata-read-failed", message)
    assertFalse(changed)
    assertEqual(2, reads)
    assertEqual(0, value.nameWrites)
    assertEqual(0, value.customWrites)
end)

local function placementHarness(assetId, existing)
    local target = { items = existing and { existing } or {} }
    local created = 0
    local persistence = CF.PersistenceAdapter.new({ storage = storageWith(nil) })
    assertTrue(persistence.load(true))
    local world = {
        saveIdentity = function() return "integrity-matrix-save" end,
        resolvePlacement = function()
            return { status = "available", target = target, location = { kind = "model-target" } }
        end,
        items = function(container) return container.items end,
        createItem = function(itemType)
            created = created + 1
            local value = item(assetId, true)
            value.itemType = itemType
            return value
        end,
        addItem = function(container, value) container.items[#container.items + 1] = value; return value end,
        scanPhysical = function(context)
            local records = {}
            for _, value in ipairs(target.items) do
                records[#records + 1] = { item = value, authoredTarget = true, location = { kind = "model-target" } }
            end
            return { items = records, coverage = "incomplete", context = context }
        end
    }
    local placement = CF.PlacementAdapter.new({ persistence = persistence, world = world, itemPort = itemPort })
    placement.initialize("integrity-matrix-save")
    return placement, persistence, target, function() return created end
end

test("integrity carrier matrix covers placement scan and reconciliation for D1-D6 and B-37", function()
    local rejectedStates = {
        "cross-pair", "asset-only", "token-only", "authored-absent", "throwing", "nil", "non-table",
        "hostile-table", "malformed-nested-access", "unreadable-legacy", "partial", "malformed",
        "conflicting-mirror", "unknown-asset", "wrong-save", "unknown-revision", "future-revision"
    }
    for index, assetId in ipairs(allAssets) do
        local otherAssetId = allAssets[(index % #allAssets) + 1]

        local placement, persistence, target, created = placementHarness(assetId, nil)
        local placementTokens = function(candidateAssetId) return placement.tokenFor(candidateAssetId) end
        local exact = carrier(assetId, "current", otherAssetId, placementTokens)
        target.items = { exact }
        assertEqual("placed", placement.reconcile(assetId))
        assertEqual(0, created())
        assertEqual(exact, target.items[1])
        assertEqual("placed", persistence.snapshot().assetMaterialisation[assetId])

        placement, persistence, target, created = placementHarness(assetId, nil)
        placementTokens = function(candidateAssetId) return placement.tokenFor(candidateAssetId) end
        local older = carrier(assetId, "supported-old", otherAssetId, placementTokens)
        target.items = { older }
        assertEqual("placed", placement.reconcile(assetId))
        assertEqual(0, created())
        assertEqual(older, target.items[1])
        assertEqual(CF.Content.thread.contentRevision, older.modData.ConspiracyFiles.contentRevision)

        placement, persistence, target, created = placementHarness(assetId, nil)
        local ordinary = carrier(assetId, "absent", otherAssetId)
        target.items = { ordinary }
        assertEqual("placed", placement.reconcile(assetId))
        assertEqual(1, created())
        assertEqual(2, #target.items)
        assertEqual(ordinary, target.items[1])

        placement, persistence, target, created = placementHarness(assetId, nil)
        local sameNameDifferentType = carrier(assetId, "authored-absent", otherAssetId)
        sameNameDifferentType.itemType = "Base.UnrelatedType"
        target.items = { sameNameDifferentType }
        assertEqual("placed", placement.reconcile(assetId))
        assertEqual(1, created())
        assertEqual(2, #target.items)
        assertEqual(sameNameDifferentType, target.items[1])

        for _, state in ipairs(rejectedStates) do
            placement, persistence, target, created = placementHarness(assetId, nil)
            placementTokens = function(candidateAssetId) return placement.tokenFor(candidateAssetId) end
            local hostile = carrier(assetId, state, otherAssetId, placementTokens)
            target.items = { hostile }
            local beforeItem = copy(hostile)
            local beforeRoot = persistence.snapshot()
            local ok = pcall(placement.reconcile, assetId)
            assertFalse(ok, "placement must reject " .. assetId .. "/" .. state)
            assertEqual(0, created())
            assertEqual(1, #target.items)
            assertDeepEqual(beforeItem, hostile)
            assertDeepEqual(beforeRoot, persistence.snapshot())
            ok = pcall(placement.reconcile, assetId)
            assertFalse(ok, "placement conflict must remain sticky for " .. assetId .. "/" .. state)
            assertEqual(0, created())
            assertEqual(1, #target.items)
            assertDeepEqual(beforeItem, hostile)
            assertDeepEqual(beforeRoot, persistence.snapshot())

            placement, persistence, target = placementHarness(assetId, nil)
            assertEqual("placed", placement.reconcile(assetId))
            placementTokens = function(candidateAssetId) return placement.tokenFor(candidateAssetId) end
            target.items = { carrier(assetId, state, otherAssetId, placementTokens) }
            local scanItem = target.items[1]
            beforeItem = copy(scanItem)
            beforeRoot = persistence.snapshot()
            ok = pcall(placement.reconcileIdentity, assetId)
            assertFalse(ok, "scan/reconciliation must reject " .. assetId .. "/" .. state)
            assertDeepEqual(beforeItem, scanItem)
            assertDeepEqual(beforeRoot, persistence.snapshot())
            ok = pcall(placement.reconcileIdentity, assetId)
            assertFalse(ok, "scan/reconciliation conflict must remain sticky for " .. assetId .. "/" .. state)
            assertDeepEqual(beforeItem, scanItem)
            assertDeepEqual(beforeRoot, persistence.snapshot())
        end
    end
end)

test("integrity unreadable authored-carrier faults use the bounded adapter error path without state leaks", function()
    local placement, persistence, target, created = placementHarness(ids.d1, nil)
    local hostile = carrier(ids.d1, "throwing", ids.d2, function(assetId) return placement.tokenFor(assetId) end)
    target.items = { hostile }
    local beforeRoot = persistence.snapshot()
    local reports = {}
    local budget = CF.ErrorBudget.new({
        threshold = 3,
        report = function(message) reports[#reports + 1] = message end
    })
    for _ = 1, 4 do
        budget.call("placement", function() placement.reconcile(ids.d1) end)
    end
    assertTrue(budget.status("placement").disabled)
    assertEqual(1, #reports)
    assertTrue(string.find(reports[1], "placement failed", 1, true) ~= nil)
    assertEqual(0, created())
    assertEqual(1, #target.items)
    assertEqual(hostile, target.items[1])
    assertDeepEqual(beforeRoot, persistence.snapshot())
end)

local function presentationHarness()
    local persistence = CF.PersistenceAdapter.new({ storage = storageWith(nil) })
    assertTrue(persistence.load(true))
    local readers = {}
    local port = {
        isInventoryItem = function(value) return type(value) == "table" and value.inventoryItem == true end,
        isOwned = function(subject) return subject.item.owned == true end,
        captureContext = function() return "Integrity matrix context" end,
        addOption = function(context, label, handler, playerNum, value)
            local option = { name = label, handler = handler, playerNum = playerNum, item = value }
            context.options[#context.options + 1] = option
            return option
        end,
        openReader = function(projection) readers[#readers + 1] = projection end,
        openNotebook = function() end,
        configuredKey = function() return nil end,
        ensureKeyBinding = function() end,
        replaceEvent = function() end,
        removeEvent = function() end
    }
    local gateway = CF.ItemIdentityGateway.new({ itemPort = itemPort, tokenFor = tokenFor })
    local runtime = CF.PresentationRuntime.new({
        port = port,
        persistenceProvider = function() return persistence end,
        identityProvider = function() return gateway end,
        callBoundary = function(_, callback) return pcall(callback) end
    })
    return runtime, persistence, readers
end

local function menuFor(runtime, value)
    local menu = { options = {} }
    runtime.fillInventoryContextMenu(0, menu, { value })
    return menu
end

local function optionNamed(menu, name)
    for _, option in ipairs(menu.options) do if option.name == name then return option end end
end

local function activate(option, alternateItem)
    if option and option.handler then option.handler(nil, option.playerNum, alternateItem or option.item) end
end

test("integrity presentation matrix and read-only stale callbacks cover Inspect and Mark", function()
    local rejectedStates = {
        "cross-pair", "asset-only", "token-only", "absent", "authored-absent", "throwing", "nil", "non-table",
        "hostile-table", "malformed-nested-access", "unreadable-legacy", "partial", "malformed",
        "conflicting-mirror", "unknown-asset", "wrong-save", "unknown-revision", "future-revision"
    }
    for index, assetId in ipairs(allAssets) do
        local otherAssetId = allAssets[(index % #allAssets) + 1]
        local runtime, persistence, readers = presentationHarness()
        local exact = carrier(assetId, "current", otherAssetId)
        local menu = menuFor(runtime, exact)
        assertEqual(assetId == ids.key and 2 or 1, #menu.options)
        assertEqual(0, #persistence.snapshot().evidence)
        assertEqual(0, #readers)

        runtime, persistence, readers = presentationHarness()
        local older = carrier(assetId, "supported-old", otherAssetId)
        menu = menuFor(runtime, older)
        assertEqual(assetId == ids.key and 2 or 1, #menu.options)
        assertEqual(CF.Content.thread.contentRevision, older.modData.ConspiracyFiles.contentRevision)

        for _, state in ipairs(rejectedStates) do
            runtime, persistence, readers = presentationHarness()
            local hostile = carrier(assetId, state, otherAssetId)
            local beforeItem = copy(hostile)
            local beforeRoot = persistence.snapshot()
            menu = menuFor(runtime, hostile)
            assertEqual(0, #menu.options, assetId .. "/" .. state .. " presentation")
            assertEqual(0, #readers)
            assertDeepEqual(beforeItem, hostile)
            assertDeepEqual(beforeRoot, persistence.snapshot())
        end
    end

    local function staleInspect(assetId, mutation, label)
        local runtime, persistence, readers = presentationHarness()
        local selected = carrier(assetId, "current", ids.d2)
        local menu = menuFor(runtime, selected)
        local inspect = optionNamed(menu, "Inspect")
        assertTrue(inspect ~= nil, label .. " positive menu")
        mutation(selected)
        local beforeItem = copy(selected)
        local beforeRoot = persistence.snapshot()
        activate(inspect)
        assertEqual(0, #readers, label .. " reader")
        assertDeepEqual(beforeItem, selected, label .. " activation item preservation")
        assertDeepEqual(beforeRoot, persistence.snapshot(), label .. " activation root preservation")
    end

    staleInspect(ids.d1, function(value)
        local replacement = carrier(ids.d2, "current", ids.d1)
        value.modData, value.name, value.customName = copy(replacement.modData), replacement.name, replacement.customName
    end, "D1-to-D2 coherent substitution")
    staleInspect(ids.d2, function(value)
        local replacement = carrier(ids.d1, "current", ids.d2)
        value.modData, value.name, value.customName = copy(replacement.modData), replacement.name, replacement.customName
    end, "D2-to-D1 coherent substitution")
    staleInspect(ids.d1, function(value) value.modData.ConspiracyFiles = nil end, "carrier removal")
    staleInspect(ids.d1, function(value) value.modData.ConspiracyFiles.physicalToken = nil end, "partial carrier")
    staleInspect(ids.d1, function(value)
        local nested = value.modData.ConspiracyFiles
        nested.contentRevision = "dead-air-r0-compatible"
        nested.resolvedTitle, nested.resolvedDescription, nested.resolvedBody = "Old", "Old", "Old"
        value.name = "Old"
    end, "compatible-refresh abuse")
    staleInspect(ids.d1, function(value) value.modData.ConspiracyFiles.resolvedBody = "mutated body" end, "body mutation")
    staleInspect(ids.d1, function(value) addLegacyMirror(value, false) end, "legacy mirror mutation")
    staleInspect(ids.d1, function(value) value.owned = false end, "ownership mutation")

    local runtime, persistence, readers = presentationHarness()
    local key = carrier(ids.key, "current", ids.d1)
    local menu = menuFor(runtime, key)
    local inspect = optionNamed(menu, "Inspect")
    local mark = optionNamed(menu, "Mark Interesting")
    assertTrue(inspect ~= nil and mark ~= nil)
    local replacement = carrier(ids.d1, "current", ids.key)
    key.modData, key.name, key.customName = copy(replacement.modData), replacement.name, replacement.customName
    local beforeItem, beforeRoot = copy(key), persistence.snapshot()
    activate(inspect)
    activate(mark)
    assertEqual(0, #readers)
    assertDeepEqual(beforeItem, key)
    assertDeepEqual(beforeRoot, persistence.snapshot())

    local markMutations = {
        { "mark/carrier-removal", function(value) value.modData.ConspiracyFiles = nil end },
        { "mark/token", function(value) value.modData.ConspiracyFiles.physicalToken = tokenFor(ids.d1) end },
        { "mark/compatible-refresh", function(value)
            local nested = value.modData.ConspiracyFiles
            nested.contentRevision = "dead-air-r0-compatible-text"
            nested.resolvedTitle, nested.resolvedDescription, nested.resolvedBody = "Old", "Old", "Old"
            value.name = "Old"
        end },
        { "mark/body", function(value) value.modData.ConspiracyFiles.resolvedBody = "changed" end },
        { "mark/mirror", function(value) addLegacyMirror(value, false) end },
        { "mark/ownership", function(value) value.owned = false end }
    }
    for _, candidate in ipairs(markMutations) do
        runtime, persistence, readers = presentationHarness()
        key = carrier(ids.key, "current", ids.d1)
        menu = menuFor(runtime, key)
        mark = optionNamed(menu, "Mark Interesting")
        assertTrue(mark ~= nil)
        candidate[2](key)
        beforeItem, beforeRoot = copy(key), persistence.snapshot()
        activate(mark)
        assertEqual(0, #readers, candidate[1])
        assertDeepEqual(beforeItem, key, candidate[1])
        assertDeepEqual(beforeRoot, persistence.snapshot(), candidate[1])
    end

    runtime, persistence, readers = presentationHarness()
    local first = carrier(ids.d1, "current", ids.d2)
    local second = carrier(ids.d1, "current", ids.d2)
    menu = menuFor(runtime, first)
    inspect = optionNamed(menu, "Inspect")
    beforeRoot = persistence.snapshot()
    activate(inspect, second)
    assertEqual(0, #readers)
    assertDeepEqual(beforeRoot, persistence.snapshot(), "callback item substitution")
end)
