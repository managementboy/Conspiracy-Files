-- A TRANSPORT SCENE REALITY NEVER PROMOTED DOES NOT HOLD THE CASE OPEN.
--
-- Every opening family ends with a clue that waits for a CONFIRMED vanilla
-- vehicle scene near the second site. The families say it "cannot make the
-- case fail merely because this save has no suitable nearby scene" - and it
-- did not fail the case; it held it open for three in-game days with every
-- essential clue found and the closing question not firing (core loop
-- 20260925T200914; every audit of the Fitness opening saw the cooler wait).
--
-- Held: with every other clue known, a waiting vehicle clue no longer blocks
-- accounting; a waiting clue of any other kind still does; and the runtime
-- sets the scene aside before it retires the case, so the record says the
-- case ended without it rather than nothing.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local S=require("ConspiracyFiles/Generated/Session")

local function root(status,intent,known)
    return {case={caseId="c",documents={{id="d1"},{id="d2",placementIntent=intent}}},
            assignments={d1={status="placed"},d2={status=status}},known=known}
end
assert(S.accounted(root("deferred","vehicle",{"d1"}))==true,"a waiting transport scene must not hold the case open")
assert(S.accounted(root("indexed","vehicle",{"d1"}))==true,"nor an indexed one")
assert(S.accounted(root("deferred",nil,{"d1"}))==false,"a waiting clue of any other kind still does")
assert(S.accounted(root("deferred","vehicle",{}))==false,"the essentials must still be found first")
assert(S.accounted(root("placed","vehicle",{"d1"}))==false,"a transport scene that WAS placed must be found like any clue")
assert(S.accounted(root("dropped","vehicle",{"d1"}))==true,"a dropped clue is accounted for, as before")
local ids=S.unpromotedVehicleIds(root("deferred","vehicle",{"d1"}))
assert(#ids==1 and ids[1]=="d2","the waiting scene is named so the runtime can set it aside")
assert(#S.unpromotedVehicleIds(root("placed","vehicle",{"d1"}))==0)

-- The runtime sets it aside BEFORE retiring, through the session's own drop.
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua","rb"))
local src=f:read("*a"); f:close()
local body=assert(src:match("local function retireIfAccounted%(done%)(.-)\nend\n"))
local drop=body:find("Session.unpromotedVehicleIds(done)",1,true)
local retire=body:find("Cases.retire(wrapper,index,seen,worldHours())",1,true)
assert(drop and retire and drop<retire,"the scene must be set aside before the case retires")
assert(body:find('why="no-scene-at-completion"',1,true),"setting a scene aside must say why in the log")
print("PASS transport scene: a scene reality never promoted is set aside at completion, never a three-day wait")
