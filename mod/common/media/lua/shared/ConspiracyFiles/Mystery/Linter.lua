-- THE LOAD-TIME LINTER: A MYSTERY THAT FAILS THIS NEVER REACHES A SAVE.
--
-- Design v3, iteration 2's regulator frame: "provable before it reaches a
-- save, not merely reviewed." A mystery is a plain Lua table in the
-- Vocabulary's shape; M.lint walks it once, offline, with no PZ dependency,
-- and refuses anything the honesty rules or the vocabulary itself forbid.
-- Checked on RENDERED text (after placeholder substitution), because
-- iteration 2's regulator frame found the obvious miss: a count hidden
-- inside a template substitution passes a scan of the authored string but
-- not of what the player actually reads.
--
-- What this module refuses (DR-20260925-MYSTERY-BOUNDARIES and the
-- project's long-standing observation rules):
--   * a finding whose kind the catalogue does not recognise, or whose
--     capacity mismatches its declared where/wear/quantity shape;
--   * prose that asserts certainty, names the central conspiracy, or uses
--     an investigator's vocabulary (the same discipline THREADS already
--     holds itself to - test/threads_group_what_i_carry.lua);
--   * any number in rendered text that is not a discovery ordinal (a count
--     or a total, on any surface, ever);
--   * a body over its kind's declared MAX_CHARS;
--   * a LINK, REVEAL or CLOSE that references a node the mystery never
--     declared with PLACE (a dangling reference);
--   * a CLOSE predicate naming zero keys, or a "gate" predicate naming more
--     than one;
--   * a MUTATE transition that is not `Vocabulary.validTransition`.
--
-- What it CANNOT refuse, and says so rather than pretending otherwise: a
-- GATE mechanic's reachability against the live world (iteration 1's
-- 3am-on-call frame named this the load-bearing risk of the whole
-- interpreter idea) - that is play, and a silence node is how an author
-- admits a GATE may never fire.
local Vocab=require("ConspiracyFiles/Mystery/Vocabulary")
local M={}

-- The same investigator/certainty words THREADS already refuses itself
-- (test/threads_group_what_i_carry.lua). One list, shared, so a new surface
-- cannot quietly reintroduce a leak the project already closed once.
M.FOREIGN_WORDS={"case","cases","investigation","investigator","detective",
    "solved","solve","unsolved","closed","complete","completed",
    "finished","resolved","total","progress","score","remaining"}

local function foreignWord(text)
    local lower=" "..tostring(text):lower():gsub("[^%a]+"," ").." "
    for _,word in ipairs(M.FOREIGN_WORDS) do
        if lower:find(" "..word.." ",1,true) then return word end
    end
end
-- Any digit in rendered prose is a count unless it is a discovery ordinal,
-- which never appears IN prose - it is drawn on the row beside it. So any
-- digit in a finding's own text is refused outright.
local function hasCount(text) return tostring(text):find("%d")~=nil end

