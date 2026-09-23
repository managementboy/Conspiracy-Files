-- EVERY MYSTERY IS BOUND TO A CENTRAL CONSPIRACY, AND WHICH ONE IS HIDDEN.
--
-- Measured on 2026-09-23, before this was true:
--
--   * ConspiracyPair held exactly ONE pair, hardcoded. `M.current()` returned
--     it and `M.validate` refused every other id, so no save could differ from
--     any other and nothing was hidden, because nothing was ever chosen.
--   * Every case carried that pair as a stamp it never mentioned. Of 27
--     scenario `unresolved` lines, exactly ONE touched the farm, a sample,
--     infection, animals or biological material. The other 26 resolved into
--     clerical trivia - a missing form, an unsigned collection entry, an
--     unauthorised handling fee - and were bound to the central conspiracy in
--     name only.
--
-- The binding is now a property the generator checks: a scenario names an
-- AXIS, the live pair supplies the sentence for that axis, and a scenario
-- without a valid axis does not validate at all.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Pair=require("ConspiracyFiles/Generated/ConspiracyPair")
local Story=require("ConspiracyFiles/Generated/Story")
local Premises=require("ConspiracyFiles/Generated/Premises")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local G=require("ConspiracyFiles/Generated/Generator")

-- 1. THERE IS MORE THAN ONE CENTRAL CONSPIRACY.
assert(Pair.count()>=2,"a single hardcoded pair cannot be hidden, because nothing is chosen")
local ids=Pair.list()
assert(ids[1]=="farm-zero-vs-delivered-agent",
    "the original pair stays first so saves written before the registry still validate")

-- 2. NEITHER READING EVER WINS. No pair may carry a verdict in any spelling.
for _,id in ipairs(ids) do
    local p=assert(Pair.byId(id))
    assert(#p.theories==2,id.." must offer exactly two readings")
    for _,banned in ipairs({"correct","winner","truth","answer","solution","score"}) do
        assert(p[banned]==nil,id.." carries a "..banned.." field")
    end
    assert(type(p.missingFact)=="string" and #p.missingFact>0,
        id.." must say what its evidence cannot establish")
    -- A smuggled winner is refused even when everything else matches.
    local forged=assert(Pair.byId(id)); forged.correct=p.theories[1].id
    assert(Pair.validate(forged)==false,"a hand-edited save smuggled a winner into "..id)
    assert(Pair.validate(assert(Pair.byId(id))),id.." does not validate as itself")
end

-- 3. WHICH PAIR IS LIVE COMES FROM THE SEED, IS STABLE, AND VARIES.
assert(Pair.select("x")==nil,"a seed selects the pair; a non-number must be refused")
local seen={}
for seed=1,40 do
    local a=assert(Pair.select(seed))
    local b=assert(Pair.select(seed))
    assert(a.id==b.id,"selection must be stable for a seed, or reloads would change the campaign")
    seen[a.id]=true
end
local distinct=0; for _ in pairs(seen) do distinct=distinct+1 end
assert(distinct>=2,"forty seeds drew only "..distinct.." pair(s); the choice is not real")

-- 4. EVERY PAIR ANSWERS EVERY AXIS, or a scenario could name an axis its
--    campaign cannot speak to and the binding would break at generation time.
for _,id in ipairs(ids) do
    local p=assert(Pair.byId(id))
    for _,axis in ipairs(Pair.AXES) do
        local line=Pair.axisLine(p,axis)
        assert(type(line)=="string" and #line>0,id.." carries no line for axis "..axis)
        -- The line must not resolve anything: it says what the finding could
        -- mean under either reading, never which reading is right.
        for _,banned in ipairs({"proves","confirms","establishes","therefore","must have been"}) do
            assert(not line:lower():find(banned,1,true),
                id.."/"..axis.." draws a conclusion: "..line)
        end
    end
end
assert(Pair.isAxis("movement") and not Pair.isAxis("not-an-axis"),
    "the axis list must be closed, or an unbound scenario passes as bound")

-- 5. EVERY REACHABLE SCENARIO DECLARES A VALID AXIS. This is the assertion
--    that would have failed for 26 of 27 scenarios before today.
local checked=0
local function get(id,v) return Personal.get(id,v) or Ordinary.get(id,v) end
for _,id in ipairs(Premises.list()) do
    for variant=1,12 do
        local s=get(id,variant)
        if s then
            checked=checked+1
            assert(Pair.isAxis(s.centralAxis),
                "scenario "..id.." v"..variant.." is not bound to the central conspiracy")
            assert(Story.validate(s))
        end
    end
end
assert(checked>=40,"only "..checked.." scenarios were reachable; the sweep is not covering the pool")

-- 6. A GENERATED CASE CARRIES THE BRIDGE, and the bridge is the LIVE pair's.
local catalog=dofile("test/fixtures/synthetic_locations.lua")
for _,site in ipairs(catalog.locations) do site.paperStorage="indexed" end
local sites={catalog.locations[1].id,catalog.locations[2].id}
local pairsSeen={}
for seed=1,12 do
    local case=assert(G.generateSelected(catalog,seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",
        allowSynthetic=true,opening=true,self="Ada Whitlock",profession="fitnessinstructor"},sites))
    assert(Pair.validate(case.conspiracyPair),"seed "..seed.." carries an invalid central pair")
    assert(Pair.isAxis(case.story.centralAxis),"seed "..seed.." lost its axis")
    -- The bridge is DERIVED, never stored: a sentence in every saved case
    -- would cost real headroom (test/map_feature_budget.lua) for something the
    -- axis and the pair already determine.
    assert(case.story.central==nil,"the bridge sentence must not be written into the save")
    local expected=Pair.axisLine(case.conspiracyPair,case.story.centralAxis)
    assert(Story.centralLine(case.story,case.conspiracyPair)==expected,
        "seed "..seed.." resolves a bridge from a pair it is not running")
    assert(type(expected)=="string" and #expected>0,"seed "..seed.." has no bridge at all")
    assert(G.validate(case),"seed "..seed.." no longer rebuilds from its seed")
    pairsSeen[case.conspiracyPair.id]=true
end

-- 7. CONTENT WRITTEN FOR ONE CONSPIRACY PINS IT. The Fitness opening's feed
--    sack, spent protective equipment and farm-connected client are a farm
--    story; dropped into a cordon campaign they would read as nonsense.
local fitness=require("ConspiracyFiles/Generated/FitnessOpeningScenarios")[1]
assert(fitness.requiresPair=="farm-zero-vs-delivered-agent",
    "the fitness opening must pin the pair its prose commits to")
local onlyOne=true
for id in pairs(pairsSeen) do if id~="farm-zero-vs-delivered-agent" then onlyOne=false end end
assert(onlyOne,"a pinned scenario drew a pair its text was not written for")

print("PASS central conspiracy: "..Pair.count().." hidden pairs, seed-selected, "
    ..checked.." scenarios all bound by a checked axis")
