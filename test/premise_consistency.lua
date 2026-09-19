-- Every premise tells a true story on every calendar, both ways.
--
-- Owner, 2026-09-15 (P4-R107): fix all story defects and add a consistency
-- test. The audit found the same few mistakes twenty times over: "differ by
-- eight months" for November to March; "Dated after the letter" on a payslip
-- dated before it on every seed; a meaning saying "One of them is wrong" beside
-- a line saying the records matched; "eight days later" landing after the
-- review that read both; two "Payment slip" documents in one case; the same person
-- at both sites on one day. None of it was caught because nothing checked what
-- the words claimed against the dates and the branch they were printed in.
--
-- And P4-R108: case dates are spread from May into July, so a document inside the
-- relay memo's week (30 June - 8 July 1993) is a signal rather than true of
-- every document. The rate is asserted here as a band.
--
-- Two passes:
--   1. every premise x outline x a spread of calendars (seeded and the edge
--      cases), rendered through Generator.renderAnchor - the assembly build()
--      itself uses - with the placeholders Generator.dateFields supplies;
--   2. real cases from Generator.generate: 400 seeds for the week rate, and
--      as many more as it takes for every premise x outline x review
--      present/absent to occur.
-- A new premise must pass this before it is added (docs/design/PREMISES.md).
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local Premises = require("ConspiracyFiles/Generated/Premises")
local Memo = require("ConspiracyFiles/Generated/RelayMemo")
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local opts = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }

local problems, problemCount = {}, 0
local function problem(msg)
    problemCount = problemCount + 1
    if #problems < 30 then problems[#problems + 1] = msg end
end

-- Dates -----------------------------------------------------------------------
local MONTH = { january = 1, february = 2, march = 3, april = 4, may = 5, june = 6, july = 7,
    august = 8, september = 9, october = 10, november = 11, december = 12 }
local BEFORE = { 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334 }
local LENGTH = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
local APRIL_30, MAY_1, JUNE_28, JULY_8 = 120, 121, 179, 189

