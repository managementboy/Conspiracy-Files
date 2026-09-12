-- Why are these all one case?
--
-- Owner, 2026-09-11, holding a stock list, a "review", a credit card and an
-- audit note: "as of now I cant figure out why they are all part of one case".
-- Three causes, each fixed and pinned here:
--   A. documents were titled by the paper, not the content - a payment slip on
--      a notepad was called "Review";
--   B. the extra documents fitted any story, so only the reference number tied
--      them together;
--   C. nothing noticed when a document refers to one not found yet. The
--      owner's wording: "probably refers to another list?" - a question,
--      because a question can be wrong.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local Premises = require("ConspiracyFiles/Generated/Premises")
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local opts = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }

local sawPayment, sawLog = false, false
for seed = 1, 400 do
    local case = G.generate(catalog, seed, opts)
    if case then
        assert(G.validate(case))
        local subject = Premises.get(case.premiseId).subject
        for _, doc in ipairs(case.documents) do
            -- A: a payment slip is a payment slip, whatever it is written on.
            if doc.body:find("Payment against", 1, true) then
                sawPayment = true
                assert(doc.title:find("^Payment slip"), "a payment is titled " .. doc.title)
                -- B: and it names the case's matter, not only its number.
                assert(doc.body:find("Payment against " .. subject, 1, true), doc.body)
            end
            -- Recognised by its own found-text: a premise's gate log also says
            -- somebody signed in at the gate, and is correctly titled "Gate log".
            if doc.body:find("the current week held open by a bent paperclip", 1, true) then
                sawLog = true
                assert(doc.title:find("^Duty log"), "a duty log is titled " .. doc.title)
                assert(doc.body:find(subject, 1, true), "the duty log must name the matter")
            end
            assert(not doc.title:find("^Review /"), "nothing may be titled 'Review' for its paper: " .. doc.title)
        end
    end
end
assert(sawPayment and sawLog, "both documents must actually occur for this to mean anything")

-- C: the projection reports links to unfound documents by title only, and the
-- notebook turns them into a question.
local case
for seed = 1, 400 do
    local c = G.generate(catalog, seed, opts)
    if c and #c.documents >= 3 then
        for _, doc in ipairs(c.documents) do
            for _, link in ipairs(doc.links) do
                if link.target ~= doc.id then case = c; break end
            end
        end
    end
    if case then break end
end
local reviewer
for _, doc in ipairs(case.documents) do if #doc.links > 0 then reviewer = doc; break end end
local rows = assert(G.project(case, { reviewer.id }))
assert(rows[1].unseen and #rows[1].unseen >= 1, "a link to an unfound document must be reported")
assert(rows[1].unseen[1].title and not rows[1].unseen[1].body,
    "only the unfound document's title may travel, never its text")
assert(#rows[1].connections == 0, "and it must not count as a connection until found")

local notebook = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/Notebook.lua")):read("*a")
assert(notebook:find('Probably refers to "', 1, true), "the survivor wonders, in the owner's words")
assert(notebook:find('.."?"', 1, true), "as a question - a question can be wrong")
-- Checked on the table itself: the comment above it quotes the old label to
-- explain why it went.
local meanings = notebook:match("local meanings=(%b{})")
-- The label values, not the keys: `disputes-delivery` is the link kind's
-- internal id and stays; what the player reads must not say "delivery".
assert(meanings and not meanings:find('="[^"]*[Dd]elivery', 1),
    "the connection verbs must not assume every case is about a delivery")
print("PASS one story: documents are titled by what they are, name the same matter, "
    .. "and the survivor wonders about the ones not found yet")
