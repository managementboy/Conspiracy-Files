-- Stages for checks/promise.sh: the generator's promise and the poller's own
-- silence (P4-R133, docs/design/CASE_PACING.md step 6).
--
-- Loaded after core_loop.lua, campaign.lua (CFCamp.promise, ladder, cases,
-- gap, moveOn) and pacing.lua (CFPace.speed, hours), whose stages this reuses:
-- everything the assertions read is already there. What is here is only what a
-- SHORT run needs that a campaign gets by playing for an hour - the two limits
-- the poller refuses on, lowered to what this world already has, so `cap` and
-- `active-limit` can be seen without first filling a save with cases.
--
-- Lowering a limit is a harness knob, not a mod change: the poller reads
-- SuccessiveCases.MAX_ACTIVE and MAX_CASES on every poll, and the branch that
-- then refuses is the shipped one, with the shipped code, counted the shipped
-- way. The check restores both before it judges anything else.
CFProm = CFProm or {}
local P = CFProm
local R = ConspiracyFiles.GeneratedRuntime
local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")

P.was = P.was or { active = Cases.MAX_ACTIVE, cases = Cases.MAX_CASES }

-- The limits as they stand, and what the save is holding against them.
function P.limits()
    local s = R.automaticStatus()
    return tostring(Cases.MAX_ACTIVE), tostring(Cases.MAX_CASES),
        tostring(s.active), tostring(s.count), tostring(s.scheduled), tostring(s.preparing)
end

-- Lower MAX_ACTIVE to the number of unfinished cases this world already has,
-- so the next poll meets the active limit. Returns what it was and what it is.
function P.squeezeActive()
    local s = R.automaticStatus()
    local n = math.max(1, tonumber(s.active) or 1)
    Cases.MAX_ACTIVE = n
    return "true", tostring(P.was.active), tostring(n), tostring(s.active)
end

-- The same for the cap: MAX_CASES down to the number of cases in the save.
function P.squeezeCap()
    local s = R.automaticStatus()
    local n = math.max(1, tonumber(s.count) or 1)
    Cases.MAX_CASES = n
    return "true", tostring(P.was.cases), tostring(n), tostring(s.count)
end

function P.restore()
    Cases.MAX_ACTIVE, Cases.MAX_CASES = P.was.active, P.was.cases
    return "true", tostring(Cases.MAX_ACTIVE), tostring(Cases.MAX_CASES)
end

-- The gap between cases, in in-game hours, as the poller reads it. Unlike
-- CFCamp.gap this sets one number and says what it set, because the gap stage
-- wants a wait long enough that the poll cannot get past it by accident.
function P.gapHours(minGap, afterCompletion)
    local c = ConspiracyFiles.AutomaticInvestigations.config
    c.minGapHours = tonumber(minGap) or 24
    c.afterCompletionHours = tonumber(afterCompletion) or 1
    return tostring(c.minGapHours), tostring(c.afterCompletionHours)
end

-- Whether the poller has spoken at all yet: `why` nil is the fault P4-R133
-- step 6 exists to remove, so a check needs to ask about it directly rather
-- than through the formatted promise line, where nil prints as the word "nil".
function P.why()
    local s = R.automaticStatus()
    return tostring(s.why ~= nil), tostring(s.why), tostring(s.deferCount),
        tostring(s.active) .. "/" .. tostring(s.activeLimit),
        tostring(s.count) .. "/" .. tostring(s.limit), tostring(s.rung)
end

return CFProm
