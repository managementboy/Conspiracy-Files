-- A COMPARISON MUST DESCRIBE THE EVIDENCE THE CASE ACTUALLY CONTAINS.
--
-- 2026-09-23: ten scenarios had their middle record converted from a document
-- to a physical object, and every rule test passed immediately - object
-- eligibility, the marking convention, the case-reference ban, the body cap,
-- the date rule, the page rule. All green. And the cases were incoherent,
-- because the comparison texts still said:
--
--   "The job record has them beside the broken truck all day"
--   "The counter book has {P1} alone, moving a sign to the other end"
--   "The retained instruction has {P2} away that day"
--   "The desk card has {P1} on nights"
--
-- None of those documents existed any more. Nothing in the suite could tell,
-- because no test related a comparison's WORDS to the evidence it compares.
-- They were found by reading the file, which is not a test.
--
-- This is narrow on purpose. It does not judge prose. It checks one thing: a
-- comparison that leans on an anchor must not describe that anchor as a
-- document when the anchor is a thing. Nothing is written on a bench saw, so
-- a comparison cannot quote one.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Story=require("ConspiracyFiles/Generated/Story")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local Premises=require("ConspiracyFiles/Generated/Premises")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")

-- THE CHECK IS POSITIVE, NOT A BANNED-WORD LIST.
--
-- The first version of this test banned paper nouns in any comparison that
-- touched an object, and immediately produced false positives: a comparison
-- may rest on a paper claim AND an object response, and naming the routing
-- sheet or the stock book is then entirely correct. Banning words cannot tell
-- a legitimate mention of paper from a stale one.
--
-- So it asks the opposite question, which has an exact answer: if a comparison
-- rests on an object anchor, does it mention that object at all? A comparison
-- that relates a thing to a record while describing only records is the defect
-- - that is precisely what "the job record has them beside the broken truck"
-- was, after the job record became a wrench.
local STOP={marked=true,the=true,a=true,an=true,of=true,and_=true,with=true}
local function distinctive(title)
    local words={}
    for word in title:gmatch("%a+") do
        local w=word:lower()
        -- ">2" so "key" and "pen" count. They are exactly the words a
        -- comparison uses for those objects.
        if #w>2 and not STOP[w] and w~="p1" and w~="p2" and w~="code" then words[#words+1]=w end
    end
    return words
end

local function get(id,v) return Personal.get(id,v) or Ordinary.get(id,v) end

local checked,objectAnchors,flagged=0,0,{}
for _,id in ipairs(Premises.list()) do
    for variant=1,12 do
        local s=get(id,variant)
        if s then
            checked=checked+1
            local objects={}
            for key,anchor in pairs(s.anchors or {}) do
                local carrier=Kinds.get(anchor.kind)
                if carrier and carrier.capacity=="object" then
                    -- Title AND observation: a comparison may name the thing
                    -- with a word the object's own record uses rather than the
                    -- one in its title - "the sealed gate" for a plant padlock
                    -- whose observation says "the gate padlock, shut". That is
                    -- describing the object, not ignoring it.
                    objects[key]=distinctive((anchor.title or "").." "..(anchor.observation or ""))
                    objectAnchors=objectAnchors+1
                end
            end
            for _,c in ipairs(s.comparisons or {}) do
                local text=(c.text or ""):lower()
                -- ONLY `from` AND `to`. `requires` is a gate - which findings
                -- the player must hold before this line can appear - not a
                -- claim that the line describes each of them. The fitness
                -- opening's vehicle comparison legitimately requires the feed
                -- sack and the protective hoard while speaking only about the
                -- vehicle it relates.
                local touches={}
                if c.from then touches[c.from]=true end
                if c.to then touches[c.to]=true end
                for key in pairs(touches) do
                    local words=objects[key]
                    if words and #words>0 then
                        local mentioned=false
                        for _,w in ipairs(words) do
                            if text:find(w,1,true) then mentioned=true break end
                        end
                        if not mentioned then
                            flagged[#flagged+1]=id.." v"..variant..": a comparison rests on the "
                                .."object '"..tostring(s.anchors[key].title).."' and never mentions it: "
                                ..tostring(c.text)
                        end
                    end
                end
            end
            assert(Story.validate(s))
        end
    end
end

if #flagged>0 then
    for _,line in ipairs(flagged) do print("  "..line) end
    error(#flagged.." comparison(s) rest on an object they never describe")
end
assert(objectAnchors>0,"no object anchors found at all; this test would pass vacuously")
assert(checked>=40,"only "..checked.." scenarios reachable; the sweep is not covering the pool")

print(string.format("PASS comparison describes evidence: %d scenarios, %d object anchors, "
    .."no comparison quotes a page that is not there",checked,objectAnchors))
