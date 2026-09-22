-- The campaign gate's own fixture, held to the contract it is supposed to
-- express. Every assertion here exists because the fixture got it wrong and
-- the mod was blamed for it.
--
-- This is a static test on purpose. The gate itself costs about ninety minutes
-- and needs Project Zomboid; a stale expectation inside it should not need a
-- ninety-minute run to notice, and on 2026-09-21 three of them survived
-- precisely because nothing cheap could see them.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local sh=read("tools/autotest/checks/campaign.sh")
local lua=read("tools/autotest/checks/campaign.lua")

-- 1. THE RECEDING CEILING. CASE_LEFT was "$((PLAYED + n))" recomputed on every
-- iteration while PLAYED grew inside the loop, so the bound moved away as the
-- loop ran and the stage reported "only 5 of 3 clues could be played"
-- (20260921T111236). The mod had placed every clue.
assert(sh:find("local offered=%$%(%( PLAYED %+ n %)%)"),
    "the clue ceiling must be frozen in its own variable before the inner loop")
-- Counting the assignments is what catches this, because the broken version
-- ASSIGNED CASE_LEFT in more than one place. There are exactly two: the reset
-- before the outer loop, and the frozen ceiling.
local assignments=0
for line in sh:gmatch("[^\n]+") do
    if not line:match("^%s*#") then
        for _ in line:gmatch("CASE_LEFT=") do assignments=assignments+1 end
    end
end
assert(assignments==2,
    "CASE_LEFT must be assigned exactly twice - the reset and the frozen "
    .."ceiling - but it is assigned "..assignments.." times; a third "
    .."assignment is the receding bound coming back")

-- 2. AND A COUNT CANNOT NAME WHAT WENT MISSING. Freezing the ceiling fixes the
-- arithmetic but still cannot tell a harness miscount from a lost document, so
-- the assertion that matters is by document id.
assert(lua:find("function C.outstanding"),
    "campaign.lua must be able to report outstanding clues by document id")
assert(sh:find("played_all"),
    "the played-through assertion must ask which clues are outstanding by id")
assert(sh:find("CFCamp.outstanding",1,true),
    "campaign.sh must call CFCamp.outstanding rather than compare two counters")

-- 3. THE LITERAL TITLE. Answer steering guarantees a compatible authored
-- contribution; which document carries it and what it is called belongs to
-- whoever wrote the event. Demanding a title failed the mod for being rewritten.
-- The comment recording that history is welcome; an assertion enforcing it is
-- not. Look only at lines that do something.
for line in sh:gmatch("[^\n]+") do
    if not line:match("^%s*#") then
        assert(not line:find("Duty log",1,true),
            "an executable line still requires a literal document title from "
            .."answer steering: "..line)
    end
end
assert(sh:find("CFCamp.waysOf",1,true),
    "steering must be checked by the contribution offered, not by a title")

-- 4. THE ROWLESS STUB. P4-R111 once archived the oldest case into a stub with
-- no rows. The contract now retains full evidence history and
-- test/case_archive asserts stubs == 0, so in the gate a stub is a REGRESSION,
-- and the stages only reachable through one are not-applicable rather than
-- unexercised.
assert(sh:find('fail "%$%(field 2 "%$arch"%) finished case%(s%) lost their source rows'),
    "a stubbed case must be a failure in the campaign gate, not a milestone")
assert(sh:find("NOT APPLICABLE",1,true),
    "the stub stage must be reported as not applicable under the current contract")
assert(not sh:find("stubs present",1,true),
    "the reload stages must not still be named for stubs that cannot occur")

-- 5. A HANG IS A LACK OF PROGRESS, NOT A LACK OF TIME. Every bounded job in
-- the mod is paced per frame and a hidden run manages about 7 frames a second,
-- so a wall clock measures the laptop. Worse, a job wedged at step 0 with
-- ticks=0 is indistinguishable from a slow one until the clock fires - which
-- is how a scan sat at building 0 of 9,978 forever and was read as "busy".
assert(lua:find("function C.progress"),
    "campaign.lua must expose a progress fingerprint")