local function textOf(finding)
    local parts={}
    if type(finding.observation)=="string" then parts[#parts+1]=finding.observation end
    if type(finding.source)=="string" then parts[#parts+1]=finding.source end
    if type(finding.note)=="string" then parts[#parts+1]=finding.note end
    if type(finding.body)=="string" then parts[#parts+1]=finding.body end
    return table.concat(parts," ")
end

-- Refuses a single finding. `catalogue` is an optional {kind->true} lookup
-- (EvidenceKinds/ObjectRules eligibility) so this module keeps no PZ
-- dependency of its own; without one, kind existence is not checked and the
-- caller is told so via the second return.
local function lintFinding(id,finding,catalogue)
    if type(finding)~="table" then return false,id..": not a table" end
    if not Vocab.WHERE[finding.where] then return false,id..": invalid where" end
    if finding.where=="heard" then
        if finding.capacity~=nil and finding.capacity~="heard" then
            return false,id..": a heard finding must not claim object capacity"
        end
    else
        if not Vocab.CAPACITY[finding.capacity] then return false,id..": invalid capacity" end
    end
    local cap=finding.capacity or "heard"
    local text=textOf(finding)
    local maxChars=finding.maxChars or Vocab.MAX_CHARS[cap]
    if type(maxChars)~="number" or maxChars>Vocab.MAX_CHARS[cap] then
        return false,id..": declares a cap larger than its kind allows"
    end
    if #text>maxChars then return false,id..": text exceeds its kind's cap ("..#text.."/"..maxChars..")" end
    if text=="" then return false,id..": no text at all" end
    local word=foreignWord(text)
    if word then return false,id..": speaks as an investigator ('"..word.."')" end
    if hasCount(text) then return false,id..": a number in the survivor's own prose" end
    if cap=="object" and not finding.wear then return false,id..": an object must say what state it was found in" end
    if catalogue and cap=="object" and type(finding.kind)=="string" and not catalogue[finding.kind] then
        return false,id..": "..finding.kind.." is not a catalogued, rule-eligible object"
    end
    return true
end

-- The whole mystery: `{id, findings={id=finding,...}, links={...},
-- reveals={...}, gates={...}, close=predicate, mutations={...}}`.
-- Returns true, or false plus the first reason - refusal is on the first
-- fault found, so an author sees one problem at a time rather than a wall.
function M.lint(mystery,catalogue)
    if type(mystery)~="table" then return false,"not a table" end
    if type(mystery.id)~="string" or mystery.id=="" then return false,"missing id" end
    if type(mystery.findings)~="table" or next(mystery.findings)==nil then
        return false,mystery.id..": no findings at all"
    end
    for id,finding in pairs(mystery.findings) do
        local ok,why=lintFinding(id,finding,catalogue)
        if not ok then return false,why end
    end
    local function known(id) return mystery.findings[id]~=nil end
    for i,link in ipairs(mystery.links or {}) do
        if not Vocab.LINK_SHAPE[link.shape] then return false,"link "..i..": invalid shape" end
        if type(link.requires)~="table" or #link.requires<2 then
            return false,"link "..i..": needs at least two findings"
        end
        for _,id in ipairs(link.requires) do
            if not known(id) then return false,"link "..i..": references undeclared finding "..tostring(id) end
        end
        if not link.text or foreignWord(link.text) or hasCount(link.text) then
            return false,"link "..i..": invalid or dishonest text"
        end
    end
    for i,reveal in ipairs(mystery.reveals or {}) do
        if type(reveal.requires)~="table" or #reveal.requires==0 then
            return false,"reveal "..i..": needs at least one finding"
        end
        for _,id in ipairs(reveal.requires) do
            if not known(id) then return false,"reveal "..i..": references undeclared finding "..tostring(id) end
        end
        if not reveal.text or foreignWord(reveal.text) or hasCount(reveal.text) then
            return false,"reveal "..i..": invalid or dishonest text"
        end
    end
    for i,gate in ipairs(mystery.gates or {}) do
        if not Vocab.GATE_KIND[gate.kind] then return false,"gate "..i..": invalid kind" end
        if not known(gate.produces) then return false,"gate "..i..": produces an undeclared finding" end
    end
    for i,mutation in ipairs(mystery.mutations or {}) do
        if not known(mutation.node) then return false,"mutation "..i..": references undeclared finding" end
        if not Vocab.validTransition(mutation) then return false,"mutation "..i..": invalid transition" end
    end
    if mystery.close~=nil then
        if type(mystery.close)~="table" or type(mystery.close.keys)~="table" or #mystery.close.keys==0 then
            return false,"close: invalid predicate"
        end
        if mystery.close.kind=="gate" and #mystery.close.keys~=1 then
            return false,"close: a gate predicate names exactly one finding"
        end
        for _,id in ipairs(mystery.close.keys) do
            if not known(id) then return false,"close: references undeclared finding "..tostring(id) end
        end
    end
    -- Requiring the central axis and pair binding the way Story.lua already
    -- does (DR-20260923, the audit that found scenarios silently unbound).
    if mystery.centralAxis==nil then return false,"does not say which axis of the central conspiracy it touches" end
    return true
end

return M
