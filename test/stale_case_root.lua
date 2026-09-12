-- A saved case from an older build must not crash the game.
--
-- Generator.REVISION moved to g3-premises-1 when twenty premises replaced the
-- single story. A case written by the previous revision no longer validates -
-- that is the point of pinning the revision, and the schema comment has said
-- since G2 that callers must start a fresh save rather than reinterpret an old
-- case. What must NOT happen is what happened with retired cases on
-- 2026-09-09: the runtime asserted on a root it could not open and threw a Lua
-- error once per tick, forever, with no way for the player to stop it.
--
-- So: opening a stale root must fail politely, and the runtime must handle
-- that failure instead of asserting on it.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local Session = require("ConspiracyFiles/Generated/Session")
local Retired = require("ConspiracyFiles/Generated/RetiredCase")

local opts = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }
local case = assert(G.generate(dofile("test/fixtures/synthetic_locations.lua"), 5, opts))
local targets = {}
for _, site in ipairs(case.locations) do
    targets[site.id] = { x = site.bounds.x1, y = site.bounds.y1, z = site.bounds.z,
        objectIndex = 0, containerIndex = 0, containerType = site.containerTypes[1], sprite = "s" }
end
local root = assert(Session.create(case, targets))

-- Age the root exactly as a save from the previous build would be.
root.case.generatorRevision = "g2-role-carrier-1"

-- It is not retired, so the runtime's retirement branch will not catch it.
assert(not Retired.isRetired(root),
    "a stale case is not a retired case; the retirement branch must not absorb it")

-- Opening it must RETURN a failure, not raise one. A raise inside the
-- per-tick loop is the error loop this test exists to prevent.
local ok, api, why = pcall(Session.open, root, function() end)
assert(ok, "opening a stale root raised instead of returning: " .. tostring(api))
assert(api == nil, "a case from an older generator revision must not open")
assert(type(why) == "string" and #why > 0, "a refusal must say why")

-- And the runtime must act on that return value rather than asserting on it.
local f = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua", "r"))
local runtime = f:read("*a"); f:close()
assert(not runtime:find("sessions[#sessions+1]=assert(Session.open(", 1, true),
    "the runtime still asserts on Session.open; a save from an older build would throw every tick")
assert(runtime:find("local api,why=Session.open(", 1, true),
    "the runtime must take Session.open's failure as a value")
assert(runtime:find("predate this build", 1, true),
    "the player must be told why a case stopped being tracked, in the console")

print("PASS stale case root: an older build's case refuses to open, says why, "
    .. "and the runtime skips it instead of throwing every tick")
