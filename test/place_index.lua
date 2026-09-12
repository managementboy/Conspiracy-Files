-- Two indexes over one store, and what each row is allowed to say about
-- where it was found (WP1, WP2, WP6).
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local M = require("ConspiracyFiles/PlaceIndex")

-- ---------------------------------------------------------------- WP1 ----
-- The complaint this answers: an employment record, a rent statement and a
-- public notice all read "Handwritten cover letter", because the subtitle
-- described our item list rather than the survivor's knowledge.
local function rows()
    return {
        { id = "a", ordinal = 1, cfCarrier = "Handwritten cover letter", cfCase = "R-482", detailText = "x" },
        { id = "b", ordinal = 2, cfCarrier = "Handwritten cover letter", cfCase = "R-482", detailText = "x" },
        { id = "c", ordinal = 3, cfCarrier = "Handwritten cover letter", cfCase = "R-340", detailText = "x" },
        { id = "d", ordinal = 4, summary = "Identity document - corpse", detailText = "x" },
    }
end

local placed = M.decorate(rows(), { a = "109 Walker Road", b = "109 Walker Road", c = "42 McCoy Lane" })
assert(placed[1].summary == "109 Walker Road - Discovery 1 - Case R-482", placed[1].summary)
assert(placed[3].summary == "42 McCoy Lane - Discovery 3 - Case R-340", placed[3].summary)

-- Four papers from one desk sit next to each other. They must still be four
-- distinguishable rows, which the true discovery number guarantees - the
-- ordinal comes from the ledger, so no two rows can ever carry the same one.
assert(placed[1].summary ~= placed[2].summary, "two finds in one place must not read identically")

-- Nothing regresses. A row the ledger has no place for keeps exactly the
-- subtitle its source gave it.
assert(placed[4].summary == "Identity document - corpse", placed[4].summary)
local unplaced = M.decorate(rows(), {})
assert(unplaced[1].summary == "Handwritten cover letter - Discovery 1 - Case R-482", unplaced[1].summary)

-- A source that writes its own subtitle gets the place prefixed, not
-- substituted: it already distinguishes its rows and we must not lose that.
local prefixed = M.decorate(rows(), { d = "109 Walker Road" })
assert(prefixed[4].summary == "109 Walker Road - Identity document - corpse", prefixed[4].summary)

-- The carrier name is demoted to the detail pane, never dropped.
assert(placed[1].detailText:find("FOUND\n109 Walker Road", 1, true), placed[1].detailText)
assert(placed[1].detailText:find("handwritten cover letter", 1, true), placed[1].detailText)

-- "Unknown" must not be a place. A missing place is said plainly, in the
-- survivor's voice, and never becomes a string that could group anything.
assert(unplaced[1].place == nil and placed[4].place == nil)
for _, row in ipairs(unplaced) do
    assert(not row.detailText:find("Unknown", 1, true))
    assert(row.detailText:find("didn't note where", 1, true), row.detailText)
end
-- An empty string is not a place either: it would herd every placeless entry
-- under one enormous fake heading.
local blank = M.decorate(rows(), { a = "", b = false, c = 7 })
assert(blank[1].place == nil and blank[2].place == nil and blank[3].place == nil)

-- --------------------------------------------------------- WP2 / WP6 ----
-- A heading is earned, not printed. One visit is not a return (P4-R81).
local earned = M.headings({ ["109 Walker Road"] = 1, ["42 McCoy Lane"] = 2, ["Wide Street"] = 4 })
assert(earned["109 Walker Road"] == nil, "being somewhere once earns nothing")
assert(earned["42 McCoy Lane"] == 2 and earned["Wide Street"] == 4)
assert(M.headings(nil) and next(M.headings(nil)) == nil)

-- What a heading says. The address is withheld until the third visit.
assert(M.headingText("42 McCoy Lane", 1) == nil)
assert(M.headingText("42 McCoy Lane", 2) == "Back again", tostring(M.headingText("42 McCoy Lane", 2)))
assert(M.headingText("42 McCoy Lane", 3):find("42 McCoy Lane", 1, true))
assert(M.headingText("42 McCoy Lane", 5):find("5 times", 1, true))

-- The place view is the SAME rows in the SAME order, with headings laid over
-- the runs that earned one. Never a sort: sorting by address would turn the
-- notebook into a checklist to sweep.
local view = M.index(placed, { ["109 Walker Road"] = 2 })
local order, headings = {}, 0
for _, entry in ipairs(view) do
    if entry.heading then headings = headings + 1 else order[#order + 1] = entry.row.id end
end
assert(table.concat(order, ",") == "a,b,c,d", table.concat(order, ","))
assert(headings == 1, "only the earned place gets a heading, got " .. headings)
assert(view[1].heading and view[1].place == "109 Walker Road")

-- A heading opens once per run, not once per row.
local repeated = M.decorate(rows(), { a = "Same Place", b = "Same Place", c = "Same Place" })
local count = 0
for _, entry in ipairs(M.index(repeated, { ["Same Place"] = 2 })) do
    if entry.heading then count = count + 1 end
end
assert(count == 1, "three entries in one place is one heading, got " .. count)

-- A place holding entries from two cases is a real finding and is marked.
assert(M.crossesCases(placed, "109 Walker Road") == false, "one case is not a crossing")
local crossing = M.decorate(rows(), { a = "Shared Desk", c = "Shared Desk" })
assert(M.crossesCases(crossing, "Shared Desk") == true)
assert(M.index(crossing, { ["Shared Desk"] = 2 })[1].crossesCases == true)

-- With nothing earned, the view is flat - which is the whole first hour of
-- every save and must not look broken.
local flat = M.index(placed, {})
for _, entry in ipairs(flat) do assert(not entry.heading, "nothing earned means no headings") end
assert(#flat == #placed)
assert(#M.EMPTY > 0 and not M.EMPTY:find("error", 1, true))

print("PASS place index: the subtitle says where, the carrier is demoted, a "
    .. "heading is earned by a return, order is never sorted, and a crossing is marked")