for _,field in ipairs({"metrics","automaticStatus","T3Nearby","assignments"}) do
    assert(lua:find(field,1,true),
        "the progress fingerprint must include "..field)
end
assert(sh:find("CFCamp.progress",1,true),
    "campaign.sh must judge a stall from progress, not from elapsed seconds")
assert(sh:find("NO WORK WAS COMPLETED",1,true),
    "the stall failure must say no work completed, and quote both fingerprints")

-- 5a. AND LIVENESS IS NOT PROGRESS. The first version of the fingerprint put
-- scheduler step counts in the string it compared. Those rise on every poll
-- whatever happens - the filler ran 70,019 -> 70,054 steps in eleven seconds
-- while deferred=2 placed=4 had not moved for eight in-game hours - so the
-- detector could never fire and was exactly as blind as the wall clock it
-- replaced. C.progress returns work FIRST and liveness SECOND, and only the
-- first is compared.
local progress=lua:match("function C%.progress%(%)(.-)\nend")
assert(progress,"C.progress must be readable")
local work=progress:match("local work = table%.concat%(%{(.-)%}")
assert(work,"C.progress must build a `work` fingerprint of its own")
for _,forbidden in ipairs({"steps","queued","liveness","ticks"}) do
    assert(not work:find(forbidden,1,true),
        "the work fingerprint must not contain "..forbidden
        ..": a counter that rises whatever happens can never be flat, so the "
        .."stall detector built on it can never fire")
end
for _,needed in ipairs({"assignments","known","status.count"}) do
    assert(work:find(needed,1,true),
        "the work fingerprint must contain "..needed)
end
assert(progress:find("local liveness",1,true),
    "liveness must be reported separately, so a wedged job can be told from an idle one")
-- The shell must read field 1 as work and field 2 as liveness, and compare
-- only the first.
assert(sh:find('now_progress="$(field 1 "$sample")"',1,true)
   and sh:find('now_liveness="$(field 2 "$sample")"',1,true),
    "campaign.sh must take work from field 1 and liveness from field 2")
assert(sh:find('"$now_progress" = "$last_progress"',1,true),
    "the flat-run comparison must be on the work fingerprint")
assert(not sh:find('"$now_liveness" = "$last_liveness"',1,true),
    "liveness must never be compared")

-- 5b. AND A SITE THAT CANNOT SUPPLY MUST NOT BE ASKED FOREVER. Returning to
-- the waiting clue's own site on every move cannot help when that site's
-- eligible containers are used up; it answers no-containers every time
-- (20260921T133647). The design's answers are a different neighbourhood, a
-- carrier, or expiry.
assert(sh:find('if [ "$moves" -le 3 ]',1,true),
    "the harness must stop returning to a site that keeps answering no-containers")

-- 5c. AND IT MUST ARRIVE INDOORS, OR REFUSE. moveOn teleported to the centre of
-- the building's BOUNDING BOX while its comment said "the middle of a
-- building". For an L-shaped building or a box spanning a garden that point is
-- in the open, and the survivor was measured standing in the street twice
-- (10855,10101 and 10618,9985) with getRoom() nil - with nothing checking.
-- docs/TESTING.md records why it matters: "a house catalogued from the street
-- yields one or two candidates and eight once the survivor walks in".
assert(lua:find("function C.indoors"),
    "campaign.lua must be able to say which room the survivor is standing in")
local moveOn=lua:match("function C%.moveOn%(minTiles%)(.-)\n-- Which room")
assert(moveOn,"C.moveOn must be readable")
assert(moveOn:find("C.indoors()",1,true),
    "moveOn must check that it actually arrived indoors")
assert(moveOn:find("getRooms",1,true),
    "moveOn must fall back to the building's own room list when the box centre misses")
assert(moveOn:find('return "false", "could not get inside',1,true),
    "moveOn must refuse rather than measure placement from the street")
