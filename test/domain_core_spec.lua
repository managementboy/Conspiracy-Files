local CF = require("ConspiracyFiles")
local Content = CF.Content
local ThreadState = CF.ThreadState
local Validator = CF.Validator
local ids = Content.ids

local function newState()
    local state, message = ThreadState.new()
    assertTrue(state ~= nil, message)
    return state
end

local function countKind(snapshot, kind)
    local count = 0
    for _, entry in ipairs(snapshot.journal) do if entry.kind == kind then count = count + 1 end end
    return count
end

local function findEvidence(snapshot, assetId)
    for _, evidence in ipairs(snapshot.evidence) do if evidence.assetId == assetId then return evidence end end
    return nil
end

local function assertChanged(ok, _, changed)
    assertTrue(ok)
    assertTrue(changed)
end

local function discover(state, assetId)
    assertChanged(state.discover(assetId, "Found " .. assetId, Content.assets[assetId].placementLocationId))
end

local function removeJournalKind(root, kind)
    local retained = {}
    for _, entry in ipairs(root.journal) do
        if entry.kind ~= kind then retained[#retained + 1] = entry end
    end
    root.journal = retained
    for index, entry in ipairs(root.journal) do
        entry.ordinal = index
        entry.entryId = CF.Ids.journal(index)
    end
    return root
end

local function renumberJournal(root)
    for index, entry in ipairs(root.journal) do
        entry.ordinal = index
        entry.entryId = CF.Ids.journal(index)
    end
    return root
end

local function containsText(value, needle, seen)
    if type(value) == "string" then return string.find(value, needle, 1, true) ~= nil end
    if type(value) ~= "table" then return false end
    seen = seen or {}
    if seen[value] then return false end
    seen[value] = true
    for key, child in pairs(value) do
        if containsText(key, needle, seen) or containsText(child, needle, seen) then return true end
    end
    return false
end

local function patternEscape(value)
    return (string.gsub(value, "(%W)", "%%%1"))
end

test("CF-V01-P04 D1/D2 introduction paths expose only ordinary-text leads", function()
    for _, assetId in ipairs({ ids.d1, ids.d2 }) do
        local state = newState()
        discover(state, assetId)
        local snapshot = state.snapshot()
        assertEqual(1, #snapshot.evidence)
        assertEqual(1, countKind(snapshot, "thread-introduced"))
        assertEqual(1, countKind(snapshot, "asset-discovered"))
        assertEqual("Found " .. assetId, snapshot.evidence[1].contextText)
        local leads = state.leads()
        assertEqual(1, #leads)
        assertEqual("ordinary-text", leads[1].kind)
        assertEqual(nil, snapshot.objective)
        assertEqual(nil, snapshot.mapMarker)
        assertEqual(nil, snapshot.caseComplete)
        assertEqual(nil, snapshot.solved)
    end
end)

test("CF-V01-P06 duplicate/reordered materialisation and discovery are idempotent after reconstruction", function()
    local state = newState()
    discover(state, ids.d3)
    assertChanged(state.materialise(ids.d3))
    local ok, _, changed = state.discover(ids.d3, "different context", ids.relay)
    assertTrue(ok)
    assertFalse(changed)
    ok, _, changed = state.materialise(ids.d3)
    assertTrue(ok)
    assertFalse(changed)
    local reconstructed, message = ThreadState.new(state.snapshot())
    assertTrue(reconstructed ~= nil, message)
    ok, _, changed = reconstructed.discover(ids.d3, "again", ids.relay)
    assertTrue(ok)
    assertFalse(changed)
    local snapshot = reconstructed.snapshot()
    assertEqual(1, #snapshot.evidence)
    assertEqual(1, countKind(snapshot, "asset-discovered"))
    assertEqual("placed", snapshot.assetMaterialisation[ids.d3])
    assertEqual(1, snapshot.evidence[1].discoveryOrdinal)
end)

test("CF-V01-P07 exported snapshots cannot mutate authored or marked Evidence truth", function()
    local state = newState()
    discover(state, ids.d1)
    assertChanged(state.markInteresting("intent-key", { assetId = ids.key, contextText = "Red key in Drawer C", foundLocationId = ids.police }))
    local truth = state.snapshot()
    local hostile = state.snapshot()
    for _, evidence in ipairs(hostile.evidence) do
        evidence.evidenceId = "dead-air:evidence:tampered"
        evidence.kind = "tampered"
        evidence.assetId = ids.d6
        evidence.discoveryOrdinal = 999
        evidence.contextText = "tampered"
        evidence.foundLocationId = ids.relay
        evidence.playerMarkedInteresting = not evidence.playerMarkedInteresting
        evidence.markIntentId = "tampered"
    end
    assertDeepEqual(truth, state.snapshot())
    local ok = state.replace(hostile)
    assertFalse(ok)
    assertDeepEqual(truth, state.snapshot())
end)

test("CF-V01-P08 JournalEntry chronology is append-only across mutation attempts", function()
    local state = newState()
    discover(state, ids.d4)
    discover(state, ids.d2)
    assertChanged(state.confirmLocation(ids.relay))
    discover(state, ids.d5)
    discover(state, ids.d6)
    local truth = state.snapshot()
    for index, entry in ipairs(truth.journal) do
        assertEqual(index, entry.ordinal)
        assertEqual(CF.Ids.journal(index), entry.entryId)
    end
    local mutations = {}
    local deleted = state.snapshot(); deleted.journal[#deleted.journal] = nil; mutations[#mutations + 1] = deleted
    local overwritten = state.snapshot(); overwritten.journal[1].subjectId = ids.d1; mutations[#mutations + 1] = overwritten
    local reordered = state.snapshot(); reordered.journal[1], reordered.journal[2] = reordered.journal[2], reordered.journal[1]; mutations[#mutations + 1] = reordered
    local inserted = state.snapshot(); table.insert(inserted.journal, 2, inserted.journal[1]); mutations[#mutations + 1] = inserted
    for _, hostile in ipairs(mutations) do
        assertFalse(state.replace(hostile))
        assertDeepEqual(truth, state.snapshot())
    end
end)

test("CF-V01-P09 deterministic no-AI renderer survives save-shaped round trips", function()
    local state = newState()
    for _, assetId in ipairs(Content.thread.documentAssetIds) do discover(state, assetId) end
    assertChanged(state.confirmLocation(ids.relay))
    local first = state.renderJournal()
    local second = state.renderJournal()
    assertDeepEqual(first, second)
    local restored = assert(ThreadState.new(state.snapshot()))
    assertDeepEqual(first, restored.renderJournal())
    local discoveryTexts = {}
    for _, rendered in ipairs(first) do
        if rendered.kind == "asset-discovered" then discoveryTexts[#discoveryTexts + 1] = rendered.text end
    end
    assertEqual(6, #discoveryTexts)
    for index, assetId in ipairs(Content.thread.documentAssetIds) do assertEqual(Content.assets[assetId].journalText, discoveryTexts[index]) end
    assertEqual(nil, _G.RuntimeAI)
end)

test("CF-V01-P10 D5/D6 contradiction is knowledge-bounded and exactly once", function()
    for _, order in ipairs({ { ids.d5, ids.d6 }, { ids.d6, ids.d5 } }) do
        local state = newState()
        discover(state, order[1])
        assertEqual(0, countKind(state.snapshot(), "contradiction-surfaced"))
        discover(state, order[2])
        local before = state.snapshot()
        assertEqual(1, countKind(before, "contradiction-surfaced"))
        local ok, _, changed = state.discover(order[2], "repeat", Content.assets[order[2]].placementLocationId)
        assertTrue(ok)
        assertFalse(changed)
        assertEqual(1, countKind(state.snapshot(), "contradiction-surfaced"))
        assertEqual(2, #state.snapshot().evidence)
        local rendered = state.renderJournal()
        assertTrue(rendered[#rendered].major)
        assertTrue(string.find(rendered[#rendered].text, "Both records remain unresolved", 1, true) ~= nil)
    end
end)

test("CF-V01-P11 B-37 recontextualisation requires a prior marked key", function()
    local before = newState()
    assertChanged(before.markInteresting("key-before", { assetId = ids.key, contextText = "Original key context" }))
    discover(before, ids.d6)
    assertEqual(1, countKind(before.snapshot(), "evidence-updated"))
    assertEqual("Original key context", before.snapshot().evidence[1].contextText)
    local text = before.renderJournal()[#before.renderJournal()].text
    assertTrue(string.find(text, "matches", 1, true) ~= nil)
    assertFalse(string.find(text, "same physical", 1, true) ~= nil)

    local after = newState()
    discover(after, ids.d6)
    assertChanged(after.markInteresting("key-after", { assetId = ids.key, contextText = "Late key" }))
    local ok, _, changed = after.discover(ids.d6, "repeat", ids.police)
    assertTrue(ok)
    assertFalse(changed)
    assertEqual(0, countKind(after.snapshot(), "evidence-updated"))

    local unmarked = newState()
    discover(unmarked, ids.d6)
    assertEqual(0, countKind(unmarked.snapshot(), "evidence-updated"))
end)

test("CF-V01-P12 only the three eligible event classes are major and never solved", function()
    local state = newState()
    discover(state, ids.d3)
    discover(state, ids.d2)
    assertChanged(state.confirmLocation(ids.relay))
    discover(state, ids.d4)
    discover(state, ids.d5)
    discover(state, ids.d6)
    local majors = {}
    for _, rendered in ipairs(state.renderJournal()) do if rendered.major then majors[#majors + 1] = rendered.kind end end
    assertEqual(3, #majors)
    assertEqual("thread-introduced", majors[1])
    assertEqual("location-confirmed", majors[2])
    assertEqual("contradiction-surfaced", majors[3])
    local snapshot = state.snapshot()
    assertEqual(nil, snapshot.solved)
    assertEqual(nil, snapshot.caseComplete)

    local early = newState()
    assertChanged(early.confirmLocation(ids.relay))
    discover(early, ids.d2)
    assertFalse(early.renderJournal()[1].major)
end)

test("CF-V01-P14 Mark Interesting creates one immutable chronology record per intent", function()
    local state = newState()
    assertChanged(state.markInteresting("generic-1", { subjectLabel = "Odd receiver", contextText = "On a workbench" }))
    assertChanged(state.markInteresting("key-1", { assetId = ids.key, contextText = "Red B-37 tag", foundLocationId = ids.police }))
    local ok, _, changed = state.markInteresting("key-1", { assetId = ids.key, contextText = "different" })
    assertTrue(ok)
    assertFalse(changed)
    local snapshot = state.snapshot()
    assertEqual(2, #snapshot.evidence)
    assertEqual(2, countKind(snapshot, "marked-interesting"))
    assertTrue(snapshot.evidence[1].playerMarkedInteresting)
    assertTrue(snapshot.evidence[2].playerMarkedInteresting)
    assertEqual("dead-air:evidence:marked:0001", snapshot.evidence[1].evidenceId)
    assertEqual("dead-air:evidence:marked:0002", snapshot.evidence[2].evidenceId)
end)

test("CF-V01-P14 one physical authored object cannot be marked twice", function()
    local state = newState()
    assertChanged(state.markInteresting("key-first", { assetId = ids.key, contextText = "First mark" }))
    local ok, evidenceId, changed = state.markInteresting("key-second", { assetId = ids.key, contextText = "Second mark" })
    assertTrue(ok)
    assertFalse(changed)
    assertEqual("dead-air:evidence:marked:0001", evidenceId)
    assertEqual(1, #state.snapshot().evidence)
end)

test("CF-V01-P15 optional B-37 key does not gate six-document or contradiction paths", function()
    local state = newState()
    for _, assetId in ipairs(Content.thread.documentAssetIds) do discover(state, assetId) end
    local snapshot = state.snapshot()
    assertEqual(6, #snapshot.evidence)
    assertEqual(nil, findEvidence(snapshot, ids.key))
    assertEqual(1, countKind(snapshot, "contradiction-surfaced"))
    assertEqual(0, countKind(snapshot, "evidence-updated"))
end)

test("CF-V01-P16 Organisation label derives generic-to-specific without persistence", function()
    local generic = newState()
    discover(generic, ids.d2)
    assertEqual("communications maintenance contractor (C.S.S.)", generic.organisationLabel(ids.css))
    for _, revealId in ipairs({ ids.d1, ids.d3, ids.d5 }) do
        local state = newState()
        discover(state, ids.d2)
        discover(state, revealId)
        assertEqual("Cumberland Signal Services", state.organisationLabel(ids.css))
        assertEqual(nil, state.snapshot().organisations)
    end
end)

test("CF-V01-P17 Location labels derive independently from idempotent confirmations", function()
    local state = newState()
    assertEqual("Relay Site 31", state.locationLabel(ids.relay))
    assertEqual("police property desk", state.locationLabel(ids.police))
    assertChanged(state.confirmLocation(ids.relay))
    assertEqual("Relay Site 31 service office", state.locationLabel(ids.relay))
    assertEqual("police property desk", state.locationLabel(ids.police))
    local ok, _, changed = state.confirmLocation(ids.relay)
    assertTrue(ok)
    assertFalse(changed)
    assertEqual(1, countKind(state.snapshot(), "location-confirmed"))
    assertChanged(state.confirmLocation(ids.police))
    assertEqual("police property / records area", state.locationLabel(ids.police))
end)

test("CF-V01-P18 staged recursive validation rejects unsafe states and preserves last-known-good", function()
    local state = newState()
    discover(state, ids.d1)
    local good = state.snapshot()
    local cases = {}
    local badKey = state.snapshot(); badKey.assetMaterialisation[true] = "materialised"; cases[#cases + 1] = badKey
    local tableKey = state.snapshot(); tableKey.assetMaterialisation[{}] = "materialised"; cases[#cases + 1] = tableKey
    local badFunction = state.snapshot(); badFunction.assetMaterialisation.bad = function() end; cases[#cases + 1] = badFunction
    local badThread = state.snapshot(); badThread.assetMaterialisation.bad = coroutine.create(function() end); cases[#cases + 1] = badThread
    if io and io.stdout and type(io.stdout) == "userdata" then local badUserdata = state.snapshot(); badUserdata.assetMaterialisation.bad = io.stdout; cases[#cases + 1] = badUserdata end
    local badMeta = state.snapshot(); setmetatable(badMeta.assetMaterialisation, { __index = {} }); cases[#cases + 1] = badMeta
    local javaStandIn = state.snapshot(); javaStandIn.assetMaterialisation.bad = setmetatable({}, { __index = { getClass = function() end } }); cases[#cases + 1] = javaStandIn
    local cycle = state.snapshot(); cycle.assetMaterialisation.bad = cycle; cases[#cases + 1] = cycle
    local alias = state.snapshot(); alias.assetMaterialisation.bad = alias.evidence[1]; cases[#cases + 1] = alias
    local schema = state.snapshot(); schema.caseComplete = true; cases[#cases + 1] = schema
    local missingStatic = state.snapshot(); missingStatic.evidence[1].assetId = "dead-air:asset:missing"; cases[#cases + 1] = missingStatic
    local tooDeep = state.snapshot()
    local deepCursor = {}
    tooDeep.assetMaterialisation.bad = deepCursor
    for _ = 1, 65 do deepCursor.child = {}; deepCursor = deepCursor.child end
    cases[#cases + 1] = tooDeep
    for _, invalid in ipairs(cases) do
        local ok, diagnostic = state.replace(invalid)
        assertFalse(ok)
        assertTrue(type(diagnostic) == "string" and diagnostic ~= "")
        assertEqual(diagnostic, state.lastDiagnostic())
        assertDeepEqual(good, state.snapshot())
    end

    local depth64, cursor = {}, nil
    cursor = depth64
    for _ = 2, 64 do cursor.child = {}; cursor = cursor.child end
    assertTrue(Validator.validateStructure(depth64))
    cursor.child = {}
    assertFalse(Validator.validateStructure(depth64))
    assertTrue(Validator.validateStructure({ [0] = "zero", [-1.5] = true, name = 3.25, nested = {} }))
end)

test("CF-V01-P18 mandatory reverse chronology rejects missing and reordered derived events", function()
    local introduction = newState()
    discover(introduction, ids.d1)
    local missingIntroduction = removeJournalKind(introduction.snapshot(), "thread-introduced")

    local contradiction = newState()
    discover(contradiction, ids.d5)
    discover(contradiction, ids.d6)
    local missingContradiction = removeJournalKind(contradiction.snapshot(), "contradiction-surfaced")

    local b37 = newState()
    assertChanged(b37.markInteresting("key-before-d6", { assetId = ids.key, contextText = "B-37 before D6" }))
    discover(b37, ids.d6)
    local missingUpdate = removeJournalKind(b37.snapshot(), "evidence-updated")

    local introductionBeforeDiscovery = introduction.snapshot()
    introductionBeforeDiscovery.journal[1], introductionBeforeDiscovery.journal[2]
        = introductionBeforeDiscovery.journal[2], introductionBeforeDiscovery.journal[1]
    renumberJournal(introductionBeforeDiscovery)

    local contradictionBeforeDiscovery = contradiction.snapshot()
    table.insert(contradictionBeforeDiscovery.journal, 1, table.remove(contradictionBeforeDiscovery.journal, 3))
    renumberJournal(contradictionBeforeDiscovery)

    local updateBeforeD6 = b37.snapshot()
    updateBeforeD6.journal[2], updateBeforeD6.journal[3] = updateBeforeD6.journal[3], updateBeforeD6.journal[2]
    renumberJournal(updateBeforeD6)

    for _, hostile in ipairs({
        missingIntroduction, missingContradiction, missingUpdate,
        introductionBeforeDiscovery, contradictionBeforeDiscovery, updateBeforeD6
    }) do
        local ok, message = Validator.validate(hostile)
        assertFalse(ok)
        assertTrue(type(message) == "string" and message ~= "")
    end
end)

test("CF-V01-P19 calibrated estimator enforces the real 500 KB boundary", function()
    local maximal = newState()
    for _, assetId in ipairs(Content.thread.documentAssetIds) do
        assertChanged(maximal.materialise(assetId))
        discover(maximal, assetId)
    end
    assertChanged(maximal.markInteresting("max-key", { assetId = ids.key, contextText = "B-37 key in Drawer C" }))
    assertChanged(maximal.confirmLocation(ids.relay))
    assertChanged(maximal.confirmLocation(ids.police))
    local maximalSnapshot = maximal.snapshot()
    assertEqual(7, #maximalSnapshot.evidence)
    assertTrue(Validator.estimateEncodedBytes(maximalSnapshot) < ThreadState.MAX_ENCODED_BYTES)

    local state = newState()
    local lastGood = state.snapshot()
    local rejected = nil
    for index = 1, 200 do
        local ok, message, changed = state.markInteresting(
            "capacity-" .. index,
            { subjectLabel = "payload-" .. index, contextText = string.rep("x", Validator.MAX_CONTEXT_TEXT_BYTES) }
        )
        if not ok then
            rejected = message
            break
        end
        assertTrue(changed)
        lastGood = state.snapshot()
    end
    assertTrue(type(rejected) == "string")
    assertTrue(string.find(rejected, "capacity-exceeded:", 1, true) == 1)
    assertTrue(Validator.estimateEncodedBytes(lastGood) <= ThreadState.MAX_ENCODED_BYTES)
    assertDeepEqual(lastGood, state.snapshot())
    assertFalse(containsText(lastGood, Content.assets[ids.d1].bodyText))
end)

test("CF-V01-P19 persisted text fields have enforced byte caps", function()
    local state = newState()
    assertFalse(state.discover(ids.d3, string.rep("x", Validator.MAX_CONTEXT_TEXT_BYTES + 1), ids.relay))
    assertFalse(state.markInteresting(string.rep("i", Validator.MAX_MARK_INTENT_ID_BYTES + 1), { subjectLabel = "x", contextText = "x" }))
    assertFalse(state.markInteresting("bounded-label", { subjectLabel = string.rep("x", Validator.MAX_SUBJECT_LABEL_BYTES + 1), contextText = "x" }))
    assertEqual(0, #state.snapshot().evidence)
end)

test("CF-V01-P18 compatible content revisions load while incompatible schemas fail closed", function()
    local current = newState().snapshot()
    current.contentRevision = "dead-air-r1-typo-fix"
    local compatible, message = ThreadState.new(current)
    assertTrue(compatible ~= nil, message)
    local incompatible = current
    incompatible.schemaVersion = Validator.CURRENT_SCHEMA_VERSION - 1
    assertEqual(nil, ThreadState.new(incompatible))
end)

test("CF-V01-P06 entry selection matches the immutable introduction", function()
    local automatic = newState()
    discover(automatic, ids.d2)
    assertEqual("fallback", automatic.snapshot().entryOpportunityUsed)

    local selected = newState()
    assertChanged(selected.useEntryOpportunity("anchor"))
    local ok = selected.discover(ids.d2, "Wrong introduction", ids.police)
    assertFalse(ok)
    discover(selected, ids.d1)
    assertEqual("anchor", selected.snapshot().entryOpportunityUsed)

    local hostile = selected.snapshot()
    hostile.entryOpportunityUsed = "fallback"
    assertFalse(Validator.validate(hostile))
end)

test("CF-V01-P06 placement and physical availability follow legal transitions", function()
    local state = newState()
    assertChanged(state.transitionMaterialisation(ids.d1, "pending"))
    assertChanged(state.transitionMaterialisation(ids.d1, "placing"))
    assertChanged(state.transitionMaterialisation(ids.d1, "placed"))
    assertChanged(state.transitionPhysicalAvailability(ids.d1, "unknown"))
    assertChanged(state.transitionPhysicalAvailability(ids.d1, "available"))
    assertChanged(state.transitionPhysicalAvailability(ids.d1, "unavailable"))
    assertChanged(state.transitionPhysicalAvailability(ids.d1, "available"))
    assertChanged(state.transitionPhysicalAvailability(ids.d1, "conflict"))
    assertFalse(state.transitionPhysicalAvailability(ids.d1, "available"))
    assertChanged(state.transitionMaterialisation(ids.d1, "conflict"))
    assertFalse(state.transitionMaterialisation(ids.d1, "placed"))
end)

test("CF-V01-P04 confirmed locations are no longer outstanding leads", function()
    local state = newState()
    discover(state, ids.d1)
    assertEqual(1, #state.leads())
    assertChanged(state.confirmLocation(ids.police))
    assertEqual(0, #state.leads())
end)

test("CF-V01-P09 journal text is a point-in-time chronology", function()
    local state = newState()
    discover(state, ids.d2)
    local introduced = state.renderJournal()[2].text
    assertChanged(state.confirmLocation(ids.relay))
    assertEqual(introduced, state.renderJournal()[2].text)
    assertTrue(string.find(introduced, Content.locations[ids.relay].preArrivalLabel, 1, true) ~= nil)
end)

test("CF-V01-P24 Evidence resolves full static content without copying document bodies", function()
    local contentOk, contentMessage = Content.validate()
    assertTrue(contentOk, contentMessage)
    local fixtureFile = assert(io.open("test/fixtures/THREAD-001-DEAD-AIR.md", "rb"))
    local fixture = fixtureFile:read("*a")
    fixtureFile:close()
    fixture = string.gsub(fixture, "\r\n", "\n")
    for _, assetId in ipairs(Content.thread.documentAssetIds) do
        local fixtureBody = string.match(fixture, "Document ID:%*%* `" .. patternEscape(assetId) .. "`.-```text\n(.-)\n```")
        assertTrue(fixtureBody ~= nil, "fixture body missing for " .. assetId)
        assertEqual(fixtureBody, Content.assets[assetId].bodyText, "static body differs from accepted fixture")
    end
    local state = newState()
    discover(state, ids.d1)
    local evidenceId = state.snapshot().evidence[1].evidenceId
    local resolved = assert(state.resolveEvidence(evidenceId))
    assertEqual(Content.assets[ids.d1].displayName, resolved.displayName)
    assertEqual(Content.assets[ids.d1].bodyText, resolved.bodyText)
    assertTrue(string.len(resolved.bodyText) > 1000)
    assertFalse(containsText(state.snapshot(), Content.assets[ids.d1].bodyText))
    local restored = assert(ThreadState.new(state.snapshot()))
    assertEqual(resolved.bodyText, assert(restored.resolveEvidence(evidenceId)).bodyText)
end)

test("CF-V01-P25 complete suite loads with PZ globals absent", function()
    assertEqual(nil, _G.Events)
    assertEqual(nil, _G.ModData)
    assertEqual(nil, _G.getPlayer)
    assertEqual(nil, _G.getWorld)
    assertTrue(type(CF.ThreadState.new) == "function")
end)
