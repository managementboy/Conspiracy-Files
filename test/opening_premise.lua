-- THE PERSONAL OPENING: "No contact at premises" (DR-20260919-BUILD-PAIR).
--
-- Phase B, first increment. The premise exists, is asked for by name rather
-- than drawn, carries the survivor's own name, and rebuilds identically from
-- its own record - which is the property that decides whether the case survives
-- a reload at all.
--
-- What this holds to account:
--   * the opening is NEVER drawn at random, so no existing seed's story changes;
--   * it refuses to generate without the survivor's name, because the slip is
--     the case's only personal anchor and the one link with no alternative
--     (OPENING_PAIR_COMPLETION.md, link A);
--   * {SELF} actually renders - map.SELF alone did nothing, because fill walks
--     an explicit FIELDS list and the placeholder stayed literal in the slip;
--   * the case records its own opening, so G.validate's rebuild matches. Without
--     that the rebuild draws a premise from the seed, validation fails, and the
--     opening is refused on every reload - a save-breaking bug;
--   * the text asserts nothing it cannot: no visitor, no employer, no relative,
--     and no proven visit (DR-20260919-VISITOR-SEPARATE,
--     DR-20260919-OPENING-PAYOFF).
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Premises=require("ConspiracyFiles/Generated/Premises")

local OPTS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function openingOpts(name)
    return {mapId=OPTS.mapId,buildLine=OPTS.buildLine,allowSynthetic=true,opening=true,self=name}
end

-- ---------------------------------------------------------------------------
-- 1. It exists, and it is never drawn by chance ---------------------------
-- ---------------------------------------------------------------------------
local opening=assert(Premises.opening(),"there is an opening premise")
assert(opening.id=="no-contact-at-premises","and it is the approved one: "..opening.id)
assert(opening.opening==true,"flagged as an opening")
assert(Premises.get(opening.id),"and reachable by id like any other premise")

-- The ordinary pool stays at twenty. If an opening ever leaked into it, a new
-- save's second case could open with the survivor's own name in it.
assert(Premises.choosableCount()==20,
    "an ordinary case draws from twenty premises: got "..Premises.choosableCount())
-- Twenty-two: twenty ordinary, the opening, and the connected follow-up. What
-- matters is that the ORDINARY pool stayed at twenty, asserted above.
assert(Premises.count()==22,"and twenty-two exist in total: got "..Premises.count())

-- EVERY INDEX of the ordinary pool, not a sample. `choose` takes the caller's
-- seeded PRNG, so a stub returning each index in turn walks the whole pool -
-- which is stronger than a thousand random draws and needs no generator.
-- (An earlier version looped on G.rng, which is not exported, so the loop never
-- ran and the assertion was vacuous. Its own "the draw was exercised" guard
-- caught that.)
local drawn={}
for index=1,Premises.choosableCount() do
    local p=assert(Premises.choose(function() return index end),"index "..index.." draws a premise")
    assert(not p.opening,"no opening premise is ever drawn: index "..index.." gave "..p.id)
    assert(not p.followUp,"no follow-up premise is ever drawn either: index "..index.." gave "..p.id)
    assert(p.id~="no-contact-at-premises","the opening was drawn at index "..index)
    assert(not drawn[p.id],"each index draws a distinct premise: "..p.id.." twice")
    drawn[p.id]=true
end
local n=0
for _ in pairs(drawn) do n=n+1 end
assert(n==20,"all twenty ordinary premises are reachable by index: got "..n)
print("PASS opening premise: it exists, and an ordinary case can never draw it")

-- ---------------------------------------------------------------------------
-- 2. It refuses to generate without the survivor's name -------------------
-- ---------------------------------------------------------------------------
local case,why=G.generate(catalog(),101,
    {mapId=OPTS.mapId,buildLine=OPTS.buildLine,allowSynthetic=true,opening=true})
assert(case==nil,"the opening refuses to generate with no name")
assert(tostring(why):find("name",1,true),"and says why: "..tostring(why))
-- A blank or absurd name is refused too: this goes on a document.
assert(G.generate(catalog(),101,openingOpts(""))==nil,"an empty name is refused")
assert(G.generate(catalog(),101,openingOpts(string.rep("x",61)))==nil,"an absurd name is refused")
print("PASS opening premise: no survivor name, no opening - the slip is the only personal anchor")