assert(sh:find("survivor in $(ev 'return CFCamp.indoors()')",1,true),
    "every placement finding must record where the survivor was standing")

-- 5d. A FAILURE MESSAGE MUST NOT ASSUME THE EXPECTATION IT IS TESTING.
-- "case 1's answers lost their used mark" was printed while the answers were
-- plainly marked used by case 3; that reads as a second defect and is not one.
assert(sh:find("are marked used by ${used_by#generated:}",1,true),
    "the used-mark failure must name the case that actually used the answers")
assert(sh:find("lost their used mark entirely",1,true),
    "an genuinely empty used mark must still be reported as such")
-- The clock may still stop a run, but what it produces is a stage that ran out
-- of time, never an accusation against the mod.
local clockFail=sh:match("if %[ \"%$%(date %+%%s%)\" %-ge \"%$deadline\" %]; then\n(.-)\n")
assert(clockFail and clockFail:find("unexercised"),
    "the wall-clock boundary must report NOT EXERCISED, never fail the product")

-- 6. THREE KINDS OF BAD NEWS. A harness defect reported as a product failure
-- is how this report went wrong twice in one day.
for _,kind in ipairs({"fails","harnesses","unexercised"}) do
    assert(sh:find(kind.."=%(%)"), "campaign.sh must keep a separate "..kind.." list")
end
-- THE WHOLE RUN IS ONE FUNCTION. bash reads a script from disk incrementally,
-- so editing this file mid-run shifts the byte offset under the running shell
-- and kills it on a syntax error in text it never meant to execute. That cost
-- a ninety-minute run twice, on 2026-09-21 and 2026-09-22. A function body is
-- parsed in full when bash reads the definition, so the file on disk stops
-- mattering once it is defined.
assert(sh:find("cf_main() {",1,true) and sh:find('cf_main "$@"',1,true),
    "the run must be wrapped in one function, so that editing this file while "
    .."it runs cannot kill the run")
assert(sh:find('verdict="COULD NOT RUN"',1,true),
    "a harness failure must produce COULD NOT RUN, not FAIL")

-- 7. THE ASSERTIONS THAT MUST SURVIVE. Nothing above may be bought by dropping
-- one of these; each is a current product requirement.
local required={
    ["real case progression"]='next_case "case 3"',
    ["compatible steering"]="CFCamp.steerOf",
    ["answers consumed and locked"]="tryChange",
    ["essential-source completion"]="wait_finished",
    ["full retained history"]="CFCamp.archive",
    ["save and reload integrity"]="CFReload.record",
    ["evidence stays Old"]="CFCamp.oldEvidence",
    ["the save stays in budget"]="over the 500 kB budget",
}
for name,needle in pairs(required) do
    assert(sh:find(needle,1,true),
        "the campaign gate must still assert "..name.." ("..needle..")")
end

-- 8. AN OWNER-SANCTIONED STATE IS NOT A PILE OF PRODUCT FAILURES.
-- An interrupted placement parks a clue at `unknown` and the mod deliberately
-- never replaces it. The owner decided on 2026-09-22 that the case stays OPEN
-- rather than completing with a gap, so it genuinely cannot finish - and the
-- 2026-09-21 run turned that single condition into 27 product failures by
-- grinding through every stage that needed a finished case 1.
assert(sh:find("WEDGED=1",1,true),
    "the gate must notice a clue parked at `unknown`")
assert(sh:find('[ "$WEDGED" = 1 ]; then',1,true),
    "the gate must stop when case 1 cannot finish, rather than failing every "
    .."stage behind it")
assert(sh:find("COULD NOT RUN",1,true),
    "a world where case 1 cannot finish is a run that could not happen, not a "
    .."product failure")
-- And it must be reported as unexercised, never as a failure.
local wedge=sh:match("if grep %-q \"unknown\".-\n%s*fi")
assert(wedge and wedge:find("unexercised",1,true) and not wedge:find("fail ",1,true),
    "a wedged clue must be reported NOT EXERCISED, not FAIL")

