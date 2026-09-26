-- Module C's (CFPDA's, per docs/design/MODULE_SEPARATION_2026-09-26.md
-- section 3 step 1) one PZ Events surface. No PDA file currently registers
-- a raw PZ event directly - C is driven entirely by module A's Organiser.lua
-- calling into KnoxApps/OrganiserScreen, confirmed by grep across the PDA
-- candidate files before writing this. This dispatcher exists now so any
-- future direct PZ hook C needs has one designated place to register,
-- consistent with A's and B's dispatchers.
ConspiracyFiles = ConspiracyFiles or {}
local Dispatch = ConspiracyFiles.PDAEvents or {}
ConspiracyFiles.PDAEvents = Dispatch

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
