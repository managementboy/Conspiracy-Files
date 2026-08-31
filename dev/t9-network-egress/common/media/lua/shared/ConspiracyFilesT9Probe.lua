-- Conspiracy-Files Spike T9: Build 42 vanilla-Lua network-egress probe.
-- Disposable development code. This is NOT production Conspiracy-Files code.

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.T9Probe = ConspiracyFiles.T9Probe or {}

local T9 = ConspiracyFiles.T9Probe
local PREFIX = "[CF-T9]"
local SENTINEL_FILE = "ConspiracyFiles_T9_Sentinel.txt"
local SENTINEL_VALUE = "CF-T9-SENTINEL"
local startupTicks = 0
local completed = false
local quitTicks = 0
local requestFinishedMs = nil
local requestElapsedMs = nil
local quitRequested = false
local autoContinuePending = true
local autoContinueTicks = 0

local candidateNames = {
    "getUrlInputStream",
    "getURLInputStream",
    "getHostByName",
    "openUrl",
    "getPublicServersList",
    "PublicServerUtil",
    "URL",
    "URLConnection",
    "HttpURLConnection",
    "HttpClient",
    "OkHttpClient",
    "Request",
    "Socket",
    "Thread",
    "Runnable",
    "luajava",
}

local discoveryTerms = {
    "http",
    "url",
    "socket",
    "host",
    "network",
    "request",
    "stream",
    "thread",
    "async",
    "web",
}

local function nowMs()
    if getTimeInMillis then
        return getTimeInMillis()
    end
    return 0
end

local function safeString(value)
    if value == nil then
        return "<nil>"
    end
    return tostring(value):gsub("|", "/"):gsub("\r", " "):gsub("\n", " ")
end

local function boolText(value)
    if value then
        return "true"
    end
    return "false"
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

local function isT9Save()
    local currentSave = getCurrentSaveName and getCurrentSaveName() or ""
    local folder = tostring(currentSave):match("([^\\/]+)$") or ""
    return folder:match("^T9_") ~= nil
end

local function gameVersion()
    if not getGameVersion then
        return "unavailable"
    end
    local ok, value = pcall(getGameVersion)
    return ok and safeString(value) or "error"
end

local function globalType(name)
    return type(_G[name])
end

local function activeModStatus()
    local ok, mods = pcall(function()
        return getActivatedMods()
    end)
    if not ok or mods == nil then
        return "unavailable", false, -1
    end

    local count = -1
    local countOk, countValue = pcall(function()
        return mods:size()
    end)
    if countOk then
        count = countValue
    end

    local containsOk, containsValue = pcall(function()
        return mods:contains("ZombieBuddy")
    end)
    return "available", containsOk and containsValue == true, count
end