-- 9. BOTH CONTINUITY MECHANISMS, NOT JUST THE SUPERSEDED ONE.
-- DR-20260919-CONTINUITY: "continuity carries discovered evidence, not
-- selected opinions... The three closing questions are NOT restored as the
-- steering mechanism." A case built from a finding carries `follows`; the
-- answers wait for the case after. The gate demanded a STEER on case 2 and
-- failed correct behaviour twice - on 2026-09-22 the game logged "next case
-- follows the finding recorded in generated:1247366911:case" for the very
-- case the gate called unsteered.
assert(lua:find("function C.continuityOf"),
    "the gate must be able to report WHICH continuity a case carries")
assert(sh:find("CFCamp.continuityOf",1,true),
    "the gate must ask which mechanism ran, not assume the steer")
for _,needle in ipairs({'case "$kind2" in','follows|steer)'}) do
    assert(sh:find(needle,1,true),
        "case 2 must be allowed to continue from case 1 by EITHER mechanism ("..needle..")")
end
assert(sh:find('[ "$kind3" = steer ] || fail',1,true),
    "when case 2 follows a finding, the deferred answers must reach case 3 - "
    .."and that must be asserted, not merely tolerated")
-- The superseded unconditional demand must not come back.
for line in sh:gmatch("[^\n]+") do
    if not line:match("^%s*#") and line:find("case 3 should be unsteered",1,true) then
        error("the unconditional 'case 3 should be unsteered' demand is back: "..line)
    end
end

-- 10. THE STALL MUST NOT PRE-EMPT THE ESCAPE. The survivor returns to the
-- waiting clue's own site for three moves; only from the fourth does the cap
-- send them somewhere fresh, which is the design's remedy for a clue with
-- nowhere to go. A stall threshold of four fired at exactly that handover, so
-- the remedy was never exercised once (2026-09-22).
local siteCap=tonumber(sh:match('%[ "%$moves" %-le (%d+) %]'))
local stallAt=tonumber(sh:match('%[ "%$flat" %-ge (%d+) %]'))
assert(siteCap and stallAt,"both bounds must be readable")
assert(stallAt>siteCap+1,
    "the stall fires at "..stallAt.." flat moves while the survivor only starts "
    .."moving on after "..siteCap..": the fresh-neighbourhood remedy gets "
    ..math.max(0,stallAt-siteCap-1).." move(s) before the stage is failed, which "
    .."is not enough to exercise it")

-- 11. THE STEP-BACK MUST PREFER INDOORS. goToWaitingSite steps the survivor
-- beyond StaleClue's proximity guard so a clue CAN be placed at the site they
-- just loaded - but it took the first free square at guard distance in the
-- first direction that worked, and free squares 25 tiles out are
-- overwhelmingly street. The owner watched the survivor standing at
-- 10890,10167 in the open while the filler answered `no-containers` for the
-- site at 10865,10167, and said so twice before it was fixed.
--
-- docs/TESTING.md records why it matters in the design's own sentence: "a
-- house catalogued from the street yields one or two candidates and eight
-- once the survivor walks in".
local step=lua:match("function C%.goToWaitingSite.-\nend")
assert(step,"goToWaitingSite must be readable")
assert(step:find("indoorsOnly",1,true),
    "the step-back must try indoor squares before settling for the street")
assert(step:find("ipairs({ true, false })",1,true),
    "the step-back must make TWO passes - indoors first, then any free square "
    .."- so a site ringed by open ground still steps back rather than standing "
    .."on top of the proximity guard")
assert(step:find("getRoom",1,true),
    "indoors is decided by asking the square for its room")
assert(step:find("backRoom",1,true),
    "the finding must record WHERE the survivor ended up; standing in the "
    .."street was invisible in the evidence for two whole runs")

print("PASS campaign_harness: ceiling frozen, clues counted by id, steering by "
    .."contribution, stubs a regression, stalls judged by progress, three "
    .."outcome kinds, 8 product assertions retained")
