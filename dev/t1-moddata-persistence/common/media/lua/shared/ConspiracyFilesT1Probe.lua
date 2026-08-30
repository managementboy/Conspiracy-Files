-- Conspiracy-Files Spike T1: Build 42 ModData persistence probe.
-- Disposable development code. This is NOT production Conspiracy-Files code.

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.T1Probe = ConspiracyFiles.T1Probe or {}

local T1 = ConspiracyFiles.T1Probe

local PREFIX = "[CF-T1]"
local CONTROL_TAG = "ConspiracyFiles.T1.Control"
local PAYLOAD_TAG = "ConspiracyFiles.T1.Payload"
local HASH_MOD = 2147483647
local moduleLoadedMs = getTimeInMillis and getTimeInMillis() or 0
local lastOnSaveMs = nil
local verifiedArmedOnLoad = false
local autoContinuePending = true
local autoContinueTicks = 0
local autoQuitPending = false
local autoQuitTicks = 0
local EXPECTED_RELOAD_FILE = "ConspiracyFiles_T1_ExpectedReload.txt"

local scenarios = {
    "baseline",
    "nil_seed",
    "nil_removal",
    "function_value",
    "userdata_value",
    "metatable",
    "cycle",
    "shared_reference",
    "boolean_key",
    "table_key",
    "function_key",
    "userdata_key",
    "depth_16",
    "depth_32",
    "depth_64",
    "depth_128",
    "depth_256",
    "depth_512",
    "scale_1000",
    "scale_10000",
    "scale_100000",
}

local selectedIndex = 1

local function autoModeForCurrentSave()
    local currentSave = getCurrentSaveName and getCurrentSaveName() or ""
    local folder = tostring(currentSave):match("([^\\/]+)$") or ""
    if folder == "T1_clean" then
        return "clear"
    end

    local requested = folder:match("^T1_(.+)$")
    if requested then
        for i = 1, #scenarios do
            if scenarios[i] == requested then
                return requested, i
            end
        end
    end
    return nil
end

local function expectedReloadScenario()
    local reader = getFileReader and getFileReader(EXPECTED_RELOAD_FILE, false) or nil
    if not reader then
        return nil
    end
    local expectedSave = reader:readLine()
    reader:close()
    if type(expectedSave) ~= "string" then
        return nil
    end
    return expectedSave:match("^T1_(.+)$")
end

local function nowMs()
    if getTimeInMillis then
        return getTimeInMillis()
    end
    return 0
end

local function boolText(value)
    if value then
        return "true"
    end
    return "false"
end

local function safeString(value)
    if value == nil then
        return "<nil>"
    end
    return tostring(value):gsub("|", "/"):gsub("\n", " ")
end

