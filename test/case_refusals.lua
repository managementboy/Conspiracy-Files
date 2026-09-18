-- HONEST REFUSALS AND THE DEBT THEY LEAVE (P4-R133, docs/design/CASE_PACING.md).
--
-- A refusal used to be a sentence: "insufficient distinct loaded storage
-- nearby", logged seventeen times in one campaign run while no second case
-- ever came. Now every refusal carries a code from a closed set, a count, and
-- dueHours - the in-game hour by which the next case IS expected - and the
-- count and the rung are kept in the case store's own schedule slot, so a save
-- and a reload do not let a player who stays in one house start the ladder
-- again from the bottom.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local A=require("ConspiracyFiles/Generated/SuccessiveCases")
local V=require("ConspiracyFiles/Validator")
local Log=require("ConspiracyFiles/Log")

local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function root(seed)
    local c=assert(G.generate(catalog(),seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}))
    local targets={}
    for _,site in ipairs(c.locations) do
        targets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
            containerIndex=0,containerType="shelves",sprite="shelf_sprite"}
    end
    return assert(S.create(c,targets))
end

-- 1. The vocabulary is closed, and the log has a word for a refusal ----------
-- `gap` joined the set on 2026-09-18, for the poller's own wait between cases
-- (P4-R133's honesty had stopped at the generator's door: AutomaticInvestigations
-- returned silently five times over). It is the only code added since the set
-- was closed, and it is uncounted like the other two waits of our own making.
local expected={"no-reach","no-containers","cap","active-limit","cooldown","disabled","busy","gap"}
local n=0
for code in pairs(A.DEFER_CODES) do n=n+1 end
assert(n==#expected,"the refusal codes are a closed set of "..#expected..", got "..n)
for _,code in ipairs(expected) do assert(A.DEFER_CODES[code],"missing refusal code "..code) end
local events={}
for _,id in ipairs(Log.events()) do events[id]=true end
assert(events.defer,"the log's closed vocabulary must know ev=defer")
assert(A.REFUSALS_PER_RUNG==3,"the ladder moves after three refusals of one code")
assert(A.MAX_RUNG>=1,"there must be a rung to climb")

-- 2. The debt is written, read back and cleared ------------------------------
local wrapper={canonical=root(17),schedule={schema=1,createdHours={10}}}
assert(A.validate(wrapper))
assert(A.defer(wrapper)==nil,"a fresh campaign owes nothing")
local record={code="no-containers",count=17,sinceHours=12.5,dueHours=36,rung=2}
local owed=assert(A.setDefer(wrapper,record))
assert(wrapper.schedule.defer==nil,"setDefer must be copy-on-write, not a mutation")
local read=assert(A.defer(owed))
assert(read.code=="no-containers" and read.count==17 and read.rung==2 and read.dueHours==36,
    "the debt reads back exactly as it was written")
read.count=999
assert(A.defer(owed).count==17,"a reader must not be able to edit the save")
local paid=assert(A.setDefer(owed,nil))
assert(A.defer(paid)==nil,"a case arriving clears the debt")

-- 3. A save and a reload do not reset a count --------------------------------
-- The store is what the mod actually persists: it is validated on the way in
-- (P4-R32) and read back through A.current, which is the path a reload takes.
local store={campaign=owed}
local reloaded=assert(A.current(store),"a save carrying a refusal debt must load")
local after=assert(A.defer(reloaded))
assert(after.count==17 and after.code=="no-containers" and after.rung==2,
    "a reload must not reset the count: got "..tostring(after.count))

-- And it survives the writes that happen in between: a second case staged, a
-- last-seen note, answers. Every writer copies the schedule, so none of them
-- may quietly drop the debt.
local staged=assert(A.stage(owed,root(18),11))
assert(A.defer(staged).count==17,"staging a case must carry the debt forward")
assert(#staged.schedule.createdHours==2,"and the schedule it lives in still grows")

-- 4. A hand-edited debt is refused, field by field ---------------------------
local function refused(mutate,why)
    local w={canonical=owed.canonical,schedule={schema=1,createdHours={10},
        defer={code="no-containers",count=3,sinceHours=1,dueHours=2,rung=1}}}
    mutate(w.schedule.defer,w)
    local ok=A.validate(w)
    assert(not ok,"a save must refuse "..why)
end
refused(function(d) d.code="because-i-said-so" end,"a code outside the closed set")
refused(function(d) d.count=0 end,"a count below one")
refused(function(d) d.count=1.5 end,"a fractional count")
refused(function(d) d.rung=A.MAX_RUNG+1 end,"a rung past the last one")
refused(function(d) d.rung=-1 end,"a negative rung")
refused(function(d) d.dueHours=-1 end,"a promise before the world began")
refused(function(d) d.sinceHours=0/0 end,"an hour that is not a number")
refused(function(d) d.deadline=5 end,"a field nobody wrote")
refused(function(d) d.code=nil end,"a debt with no reason")
-- And the schedule itself still validates with the debt absent.
do
    local w={canonical=owed.canonical,schedule={schema=1,createdHours={10}}}
    assert(A.validate(w),"a save written before the debt existed must still load")
end
-- A store with no schedule at all (the legacy single-case save) has nowhere to
-- keep it, and says so rather than pretending to have written it.
assert(not A.setDefer({canonical=owed.canonical},{code="cap",count=1,sinceHours=1,dueHours=2,rung=0}),
    "a campaign with no schedule cannot record a debt")

-- 5. It costs almost nothing -------------------------------------------------
-- Measured with the project's own estimator (Validator.estimateEncodedBytes),
-- which is a deliberate ceiling - four bytes per character of a string, 32 per
-- number - because that is the number P4-R17's budget is kept against. The
-- design's "about 150 bytes" is the real serialised length; the ceiling this
-- must fit inside is larger, and is what the budget test counts.
local bare=V.estimateEncodedBytes({schema=1,createdHours={10}})
local withDebt=V.estimateEncodedBytes(owed.schedule)
local cost=withDebt-bare
assert(cost<=400,"the debt must stay a rounding error in the budget, measured "..cost)

print(string.format("PASS refusals: %d codes, the debt survives a reload at %d estimator bytes, 9 hand edits refused",
    #expected,cost))
