-- A case that ends without a clue it never had must SAY so
-- (DR-20260919-SOLVABLE-WITHDRAWN).
--
-- Session.accounted counts a DROPPED clue as accounted for, which is correct:
-- a clue with nowhere to go after three in-game days must not squat an active
-- slot for ever, and a four-clue case is still a case (P4-R133). But that made
-- "accounted for" and "found" the same answer at the one moment they differ,
-- so the completion path said "That's all of it, I think" over a case that was
-- never fully placed - the mod claiming an ending it had not delivered.
--
-- The ending is still allowed. Being silent about it is not.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local S=require("ConspiracyFiles/Generated/Session")

assert(type(S.gaps)=="function","Session exposes the clues a case ended without")

-- A case of three documents. Two found, one dropped: never placed, never found.
local function root(statuses,known)
    local docs,assign={},{}
    for id,status in pairs(statuses) do assign[id]={status=status} end
    for _,id in ipairs({"d1","d2","d3"}) do docs[#docs+1]={id=id} end
    return {case={caseId="c1",documents=docs},assignments=assign,known=known or {}}
end

-- Everything found: complete, and no gap. The original wording still applies.
local whole=root({d1="placed",d2="placed",d3="placed"},{"d1","d2","d3"})
assert(S.accounted(whole),"a case with every clue found is accounted for")
assert(#S.gaps(whole)==0,"a case that delivered everything reports no gap")

-- One clue dropped and never found: still accounted for, but now it says so.
local short=root({d1="placed",d2="placed",d3="dropped"},{"d1","d2"})
assert(S.accounted(short),"a dropped clue still lets the case complete (P4-R133)")
local gaps=S.gaps(short)
assert(#gaps==1,"the clue the case never had is reported: "..#gaps)
assert(gaps[1]=="d3","and it is the dropped one, not a found one: "..tostring(gaps[1]))

-- Two dropped, reported in the case's own document order.
local thin=root({d1="dropped",d2="placed",d3="dropped"},{"d2"})
local two=S.gaps(thin)
assert(#two==2 and two[1]=="d1" and two[2]=="d3","gaps keep the case's document order")

-- A clue that WAS found is never a gap, whatever the world did to its carrier.
-- `recognised` counts as found exactly as it does everywhere else (P4-R132).
local carried=root({d1="placed",d2="placed",d3="dropped"},{"d1","d2"})
carried.recognised={"d3"}
assert(#S.gaps(carried)==0,"a clue already in hand is not a gap even if its assignment was dropped")

-- TWO HISTORIES. A dropped clue is NOT always one that was never placed:
-- `dropMissing` drops a clue that WAS out there, on a carrier that went away
-- (P4-R134), and it nils the target, so without droppedFrom the two paths are
-- indistinguishable afterwards. A run has to be able to say which it saw.
local both=root({d1="dropped",d2="placed",d3="dropped"},{"d2"})
both.assignments.d1.droppedFrom="deferred"
both.assignments.d3.droppedFrom="carrier"
local ids,history=S.gaps(both)
assert(#ids==2,"both gaps are reported")
assert(history.d1=="deferred","a clue that never found a container: "..tostring(history.d1))
assert(history.d3=="carrier","a clue whose carrier went away: "..tostring(history.d3))

-- A save written before droppedFrom existed must not be guessed at.
local old=root({d1="placed",d2="placed",d3="dropped"},{"d1","d2"})
local _,oldHistory=S.gaps(old)
assert(oldHistory.d3=="unrecorded","an older save says so rather than inventing a history")

-- A clue still WAITING is not a gap: the case has not finished at all, and
-- accounted already refuses. A gap is only ever a clue the case gave up on.
local waiting=root({d1="placed",d2="placed",d3="deferred"},{"d1","d2"})
assert(not S.accounted(waiting),"a clue still waiting for a container blocks completion")
assert(#S.gaps(waiting)==0,"a waiting clue is not yet a gap")

-- Nothing odd on the edges.
assert(#S.gaps(nil)==0 and #S.gaps({})==0,"a missing or empty root reports no gap rather than throwing")

print("PASS case gaps: a case may finish on the clues it got, but never silently")

-- THE CLOSING LINE. Set F says the paperwork is complete; a case with a gap
-- must not use it. The voice is client-side, so this asserts the contract the
-- runtime relies on: a gap count of zero keeps the original wording, and a
-- positive count must choose different words that never claim a document was
-- lost, taken or destroyed (P4-R104).
local voice=io.open("mod/common/media/lua/client/ConspiracyFiles/PlayerVoice.lua")
assert(voice,"the voice is readable")
local src=voice:read("*a"); voice:close()
assert(src:find("SET_F_GAP",1,true),"the voice has a closing set for a case with a gap")
assert(src:find("function V.onCaseComplete(caseId,gaps)",1,true),
    "onCaseComplete is told how many clues the case ended without")
local gapSet=src:match("SET_F_GAP=%{(.-)%}")
assert(gapSet,"the gap set is readable")
for _,word in ipairs({"lost","taken","destroyed","stolen","gone"}) do
    assert(not gapSet:lower():find(word,1,true),
        "a closing line never claims a document's fate: found \""..word.."\"")
end
assert(gapSet:find("%a"),"the gap set has lines in it")
print("PASS case gaps: the closing line says the survivor missed something, never that a document was lost")
