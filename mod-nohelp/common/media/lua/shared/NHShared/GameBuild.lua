-- Which game builds this mod runs on: Build 42.20 and every later build
-- (owner decision 2026-09-30). mod.info's versionMin says the same to the
-- game's mod loader; this is the in-Lua half for code that reads
-- getGameVersion() or a stored build line. Shipped data generated on 42.20
-- still names "42.20" as its own source build; that is provenance, not a gate.
local B={FIRST="42.20"}

-- "42.20", "42.20.4", "42.21.1 (rc)" -> 42,20,4. Anything else -> nil.
function B.parse(v)
    local major,minor,patch=tostring(v or ""):match("^%s*(%d+)%.(%d+)%.?(%d*)")
    if not major then return nil end
    return tonumber(major),tonumber(minor),tonumber(patch) or 0
end

function B.atLeast(v,floor)
    local a1,a2,a3=B.parse(v)
    local b1,b2,b3=B.parse(floor)
    if not (a1 and b1) then return false end
    if a1~=b1 then return a1>b1 end
    if a2~=b2 then return a2>b2 end
    return a3>=b3
end

function B.supported(v) return B.atLeast(v,B.FIRST) end

return B
