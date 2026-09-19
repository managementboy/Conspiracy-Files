-- Player voice lines: the survivor thinks out loud when something happens in
-- their head - a person-key-door link (Set B, or Set C when no name is known),
-- records that agree or disagree, nothing left to find, an address from the
-- file, a pile, a body. Noting evidence says nothing any more (Set A removed,
-- P4-R132 stage 2): the progress bar and the item changing say it. Exact
-- wording and delivery rules live in docs/design/PLAYER_VOICE.md -- lines are
-- used verbatim, never reworded.
--
-- Delivery: Say() speech bubble, setHaloNote with
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
-- Set E: a document the player just found disagrees with, or backs up, one
-- they already had. This is the centre of an investigation and the mod used to
-- pass it in silence.
--
-- The survivor NEVER says which record is true. "They do not match" is a fact
-- about two records; "someone is lying" is a conclusion, and the whole
-- discipline of this project is that a lead is never proof.
local SET_E_DISPUTE={
    "This doesn't match what the other one said.",
    "Hold on - the other copy says something else entirely.",
    "One of these is wrong. I can't tell which.",
    "These two don't agree, and both of them are signed.",
}
local SET_E_AGREE={
    "That fits with the other one.",
    "Same story as the first copy. That's something.",
    "Two records, and they agree for once.",
}
-- Set F: every document of a case has been found. Not "solved" - the mod does
-- not know that and never will. Only that there is nothing further to find.
local SET_F={
    "That's all of it, I think.",
    "I don't think there's any more of this one.",
    "That's the last of the paperwork.",
}
--- Set F, the other ending: the case finished with a clue it never had
--- (DR-20260919-SOLVABLE-WITHDRAWN). Set F above is hedged but still says the
--- paperwork is complete, and over a case that was never fully placed that is
--- the mod claiming an ending it did not deliver.
---
--- These say the survivor did not get everything, and nothing more. Never that
--- a document was lost, taken or destroyed: nothing here knows any document's
--- fate and no line may invent one (P4-R104). That holds for both histories a
--- gap can have - a clue that never found a container and so was never in the
--- world, and one that was placed on a carrier that then went away - which is
--- why the wording is about the survivor's reach and says nothing about where
--- the paper went.
local SET_F_GAP={
    "That's all I could get hold of.",
    "Some of this never turned up.",
    "There's a piece of this I never found.",
}
local indexFGap=0
--- Set F, the third ending: the case ended without evidence its CONCLUSION
--- rests on (DR-20260919-GAP-NOT-PROGRESSION, OPENING_PAIR_COMPLETION.md).
--- Distinct from Set F_GAP, which is for a case that merely lost a
--- corroborating scrap and still reached its payoff.
---
--- These say the investigation is not finished - because it is not. They do not
--- claim a document was lost, taken or destroyed, and they never invite the
--- closing question: there is nothing to make of it yet.
local SET_F_OPEN={
    "I never got the part that mattered.",
    "There's a hole in the middle of this one.",
    "I can't say what this was. Not yet.",
}
local indexFOpen=0
-- Set G: the player has walked into a building an earlier document named.
-- Fires on ARRIVAL and never before: said a moment early it is a quest marker,
-- said on the doorstep it is recognition.
local SET_G={
    "This is the address from the file.",
    "So this is the place the paperwork meant.",
    "I've read this address somewhere. Here it is.",
}
-- Set H: far too many of one ordinary thing in one place.
local SET_H={
    "Why would anyone need this many?",
    "That is a lot of the same thing.",
    "Nobody keeps this many by accident.",
}
-- Set I: a body somewhere a body has no business being.
local SET_I={
    "God. Someone put a body in here.",
    "There's a person in here. Someone put them here.",
    "That's a body. In here.",
}
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

-- setHaloNote is the only halo API that takes a duration; 900 was established
-- (for the old clue hints) as a readable value for a short line of speech.
local HALO_DURATION=900
-- UI channel only. playUISound never reaches the world sound manager, so it
-- cannot attract zombies.
local VOICE_SOUND="UIObjectMenuEnter"
-- A burst of looting must not produce a burst of chatter. This gates Set D
-- only: Set B/C is the more significant event and must never be suppressed.
local COOLDOWN_MS=45000

local indexE,indexF,indexG,indexH,indexI=0,0,0,0,0
local indexB,indexC,indexD=0,0,0
local lastMusingAt=-1/0

local function now()
    if not getTimeInMillis then return 0 end
    local ok,t=pcall(getTimeInMillis)
    return (ok and type(t)=="number") and t or 0
end

-- Plain substring replace, not gsub: an observed name is player-facing text
-- we do not control, and gsub's replacement string treats "%" specially.
local function fill(template,slot,value)
    local i,j=template:find(slot,1,true)
    if not i then return template end
    return template:sub(1,i-1)..value..template:sub(j+1)
end
local function withName(template,name) return fill(template,"<name>",name) end

