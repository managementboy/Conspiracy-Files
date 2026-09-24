-- A DECISION NOT TO ACT MUST HAVE A NAME.
--
-- Every player-facing bug found in the 2026-09-24 playtests was a silent
-- no-op. heldKey returned nil for a generated key; KeyObservations.observe
-- returned early so a token could never arrive; a read flyer saved a timestamp
-- no consumer read; a clue's search icon was never emitted so the clue could
-- not be found by the one mechanism that finds clues. The suite was green
-- throughout, because a test can only check a claim somebody thought to make,
-- and nobody asserts on a decision they do not know is being taken.
--
-- Counted at the time across client modules: MapMediaRuntime 74 early returns
-- against 13 log calls, LocalPersonIntegration 48 against 15, ClueMarkers 40
-- against 11.
--
-- This pins the mechanism, not a coverage number. Rollout is deliberate and
-- incremental - the paths where a player-visible outcome is declined.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Log=require("ConspiracyFiles/Log")

-- 1. A DECLINE RETURNS NIL AND ITS REASON, so a caller can pass it upward.
local decline=Log.declines("testmod")
local value,reason=decline("the body has not been stamped yet")
assert(value==nil,"a decline must return nil so callers treat it as no result")
assert(reason=="the body has not been stamped yet","the reason must come back with it")

-- 2. THE REASON SURVIVES BEING SILENT. This is the point: a playtest that ends
--    in "nothing happened" is asked afterwards instead of being re-run.
assert(ConspiracyFiles.verbose.testmod~=true,"verbose must default to off")
assert(Log.lastDecline("testmod")=="the body has not been stamped yet",
    "the last reason must be readable even though nothing was printed")

-- 3. EACH MODULE KEEPS ITS OWN, so one noisy subsystem does not hide another.
local other=Log.declines("othermod")
other("no destination building")
assert(Log.lastDecline("testmod")=="the body has not been stamped yet",
    "one module's decline overwrote another's")
assert(Log.lastDecline("othermod")=="no destination building")
local all=Log.lastDecline()
assert(all.testmod and all.othermod,"the whole set must be readable at once")

-- 4. TURNING IT ON IS A FLAG, NOT A REBUILD.
ConspiracyFiles.verbose.testmod=true
local v2,r2=decline("still nothing")
assert(v2==nil and r2=="still nothing","verbose must not change what a decline returns")
ConspiracyFiles.verbose.testmod=nil

-- 5. THE PATHS THAT FAILED IN PLAY ARE WIRED. Named individually, because a
--    count would pass while the three that actually cost a playtest were missed.
local function reads(path)
    local f=assert(io.open(path,"rb")); local s=f:read("*a"); f:close(); return s
end
local wired={
    ["client/ConspiracyFiles/IdentityObserver.lua"]="keys",
    ["client/ConspiracyFiles/LocalPersonIntegration.lua"]="keydoor",
    ["client/ConspiracyFiles/ClueSearch.lua"]="cluesearch",
}
for file,module in pairs(wired) do
    local src=reads("mod/common/media/lua/"..file)
    assert(src:find('declines("'..module..'")',1,true),
        file.." no longer names why it declines to act ("..module..")")
end

print("PASS silence has a name: a decline returns nil and its reason, keeps the "
    .."reason while silent, is per-module, and the three paths that cost a playtest are wired")
