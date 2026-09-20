-- Phase 0 diagnostics, NOT a production read trigger. No hooks until start()
-- is explicitly called in debug single-player. No canonical/item writes, no
-- placement, no stash preparation. Linux must verify the source-backed path.
local CFLog = require("ConspiracyFiles/Log")
ConspiracyFiles = ConspiracyFiles or {}
local O = ConspiracyFiles.MapReadObserver or {}
ConspiracyFiles.MapReadObserver = O

local LIMIT = 192
local function pack(...) return { n = select("#", ...), ... } end
local function allowed()
    return getDebug and getDebug() and not (isClient and isClient())
        and not (isServer and isServer()) and true or false
end
local function short(value)
    if value == nil then return "nil" end
    return tostring(value):gsub("[%c]", " "):sub(1, 160)
end
local function read(fn)
    local ok, value = pcall(fn)
    if not ok then return "unknown", short(value) end
    if value == nil then return "nil" end
    if type(value) == "boolean" or type(value) == "number" then return value end
    return short(value)
end

-- Explicit receiver calls are essential for PZ Java-backed methods.
function O.item(item, playerNum)
    local r = { player = playerNum }
    if not item then r.item = "missing"; return r end
    r.design, r.designError = read(function() return item:getStashMap() end)
    r.map, r.mapError = read(function() return item:getMapID() end)
    r.copy, r.copyError = read(function() return item:getID() end)
    r.type, r.typeError = read(function() return item:getFullType() end)
    r.read, r.readError = read(function()
        local p = getSpecificPlayer(playerNum)
        if not p then error("player unavailable") end
        return p:hasReadMap(item)
    end)
    return r
end

