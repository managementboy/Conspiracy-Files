-- P4-R91 made the shared week real, and the owner chose how the player meets
-- it: the relay memo turns up in the FIRST generated case of a game, and once
-- it has been found the records note - as a maybe - which papers are dated
-- inside the nine days it covers. These are outcome assertions on the
-- generator, the pages a reader turns and the rows both surfaces show.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
package.preload["ConspiracyFiles/Generated/PlaceNames"]=function()
    return {render=function(text,case) return text end}
end
ConspiracyFiles=ConspiracyFiles or {}
local G=require("ConspiracyFiles/Generated/Generator")
local Memo=require("ConspiracyFiles/Generated/RelayMemo")
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
local Content=require("ConspiracyFiles/Content")
local Rows=require("ConspiracyFiles/EvidenceRows")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local plain={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local first={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true,relayMemo=true}

local function memosIn(case)
    local found={}
    for _,d in ipairs(case.documents) do if d.kind==Memo.KIND then found[#found+1]=d end end
    return found
end
local function roles(case) return #case.documents-#memosIn(case) end

local checked=0
for seed=1,120 do
    local without=G.generate(catalog,seed,plain)
    local with=G.generate(catalog,seed,first)
    if without then
        checked=checked+1
        -- Later cases are untouched: the same seed builds the same case.
        assert(#memosIn(without)==0,"a later case must not carry the memo (seed "..seed..")")
        assert(without.relayMemo==nil,"a later case carries no memo flag")
        assert(with,"the memo must never stop a first case from generating (seed "..seed..")")
        -- The first case is the later case plus exactly one paper, last.
        local memos=memosIn(with)
        assert(#memos==1,"a first case carries exactly one memo (seed "..seed..")")
        assert(with.documents[#with.documents]==memos[1],"the memo comes after every story document")
        assert(roles(with)==#without.documents,"the memo takes no story role")
        for i,d in ipairs(without.documents) do
            assert(with.documents[i].body==d.body,"the memo changes no other document (seed "..seed..")")
        end
        -- It is not the player's own house: it waits at the second site.
        assert(memos[1].locationId==with.locations[2].id,"the memo is placed at the second site")
        assert(roles(with)<=G.MAX_EVIDENCE,"the story itself stays inside MAX_EVIDENCE")
        assert(G.validate(with),"a first case validates")
        local need=assert(G.requiredContainers(with))
        local total=0; for _,n in pairs(need) do total=total+n end
        assert(total==#with.documents,"the memo needs a container of its own")
    end
end
assert(checked>50,"too few seeds generated to prove anything: "..checked)

-- The memo's words are the approved Dead Air memo, verbatim, not a rewrite.
local case=assert(G.generate(catalog,7,first))
local memo=memosIn(case)[1]
local approved=Content.assets["dead-air:asset:access-memo-7c"].bodyText
assert(memo.body:find(approved,1,true),"the memo reproduces the approved text exactly")

-- A reader turning its pages sees the memo, and never the survivor's thinking.
local pages=table.concat(Pages.pages(memo.body),"\n")
assert(pages:find("CUMBERLAND SIGNAL SERVICES",1,true),"the pages carry the memo")
assert(not pages:find("WHAT IT MIGHT MEAN",1,true),"the pages carry no interpretation")
assert(not pages:find("WHAT YOU FOUND",1,true),"the pages carry no description of the paper")

-- Tampering is refused like any other generated text.
local forged=assert(G.restore(case)); forged.relayMemo=false
assert(not G.validate(forged),"a false memo flag is rejected")
local stripped=assert(G.restore(case)); stripped.documents[#stripped.documents]=nil
assert(not G.validate(stripped),"a first case with its memo removed is rejected")
local rewritten=assert(G.restore(case)); rewritten.documents[#rewritten.documents].body="nothing"
assert(not G.validate(rewritten),"a rewritten memo is rejected")

-- The week, inclusive at both ends and nowhere else.
assert(Memo.inWeek("June 30, 1993"),"30 June opens the week")
assert(Memo.inWeek("Filed July 5, 1993 - late"),"5 July is inside")
assert(Memo.inWeek("July 8, 1993"),"8 July closes the week")
assert(not Memo.inWeek("June 29, 1993"),"29 June is outside")
assert(not Memo.inWeek("July 9, 1993"),"9 July is outside")
assert(not Memo.inWeek("July 5, 1994"),"another year is outside")
assert(not Memo.inWeek("no date at all"),"an undated paper is outside")
-- P4-R108: cases run from May into July, and a diary heading is in capitals.
assert(Memo.inWeek("JULY 3, 1993"),"a capitalised heading inside the week is read")
assert(Memo.inWeek("JUNE 30, 1993\n'called again'"),"a capitalised 30 June is read")
assert(not Memo.inWeek("May 30, 1993"),"30 May is not 30 June")
assert(not Memo.inWeek("June 14, 1993"),"mid-June is outside")
assert(not Memo.inWeek("Drawn weekly since June 1993."),"a month with no day is not a date in the week")
assert(not Memo.inWeek("August 5, 1993"),"5 August is not 5 July")
assert(Memo.inWeek("Issued June 21, 1993\nReviewed July 2, 1993"),"any date in the week counts")

-- The note: only once the memo is found, only on dated papers, never on the
-- memo itself, and never as a statement of fact.
local function runtimeWith(known)
    return function() return {known=function() return known end} end
end
local dated={id="d1",title="Dispatch copy / R-482",body="Ref R-482\nJuly 5, 1993",kind="dispatch"}
local undated={id="d2",title="A chipped clay pot",body="on a shelf",kind="ClayPot"}
local late={id="d3",title="Receiving copy / R-482",body="July 12, 1993",kind="receipt"}
local found={id="m1",title=Memo.TITLE,body=memo.body,kind=Memo.KIND}

local before=Rows.build("evidence",runtimeWith({dated,undated}))
assert(not before[1].detailText:find("DATE NOTE",1,true),"no note before the memo is found")

local after=Rows.build("evidence",runtimeWith({dated,undated,late,found}))
local note=after[1].detailText
assert(note:find("DATE NOTE",1,true),"a paper dated in the week is noted once the memo is found: "..note)
assert(note:find("may",1,true) or note:find("coincidence",1,true),"the note is a maybe: "..note)
assert(not note:find("proves",1,true) and not note:find("because",1,true),"the note asserts nothing: "..note)
assert(not after[2].detailText:find("DATE NOTE",1,true),"an undated paper is not noted")
assert(not after[3].detailText:find("DATE NOTE",1,true),"a paper dated outside the week is not noted")
assert(not after[4].detailText:find("DATE NOTE",1,true),"the memo is not noted against itself")
assert(after[4].cfCarrier=="Office memo",after[4].cfCarrier)

print("PASS relay memo: first cases only ("..checked.." seeds), approved text verbatim, pages clean, tamper-proof, week inclusive, note hedged")