-- A line the player misses and a line that never fired look identical unless
-- delivery is logged. That cost an hour on clue hints; do not repeat it.
local CFLog=require("ConspiracyFiles/Log")
local function log(message) CFLog.message("voice","voice",message) end
-- Two visual channels, two different strings. Owner, 2026-09-10: "some
-- messages on top of the player repeated once in colour once in white" - which
-- they did, because Say and setHaloNote were both handed the same sentence.
-- Swapped round (owner, Windows, 2026-09-14: "switch arround the speach text.
-- colored and white. it makes more sence"): the white halo carries the
-- survivor's words and holds the longer display; the coloured bubble carries
-- the fact, in as few words as will fit.
local function deliver(player,text,label)
    -- Call engine methods with colon syntax, the way vanilla does.
    -- pcall(obj.method, obj, ...) extracts the method first; Kahlua treats that
    -- differently from a real method call, and pcall then hides any complaint, so
    -- a true result can mean 'did not throw' rather than 'worked'.
    local halo=false
    if player.setHaloNote then
        halo=pcall(function() player:setHaloNote(text,255,255,255,HALO_DURATION) end)
    end
    -- A player object with no halo still gets the words, in the bubble.
    if player.Say then pcall(function() player:Say(halo and label or text) end) end
    local audible=false
    if getSoundManager then
        local ok,manager=pcall(getSoundManager)
        if ok and manager and manager.playUISound then audible=pcall(function() manager:playUISound(VOICE_SOUND) end) end
    end
    log("said \""..tostring(text).."\" halo="..tostring(halo).."("..tostring(label)..") sound="..tostring(audible))
    return halo,audible
end

-- Lines that fire together are SHOWN one after another. Inspecting a single
-- document can announce the discovery, a disagreement and a pile in the same
-- instant, and each Say replaced the bubble before it, so two of the three
-- vanished before they could be read (owner, Windows, 2026-09-14: "disappears
-- super fast. I cant read that fast"). Each line now holds the space long
-- enough to read it, and the next one waits. Bounded, so a burst never becomes
-- minutes of chatter.
-- V.HOLD_MS overrides the hold; the content tests set 0 to deliver at once.
local QUEUE_MAX=4
local queue={}
local lastSpokenAt,lastHold=-1/0,0
local function holdFor(text) return math.max(3000,1500+60*#tostring(text)) end
local function speak(player,text,label,priority)
    if not player then log("no player; line not delivered") return false,false end
    assert(type(label)=="string" and label~="" and label~=text,
        "the halo must say something other than the spoken line, or it echoes it")
    local t=now()
    if #queue==0 and t-lastSpokenAt>=(V.HOLD_MS or lastHold) then
        lastSpokenAt,lastHold=t,holdFor(text)
        return deliver(player,text,label)
    end
    if #queue>=QUEUE_MAX then
        -- A case's closing words must not be lost behind a busy moment
        -- (campaign check, 2026-09-15: "What do I make of it?" was never said
        -- after a case whose last evidence brought connections and a pile). They
        -- push out the oldest ordinary line waiting instead.
        local room
        if priority then for i,q in ipairs(queue) do if not q.priority then room=i; break end end end
        if not room then
            log("line dropped, "..QUEUE_MAX.." already waiting: \""..tostring(text).."\"")
            return false,false
        end
        log("line dropped for a case's closing words: \""..tostring(queue[room].text).."\"")
        table.remove(queue,room)
    end
    queue[#queue+1]={text=text,label=label,priority=priority}
    log("queued \""..tostring(text).."\" behind "..(#queue-1).." waiting line(s)")
    return false,false
end

local function player()
    if not getPlayer then return nil end
    local ok,p=pcall(getPlayer)
    return ok and p or nil
end

-- Every tick: the next waiting line, once the one showing has had its time.
-- A line waiting while there is no player stays queued rather than lost.
function V.drain()
    if #queue==0 then return end
    local t=now()
    if t-lastSpokenAt<(V.HOLD_MS or lastHold) then return end
    local p=player(); if not p then return end
    local nextLine=table.remove(queue,1)
    lastSpokenAt,lastHold=t,holdFor(nextLine.text)
    deliver(p,nextLine.text,nextLine.label)
end
if Events and Events.OnTick and Events.OnTick.Add then Events.OnTick.Add(V.drain) end

-- Set A is gone (P4-R132, stage 2): noting evidence is a timed action with the
-- game's progress bar, and the item changing says it was noted. The hook stays
-- so DiscoveryLog's call is still a known, logged place, but nothing is said.
function V.onDiscovery(kind,reference)
    log("discovery "..tostring(kind).." "..tostring(reference).."; nothing said")
end

-- Set B/C: a real key looted from a body opened a door. Never gated by the
-- Set D cooldown -- this is the more significant event. `sourceToken` is the
-- corpse/wallet provenance token; a name is used only when PersonNameLog
-- already associated one with that exact token. Never invents a name.
function V.onKeyDoorLink(sourceToken)
    local p=player(); if not p then return end
    local names=ConspiracyFiles.PersonNameLog
    local ok,name=false,nil
    if names and names.nameFor then ok,name=pcall(names.nameFor,sourceToken) end
    if ok and type(name)=="string" and name~="" then
        indexB=indexB%#SET_B+1
        speak(p,withName(SET_B[indexB],name),"Key matches this door")
    else
        indexC=indexC%#SET_C+1
        speak(p,SET_C[indexC],"Key matches this door")
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
-- new persistent state of our own. Gated by a cooldown (it shared Set A's
-- until Set A was removed): ambient musing, not the significant Set B/C
-- revelation, so a burst of loot in one trip gives at most one line. Only for
-- a clue already recognised (EvidencePickupHint, P4-R132).
function V.onEvidenceFound(item)
    if not item then return end
    local p=player(); if not p then return end
    local ok,md=pcall(function() return item:getModData() end)
    if not ok or type(md)~="table" then log("evidence hint not delivered: item has no mod data") return end
    if md.cfVoiceHinted then log("evidence hint suppressed: already delivered for this item") return end
    local t=now()
    if t-lastMusingAt<COOLDOWN_MS then log("evidence hint suppressed by cooldown ("..(t-lastMusingAt).."ms)") return end
    lastMusingAt=t
    md.cfVoiceHinted=true
    indexD=indexD%#SET_D+1
    speak(p,SET_D[indexD],"Unread")
end

-- Everything below fires only when the player learns something they could not
-- have known a second earlier. That is the rule that keeps a mod with nine
-- voice triggers from becoming a mod that natters, and it rules out ambient
-- observation entirely: walking past a marker, opening the organiser and
-- reading a page all stay silent.
--
-- Each is gated on its own once-per-thing flag rather than on the shared
-- cooldown, because none of them can repeat: a case retires once, a connection
-- is new once, an address is arrived at once per case.
local said={}
local function once(key)
    if said[key] then return false end
    said[key]=true
    return true
end

-- Set E: a newly found document connects to one already held.
-- `kind` is the connection's own kind, as recorded on the document.
function V.onConnection(kind,documentId)
    local p=player(); if not p then return end
    if not once("link:"..tostring(documentId)) then return end
    if kind=="disputes-delivery" then
        indexE=indexE%#SET_E_DISPUTE+1
        speak(p,SET_E_DISPUTE[indexE],"Two records disagree")
    else
        indexE=indexE%#SET_E_AGREE+1
        speak(p,SET_E_AGREE[indexE],"Records agree")
    end
end

-- Set F: the last document of a case has been found.
-- `gaps` is the number of the case's clues that were never placed and so never
-- found (Session.gaps). Zero, nil or absent keeps the original wording exactly,
-- so a case that delivered everything reads as it always did.
function V.onCaseComplete(caseId,gaps)
    local p=player(); if not p then return end
    if not once("done:"..tostring(caseId)) then return end
    if type(gaps)=="number" and gaps>0 then
        indexFGap=indexFGap%#SET_F_GAP+1
        speak(p,SET_F_GAP[indexFGap],"Something in this was never found",true)
    else
        indexF=indexF%#SET_F+1
        speak(p,SET_F[indexF],"Nothing left to find here",true)
    end
    -- A moment later, a second thought (P4-R113, P4-R122): the question the
    -- organiser's FILES now holds. It waits in the queue behind the first line;
    -- the organiser never opens by itself. Both are the case's closing words and
    -- are never dropped from a full queue.
    speak(p,"What do I make of it?","A question for the organiser",true)
end

--- The case is accounted for but never had the evidence its conclusion rests
--- on. No second thought follows: "What do I make of it?" over a case with a
--- hole in it would present an unfinished investigation as a finished one.
function V.onCaseIncomplete(caseId,essential)
    local p=player(); if not p then return end
    if not once("incomplete:"..tostring(caseId)) then return end
    indexFOpen=indexFOpen%#SET_F_OPEN+1
    speak(p,SET_F_OPEN[indexFOpen],"Missing what this rested on",true)
end

-- Set G: arrival at a building an earlier document named. The caller owns
-- "has the player actually arrived"; this owns only delivery and once-ness.
function V.onNamedPlace(buildingId)
    local p=player(); if not p then return end
    if not once("place:"..tostring(buildingId)) then return end
    indexG=indexG%#SET_G+1
    speak(p,SET_G[indexG],"Named in the file")
end

-- Set H: a pile. `where` is whatever identifies the container, so one cupboard
-- speaks once however many times it is opened.
function V.onPile(where)
    local p=player(); if not p then return end
    if not once("pile:"..tostring(where)) then return end
    indexH=indexH%#SET_H+1
    speak(p,SET_H[indexH],"Far too many")
end

-- Set I: a body somewhere a body should not be.
function V.onBody(where)
    local p=player(); if not p then return end
    if not once("body:"..tostring(where)) then return end
    indexI=indexI%#SET_I+1
    speak(p,SET_I[indexI],"A body")
end

-- Test/debug hook: reset rotation and cooldown state.
function V.reset()
    indexB,indexC,indexD,lastMusingAt=0,0,0,-1/0
    indexE,indexF,indexG,indexH,indexI=0,0,0,0,0
    said={}
    queue={}; lastSpokenAt,lastHold=-1/0,0
end

return V
