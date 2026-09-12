-- Five more moments where the survivor speaks, and the rule that keeps them
-- from becoming chatter.
--
-- Owner, 2026-09-10: "I would also like us to use it much more to interact
-- with the player."
--
-- THE RULE: speak only when the player learns something they could not have
-- known a second earlier. It rules out ambient observation entirely - walking
-- past a marker, opening the notebook, reading a page - and it rules in all
-- five of these. A line the survivor has not earned makes the next one cheaper,
-- and Project Zomboid players uninstall mods that natter.
package.path = "mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;" .. package.path

local says, halos = {}, {}
local p = {
    Say = function(_, t) says[#says + 1] = t end,
    setHaloNote = function(_, t) halos[#halos + 1] = t end,
}
getPlayer = function() return p end
getTimeInMillis = function() return 0 end
ConspiracyFiles = ConspiracyFiles or {}
local Voice = dofile('mod/common/media/lua/client/ConspiracyFiles/PlayerVoice.lua')

local function fresh() says, halos = {}, {}; Voice.reset() end

-- A newly found record disagreeing with one already held is the centre of an
-- investigation, and the mod used to pass it in silence.
fresh()
Voice.onConnection("disputes-delivery", "doc-2")
assert(#says == 1 and #halos == 1, "a connection must be spoken")
assert(halos[1] == "Two records disagree", halos[1])
assert(says[1] ~= halos[1], "the bubble and the halo never say the same thing")

-- It must never say which record is true. That is a conclusion, and a lead is
-- never proof.
for _, line in ipairs({ says[1] }) do
    local l = line:lower()
    for _, banned in ipairs({ "lying", "lied", "faked", "proves", "cover" }) do
        assert(not l:find(banned, 1, true), "the survivor must not conclude: " .. line)
    end
end

-- Agreement is a different line, because it is a different fact.
fresh(); Voice.onConnection("corroborates", "doc-3")
assert(halos[1] == "Records agree", halos[1])

-- Once per thing. A connection is new once; a case retires once; an address is
-- arrived at once. None of these can repeat, so none of them may repeat.
fresh()
Voice.onConnection("disputes-delivery", "doc-9"); Voice.onConnection("disputes-delivery", "doc-9")
assert(#says == 1, "the same connection must not be announced twice")
Voice.onCaseComplete("case-1"); Voice.onCaseComplete("case-1")
Voice.onNamedPlace("t3:12"); Voice.onNamedPlace("t3:12")
Voice.onPile("doc-4"); Voice.onPile("doc-4")
Voice.onBody("boot"); Voice.onBody("boot")
assert(#says == 5, "each moment speaks exactly once, got " .. #says)

-- The halo is read at a glance; the bubble is the survivor thinking.
for _, h in ipairs(halos) do assert(#h <= 30, "halo too long to read at a glance: " .. h) end

-- A completed case is never called solved. The mod does not know that.
fresh(); Voice.onCaseComplete("case-2")
assert(halos[1] == "Nothing left to find here", halos[1])
assert(not says[1]:lower():find("solved", 1, true), "a case is never solved, only exhausted")

-- The callers, checked at the source: a behavioural test only covers the paths
-- it exercises, and these fire deep inside the runtime.
local f = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua', 'r'))
local runtime = f:read('*a'); f:close()
assert(runtime:find("voice.onConnection", 1, true), "inspection must announce a connection")
assert(runtime:find("v.onCaseComplete", 1, true), "retirement must announce a finished case")
assert(runtime:find("voice.onNamedPlace", 1, true), "arrival must announce a named place")
assert(runtime:find("voice.onPile", 1, true), "a pile must be worth a beat")
-- Arrival must be gated on the document being KNOWN. Announcing a lead the
-- player has not read would turn recognition into a quest marker.
assert(runtime:find("if known[doc.id] then", 1, true),
    "a place may only be recognised from a document the player has actually read")

print("PASS voice moments: five new triggers, each once, each earned, "
    .. "and none of them concluding anything")
