-- WHAT A MAP OR FLYER PLACE HANDS THE DECISION (AreaCase.decide): the maps
-- marking it, a big area's own marks and the keys of every mark naming it.
-- Shared by the runtime (GeneratedRuntime, when a place is decided) and the
-- offline progress check (tools/nohelp_content/progress.lua, E7), so the
-- check runs the very decision the game runs.
local Manifest=require("NHShared/Mystery/Manifest")
local M={}
-- The maps marking a place, each once, in the static order MapSites gives.
function M.designsOf(entry)
    local out,seen={},{}
    for _,m in ipairs(entry.marks or {}) do
        local d=m.design or (m.print and "print:"..m.print)
        if d and not seen[d] then seen[d]=true; out[#out+1]=d end
    end
    return out
end
-- A big marked area's own map marks (their `mark` numbers, never the
-- annotation notes), when one map alone marks it: each such mark gets its own
-- minimum of clues (AreaCase.trailFor, owner 2026-09-27). Nil otherwise.
function M.ownMarksOf(entry,designs)
    if entry.kind~="area" or #designs~=1 then return nil end
    local out,seen={},{}
    for _,m in ipairs(entry.marks or {}) do
        if m.design==designs[1] and m.mark and not seen[m.mark] then seen[m.mark]=true; out[#out+1]=m.mark end
    end
    return #out>=2 and out or nil
end
-- The keys of every mark naming a place (Manifest.markKey), so a clue
-- anchored to one of them goes there first (AreaCase.anchorPool).
function M.anchorsOf(entry)
    local out,seen={},{}
    for _,m in ipairs(entry.marks or {}) do
        local k=Manifest.markKey(m)
        if k and not seen[k] then seen[k]=true; out[#out+1]=k end
    end
    return out
end
return M