local function logEvent(kind, fields)
    local parts = { PREFIX, "EVENT", "kind=" .. safeString(kind) }
    if fields then
        for i = 1, #fields do
            parts[#parts + 1] = fields[i]
        end
    end
    print(table.concat(parts, "|"))
end

local function gameVersion()
    local ok, value = pcall(function()
        return getGameVersion()
    end)
    if ok then
        return safeString(value)
    end
    return "unavailable"
end

local function className(value)
    if value == nil then
        return "<nil>"
    end
    if getClassSimpleName then
        local ok, result = pcall(getClassSimpleName, value)
        if ok then
            return safeString(result)
        end
    end
    return "unavailable"
end

local function control()
    return ModData.getOrCreate(CONTROL_TAG)
end

local function payload()
    return ModData.get(PAYLOAD_TAG)
end

local function recreatePayload()
    ModData.remove(PAYLOAD_TAG)
    return ModData.getOrCreate(PAYLOAD_TAG)
end

local function hashString(seed, value)
    local h = seed or 0
    local s = tostring(value or "")
    for i = 1, #s do
        h = (h * 131 + string.byte(s, i)) % HASH_MOD
    end
    return h
end

local function hashNumber(seed, value)
    local n = tonumber(value) or 0
    local scaled = math.floor(n * 1000 + 0.5)
    return (seed * 131 + (scaled % HASH_MOD)) % HASH_MOD
end

local function hashBoolean(seed, value)
    return (seed * 131 + (value and 1 or 0)) % HASH_MOD
end

local function representativeStrings(i)
    local entityType
    if i % 3 == 0 then
        entityType = "evidence"
    elseif i % 3 == 1 then
        entityType = "identity"
    else
        entityType = "location"
    end

    return string.format("cf:t1:%06d", i),
        entityType,
        "CF T1 Record " .. tostring(i),
        "Bureau-" .. tostring(i % 17),
        "KX-" .. tostring(i % 1000),
        string.format("identity:%05d", i % 317),
        string.format("organisation:%04d", i % 83),
        string.format("location:%04d", i % 211)
end

local function makeRepresentativeRecord(i)
    local id, entityType, displayName, author, code, related1, related2, related3 = representativeStrings(i)
    return {
        id = id,
        entityType = entityType,
        displayName = displayName,
        discoveredAt = 1688169600 + i,
        location = {
            x = 10000 + (i % 1000),
            y = 9000 + math.floor(i / 1000),
            z = i % 3,
        },
        metadata = {
            source = "T1",
            category = "document",
            confidence = (i % 100) / 100,
            author = author,
            code = code,
        },
        relatedIds = { related1, related2, related3 },
        flags = {
            interesting = i % 2 == 0,
            archived = i % 5 == 0,
            physicalAvailable = i % 7 ~= 0,
        },
    }
end

local function expectedRecordHash(i)
    local id, entityType, displayName, author, code, related1, related2, related3 = representativeStrings(i)
    local h = 17
    h = hashString(h, id)
    h = hashString(h, entityType)
    h = hashString(h, displayName)
    h = hashNumber(h, 1688169600 + i)
    h = hashNumber(h, 10000 + (i % 1000))
    h = hashNumber(h, 9000 + math.floor(i / 1000))
    h = hashNumber(h, i % 3)
    h = hashString(h, "T1")
    h = hashString(h, "document")
    h = hashNumber(h, (i % 100) / 100)
    h = hashString(h, author)
    h = hashString(h, code)
    h = hashString(h, related1)
    h = hashString(h, related2)
    h = hashString(h, related3)
    h = hashBoolean(h, i % 2 == 0)
    h = hashBoolean(h, i % 5 == 0)
    h = hashBoolean(h, i % 7 ~= 0)
    return h
end

local function actualRecordHash(record)
    if type(record) ~= "table" then
        return nil
    end
    if type(record.location) ~= "table" or type(record.metadata) ~= "table"
        or type(record.relatedIds) ~= "table" or type(record.flags) ~= "table" then
        return nil
    end

    local h = 17
    h = hashString(h, record.id)
    h = hashString(h, record.entityType)
    h = hashString(h, record.displayName)
    h = hashNumber(h, record.discoveredAt)
    h = hashNumber(h, record.location.x)
    h = hashNumber(h, record.location.y)
    h = hashNumber(h, record.location.z)
    h = hashString(h, record.metadata.source)
    h = hashString(h, record.metadata.category)
    h = hashNumber(h, record.metadata.confidence)
    h = hashString(h, record.metadata.author)
    h = hashString(h, record.metadata.code)
    h = hashString(h, record.relatedIds[1])
    h = hashString(h, record.relatedIds[2])
    h = hashString(h, record.relatedIds[3])
    h = hashBoolean(h, record.flags.interesting == true)
    h = hashBoolean(h, record.flags.archived == true)
    h = hashBoolean(h, record.flags.physicalAvailable == true)
    return h
end

local function parseSuffixNumber(name, prefix)
    local suffix = string.match(name, "^" .. prefix .. "_(%d+)$")
    if suffix then
        return tonumber(suffix)
    end
    return nil
end

local function prepareBaseline(root)
    root.primitives = {
        stringValue = "Knox County",
        integerValue = 4242,
        floatValue = 42.125,
        boolTrue = true,
        boolFalse = false,
        removedValue = "must disappear",
    }
    root.primitives.removedValue = nil

    root.flat = {
        alpha = "a",
        beta = 2,
        gamma = true,
    }

    root.numeric = {
        [1] = "one",
        [2] = "two",
        [100] = 100,
        [0] = "zero",
        [-1] = "minus-one",
        [1.5] = "one-point-five",
    }

    root.mixed = {
        alpha = "a",
        [1] = "one",
        [2] = 2,
    }

    root.nested = {
        level1 = {
            level2 = {
                level3 = {
                    marker = "nested-ok",
                },
            },
        },
    }

    root.array = { "first", "second", "third" }
    root.empty = {}
end

local function prepareDepth(root, depth)
    local node = root
    node.depth = depth
    for i = 1, depth do
        node.child = { level = i }
        node = node.child
    end
    node.sentinel = "depth-ok"
end

local function prepareScale(root, count)
    root.recordCount = count
    root.records = {}
    local aggregate = 23
    for i = 1, count do
        local record = makeRepresentativeRecord(i)
        root.records[i] = record
        aggregate = (aggregate * 65599 + expectedRecordHash(i)) % HASH_MOD
    end
    root.expectedChecksum = aggregate
end

local function prepareScenario(name)
    local startMs = nowMs()
    local root

    if name == "nil_removal" then
        root = payload()
        if type(root) ~= "table" or root.toRemove ~= "persisted-before-removal" then
            error("nil_removal requires a successful nil_seed save/reload in the same disposable world")
        end
        root.toRemove = nil
        root.scenario = name
    else
        root = recreatePayload()
        root.scenario = name
        root.schema = 1
    end

    if name == "baseline" then
        prepareBaseline(root)
    elseif name == "nil_seed" then
        root.toRemove = "persisted-before-removal"
        root.neverStored = nil
    elseif name == "nil_removal" then
        -- The previously persisted key was set to nil above.
    elseif name == "function_value" then
        root.value = function()
            return 42
        end
    elseif name == "userdata_value" then
        root.value = getGameTime()
        root.sourceClass = className(root.value)
    elseif name == "metatable" then
        local value = { own = 7 }
        setmetatable(value, { __index = { fallback = 9 }, marker = "cf-t1-meta" })
        root.value = value
    elseif name == "cycle" then
        local value = { marker = "cycle" }
        value.self = value
        root.value = value
    elseif name == "shared_reference" then
        local shared = { marker = "shared" }
        root.a = shared
        root.b = shared
    elseif name == "boolean_key" then
        root.container = {}
        root.container[true] = "boolean-key-value"
    elseif name == "table_key" then
        root.container = {}
        local key = { marker = "table-key" }
        root.container[key] = "table-key-value"
    elseif name == "function_key" then
        root.container = {}
        local key = function()
            return "function-key"
        end
        root.container[key] = "function-key-value"
    elseif name == "userdata_key" then
        root.container = {}
        local key = getGameTime()
        root.container[key] = "userdata-key-value"
        root.sourceClass = className(key)
    else
        local depth = parseSuffixNumber(name, "depth")
        local scale = parseSuffixNumber(name, "scale")
        if depth then
            prepareDepth(root, depth)
        elseif scale then
            prepareScale(root, scale)
        else
            error("Unknown T1 scenario: " .. tostring(name))
        end
    end

    local elapsedMs = nowMs() - startMs
    local ctl = control()
    ctl.armed = true
    ctl.scenario = name
    ctl.gameVersion = gameVersion()
    ctl.preparedAtMs = nowMs()
    ctl.constructMs = elapsedMs
    ctl.runCounter = (tonumber(ctl.runCounter) or 0) + 1

    logEvent("PREPARE", {
        "scenario=" .. name,
        "gameVersion=" .. gameVersion(),
        "constructMs=" .. tostring(elapsedMs),
        "runCounter=" .. tostring(ctl.runCounter),
    })
end

local function validateBaseline(root)
    local failures = 0
    local function check(condition)
        if not condition then
            failures = failures + 1
        end
    end

    check(type(root.primitives) == "table")
    if type(root.primitives) == "table" then
        check(root.primitives.stringValue == "Knox County")
        check(root.primitives.integerValue == 4242)
        check(root.primitives.floatValue == 42.125)
        check(root.primitives.boolTrue == true)
        check(root.primitives.boolFalse == false)
        check(root.primitives.removedValue == nil)
    end

    check(type(root.flat) == "table")
    if type(root.flat) == "table" then
        check(root.flat.alpha == "a")
        check(root.flat.beta == 2)
        check(root.flat.gamma == true)
    end

    check(type(root.numeric) == "table")
    if type(root.numeric) == "table" then
        check(root.numeric[1] == "one")
        check(root.numeric[2] == "two")
        check(root.numeric[100] == 100)
        check(root.numeric[0] == "zero")
        check(root.numeric[-1] == "minus-one")
        check(root.numeric[1.5] == "one-point-five")
    end

    check(type(root.mixed) == "table")
    if type(root.mixed) == "table" then
        check(root.mixed.alpha == "a")
        check(root.mixed[1] == "one")
        check(root.mixed[2] == 2)
    end

    check(type(root.nested) == "table")
    if type(root.nested) == "table" and type(root.nested.level1) == "table"
        and type(root.nested.level1.level2) == "table"
        and type(root.nested.level1.level2.level3) == "table" then
        check(root.nested.level1.level2.level3.marker == "nested-ok")
    else
        failures = failures + 1
    end

    check(type(root.array) == "table")
    if type(root.array) == "table" then
        check(#root.array == 3)
        check(root.array[1] == "first")
        check(root.array[2] == "second")
        check(root.array[3] == "third")
    end

    check(type(root.empty) == "table")
    if type(root.empty) == "table" then
        local isEmpty = true
        for _ in pairs(root.empty) do
            isEmpty = false
            break
        end
        check(isEmpty)
    end

    return failures == 0, {
        "failures=" .. tostring(failures),
        "removedIsNil=" .. boolText(type(root.primitives) == "table" and root.primitives.removedValue == nil),
    }
end

local function validateFunctionValue(root)
    local valueType = type(root.value)
    local callable = false
    local returnValue = "<not-called>"
    if valueType == "function" then
        local ok, result = pcall(root.value)
        callable = ok
        if ok then
            returnValue = safeString(result)
        else
            returnValue = "error:" .. safeString(result)
        end
    end
    return true, {
        "valueType=" .. valueType,
        "callable=" .. boolText(callable),
        "returnValue=" .. returnValue,
    }
end

local function validateUserdataValue(root)
    local sameAsGameTime = false
    if root.value ~= nil then
        local ok, current = pcall(getGameTime)
        if ok then
            sameAsGameTime = root.value == current
        end
    end
    return true, {
        "valueType=" .. type(root.value),
        "class=" .. className(root.value),
        "sourceClass=" .. safeString(root.sourceClass),
        "sameAsCurrentGameTime=" .. boolText(sameAsGameTime),
    }
end

local function validateMetatable(root)
    local meta = nil
    if type(root.value) == "table" then
        meta = getmetatable(root.value)
    end
    local fallback = nil
    if type(root.value) == "table" then
        local ok, result = pcall(function()
            return root.value.fallback
        end)
        if ok then
            fallback = result
        end
    end
    return true, {
        "valueType=" .. type(root.value),
        "metatableType=" .. type(meta),
        "fallback=" .. safeString(fallback),
        "metaMarker=" .. safeString(type(meta) == "table" and meta.marker or nil),
    }
end

local function validateCycle(root)
    local selfSame = type(root.value) == "table" and root.value.self == root.value
    return true, {
        "valueType=" .. type(root.value),
        "selfType=" .. safeString(type(root.value) == "table" and type(root.value.self) or nil),
        "selfSame=" .. boolText(selfSame),
    }
end

local function validateSharedReference(root)
    return true, {
        "aType=" .. type(root.a),
        "bType=" .. type(root.b),
        "sameReference=" .. boolText(root.a ~= nil and root.a == root.b),
        "aMarker=" .. safeString(type(root.a) == "table" and root.a.marker or nil),
        "bMarker=" .. safeString(type(root.b) == "table" and root.b.marker or nil),
    }
end

local function validateNonstandardKey(root, expectedValue)
    local container = root.container
    if type(container) ~= "table" then
        return true, { "containerType=" .. type(container), "matchingValues=0", "keyTypes=<none>" }
    end

    local matchingValues = 0
    local keyTypes = {}
    local seenTypes = {}
    for key, value in pairs(container) do
        local keyType = type(key)
        if not seenTypes[keyType] then
            seenTypes[keyType] = true
            keyTypes[#keyTypes + 1] = keyType
        end
        if value == expectedValue then
            matchingValues = matchingValues + 1
        end
    end
    table.sort(keyTypes)
    return true, {
        "containerType=table",
        "matchingValues=" .. tostring(matchingValues),
        "keyTypes=" .. table.concat(keyTypes, ","),
    }
end

local function validateDepth(root, expectedDepth)
    local node = root
    local traversed = 0
    local malformed = false
    for i = 1, expectedDepth do
        if type(node) ~= "table" or type(node.child) ~= "table" then
            malformed = true
            break
        end
        node = node.child
        traversed = traversed + 1
    end

    local sentinel = type(node) == "table" and node.sentinel or nil
    local pass = not malformed and traversed == expectedDepth and sentinel == "depth-ok"
    return pass, {
        "expectedDepth=" .. tostring(expectedDepth),
        "traversedDepth=" .. tostring(traversed),
        "sentinel=" .. safeString(sentinel),
        "malformed=" .. boolText(malformed),
    }
end

local function validateScale(root, expectedCount)
    local startMs = nowMs()
    local records = root.records
    if type(records) ~= "table" then
        return false, {
            "expectedCount=" .. tostring(expectedCount),
            "recordsType=" .. type(records),
            "validationMs=" .. tostring(nowMs() - startMs),
        }
    end

    local numericPairCount = 0
    local aggregateActual = 23
    local aggregateExpected = 23
    local mismatches = 0

    for key, value in pairs(records) do
        if type(key) == "number" then
            numericPairCount = numericPairCount + 1
        end
    end

    for i = 1, expectedCount do
        local record = records[i]
        local actualHash = actualRecordHash(record)
        local expectedHash = expectedRecordHash(i)
        if actualHash == nil then
            mismatches = mismatches + 1
            actualHash = 0
        elseif actualHash ~= expectedHash then
            mismatches = mismatches + 1
        end
        aggregateActual = (aggregateActual * 65599 + actualHash) % HASH_MOD
        aggregateExpected = (aggregateExpected * 65599 + expectedHash) % HASH_MOD
    end

    local elapsedMs = nowMs() - startMs
    local pass = numericPairCount == expectedCount
        and mismatches == 0
        and aggregateActual == aggregateExpected
        and tonumber(root.recordCount) == expectedCount

    return pass, {
        "expectedCount=" .. tostring(expectedCount),
        "pairCount=" .. tostring(numericPairCount),
        "declaredCount=" .. safeString(root.recordCount),
        "mismatches=" .. tostring(mismatches),
        "actualChecksum=" .. tostring(aggregateActual),
        "expectedChecksum=" .. tostring(aggregateExpected),
        "storedChecksum=" .. safeString(root.expectedChecksum),
        "validationMs=" .. tostring(elapsedMs),
    }
end

local function validateScenario(name, root)
    if type(root) ~= "table" then
        return false, { "payloadType=" .. type(root) }
    end

    if name == "baseline" then
        return validateBaseline(root)
    elseif name == "nil_seed" then
        local pass = root.toRemove == "persisted-before-removal" and root.neverStored == nil
        return pass, {
            "toRemove=" .. safeString(root.toRemove),
            "neverStoredIsNil=" .. boolText(root.neverStored == nil),
        }
    elseif name == "nil_removal" then
        local pass = root.toRemove == nil
        return pass, { "removedIsNil=" .. boolText(root.toRemove == nil) }
    elseif name == "function_value" then
        return validateFunctionValue(root)
    elseif name == "userdata_value" then
        return validateUserdataValue(root)
    elseif name == "metatable" then
        return validateMetatable(root)
    elseif name == "cycle" then
        return validateCycle(root)
    elseif name == "shared_reference" then
        return validateSharedReference(root)
    elseif name == "boolean_key" then
        return validateNonstandardKey(root, "boolean-key-value")
    elseif name == "table_key" then
        return validateNonstandardKey(root, "table-key-value")
    elseif name == "function_key" then
        return validateNonstandardKey(root, "function-key-value")
    elseif name == "userdata_key" then
        return validateNonstandardKey(root, "userdata-key-value")
    end

    local depth = parseSuffixNumber(name, "depth")
    if depth then
        return validateDepth(root, depth)
    end

    local scale = parseSuffixNumber(name, "scale")
    if scale then
        return validateScale(root, scale)
    end

    return false, { "error=unknown-scenario" }
end

local function validateArmedPayload()
    local ctl = ModData.get(CONTROL_TAG)
    if type(ctl) ~= "table" or ctl.armed ~= true or type(ctl.scenario) ~= "string" then
        local autoMode = autoModeForCurrentSave()
        local expectedScenario = expectedReloadScenario()
        if autoMode and expectedScenario == autoMode then
            ctl = {
                scenario = autoMode,
                constructMs = "<control-tag-missing>",
                gameVersion = "<control-tag-missing>",
            }
            verifiedArmedOnLoad = true
            logEvent("VERIFY_CONTROL_MISSING", {
                "scenario=" .. autoMode,
                "status=entire-control-tag-missing-after-save",
            })
        else
            logEvent("VERIFY_SKIPPED", {
                "reason=no-armed-control",
                "gameVersion=" .. gameVersion(),
            })
            return
        end
    end

    local name = ctl.scenario
    local root = payload()
    local startMs = nowMs()
    local ok, pass, details = pcall(function()
        local resultPass, resultDetails = validateScenario(name, root)
        return resultPass, resultDetails
    end)
    local elapsedMs = nowMs() - startMs

    if not ok then
        logEvent("VERIFY", {
            "scenario=" .. name,
            "status=ERROR",
            "error=" .. safeString(pass),
            "validationMs=" .. tostring(elapsedMs),
            "preparedGameVersion=" .. safeString(ctl.gameVersion),
            "loadedGameVersion=" .. gameVersion(),
        })
        return
    end

    local fields = {
        "scenario=" .. name,
        "status=" .. (pass and "PASS" or "FAIL"),
        "validationMs=" .. tostring(elapsedMs),
        "constructMs=" .. safeString(ctl.constructMs),
        "preparedGameVersion=" .. safeString(ctl.gameVersion),
        "loadedGameVersion=" .. gameVersion(),
    }
    if details then
        for i = 1, #details do
            fields[#fields + 1] = details[i]
        end
    end
    logEvent("VERIFY", fields)
end

local function timedSave()
    local beforeMs = nowMs()
    logEvent("SAVE_CALL_START", {
        "scenario=" .. scenarios[selectedIndex],
        "gameVersion=" .. gameVersion(),
    })

    local ok, err = pcall(function()
        saveGame()
    end)
    local elapsedMs = nowMs() - beforeMs

    logEvent("SAVE_CALL_RETURN", {
        "scenario=" .. scenarios[selectedIndex],
        "status=" .. (ok and "RETURNED" or "ERROR"),
        "elapsedMs=" .. tostring(elapsedMs),
        "error=" .. (ok and "<none>" or safeString(err)),
    })
end

local function clearProbeState()
    ModData.remove(PAYLOAD_TAG)
    ModData.remove(CONTROL_TAG)
    logEvent("CLEAR", { "status=probe-tags-removed-in-memory" })
end

local function printSelection()
    logEvent("SELECT", {
        "index=" .. tostring(selectedIndex),
        "scenario=" .. scenarios[selectedIndex],
    })
end

local function cycleScenario()
    selectedIndex = selectedIndex + 1
    if selectedIndex > #scenarios then
        selectedIndex = 1
    end
    printSelection()
end

local function onKeyPressed(key)
    if isMultiplayer and isMultiplayer() then
        return
    end

    if key == getKeyCode("F8") then
        cycleScenario()
    elseif key == getKeyCode("F9") then
        local name = scenarios[selectedIndex]
        local ok, err = pcall(prepareScenario, name)
        if not ok then
            logEvent("PREPARE", {
                "scenario=" .. name,
                "status=ERROR",
                "error=" .. safeString(err),
            })
        end
    elseif key == getKeyCode("F10") then
        timedSave()
    end
end

local function onInitGlobalModData(isNewGame)
    if isMultiplayer and isMultiplayer() then
        logEvent("DISABLED", { "reason=multiplayer", "gameVersion=" .. gameVersion() })
        return
    end

    local initWindowMs = nowMs() - moduleLoadedMs
    logEvent("INIT_GLOBAL_MODDATA", {
        "isNewGame=" .. boolText(isNewGame == true),
        "gameVersion=" .. gameVersion(),
        "initWindowMs=" .. tostring(initWindowMs),
        "note=initWindowMs-is-not-isolated-ModData-load-time",
    })

    local ctl = ModData.get(CONTROL_TAG)
    verifiedArmedOnLoad = type(ctl) == "table" and ctl.armed == true and type(ctl.scenario) == "string"
    validateArmedPayload()
end

local function onGameStart()
    if isMultiplayer and isMultiplayer() then
        return
    end

    local ctl = ModData.get(CONTROL_TAG)
    if type(ctl) == "table" and type(ctl.scenario) == "string" then
        for i = 1, #scenarios do
            if scenarios[i] == ctl.scenario then
                selectedIndex = i
                break
            end
        end
    end

    logEvent("READY", {
        "gameVersion=" .. gameVersion(),
        "currentSave=" .. safeString(getCurrentSaveName and getCurrentSaveName() or nil),
        "controls=F8-select,F9-prepare,F10-saveGame,API-clear",
    })
    printSelection()

    local autoMode, autoIndex = autoModeForCurrentSave()
    if autoMode == "clear" then
        logEvent("AUTO_START", { "mode=" .. autoMode })
        clearProbeState()
        timedSave()
        logEvent("AUTO_DONE", { "mode=" .. autoMode })
    elseif autoMode and not verifiedArmedOnLoad then
        logEvent("AUTO_START", { "mode=" .. autoMode })
        clearProbeState()
        selectedIndex = autoIndex
        printSelection()
        prepareScenario(autoMode)
        timedSave()
        logEvent("AUTO_DONE", { "mode=" .. autoMode })
    elseif autoMode then
        logEvent("AUTO_SKIPPED", { "mode=" .. autoMode, "reason=verified-armed-payload-this-load" })
    end

    if autoMode then
        autoQuitPending = true
        autoQuitTicks = 0
        logEvent("AUTO_QUIT_ARMED", { "mode=" .. autoMode })
    end
end

local function onSave()
    lastOnSaveMs = nowMs()
    logEvent("ON_SAVE", {
        "scenario=" .. scenarios[selectedIndex],
        "timestampMs=" .. tostring(lastOnSaveMs),
        "note=event-fires-before-global-ModData-write-per-current-event-docs",
    })
end

local function onPostSave()
    local elapsed = "unavailable"
    if lastOnSaveMs then
        elapsed = tostring(nowMs() - lastOnSaveMs)
    end
    logEvent("ON_POST_SAVE", {
        "elapsedSinceOnSaveMs=" .. elapsed,
        "note=includes-non-ModData-save-and-exit-work",
    })
end

local function onAutoContinueTick()
    if not autoContinuePending then
        return
    end

    autoContinueTicks = autoContinueTicks + 1
    if autoContinueTicks < 30 then
        return
    end

    local latest = getLatestSave and getLatestSave() or nil
    local saveName = latest and latest[1] or nil
    local gameMode = latest and latest[2] or nil
    if type(saveName) ~= "string" or not saveName:match("^T1_") then
        autoContinuePending = false
        logEvent("AUTO_CONTINUE_SKIPPED", { "reason=latest-save-is-not-T1" })
        return
    end

    if not MainScreen or not MainScreen.instance or not MainScreen.instance.setDefaultSandboxVars
            or not MainScreen.continueLatestSave then
        return
    end

    autoContinuePending = false
    logEvent("AUTO_CONTINUE", { "save=" .. saveName, "gameMode=" .. safeString(gameMode) })
    MainScreen.continueLatestSave(gameMode, saveName)
end

local function onAutoContinueMainMenu()
    autoContinuePending = true
    autoContinueTicks = 0
    logEvent("AUTO_MENU_READY", { "status=waiting-for-main-screen-instance" })
end

local function onAutoQuitTick()
    if not autoQuitPending then
        return
    end

    autoQuitTicks = autoQuitTicks + 1
    if autoQuitTicks < 120 then
        return
    end

    autoQuitPending = false
    logEvent("AUTO_QUIT", { "status=normal-quit-to-desktop-requested" })
    getCore():quitToDesktop()
end

-- Small public surface for the Lua debugger if hotkeys are inconvenient.
T1.scenarios = scenarios
T1.select = function(index)
    local numeric = tonumber(index)
    if numeric and numeric >= 1 and numeric <= #scenarios then
        selectedIndex = math.floor(numeric)
        printSelection()
        return true
    end
    return false
end
T1.prepare = function()
    return prepareScenario(scenarios[selectedIndex])
end
T1.save = timedSave
T1.clear = clearProbeState
T1.validate = validateArmedPayload

Events.OnInitGlobalModData.Add(onInitGlobalModData)
Events.OnGameStart.Add(onGameStart)
Events.OnKeyPressed.Add(onKeyPressed)
Events.OnSave.Add(onSave)
Events.OnPostSave.Add(onPostSave)
Events.OnTick.Add(onAutoContinueTick)
Events.OnTick.Add(onAutoQuitTick)
Events.OnRenderTick.Add(onAutoContinueTick)
Events.OnMainMenuEnter.Add(onAutoContinueMainMenu)

logEvent("SCRIPT_LOADED", {
    "gameVersion=" .. gameVersion(),
    "scenarioCount=" .. tostring(#scenarios),
})