-- ---------------------------------------------------------------------------
-- 3. It generates, renders the name, and rebuilds identically -------------
-- ---------------------------------------------------------------------------
local NAME="Ada Whitlock"
local built
for seed=101,180 do
    built=G.generate(catalog(),seed,openingOpts(NAME))
    if built then break end
end
assert(built,"the opening generates on some seed near 101")
assert(built.facts.premise=="no-contact-at-premises","and it is the opening: "..tostring(built.facts.premise))

-- The name reaches a document, and no placeholder is left showing.
local slip
for _,d in ipairs(built.documents) do
    if d.body:find(NAME,1,true) then slip=d end
    assert(not d.body:find("{SELF}",1,true),"no document leaves {SELF} literal: "..d.title)
    assert(not d.title:find("{SELF}",1,true),"nor any title")
end
assert(slip,"the survivor's own name appears on a document")
assert(slip.title:lower():find("collection slip",1,true),
    "and it is the retained slip - link A: "..slip.title)

-- THE PROPERTY THAT MATTERS MOST. G.validate rebuilds the case from its own
-- record and compares. The opening must be recorded on the case or the rebuild
-- draws a premise from the seed and the case is refused on every reload.
assert(built.opening,"the case records that it is an opening")
assert(built.opening.premise==true and built.opening.self==NAME,"with the name it was built from")
assert(G.validate(built),"and it rebuilds identically from its own record")

-- Strip the record and validation must FAIL - that is the bug this guards.
local stripped=G.generate(catalog(),101,openingOpts(NAME))
for seed=101,180 do stripped=G.generate(catalog(),seed,openingOpts(NAME)); if stripped then break end end
stripped.opening=nil
assert(not G.validate(stripped),
    "without its recorded opening the rebuild cannot match - if this passes, the case would be refused on reload")
-- And a corrupted record is refused rather than rebuilt from a guess.
local bad
for seed=101,180 do bad=G.generate(catalog(),seed,openingOpts(NAME)); if bad then break end end
bad.opening={premise=true,self=""}
assert(not G.validate(bad),"an empty recorded name is refused")
print("PASS opening premise: the name renders, and the case rebuilds from its own record")

-- ---------------------------------------------------------------------------
-- 4. An ordinary case is completely untouched -----------------------------
-- ---------------------------------------------------------------------------
-- The premise is the seed's most significant choice. If adding the opening
-- moved any index, every case ever generated would tell a different story.
local ordinary=assert(G.generate(catalog(),101,OPTS),"an ordinary case still generates")
assert(ordinary.facts.premise~="no-contact-at-premises","and never draws the opening")
assert(ordinary.opening==nil,"and records no opening")
assert(G.validate(ordinary),"and validates")
for _,d in ipairs(ordinary.documents) do
    assert(not d.body:find("{SELF}",1,true),"an ordinary document never mentions {SELF}")
end
print("PASS opening premise: an ordinary case draws, renders and validates exactly as before")

