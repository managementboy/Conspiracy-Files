-- Player voice lines: the survivor thinks out loud when the journal gains an
-- entry (Set A), and again when a person-key-door link is discovered (Set B,
-- or Set C when no name is known). Exact wording and delivery rules live in
-- docs/design/PLAYER_VOICE.md -- lines are used verbatim, never reworded.
--
-- Delivery follows ClueHints.announce: Say() speech bubble, setHaloNote with
-- an explicit duration (HaloTextHelper.addText has none and flashes too fast
-- to read), and a UI-channel sound only -- never an emitter, never addSound,
-- never character:playSound, so the survivor thinking aloud cannot attract
-- zombies. Every engine call is guarded so a missing method degrades rather
-- than throwing, and every method is invoked with an explicit receiver
-- (player:Say(x), pcall(player.setHaloNote, player, ...)) -- Kahlua refuses a
-- Java method call without one.
ConspiracyFiles=ConspiracyFiles or {}
local V=ConspiracyFiles.PlayerVoice or {}
ConspiracyFiles.PlayerVoice=V
-- Load the pickup hint explicitly. It installs its own action wrappers at file
-- scope and nothing else references it, which is exactly how PlayerVoice itself
-- silently never loaded (86ade2c). PlayerVoice is required by DiscoveryLog, so
-- anchoring the hint here gives it a load path that is actually proven.
pcall(require,"ConspiracyFiles/EvidencePickupHint")

-- Register: the journal stays hedged, the character may speculate. No line
-- states as fact that the named person lived somewhere or owned anything.
local SET_A={
    "That's worth writing down.",
    "Interesting. Into the notebook it goes.",
    "I should note this before I forget.",
    "Hm. That's going in my notes.",
    "Better write this one down.",
    "That means something. Noting it.",
    "I'll want to remember this.",
    "Worth keeping a record of that.",
    "Let me get this down on paper.",
    "That's a detail I shouldn't lose.",
}

-- <name> is substituted with the name observed on a document found with that
-- body. Used only when a name is actually known.
local SET_B={
    "Wait - <name>'s key opens this door. Was this their place?",
    "This is <name>'s key. So this is where they came home to?",
    "<name>... this key of theirs fits right here. Their house, maybe.",
    "The key I took off <name> opens this. That's no coincidence.",
    "So <name> had a key to this place. Worth knowing.",
    "<name>'s key, this door. Somebody lived here.",
    "Huh. <name> could get in here. Might have been home.",
    "That key came off <name>, and it opens this. Their place, I'd bet.",
}

-- Fallback when the key's provenance is known but no identity document was
-- ever observed with that body. Never invent a name.
local SET_C={
    "This key came off a body, and it opens this door.",
    "Whoever I took this key from could get in here.",
    "Someone I found dead had a key to this place.",
    "That key fits. Whoever carried it belonged here, maybe.",
}

-- Set D: an uninspected generated-case evidence item just settled into the
-- inventory. Points at the fact that it needs a proper look, never at the
-- keybind or context-menu action itself -- a survivor thinking aloud does not
-- narrate a tutorial.
local SET_D={
    "I should take a proper look at this.",
    "Worth reading this properly when I get a moment.",
    "This deserves more than a glance. I'll read it properly, later.",
    "I shouldn't just carry this around unread.",
    "Better sit down and go through this properly.",
    "That's worth a proper read, not just a pocket.",
    "I'll want to go through this properly when I get the chance.",
    "This isn't something to skim. Read it properly, later.",
}

-- setHaloNote is the only halo API that takes a duration; ClueHints already
-- established 900 as a readable value for a short line of speech.
local HALO_DURATION=900
-- UI channel only. playUISound never reaches the world sound manager, so it
-- cannot attract zombies -- same choice ClueHints made, for the same reason.
local VOICE_SOUND="UIObjectMenuEnter"
-- A burst of discoveries (e.g. reading several documents back to back) must
-- not produce a burst of chatter. This gates Set A only: Set B/C is the more
-- significant event and must never be suppressed by it.
local COOLDOWN_MS=45000

local indexA,indexB,indexC,indexD=0,0,0,0
local lastSetAAt=-1/0

local function now()
    if not getTimeInMillis then return 0 end
    local ok,t=pcall(getTimeInMillis)
    return (ok and type(t)=="number") and t or 0
end