local function logCandidateSurface()
    for i = 1, #candidateNames do
        local name = candidateNames[i]
        logEvent("API_CANDIDATE", {
            "name=" .. name,
            "luaType=" .. globalType(name),
        })
    end

    local matches = {}
    for name, value in pairs(_G) do
        if type(name) == "string" then
            local lowerName = string.lower(name)
            local matched = false
            for i = 1, #discoveryTerms do
                if string.find(lowerName, discoveryTerms[i], 1, true) then
                    matched = true
                    break
                end
            end
            if matched then
                matches[#matches + 1] = name .. ":" .. type(value)
            end
        end
    end
    table.sort(matches)
    for i = 1, #matches do
        logEvent("API_MATCH", { "entry=" .. safeString(matches[i]) })
    end
    logEvent("API_DISCOVERY_DONE", { "matchCount=" .. tostring(#matches) })
end

local function dnsKind(value)
    if type(value) ~= "string" or value == "" then
        return "none"
    end
    if string.find(value, ":", 1, true) then
        return "ipv6"
    end
    if string.match(value, "^%d+%.%d+%.%d+%.%d+$") then
        return "ipv4"
    end
    return "other"
end

local function testDns(label, hostname)
    local started = nowMs()
    local ok, result = pcall(function()
        return getHostByName(hostname)
    end)
    logEvent("DNS", {
        "case=" .. label,
        "status=" .. (ok and "RETURNED" or "ERROR"),
        "resultKind=" .. (ok and dnsKind(result) or "error"),
        "elapsedMs=" .. tostring(nowMs() - started),
    })
end

local function testRejectedUrlLauncher()
    local started = nowMs()
    local ok, result = pcall(function()
        return openUrl("https://example.com")
    end)
    logEvent("OPEN_URL_REJECTED", {
        "status=" .. (ok and "RETURNED" or "ERROR"),
        "resultType=" .. type(result),
        "elapsedMs=" .. tostring(nowMs() - started),
        "note=non-allowlisted-url-no-browser-request-expected",
    })
end

local function testFileSandbox()
    local sentinelOk, sentinelReader = pcall(function()
        return getFileReader(SENTINEL_FILE, false)
    end)
    local sentinelMatched = false
    if sentinelOk and sentinelReader ~= nil then
        local readOk, line = pcall(function()
            local value = sentinelReader:readLine()
            sentinelReader:close()
            return value
        end)
        sentinelMatched = readOk and line == SENTINEL_VALUE
    end

    local traversalOk, traversalReader = pcall(function()
        return getFileReader("..\\options.ini", false)
    end)
    if traversalOk and traversalReader ~= nil then
        pcall(function()
            traversalReader:close()
        end)
    end

    logEvent("FILE_SANDBOX", {
        "controlledCacheRead=" .. boolText(sentinelMatched),
        "parentTraversalCall=" .. (traversalOk and "RETURNED" or "ERROR"),
        "parentTraversalReader=" .. (traversalReader == nil and "nil" or "non-nil"),
    })
end

local function countTableEntries(value)
    if type(value) ~= "table" then
        return -1
    end
    local count = 0
    for key, entry in pairs(value) do
        count = count + 1
    end
    return count
end

local function testFixedServerList()
    local steamMode = "unavailable"
    if getSteamModeActive then
        local steamOk, steamValue = pcall(getSteamModeActive)
        if steamOk then
            steamMode = boolText(steamValue == true)
        end
    end

    local started = nowMs()
    logEvent("SERVER_LIST_START", {
        "steamMode=" .. steamMode,
        "callThread=OnTick-event-thread",
    })
    local ok, result = pcall(function()
        return getPublicServersList()
    end)
    local finished = nowMs()
    requestFinishedMs = finished
    requestElapsedMs = finished - started
    logEvent("SERVER_LIST_RETURN", {
        "steamMode=" .. steamMode,
        "status=" .. (ok and "RETURNED" or "ERROR"),
        "resultType=" .. type(result),
        "entryCount=" .. tostring(ok and countTableEntries(result) or -1),
        "elapsedMs=" .. tostring(requestElapsedMs),
        "responseBodyVisible=false",
    })
end

local function runProbe()
    local modsStatus, zombieBuddyActive, modCount = activeModStatus()
    logEvent("ENVIRONMENT", {
        "gameVersion=" .. gameVersion(),
        "t9Save=true",
    })
    logEvent("ACTIVE_MODS", {
        "status=" .. modsStatus,
        "count=" .. tostring(modCount),
        "zombieBuddyActive=" .. boolText(zombieBuddyActive),
    })

    logCandidateSurface()
    testDns("known-host", "example.com")
    testDns("invalid-tld", "cf-t9-controlled.invalid")
    testRejectedUrlLauncher()
    testFileSandbox()

    local generalHttp = globalType("getUrlInputStream") == "function"
        or globalType("getURLInputStream") == "function"
        or globalType("URL") ~= "nil"
        or globalType("HttpClient") ~= "nil"
        or globalType("OkHttpClient") ~= "nil"
        or globalType("PublicServerUtil") ~= "nil"
    local asyncSurface = globalType("Thread") ~= "nil"
        or globalType("Runnable") ~= "nil"
        or globalType("luajava") ~= "nil"

    logEvent("GENERAL_HTTP_SURFACE", {
        "callableCandidateFound=" .. boolText(generalHttp),
        "getCapability=" .. (generalHttp and "candidate-present" or "unavailable"),
        "postCapability=" .. (generalHttp and "not-exercised" or "unavailable"),
    })
    logEvent("ASYNC_SURFACE", {
        "callableCandidateFound=" .. boolText(asyncSurface),
    })

    testFixedServerList()
end

local function onGameStart()
    if not isT9Save() then
        logEvent("SKIPPED", { "reason=current-save-is-not-T9" })
        return
    end
    logEvent("READY", { "gameVersion=" .. gameVersion(), "startAfterTicks=120" })
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
    if type(saveName) ~= "string" or not saveName:match("^T9_") then
        autoContinuePending = false
        logEvent("AUTO_CONTINUE_SKIPPED", { "reason=latest-save-is-not-T9" })
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

local function onMainMenuEnter()
    autoContinuePending = true
    autoContinueTicks = 0
    logEvent("AUTO_MENU_READY", { "status=waiting-for-main-screen-instance" })
end

local function onTick()
    if not isT9Save() then
        return
    end

    if not completed then
        startupTicks = startupTicks + 1
        if startupTicks < 120 then
            return
        end
        completed = true
        local ok, err = pcall(runProbe)
        if not ok then
            logEvent("PROBE_ERROR", { "error=" .. safeString(err) })
        end
        return
    end

    quitTicks = quitTicks + 1
    if quitTicks == 1 and requestFinishedMs ~= nil then
        local now = nowMs()
        logEvent("POST_CALL_TICK", {
            "gapSinceReturnMs=" .. tostring(now - requestFinishedMs),
            "blockingCallElapsedMs=" .. tostring(requestElapsedMs or -1),
        })
    end
    if quitTicks >= 120 and not quitRequested then
        quitRequested = true
        logEvent("AUTO_QUIT", { "status=normal-quit-to-desktop-requested" })
        getCore():quitToDesktop()
    end
end

T9.run = runProbe
T9.candidateNames = candidateNames

Events.OnGameStart.Add(onGameStart)
Events.OnTick.Add(onAutoContinueTick)
Events.OnTick.Add(onTick)
Events.OnRenderTick.Add(onAutoContinueTick)
Events.OnMainMenuEnter.Add(onMainMenuEnter)

logEvent("SCRIPT_LOADED", { "gameVersion=" .. gameVersion() })
