-- The paperwork names the pile.
--
-- Owner, 2026-09-10, on finding ten clay pots beside a file that never
-- mentioned them: "if we have 10 clay pots, do we reference them in any of our
-- files we find?" We did not. The pile's own text pointed at the case, and the
-- case was silent about the pile - which makes ten pots atmosphere rather than
-- evidence.
--
-- Now the claim carries a stores note giving the count ON PAPER, which is lower
-- than the count in the cupboard. Nothing anywhere states the disagreement:
-- the file says eight, the player counts ten, and the arithmetic is theirs.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local opts = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }

local withPiles, checked, multi = 0, 0, 0
for seed = 1, 600 do
    local case = G.generate(catalog, seed, opts)
    if case then
        assert(G.validate(case), "seed " .. seed .. " must survive a reload")
        local piles = {}
        for _, doc in ipairs(case.documents) do
            if doc.quantity then piles[#piles + 1] = doc end
        end
        local claim = case.documents[1].body
        if #piles == 0 then
            assert(not claim:find("Stores note", 1, true),
                "seed " .. seed .. " invented a stores note for a pile that is not in the case")
        else
            withPiles = withPiles + 1
            if #piles > 1 then multi = multi + 1 end
            assert(claim:find("ATTACHED", 1, true), "seed " .. seed .. ": the claim must carry the stores notes")
            for _, doc in ipairs(piles) do
                checked = checked + 1
                -- Fewer on paper than in the cupboard. That gap IS the clue.
                assert(doc.onPaper and doc.onPaper < doc.quantity,
                    "the paperwork must be short of what is actually there")
                assert(doc.onPaper >= 1, "a stores note of zero is not a note")
                -- Every pile is named, not just the first: a case can hold two.
                assert(claim:find(doc.label, 1, true),
                    "seed " .. seed .. ": pile '" .. doc.label .. "' is not mentioned in the paperwork")
                -- And it answers the claim by disagreeing with it.
                local disputes = false
                for _, link in ipairs(doc.links or {}) do
                    if link.kind == "disputes-delivery" and link.target == case.documents[1].id then disputes = true end
                end
                assert(disputes, "a pile the paperwork undercounts must dispute that paperwork")
            end
            -- The mod must never do the arithmetic. Checked as a property
            -- rather than by banned phrases: a crude word list caught the diary
            -- saying "why the signature mattered more than the answer", which
            -- is innocent prose, and would have gone on catching more of it.
            --
            -- The property is that neither side ever states both numbers. The
            -- paperwork knows only its own count; the pile knows only what is
            -- in the cupboard.
            local numerals = { "one", "two", "three", "four", "five", "six", "seven",
                "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen",
                "fifteen", "sixteen" }
            for _, doc in ipairs(piles) do
                local actual = numerals[doc.quantity]
                local onPaper = numerals[doc.onPaper]
                local storesLine = claim:match("[a-z]+ " .. doc.label:gsub("%-", "%%-") .. "s? received")
                assert(storesLine, "the stores note for " .. doc.label .. " must be findable")
                assert(storesLine:find(onPaper, 1, true),
                    "the stores note must give the count on paper")
                assert(not storesLine:find(actual, 1, true),
                    "the paperwork must not know how many are actually there")
                assert(not doc.body:find(onPaper .. " " .. doc.label, 1, true),
                    "the pile must not quote the paperwork's count back at the player")
            end
        end
    end
end

assert(withPiles > 100, "only " .. withPiles .. " cases had a pile; the check is barely exercised")
assert(multi > 0, "no case ever held two piles, so the every-pile rule is untested")
print(string.format("PASS pile paperwork: %d cases with piles (%d holding two), %d stores notes, "
    .. "every one short of the cupboard and none of them doing the arithmetic", withPiles, multi, checked))

-- An object beside a file names that file by its REFERENCE, not by the
-- premise's own noun for the matter. Owner, 2026-09-10, reading "with the file
-- on the extension among it" while looking at ten clay pots: "what is this file
-- on the extension that is mentioned here?"
--
-- The subject nouns are written for the premise's own documents - "the
-- extension", "the closure", "the callout" - and go opaque the moment they are
-- quoted next to something unrelated. A record number is a thing the player can
-- carry to the next drawer and match.
local Kinds = require("ConspiracyFiles/Generated/EvidenceKinds")
local named, subjects = 0, 0
for seed = 1, 400 do
    local case = G.generate(catalog, seed, opts)
    if case then
        for _, doc in ipairs(case.documents) do
            local carrier = assert(Kinds.get(doc.kind))
            if carrier.capacity == "object" and doc.body:find("file", 1, true) then
                named = named + 1
                assert(doc.body:find(case.facts.code, 1, true),
                    "an object beside a file must name the file's reference: " .. doc.body)
                if doc.body:find("the file on ", 1, true) then subjects = subjects + 1 end
            end
        end
    end
end
assert(named > 50, "only " .. named .. " object bodies mentioned a file; the check is barely exercised")
assert(subjects == 0, subjects .. " object bodies still name the file by the premise's subject")
print(string.format("PASS pile paperwork: %d objects name the file they sit beside by its reference", named))