-- Plain substring replace, not gsub: an observed name is player-facing text
-- we do not control, and gsub's replacement string treats "%" specially.
local function withName(template,name)
    local i,j=template:find("<name>",1,true)
    if not i then return template end
    return template:sub(1,i-1)..name..template:sub(j+1)
end

-- A line the player misses and a line that never fired look identical unless
-- delivery is logged. That cost an hour on clue hints; do not repeat it.
local CFLog=require("ConspiracyFiles/Log")
local function log(message) CFLog.message("voice","voice",message) end
local function speak(player,text)
    if not player then log("no player; line not delivered") return false,false end
    -- Call engine methods with colon syntax, the way vanilla does.
    -- pcall(obj.method, obj, ...) extracts the method first; Kahlua treats that
    -- differently from a real method call, and pcall then hides any complaint, so
    -- a true result can mean 'did not throw' rather than 'worked'.
    if player.Say then pcall(function() player:Say(text) end) end
    local halo=false
    if player.setHaloNote then
        halo=pcall(function() player:setHaloNote(text,255,255,255,HALO_DURATION) end)
    end
    local audible=false
    if getSoundManager then
        local ok,manager=pcall(getSoundManager)
        if ok and manager and manager.playUISound then audible=pcall(function() manager:playUISound(VOICE_SOUND) end) end
    end
    log("said \""..tostring(text).."\" halo="..tostring(halo).." sound="..tostring(audible))
    return halo,audible
end

local function player()
    if not getPlayer then return nil end
    local ok,p=pcall(getPlayer)
    return ok and p or nil
end

-- Set A: fire whenever a new discovery reaches the shared ledger, whatever
-- its kind. Callers (DiscoveryLog.record) must only invoke this on a
-- genuinely new event, never on a duplicate.
function V.onDiscovery(kind,reference)
    local p=player(); if not p then return end
    local t=now()
    if t-lastSetAAt<COOLDOWN_MS then log("journal line suppressed by cooldown ("..(t-lastSetAAt).."ms)") return end
    lastSetAAt=t
    indexA=indexA%#SET_A+1
    speak(p,SET_A[indexA])
end

-- Set B/C: a real key looted from a body opened a door. Never gated by the
-- Set A cooldown -- this is the more significant event. `sourceToken` is the
-- corpse/wallet provenance token; a name is used only when PersonNameLog
-- already associated one with that exact token. Never invents a name.
function V.onKeyDoorLink(sourceToken)
    local p=player(); if not p then return end
    local names=ConspiracyFiles.PersonNameLog
    local ok,name=false,nil
    if names and names.nameFor then ok,name=pcall(names.nameFor,sourceToken) end
    if ok and type(name)=="string" and name~="" then
        indexB=indexB%#SET_B+1
        speak(p,withName(SET_B[indexB],name))
    else
        indexC=indexC%#SET_C+1
        speak(p,SET_C[indexC])
    end
end

-- Set D: an uninspected generated-case evidence item just entered the
-- player's inventory. UI_POLISH_PROPOSALS.md #8 -- the right-click "Inspect
-- Investigation Evidence" action has no other discovery path, so the
-- survivor names the gap in their own voice. The caller (a pickup/transfer
-- hook) is responsible for confirming the item is live generated evidence
-- and not yet inspected; this function only owns delivery, rotation, the
-- once-per-item guard and the shared cooldown.
--
-- Once-per-item is a flag written directly onto the item's own mod data, the
-- same way GeneratedRuntime and ClueMarkers already tag items -- it survives
-- the item being dropped and picked back up, and a save/reload, without any
-- new persistent state of our own. Gated by the same cooldown as Set A: both
-- are ambient survivor musing, not the significant Set B/C revelation, so a
-- burst of loot in one trip should not produce a burst of either kind.
function V.onEvidenceFound(item)
    if not item then return end
    local p=player(); if not p then return end
    local ok,md=pcall(function() return item:getModData() end)
    if not ok or type(md)~="table" then log("evidence hint not delivered: item has no mod data") return end
    if md.cfVoiceHinted then log("evidence hint suppressed: already delivered for this item") return end
    local t=now()
    if t-lastSetAAt<COOLDOWN_MS then log("evidence hint suppressed by cooldown ("..(t-lastSetAAt).."ms)") return end
    lastSetAAt=t
    md.cfVoiceHinted=true
    indexD=indexD%#SET_D+1
    speak(p,SET_D[indexD])
end

-- Test/debug hook: reset rotation and cooldown state.
function V.reset() indexA,indexB,indexC,indexD,lastSetAAt=0,0,0,0,-1/0 end

return V
