-- Module B's (NHEngine's, per docs/design/MODULE_SEPARATION_2026-09-26.md
-- section 3 step 1) one PZ Events surface. Every engine/content-generation
-- file registers through Dispatch.on(name, fn) instead of calling
-- Events[name].Add directly, so this file is the only place in module B
-- that touches the raw PZ event table. It does not change when or whether
-- anything registers - that stays exactly where each file's own
-- gating/timing logic already lives - it only moves the raw
-- Events[name].Add(fn) call itself.
NHShared = NHShared or {}
local Dispatch = NHShared.EngineEvents or {}
NHShared.EngineEvents = Dispatch

function Dispatch.on(name, fn)
    local ev = Events and Events[name]
    if not ev or not ev.Add then return false end
    ev.Add(fn)
    return true
end

function Dispatch.off(name, fn)
    local ev = Events and Events[name]
    if not ev or not ev.Remove then return false end
    ev.Remove(fn)
    return true
end

-- Module-owned semantic events, deliberately separate from on()/off()
-- above - see InteractionEvents.lua's identical addition for the full
-- rationale (docs/design/MODULE_EXTRACTION_BLUEPRINT_2026-09-26.md
-- section 2).
local listeners = {}
function Dispatch.subscribe(name, fn)
    local list = listeners[name]
    if not list then list = {}; listeners[name] = list end
    list[#list + 1] = fn
    return true
end
function Dispatch.emit(name, ...)
    local list = listeners[name]
    if not list then return 0 end
    local n = 0
    for _, fn in ipairs(list) do
        local ok = pcall(fn, ...)
        if ok then n = n + 1 end
    end
    return n
end

return Dispatch
