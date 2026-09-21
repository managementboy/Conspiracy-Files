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
assert(sh:find("NOTHING ADVANCED",1,true),
    "the stall failure must say that nothing advanced, and quote the fingerprint")
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

print("PASS campaign_harness: ceiling frozen, clues counted by id, steering by "
    .."contribution, stubs a regression, stalls judged by progress, three "
    .."outcome kinds, 8 product assertions retained")
