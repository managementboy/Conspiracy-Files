-- Module A's (CFInteract's, per docs/design/MODULE_SEPARATION_2026-09-26.md
-- section 3 step 1) one PZ Events surface. Every interaction file registers
-- through Dispatch.on(name, fn) instead of calling Events[name].Add
-- directly, so this file is the only place in module A that touches the raw
-- PZ event table. It does not change when or whether anything registers -
-- that stays exactly where each file's own gating/timing logic already
-- lives - it only moves the raw Events[name].Add(fn) call itself.
ConspiracyFiles = ConspiracyFiles or {}
local Dispatch = ConspiracyFiles.InteractionEvents or {}
ConspiracyFiles.InteractionEvents = Dispatch

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

return Dispatch