local function emit(kind, fields)
    O.sequence = (O.sequence or 0) + 1
    local row = { seq = O.sequence, kind = kind, session = O.session }
    row.hours = read(function() return getGameTime():getWorldAgeHours() end)
    for key, value in pairs(fields or {}) do row[key] = value end
    O.rows = O.rows or {}
    if #O.rows == LIMIT then table.remove(O.rows, 1); O.dropped = O.dropped + 1 end
    O.rows[#O.rows + 1] = row
    local keys = {}
    for key in pairs(row) do keys[#keys + 1] = key end
    table.sort(keys)
    local parts = {}
    for _, key in ipairs(keys) do parts[#parts + 1] = key .. "=" .. short(row[key]) end
    CFLog.message("mapread", "probe", table.concat(parts, " | "))
    return row.seq
end

local function observe(fn, ...)
    local values = pack(pcall(fn, ...))
    if values[1] then return unpack(values, 2, values.n) end
    O.errors = (O.errors or 0) + 1
    if O.errors >= 3 then O.suspended = true end
    -- An observer error must never prevent or repeat the native callback.
    pcall(print, "[CF-MAP-READ] observer-error=" .. short(values[2])
        .. " | suspended=" .. tostring(O.suspended == true))
end

-- target[key] is a Lua method from the installed source, not an extracted
-- Java method. Keep all arguments, nil returns and native error values.
-- If another mod wraps us, stop() disables our closure without removing theirs.
local function install(target, key, before, after)
    local original = target and target[key]
    if type(original) ~= "function" then error("missing Lua path: " .. key) end
    local hook = { target = target, key = key, own = rawget(target, key), enabled = true }
    hook.wrapper = function(...)
        if not hook.enabled or not O.active or O.suspended or not allowed() then
            return original(...)
        end
        local context
        if before then context = observe(before, ...) end
        local result = pack(pcall(original, ...))
        if after then observe(after, context, result[1], ...) end
        if not result[1] then error(result[2], 0) end
        return unpack(result, 2, result.n)
    end
    O.hooks[#O.hooks + 1] = hook
    target[key] = hook.wrapper
end

local function beforeCheck(item, playerNum)
    local frame = { item = item, player = playerNum, before = O.item(item, playerNum), attached = 0,
        parent = O.frame }
    frame.call = emit("check-enter", frame.before)
    -- Publish context only after logging succeeds. A diagnostic failure before
    -- returning the context must not leave a stale frame around the native call.
    O.frame = frame
    return frame
end
local function afterCheck(frame, ok)
    if not frame then return end
    O.frame = frame.parent
    local fields = O.item(frame.item, frame.player)
    fields.call = frame.call
    fields.designBefore = frame.before.design
    fields.readBefore = frame.before.read
    fields.attached = frame.attached
    fields.nativeOK = ok
    emit("check-return", fields)
    -- A transfer-queued return has no reader attachment and is NOT a read.
    -- Do not use hasReadMap alone: it is already true for a reread/cancel.
    if ok and frame.attached > 0 then
        emit("read-candidate", fields)
    end
end
local function afterAttach(_, ok, wrapper)
    if not ok then return end
    local ui = wrapper and wrapper.mapUI
    if not ui then return end
    local fields = O.item(ui.mapObj, ui.playerNum)
    local frame = O.frame
    if frame and frame.item == ui.mapObj and frame.player == ui.playerNum then
        frame.attached = frame.attached + 1
        fields.call = frame.call
        fields.designBefore = frame.before.design
    else
        fields.call = "outside-check-path"
    end
    emit("reader-attached", fields)
end
local function beforeReveal(ui)
    local fields = O.item(ui.mapObj, ui.playerNum)
    emit("reveal-enter", fields)
    return fields
end
local function afterReveal(fields, ok)
    if fields then fields.nativeOK = ok; emit("reveal-return", fields) end
end
local function beforeClose(wrapper)
    local ui = wrapper and wrapper.mapUI
    if ui then return O.item(ui.mapObj, ui.playerNum) end
end
local function afterClose(fields, ok)
    if fields then fields.nativeOK = ok; emit("reader-close", fields) end
end

function O.stop()
    O.active = false
    O.frame = nil
    for i = #(O.hooks or {}), 1, -1 do
        local h = O.hooks[i]
        h.enabled = false
        if h.target[h.key] == h.wrapper then h.target[h.key] = h.own end
    end
    O.hooks = {}
    return true
end

function O.start(label)
    if not allowed() then return false, "debug single-player only" end
    if O.active then return false, "already active; stop before starting a new trace" end
    local ok, why = pcall(function()
        require "ISUI/ISInventoryPaneContextMenu"
        require "ISUI/Maps/ISMap"
        O.rows, O.hooks = {}, {}
        O.sequence, O.dropped, O.errors = 0, 0, 0
        O.suspended, O.frame = false, nil
        O.session = short(label or "map-phase0")
        install(ISInventoryPaneContextMenu, "onCheckMap", beforeCheck, afterCheck)
        install(ISMapWrapper, "addToUIManager", nil, afterAttach)
        install(ISMap, "revealOnWorldMap", beforeReveal, afterReveal)
        install(ISMapWrapper, "close", beforeClose, afterClose)
        O.active = true
        emit("started", { version = read(function() return getCore():getVersionNumber() end) })
    end)
    if not ok then O.stop(); return false, short(why) end
    return true, "observing only; read-candidate is not a verified production trigger"
end

function O.mark(label)
    if not O.active or not allowed() then return false, "observer not active" end
    return observe(emit, "checkpoint", { label = short(label) })
end

function O.status()
    local candidates, attached = 0, 0
    for _, row in ipairs(O.rows or {}) do
        if row.kind == "read-candidate" then candidates = candidates + 1 end
        if row.kind == "reader-attached" then attached = attached + 1 end
    end
    return O.active == true, O.suspended == true, O.sequence or 0,
        candidates, attached, O.dropped or 0, O.errors or 0
end

-- Return a copy of one bounded row for DevEval; full history is in console.txt.
-- Sequence IDs stay monotonic even when the in-memory ring drops old rows.
function O.event(sequence)
    for _, row in ipairs(O.rows or {}) do
        if row.seq == sequence then
            local copy = {}
            for key, value in pairs(row) do copy[key] = value end
            return copy
        end
    end
    return nil, "sequence absent or dropped; use the console trace"
end

return O