-- Every "Month D, YYYY" in a text, as day-of-year ordinals (1993 only).
local function datesIn(text, where)
    local out = {}
    for m, d, y in string.lower(text):gmatch("(%a+) (%d+), (%d%d%d%d)") do
        local month, day = MONTH[m], tonumber(d)
        if month then
            if y ~= "1993" or day < 1 or day > LENGTH[month] then
                problem(where .. ": impossible or out-of-year date '" .. m .. " " .. d .. ", " .. y .. "'")
            else
                local ordinal = BEFORE[month] + day
                -- Nothing is dated after 8 July: the outbreak begins after.
                -- The day before a 1 May claim is the earliest date there is.
                if ordinal < APRIL_30 or ordinal > JULY_8 then
                    problem(where .. ": date outside 30 April - 8 July 1993: " .. m .. " " .. d)
                end
                out[#out + 1] = ordinal
            end
        end
    end
    return out
end
local function range(list)
    local lo, hi
    for _, v in ipairs(list) do
        if not lo or v < lo then lo = v end
        if not hi or v > hi then hi = v end
    end
    return lo, hi
end
-- A month reference as a count of months: "November 1992" or "June 14, 1993".
local function monthIndex(text)
    local lower = string.lower(text)
    local m, y = lower:match("(%a+) %d+, (%d%d%d%d)")
    if not m then m, y = lower:match("(%a+) (%d%d%d%d)") end
    assert(m and MONTH[m], "not a month reference: " .. text)
    return tonumber(y) * 12 + MONTH[m]
end
local function render(text, map)
    for key, value in pairs(map) do
        local token, at, out = "{" .. key .. "}", 1, ""
        while true do
            local s, e = string.find(text, token, at, true)
            if not s then break end
            out = out .. string.sub(text, at, s - 1) .. value
            at = e + 1
        end
        text = out .. string.sub(text, at)
    end
    return text
end

-- Relative phrases --------------------------------------------------------------
local NUMBER = { one = 1, two = 2, three = 3, four = 4, five = 5, six = 6, seven = 7, eight = 8,
    nine = 9, ten = 10, eleven = 11, twelve = 12, thirteen = 13, fourteen = 14, fifteen = 15, sixteen = 16 }
-- Phrases that claim a span no case calendar can support: gaps are one to nine
-- days ("for weeks", "each week" were the file-signed-out defect). "Every
-- week" is not here: "clerks do this every week" is a habit, not a span.
local VAGUE = { "for weeks", "each week", "for months" }

-- What a premise's `asserts` allow, on this calendar.
local function allowed(premise, map)
    local a = premise.asserts or {}
    local days, months
    if a.days then
        days = {}
        for _, pair in ipairs(a.days) do
            local x = datesIn(render(pair[1], map), premise.id .. " asserts")[1]
            local y = datesIn(render(pair[2], map), premise.id .. " asserts")[1]
            assert(x and y, premise.id .. ": asserts.days must name two dates")
            days[#days + 1] = math.abs(y - x)
        end
    end
    if a.months then
        months = monthIndex(render(a.months[2], map)) - monthIndex(render(a.months[1], map))
    end
    return days, months
end

-- Every "N days later", "for N days", "the day before", "N months" in a text
-- must equal what the premise asserts it is relative to.
local function checkRelations(text, days, months, where)
    local t = string.lower(text)
    local function day(n, phrase)
        if not days then
            problem(where .. ": '" .. phrase .. "' but the premise asserts no days to check it against")
            return
        end
        for _, gap in ipairs(days) do if gap == n then return end end
        problem(where .. ": '" .. phrase .. "' matches no asserted gap (" .. table.concat(days, ",") .. ")")
    end
    for rel in t:gmatch("the day (%a+)") do
        if rel == "before" or rel == "after" then day(1, "the day " .. rel) end
    end
    for w, rel in t:gmatch("(%a+) days? (%a+)") do
        if NUMBER[w] and (rel == "before" or rel == "after" or rel == "later") then day(NUMBER[w], w .. " days " .. rel) end
    end
    for w in t:gmatch("for (%a+) days?") do
        if NUMBER[w] then day(NUMBER[w], "for " .. w .. " days") end
    end
    for w in t:gmatch("(%a+) weeks?") do
        if NUMBER[w] then problem(where .. ": '" .. w .. " weeks' cannot be checked against a calendar") end
    end
    for w in t:gmatch("(%a+) months?") do
        if NUMBER[w] then
            if not months then
                problem(where .. ": '" .. w .. " months' but the premise asserts no months to count")
            elseif NUMBER[w] ~= months then
                problem(where .. ": '" .. w .. " months' but the asserted span is " .. months)
            end
        end
    end
    for _, phrase in ipairs(VAGUE) do
        if t:find(phrase, 1, true) then problem(where .. ": '" .. phrase .. "' is longer than any case lasts") end
    end
end

-- Branch markers ------------------------------------------------------------------
-- Words that only make sense where two records DISAGREE, so they must never be
-- in a WHAT IT MIGHT MEAN read in a corroborating case. Most are the exact
-- phrasings the 2026-09-15 audit found beside a line saying the records
-- matched (P4-R107), kept so they cannot come back. Add to this list; never
-- trim it to let a premise through.
local DISAGREE = { "disagree", "one of them is wrong", "two places", "does not match", "do not match",
    "backdated", "contradicts", "conflict", "do not agree", "does not agree", "not reconcile",
    "matching removals", "the difference is", "both entries", "out of order", "cannot be produced",
    "does not exist", "explains this completely", "larger than the scales", "dismantled",
    "removed the marks", "template reused", "an empty page", "nobody stopped", "the underlining",
    "access not obtained", "another drawer", "another vehicle", "not carried on the list",
    "cannot be found", "somebody noticed" }
-- And words that only make sense where they AGREE, never in a disputing case.
local AGREE = { "matches", "consistent with", "as it should", "reconciles", "line up", "same door",
    "follows the letter", "payment following", "a few lines apart", "pencil addition",
    "account for the same hours", "second set of keys", "within their known tolerance",
    "inside the certificate", "back on the road", "condition it went out in", "never compared",
    "reprint noted", "withdrawn from use", "never set beside", "signed in and out", "past tense",
    "returned and destroyed", "earlier attendance", "back on the shelf", "surviving duplicate",
    "rewritten from a duplicate", "count come out", "unnamed agency", "department added",
    "redirected on request", "confirmed at both ends", "calls the change a transfer" }

local function meaningOf(body)
    local at = string.find(body, "WHAT IT MIGHT MEAN\n", 1, true)
    return at and string.lower(string.sub(body, at)) or nil
end
local function checkMarkers(body, agreeing, where)
    local meaning = meaningOf(body)
    if not meaning then return end
    for _, marker in ipairs(agreeing and DISAGREE or AGREE) do
        if meaning:find(marker, 1, true) then
            problem(where .. ": WHAT IT MIGHT MEAN says '" .. marker .. "' in a "
                .. (agreeing and "corroborating" or "disputing") .. " case")
        end
    end
end

-- Pass 1: every premise, both ways, across calendars ------------------------------
local function lcg(seed)
    return function(n) seed = (seed * 48271) % 2147483647; return seed % n + 1 end
end
local calendars = {
    -- The edges: the earliest claim, the latest calm case, the tightest and
    -- the latest cases that reach the memo's week.
    { claimDate = MAY_1, responseDate = MAY_1 + 1, reviewDate = MAY_1 + 2 },
    { claimDate = 178, responseDate = 179, reviewDate = 180 },
    { claimDate = JUNE_28, responseDate = 188, reviewDate = JULY_8 },
    { claimDate = 172, responseDate = 181, reviewDate = 182 },
    { claimDate = 150, responseDate = 151, reviewDate = 160 },
}
for s = 1, 300 do calendars[#calendars + 1] = G.calendar(lcg(s * 7919 + 1)) end

local renders = 0
for _, cal in ipairs(calendars) do
    assert(cal.claimDate >= MAY_1 and cal.claimDate <= JUNE_28, "claim outside 1 May - 28 June: " .. cal.claimDate)
    assert(cal.claimDate < cal.responseDate and cal.responseDate < cal.reviewDate, "calendar out of order")
    assert(cal.responseDate - cal.claimDate <= 9 and cal.reviewDate - cal.responseDate <= 9, "a gap over nine days")
    assert(cal.reviewDate <= JULY_8, "review after 8 July")
    local base = G.dateFields(cal)
    for _, id in ipairs(Premises.list()) do
        local premise = Premises.get(id)
        local map = {}
        for k, v in pairs(base) do map[k] = v end
        map.CODE, map.P1, map.P2 = "R-123", "Marion Ellis", "Roy Hale"
        map.A, map.B = "Synthetic storage site 1", "Synthetic storage site 2"
        map.SUBJECT, map.UNKNOWN = premise.subject, premise.unknown
        -- The opening premise names the survivor; without a SELF the placeholder
        -- would simply be skipped and this test would never read that line.
        map.SELF = "Ada Whitlock"
    -- The opening routes to a point of its own; the follow-up inherits that
    -- point and the earlier reference. All three are premise/thread data, so
    -- without them here every render would leave a placeholder and the real
    -- defect - a phrase that contradicts its calendar - would be buried under
    -- thousands of false ones.
    map.POINT = "the district transfer desk"
    map.FROMPOINT = "the district transfer desk"
    map.FROMREF = "AV-306"
        map.ORG = render(premise.orgs[1], { A = map.A, B = map.B })
        local days, months = allowed(premise, map)
        for _, agreeing in ipairs({ true, false }) do
            local branch = agreeing and "agree" or "dispute"
            local where = id .. " (" .. branch .. ", claim day " .. cal.claimDate .. ")"
            local claim = G.renderAnchor(premise.claim, false, agreeing, map)
            local response = G.renderAnchor(premise.response, true, agreeing, map)
            local review = G.renderAnchor(premise.review, true, agreeing, map)
            renders = renders + 3
            for name, body in pairs({ claim = claim, response = response, review = review }) do
                if body:find("[{}]") then problem(where .. " " .. name .. ": placeholder left: " .. body:match("{[^}]*}?")) end
                checkRelations(body, days, months, where .. " " .. name)
                checkMarkers(body, agreeing, where .. " " .. name)
            end
            -- claim < response < review, as far as each document is dated. Where
            -- a premise's whole point is a response dated BEFORE its claim, the
            -- disputing branch must actually be.
            local cLo, cHi = range(datesIn(claim, where .. " claim"))
            local rLo, rHi = range(datesIn(response, where .. " response"))
            local vLo = range(datesIn(review, where .. " review"))
            if not vLo then problem(where .. ": the review carries no date") end
            if vLo and cHi and cHi >= vLo then problem(where .. ": the claim is not dated before the review") end
            if vLo and rHi and rHi >= vLo then problem(where .. ": the response is not dated before the review") end
            local precedes = premise.asserts and premise.asserts.precedes == branch
            if precedes then
                if not (rHi and cLo and rHi < cLo) then problem(where .. ": the response should be dated before the claim") end
            elseif rLo and cHi and rLo <= cHi then
                problem(where .. ": the response is dated before the claim")
            end
        end
    end
end

-- Pass 2: real cases ----------------------------------------------------------------
-- Every combination that can occur: premise x outline x review present/absent
-- (absent only where the premise marks its review optional).
-- ORDINARY PREMISES ONLY. The seed loop below generates ordinary cases, and the
-- personal opening is deliberately undrawable from a seed - it is asked for by
-- name for the first case of a save. Waiting for it here would spin to the
-- 20,000-seed guard and fail. Its own renders are still checked above, where
-- every premise in Premises.list() is walked; only the SEED-COVERAGE target
-- excludes it. test/opening_premise.lua covers it through its own path,
-- including that both readings occur.
local wanted, seen = {}, {}
for _, id in ipairs(Premises.list()) do
    local premise = Premises.get(id)
    if not premise.opening and not premise.followUp then
    for _, outline in ipairs({ "corroboration", "conflicting-account" }) do
        wanted[#wanted + 1] = id .. "/" .. outline .. "/review"
        if premise.reviewOptional then wanted[#wanted + 1] = id .. "/" .. outline .. "/no-review" end
    end
    end
end
local function covered()
    for _, key in ipairs(wanted) do if not seen[key] then return false end end
    return true
end

local cases, weekCases, clashesChecked = 0, 0, 0
local seed = 0
while seed < 400 or not covered() do
    seed = seed + 1
    assert(seed <= 20000, "some premise/outline/review combinations never occurred in 20000 seeds")
    local case = G.generate(catalog, seed, opts)
    if case then
        cases = cases + 1
        local premise = Premises.get(case.premiseId)
        local agreeing = case.outline == "corroboration"
        local where = "seed " .. seed .. " " .. case.premiseId .. " (" .. case.outline .. ")"
        local f = case.facts
        if not (f.claimDate >= MAY_1 and f.claimDate <= JUNE_28 and f.claimDate < f.responseDate
            and f.responseDate < f.reviewDate and f.responseDate - f.claimDate <= 9
            and f.reviewDate - f.responseDate <= 9 and f.reviewDate <= JULY_8) then
            problem(where .. ": calendar facts out of bounds")
        end
        local map = G.dateFields({ claimDate = f.claimDate, responseDate = f.responseDate, reviewDate = f.reviewDate })
        local days, months = allowed(premise, map)
        local hasReview, titles, inWeek = false, {}, false
        local placed = {}
        for i, doc in ipairs(case.documents) do
            local dw = where .. " '" .. doc.title .. "'"
            if titles[doc.title] then problem(where .. ": two documents titled '" .. doc.title .. "'") end
            titles[doc.title] = true
            if doc.body:find("[{}]") or doc.title:find("[{}]") then problem(dw .. ": placeholder left") end
            datesIn(doc.body, dw)
            if doc.body:find(premise.review.found, 1, true) then hasReview = true end
            if Memo.inWeek(doc.body) then inWeek = true end
            -- Document 10's slip claims to be the day before the claim.
            if doc.body:find("the day before the entry it settles", 1, true) then
                local slip = datesIn(doc.body, dw)[1]
                if not slip or slip + 1 ~= f.claimDate or not datesIn(case.documents[1].body, dw)[1]
                    or datesIn(case.documents[1].body, dw)[1] ~= f.claimDate then
                    problem(dw .. ": the slip is not dated the day before a claim dated " .. map.DATE1)
                end
            else
                checkRelations(doc.body, days, months, dw)
            end
            checkMarkers(doc.body, agreeing, dw)
            -- Where a document puts a person on a date: "June 3, 1993 - site",
            -- or "Name - site" above a date line.
            local lines = {}
            for line in (doc.body .. "\n"):gmatch("(.-)\n") do lines[#lines + 1] = line end
            for n, line in ipairs(lines) do
                local date, site = line:match("^(%a+ %d+, 1993) %- (.+)$")
                if not date and lines[n + 1] and lines[n + 1]:match("^%a+ %d+, 1993$") then
                    site = line:match("^.+ %- (.+)$"); date = site and lines[n + 1]
                end
                for _, location in ipairs(case.locations) do
                    if date and site == location.name then
                        placed[date] = placed[date] or {}
                        placed[date][site] = true
                        clashesChecked = clashesChecked + 1
                    end
                end
            end
        end
        for date, sites in pairs(placed) do
            local count = 0
            for _ in pairs(sites) do count = count + 1 end
            if count > 1 then problem(where .. ": the same person is placed at both sites on " .. date) end
        end
        if not premise.reviewOptional and not hasReview then problem(where .. ": a required review is missing") end
        seen[case.premiseId .. "/" .. case.outline .. "/" .. (hasReview and "review" or "no-review")] = true
        if seed <= 400 and inWeek then weekCases = weekCases + 1 end
    end
end

-- P4-R108: roughly a third of cases carry a document inside the memo's week, and
-- the rest none - so the note is a signal. Measured 2026-09-15; the band is
-- wide on purpose, the point is "some, not all".
local generatedIn400 = 0
for s = 1, 400 do if G.generate(catalog, s, opts) then generatedIn400 = generatedIn400 + 1 end end
local rate = weekCases / generatedIn400
if rate < 0.15 or rate > 0.55 then
    problem(string.format("%d of %d cases (%.0f%%) carry a document in the relay memo's week; expected 15-55%%",
        weekCases, generatedIn400, rate * 100))
end

if problemCount > 0 then
    error("premise consistency: " .. problemCount .. " problems, first " .. #problems .. ":\n  "
        .. table.concat(problems, "\n  "), 0)
end
-- The two readings the survivor may choose between at a case's end ("What do I
-- make of it?", P4-R113, wording P4-R122): every premise has exactly two, each
-- a plain sentence. No length limit: the organiser's pick list wraps (owner,
-- 2026-09-15: "the wording can be as long as necessary").
for _, id in ipairs(Premises.list()) do
    local premise = Premises.get(id)
    local r = premise.readings
    if type(r) ~= "table" or #r ~= 2 then
        problem(id .. ": needs exactly two readings")
    else
        for i = 1, 2 do
            local t = r[i]
            if type(t) ~= "string" or t == "" then problem(id .. ": reading " .. i .. " is empty")
            else
                if t:find("[{}%%]") then problem(id .. ": reading " .. i .. " has a placeholder or percent sign") end
                if t:lower():find("%f[%a]you") then problem(id .. ": reading " .. i .. " addresses the player") end
                if not t:find("%.$") then problem(id .. ": reading " .. i .. " must end with a full stop") end
            end
        end
        if r[1] == r[2] then problem(id .. ": the two readings are the same") end
    end
end
if problemCount > 0 then
    error("premise readings: " .. problemCount .. " problem(s):\n  " .. table.concat(problems, "\n  "))
end

print(string.format("PASS premise consistency: %d anchor renders on %d calendars; %d cases (%d seeds) cover all %d "
    .. "premise/outline/review shapes; %d of %d cases (%.0f%%) dated in the memo's week; %d placements checked",
    renders, #calendars, cases, seed, #wanted, weekCases, generatedIn400, rate * 100, clashesChecked))
