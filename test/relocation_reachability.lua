-- WHEN CAN STALE-CLUE RELOCATION RUN AT ALL?
--
-- Two live runs (sessions 20260919T210322 and 20260919T211237) reported
-- destinations=0 for every clue and relocation never fired. This pins the
-- reason in plain Lua, because it is a property of the rule and needs no game:
--
--   StaleClue.destinations returns a site only when it is BOTH
--     (a) not visited, and
--     (b) occupied by no PLACED clue.
--
-- In a fresh case every site holds clues, so (b) fails everywhere. The ordinary
-- way a site empties is the survivor going there and collecting them - which
-- makes (a) fail. The two conditions are close to mutually exclusive in normal
-- play, and that is why relocation did not run in either session.
--
-- WHY THIS MATTERS BEYOND THE CHECK. The design notes' prime suspect for the
-- original placement mismatch was "a relocation whose canonical write was
-- refused, leaving the item in the new cupboard while the record still names
-- the old one". If relocation is this hard to reach, that suspect is much
-- weaker than assumed - which is a finding about the investigation, not about
-- this test.
--
-- Nothing here says relocation is broken. The rule is doing exactly what it
-- says; the point is how narrow the window is.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local StaleClue=require("ConspiracyFiles/StaleClue")

local function root(placedAt)
    -- Two sites, three documents. `placedAt` maps document -> site, or nil for
    -- a document that is not placed.
    local docs,assign={},{}
    for i,site in ipairs(placedAt) do
        local id="d"..i
        docs[#docs+1]={id=id,locationId=site or "siteA"}
        if site then assign[id]={status="placed",relocations=0,placedHours=0}
        else assign[id]={status="deferred",relocations=0,deferredHours=0} end
    end
    return {case={caseId="c1",documents=docs,
                  locations={{id="siteA",bounds={x1=0,y1=0,z=0}},
                             {id="siteB",bounds={x1=50,y1=50,z=0}}}},
            assignments=assign,known={}}
end

-- 1. A FRESH CASE HAS NOWHERE TO GO. Both sites hold a placed clue.
local fresh=root({"siteA","siteB","siteA"})
assert(#StaleClue.destinations(fresh,{})==0,
    "a fully placed case has no destination - this is what both live runs saw")

-- 2. Emptying a site of placed clues opens it, IF it is unvisited.
local oneFree=root({"siteA",nil,"siteA"})
local open=StaleClue.destinations(oneFree,{})
assert(#open==1 and open[1].id=="siteB",
    "a site with no placed clue is a destination: got "..#open)

-- 3. And visiting that site closes it again. This is the bind: the ordinary way
--    a site empties is by going there.
assert(#StaleClue.destinations(oneFree,{siteB=true})==0,
    "a visited site is never a destination, however empty")

-- 4. So the reachable window is a site whose clues were DEFERRED or DROPPED -
--    never placed, so never worth visiting. That is the one combination that
--    satisfies both conditions at once, and it is why relocation is rare.
local deferredSite=root({"siteA",nil,nil})
local reachable=StaleClue.destinations(deferredSite,{siteA=true})
assert(#reachable==1 and reachable[1].id=="siteB",
    "an unvisited site whose clues never arrived IS reachable, even with the other site visited")

-- 5. A found clue does not free its site while another placed clue is there.
--    Run 2 marked one clue found and destinations stayed 0 for exactly this
--    reason: the site still held others.
local stillOccupied=root({"siteA","siteB","siteA"})
stillOccupied.known={"d1"}
stillOccupied.assignments.d1.status="placed" -- found, but the record still places it
assert(#StaleClue.destinations(stillOccupied,{})==0,
    "finding one clue frees nothing while a sibling is still placed at that site")

print("PASS relocation reachability: a destination needs a site both unvisited AND empty of placed clues")
print("PASS relocation reachability: the window is a site whose clues never arrived - which is why it is rare")
