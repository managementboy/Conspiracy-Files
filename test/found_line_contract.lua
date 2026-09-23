-- THE FOUND LINE IS THE SURVIVOR'S OWN SENTENCE, AND IT MUST NAME THE PLACE.
--
-- 940c3e2 moved discovery history to first person: "109 Walker Road. It was a
-- handwritten cover letter." became "I found a handwritten cover letter at 109
-- Walker Road." It updated five tests and missed three, because those three
-- are standalone files and `lua5.1 test/run.lua` reaches only the six specs -
-- so a local run reporting "52 tests, 0 failures" was green while the suite
-- had three failures.
--
-- This pins what the sentence must CONTAIN rather than the order it says it
-- in, so the next rewording is free to move the words and is not free to lose
-- the place, the carrier, or the admission that a place was not noted.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local P=require("ConspiracyFiles/PlaceIndex")

local WHERE, CARRIER = "109 Walker Road", "handwritten cover letter"

local both = P.foundLine(WHERE, CARRIER)
assert(both:find(WHERE, 1, true), "the place must be named: "..both)
assert(both:find(CARRIER, 1, true), "the carrier must be named: "..both)
assert(both:find("^I "), "the survivor writes it in first person: "..both)
assert(both:sub(-1) == ".", "it is a sentence: "..both)

local placeOnly = P.foundLine(WHERE, nil)
assert(placeOnly:find(WHERE, 1, true), "the place must survive a missing carrier: "..placeOnly)
assert(placeOnly:find("^I "), "first person with no carrier: "..placeOnly)

local carrierOnly = P.foundLine(nil, CARRIER)
assert(carrierOnly:find(CARRIER, 1, true), "the carrier must survive a missing place: "..carrierOnly)
-- PLACELESS IS NOT AN ERROR STATE. The survivor simply did not note it, and
-- the record says so in their own voice rather than printing "Unknown".
assert(carrierOnly:find("didn't note", 1, true), "a missing place is admitted: "..carrierOnly)

local neither = P.foundLine(nil, nil)
assert(neither:find("didn't note", 1, true), "with nothing known it still admits: "..neither)
for _, line in ipairs({both, placeOnly, carrierOnly, neither}) do
    assert(not line:find("Unknown", 1, true), "never the word Unknown: "..line)
    assert(not line:find("nil", 1, true), "never a nil leaking into the writing: "..line)
end

-- A carrier takes an article, and an acronym keeps its capitals: "an ID card",
-- not "an id card". The article logic is the reason aCarrier exists.
local idCard = P.foundLine(WHERE, "ID card")
assert(idCard:find("ID card", 1, true), "an acronym keeps its capitals: "..idCard)

print("PASS found_line_contract: the FOUND line is first person, names the "
    .."place and the carrier, and admits a place it never noted")
