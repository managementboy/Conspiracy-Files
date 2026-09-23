-- A STALL DETECTOR MUST BE ABLE TO TELL TWO STATES APART.
--
-- T3Nearby.progress() returns `nil, reason`, and its own comment says why:
-- "NO JOB IS AN ANSWER, NOT A SILENCE. A caller asking why nothing is
-- happening needs to know whether the last scan finished, failed, or was
-- never started; returning nil for all three is how 'still preparing' became
-- indistinguishable from 'done and forgotten'."
--
-- Both native openings checks threw that reason away and wrote the constant
-- string "none" instead. A constant never changes, so a flat-fingerprint
-- counter reached its limit on a scan that had simply not begun.
-- fitness_world_opening.sh gave up after 120 seconds of a 2400-second budget
-- on 2026-09-23 reporting "the nearby scan stopped advancing at none", and
-- produced COULD NOT RUN for gates 3 and 4.
--
-- This is the same defect the campaign gate had in the other direction: there
-- the fingerprint contained counters that always rise, so a stall could never
-- fire; here it contained a constant, so a non-stall always fired. Both come
-- from a fingerprint that does not describe the thing being watched.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local checks={
    "tools/autotest/checks/fitness_world_opening.sh",
    "tools/autotest/checks/profession_openings.sh",
}
for _,path in ipairs(checks) do
    local sh=read(path)
    assert(sh:find("T3Nearby",1,true),path.." no longer probes the scan at all")

    -- The reason is read, and it reaches the fingerprint.
    assert(sh:find("local p,why=T.progress()",1,true),
        path..": the probe must take progress()'s second return, the reason")
    assert(sh:find('"nojob:"..tostring(why)',1,true),
        path..": the reason must reach the fingerprint, not be discarded")

    -- The constant that caused this must not come back.
    assert(not sh:find('or "none"',1,true),
        path..": a constant fingerprint cannot distinguish a stalled scan from "
        .."one that has not started")

    -- And a stall may only be declared against a LIVE job.
    assert(sh:find("scan:*)",1,true),
        path..": the stall branch must apply only to a live scan job")
end
print("PASS scan progress probe: both openings checks read the reason and stall only on a live job")
