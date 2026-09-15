-- Keys found on a body go to the journal before any door is tried.
--
-- Owner, 2026-09-11, having searched a corpse carrying two keys and an ID:
-- "would be cool that we write the information about the keys into our
-- journal. not evidence."
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local K = require("ConspiracyFiles/KeyObservations")

local function key(id, keyId, token, building, label, at)
    return { id = id, keyId = keyId, token = token, carrier = "corpse", building = building,
             label = label, x = 1, y = 2, z = 0, observedAt = at or 3 }
end
local r = K.empty()
r = K.observe(r, key("k1", 411, "corpse-item:9", "b105", "105 4th St"))
r = K.observe(r, key("k2", 412, "corpse-item:9", "b999", nil))
local rows = K.rows(r, function() return "Paris Stover" end,
    function(b) if b == "b105" then return "an address in the file marked PS-289" end end)

-- Two keys from one body are ONE entry about that body.
assert(#rows == 1, "two keys off one body must read as one entry, got " .. #rows)
assert(rows[1].title == "Two keys on Paris Stover", rows[1].title)
local text = rows[1].detailText
assert(text:find("the body carrying Paris Stover's ID", 1, true), text)
assert(text:find("cut for 105 4th St", 1, true), "a key names the building it opens: " .. text)
assert(text:find("an address in the file marked PS-289", 1, true), "and says when that building is in a case")
assert(text:find("does not name", 1, true), "an unnamed building is reported as unnamed")

-- The claim stays at the strength a key supports.
assert(text:find("It does not say whose it was", 1, true), text)
for _, banned in ipairs({ "lived at", "her house", "his house", "belonged to", "owned" }) do
    assert(not text:lower():find(banned, 1, true), "a key must not claim " .. banned)
end

-- Seeing the same key twice is one key.
local again, changed = K.observe(r, key("k1", 411, "corpse-item:9", "b105", "105 4th St"))
assert(not changed, "the same key observed twice is still one key")

-- Keys from different bodies are different entries.
r = K.observe(r, key("k3", 500, "corpse-item:4", "b200", "200 Main St", 5))
assert(#K.rows(r) == 2, "keys from two bodies must be two entries")

-- One key reads in the singular, and a body with no recorded name is "a body".
local single = K.rows(K.observe(K.empty(), key("k9", 7, "corpse-item:1", nil, nil)))
assert(single[1].title == "A key on a body", single[1].title)
assert(single[1].detailText:find("One key was with a body.", 1, true), single[1].detailText)
assert(single[1].detailText:find("a lock I have not matched", 1, true), single[1].detailText)

-- Wired: the observer is fed from the panes IdentityObserver already walks,
-- only for corpses and bags - never kitchen drawers, or every house key in Knox
-- would fill the journal.
local observer = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/IdentityObserver.lua")):read("*a")
assert(observer:find('(source=="corpse" or source=="container")', 1, true),
    "keys must only be recorded off a body or a bag taken from one")
local notebook = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/Notebook.lua")):read("*a")
assert(notebook:find("ConspiracyFiles.KeyObserver", 1, true), "the journal must read the key rows")
print("PASS key observations: keys off a body are one journal entry naming the buildings they are cut for, and nothing more")