-- ---------------------------------------------------------------------------
-- 5. The text claims nothing it cannot support ----------------------------
-- ---------------------------------------------------------------------------
-- The register REPORTS a visit. It does not witness one, name a visitor, or
-- invent a life for the survivor.
local whole={}
for _,d in ipairs(built.documents) do whole[#whole+1]=d.body end
local text=table.concat(whole," "):lower()
for _,forbidden in ipairs({"employer","employed by","my wife","my husband","my brother",
                           "my sister","my mother","my father","called at the door",
                           "attended in person","the officer who called","i saw him",
                           "i saw her","witness"}) do
    assert(not text:find(forbidden,1,true),
        "the opening invents nothing: found \""..forbidden.."\"")
end
-- Both readings exist and neither is chosen.
assert(#opening.readings==2,"two honest readings")
assert(opening.readings[1]~=opening.readings[2],"and they differ")
-- The register's disputing line is a REPORT, and its meaning says so.
assert(opening.response.dispute:lower():find("no contact at premises",1,true),
    "the record's own words are the case's name")
assert(opening.response.meaning:lower():find("what the record says",1,true)
    or opening.response.meaning:lower():find("not itself proof",1,true),
    "and its meaning separates what the record says from what happened")
-- The round sheet corroborates a round, never the visit - it must not read as
-- an alternative to the register (OPENING_PAIR_COMPLETION.md link C).
assert(opening.review.meaning:lower():find("cannot stand in",1,true)
    or opening.review.meaning:lower():find("does not say this address",1,true),
    "the round sheet is corroboration, never a route to link C")
print("PASS opening premise: it reports, and never witnesses")

-- ---------------------------------------------------------------------------
-- 6. Both readings occur through the opening's OWN path -------------------
-- ---------------------------------------------------------------------------
-- test/premises.lua asserts the opening is unreachable from ordinary seeds.
-- That is only half an answer: something has to prove it IS reachable the way
-- it is meant to be, and that it still reads both ways - the design rule every
-- premise obeys (P4-R113, P4-R122).
local outlines,docs,made={},0,0
for seed=101,260 do
    local c=G.generate(catalog(),seed,openingOpts("Ada Whitlock"))
    if c then
        made=made+1
        outlines[c.outline or "?"]=true
        for _,d in ipairs(c.documents) do
            docs=docs+1
            assert(not d.body:find("{",1,true) or not d.body:find("}",1,true)
                   or not d.body:match("{%u[%u%d]*}"),
                "unsubstituted placeholder in a body: "..d.title)
            assert(not d.title:match("{%u[%u%d]*}"),"unsubstituted placeholder in a title: "..d.title)
        end
    end
end
assert(made>=8,"the opening generates across many seeds: "..made)
assert(outlines["corroboration"],"the opening corroborates on some seeds")
assert(outlines["conflicting-account"],"and conflicts on others - it is never one-sided")
print(string.format(
    "PASS opening premise: reachable by name on %d seeds, both readings occur, %d documents carry no placeholder",
    made,docs))

-- ---------------------------------------------------------------------------
-- 7. THE PATH THE FIRST CASE ACTUALLY TAKES -------------------------------
-- ---------------------------------------------------------------------------
-- The runtime's first case goes through firstCase -> G.generateSelected, NOT
-- G.generate. generateSelected forwarded the opening to build but its own
-- option whitelist rejected the keys, so the premise was built, tested and
-- unreachable in play: "unknown generator option". Both entry points must
-- accept and validate the opening identically.
local cat=catalog()
local sites={}
for _,site in ipairs(cat.locations) do sites[#sites+1]=site.id end
assert(#sites>=2,"the fixture has two sites to select")

local sel,selWhy=G.generateSelected(cat,101,openingOpts(NAME),{sites[1],sites[2]})
assert(sel,"generateSelected accepts the opening: "..tostring(selWhy))
assert(sel.facts.premise=="no-contact-at-premises","and builds the opening premise")
assert(sel.opening and sel.opening.self==NAME,"and records it on the case")
assert(G.validate(sel),"and it rebuilds from its own record")
local selSlip=false
for _,d in ipairs(sel.documents) do
    if d.body:find(NAME,1,true) then selSlip=true end
    assert(not d.body:find("{SELF}",1,true),"no placeholder survives this path either")
end
assert(selSlip,"the survivor's name reaches a document on this path too")

-- And it refuses on the same terms, so the two entry points cannot drift.
local noName=G.generateSelected(cat,101,
    {mapId=OPTS.mapId,buildLine=OPTS.buildLine,allowSynthetic=true,opening=true},{sites[1],sites[2]})
assert(noName==nil,"generateSelected refuses an opening with no name")
assert(G.generateSelected(cat,101,openingOpts(""),{sites[1],sites[2]})==nil,"and an empty one")

-- An ordinary selected case is unchanged.
local ordSel=assert(G.generateSelected(cat,101,OPTS,{sites[1],sites[2]}),"an ordinary selected case still builds")
assert(ordSel.facts.premise~="no-contact-at-premises" and ordSel.opening==nil,
    "and is neither the opening nor marked as one")
print("PASS opening premise: both entry points accept, validate and record the opening identically")
