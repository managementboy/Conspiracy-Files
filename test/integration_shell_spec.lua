local CF = require("ConspiracyFiles")
local ids = CF.Content.ids

local function makeStorage(initial)
    local roots = {}
    if initial ~= nil then roots[CF.PersistenceAdapter.DEFAULT_TAG] = initial end
    local replacements = 0
    return {
        roots = roots,
        get = function(tag) return roots[tag] end,
        replace = function(tag, root)
            replacements = replacements + 1
            roots[tag] = root
        end,
        replacementCount = function() return replacements end
    }
end

local function discoverTransaction(assetId)
    return function(candidate)
        local ok, result, changed = candidate.discover(assetId, "Adapter round trip", CF.Content.assets[assetId].placementLocationId)
        if not ok then error(result) end
        return changed, result
    end
end

test("integration scheduler deduplicates keys and obeys queue, work, and elapsed bounds", function()
    local now, ran = 0, {}
    local scheduler = CF.Scheduler.new({
        clock = function() return now end,
        maxWorkPerDrain = 3,
        maxQueued = 4,
        maxMillis = 2,
        execute = function(subsystem, work, key)
            assertEqual("adapter", subsystem)
            ran[#ran + 1] = key
            work()
        end
    })
    local function unit() now = now + 1 end
    assertTrue(scheduler.enqueue("a", "adapter", unit))
    local accepted, reason = scheduler.enqueue("a", "adapter", unit)
    assertFalse(accepted)
    assertEqual("duplicate", reason)
    assertTrue(scheduler.enqueue("b", "adapter", unit))
    assertTrue(scheduler.enqueue("c", "adapter", unit))
    assertTrue(scheduler.enqueue("d", "adapter", unit))
    accepted, reason = scheduler.enqueue("e", "adapter", unit)
    assertFalse(accepted)
    assertEqual("queue-full", reason)

    local first = scheduler.drain()
    assertEqual(2, first.processed)
    assertEqual(2, first.remaining)
    assertEqual(2, first.elapsedMillis)
    assertEqual("a", ran[1])
    assertEqual("b", ran[2])
    assertTrue(scheduler.enqueue("a", "adapter", unit))
    local second = scheduler.drain()
    assertEqual(2, second.processed)
    assertEqual(1, second.remaining)
    local third = scheduler.drain()
    assertEqual(1, third.processed)
    assertEqual(0, third.remaining)

    local countClock = 0
    local countBounded = CF.Scheduler.new({
        clock = function() return countClock end,
        maxWorkPerDrain = 2,
        maxQueued = 5,
        maxMillis = 100
    })
    for index = 1, 5 do assertTrue(countBounded.enqueue("count-" .. index, "adapter", function() end)) end
    assertEqual(2, countBounded.drain().processed)
    assertEqual(3, countBounded.size())
end)

test("integration error budgets isolate subsystems, report once, and auto-disable after repeated faults", function()
    local reports = {}
    local budget = CF.ErrorBudget.new({
        threshold = 3,
        report = function(message) reports[#reports + 1] = message end
    })
    local ok = budget.call("persistence", function() error("first\nprivate detail") end)
    assertFalse(ok)
    assertEqual(1, #reports)
    assertTrue(string.find(reports[1], "persistence failed", 1, true) ~= nil)
    assertFalse(string.find(reports[1], "\n", 1, true) ~= nil)
    assertTrue(budget.call("persistence", function() return "recovered" end))
    assertEqual(0, budget.status("persistence").consecutiveFailures)
    for _ = 1, 3 do budget.call("persistence", function() error("again") end) end
    assertTrue(budget.status("persistence").disabled)
    assertEqual(1, #reports)
    local attempts = 0
    ok = budget.call("persistence", function() attempts = attempts + 1 end)
    assertFalse(ok)
    assertEqual(0, attempts)
    assertTrue(budget.call("scheduler", function() return true end))
    assertFalse(budget.status("scheduler").disabled)
end)

test("integration bootstrap disables before hooks or canonical mutation in multiplayer and on detector failure", function()
    local reports, mutations, hooks = {}, 0, 0
    local multiplayer = CF.IntegrationRuntime.start({
        isMultiplayer = function() return true end,
        report = function(message) reports[#reports + 1] = message end,
        storage = {
            get = function() mutations = mutations + 1 end,
            replace = function() mutations = mutations + 1 end
        },
        clock = function() return 0 end,
        addEvent = function() hooks = hooks + 1 end
    })
    assertFalse(multiplayer.enabled)
    assertEqual("multiplayer", multiplayer.reason)
    assertEqual(0, hooks)
    assertEqual(0, mutations)
    assertEqual(1, #reports)

    local failed = CF.IntegrationRuntime.start({
        isMultiplayer = function() error("detector fault") end,
        report = function(message) reports[#reports + 1] = message end
    })
    assertFalse(failed.enabled)
    assertEqual("multiplayer-detection-failed", failed.reason)
    assertEqual(0, hooks)
    assertEqual(0, mutations)
    assertEqual(2, #reports)

    local indeterminate = CF.IntegrationRuntime.start({
        isMultiplayer = function() return nil end,
        report = function(message) reports[#reports + 1] = message end
    })
    assertFalse(indeterminate.enabled)
    assertEqual("multiplayer-detection-indeterminate", indeterminate.reason)
    assertEqual(0, hooks)
    assertEqual(0, mutations)
    assertEqual(3, #reports)
end)

test("integration singleplayer lifecycle is additive and defers canonical creation until ModData initialization", function()
    local callbacks, reports = {}, {}
    local storage = makeStorage()
    local runtime = CF.IntegrationRuntime.start({
        isMultiplayer = function() return false end,
        report = function(message) reports[#reports + 1] = message end,
        storage = storage,
        clock = function() return 0 end,
        addEvent = function(name, callback)
            assertEqual(nil, callbacks[name], "event registered twice")
            callbacks[name] = callback
        end
    })
    assertTrue(runtime.enabled)
    assertEqual(3, #runtime.registeredEvents)
    assertEqual(0, storage.replacementCount())
    assertEqual("registered", runtime.phase())
    callbacks.OnInitGlobalModData(true)
    assertEqual(1, storage.replacementCount())
    assertEqual("canonical-ready", runtime.phase())
    callbacks.OnGameStart()
    assertEqual("running", runtime.phase())
    callbacks.OnTick()
    assertEqual(0, #reports)
end)

test("integration persistence stages complete roots and reconstructs domain projections across fake round trips", function()
    local storage = makeStorage()
    local first = CF.PersistenceAdapter.new({ storage = storage })
    local ok, detail = first.load(true)
    assertTrue(ok, detail)
    assertTrue(first.isLoaded())
    assertEqual(1, storage.replacementCount())
    assertTrue(first.snapshot() ~= storage.roots[first.tag()])

    local result, changed
    ok, result, changed = first.transaction(discoverTransaction(ids.d1))
    assertTrue(ok, result)
    assertTrue(changed)
    assertEqual(2, storage.replacementCount())
    local expectedSnapshot = first.snapshot()
    local expectedJournal = first.domain().renderJournal()
    assertEqual(1, #expectedSnapshot.evidence)
    assertTrue(CF.Validator.estimateEncodedBytes(expectedSnapshot) <= CF.Validator.MAX_ENCODED_BYTES)

    local second = CF.PersistenceAdapter.new({ storage = storage })
    ok, detail = second.load(false)
    assertTrue(ok, detail)
    assertEqual(2, storage.replacementCount())
    assertDeepEqual(expectedSnapshot, second.snapshot())
    assertDeepEqual(expectedJournal, second.domain().renderJournal())
    assertEqual(first.domain().organisationLabel(ids.css), second.domain().organisationLabel(ids.css))
end)

test("integration persistence rejects unsafe, oversized, regressive, and failed replacements without losing last-known-good", function()
    local storage = makeStorage()
    local adapter = CF.PersistenceAdapter.new({ storage = storage })
    assertTrue(adapter.load(true))
    assertTrue(adapter.transaction(discoverTransaction(ids.d1)))
    local good = adapter.snapshot()
    local storedGood = storage.roots[adapter.tag()]
    local replacementCount = storage.replacementCount()

    local unsafe = adapter.snapshot()
    unsafe.assetMaterialisation.bad = unsafe
    local ok = adapter.commit(unsafe)
    assertFalse(ok)
    assertEqual(storedGood, storage.roots[adapter.tag()])
    assertEqual(replacementCount, storage.replacementCount())
    assertDeepEqual(good, adapter.snapshot())

    local oversized = adapter.snapshot()
    oversized.evidence[1].contextText = string.rep("x", 200000)
    ok = adapter.commit(oversized)
    assertFalse(ok)
    assertEqual(storedGood, storage.roots[adapter.tag()])
    assertDeepEqual(good, adapter.snapshot())

    local regressive = adapter.snapshot()
    regressive.evidence = {}
    regressive.journal = {}
    ok = adapter.commit(regressive)
    assertFalse(ok)
    assertEqual(storedGood, storage.roots[adapter.tag()])
    assertDeepEqual(good, adapter.snapshot())

    local failingStorage = makeStorage(good)
    failingStorage.replace = function() error("simulated ModData.add fault") end
    local failing = CF.PersistenceAdapter.new({ storage = failingStorage })
    assertTrue(failing.load(false))
    local beforeFailure = failing.snapshot()
    local candidate = failing.snapshot()
    local state = assert(CF.ThreadState.new(candidate))
    assertTrue(state.confirmLocation(ids.relay))
    local contained = pcall(function() failing.commit(state.snapshot()) end)
    assertFalse(contained)
    assertDeepEqual(beforeFailure, failing.snapshot())
end)

test("integration invalid persisted roots never get replaced by a fresh root", function()
    local invalid = { schemaVersion = 1 }
    invalid.self = invalid
    local storage = makeStorage(invalid)
    local adapter = CF.PersistenceAdapter.new({ storage = storage })
    local ok, message = adapter.load(false)
    assertFalse(ok)
    assertTrue(type(message) == "string" and message ~= "")
    assertEqual(0, storage.replacementCount())
    assertEqual(invalid, storage.roots[CF.PersistenceAdapter.DEFAULT_TAG])
    assertFalse(adapter.isLoaded())
end)

test("integration Build 42 entrypoint creates one namespace and registers each cooperative hook once", function()
    local old = {
        namespace = rawget(_G, "ConspiracyFiles"),
        isMultiplayer = rawget(_G, "isMultiplayer"),
        getTimeInMillis = rawget(_G, "getTimeInMillis"),
        ModData = rawget(_G, "ModData"),
        Events = rawget(_G, "Events")
    }
    local callbacks = { OnInitGlobalModData = {}, OnGameStart = {}, OnTick = {} }
    local roots = {}
    _G.ConspiracyFiles = nil
    _G.isMultiplayer = function() return false end
    _G.getTimeInMillis = function() return 0 end
    _G.ModData = {
        get = function(tag) return roots[tag] end,
        add = function(tag, root) roots[tag] = root end
    }
    _G.Events = {}
    for eventName, registered in pairs(callbacks) do
        _G.Events[eventName] = { Add = function(callback) registered[#registered + 1] = callback end }
    end

    dofile("mod/common/media/lua/shared/ConspiracyFilesBootstrap.lua")
    assertTrue(type(_G.ConspiracyFiles) == "table")
    assertTrue(_G.ConspiracyFiles.runtime.enabled)
    for _, registered in pairs(callbacks) do assertEqual(1, #registered) end
    dofile("mod/common/media/lua/shared/ConspiracyFilesBootstrap.lua")
    for _, registered in pairs(callbacks) do assertEqual(1, #registered) end
    callbacks.OnInitGlobalModData[1](true)
    assertTrue(roots[CF.PersistenceAdapter.DEFAULT_TAG] ~= nil)

    _G.ConspiracyFiles = old.namespace
    _G.isMultiplayer = old.isMultiplayer
    _G.getTimeInMillis = old.getTimeInMillis
    _G.ModData = old.ModData
    _G.Events = old.Events
end)
