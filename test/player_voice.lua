-- Player voice lines: Set A (removed, P4-R132 stage 2: noting says nothing),
-- Set B/C (person-key-door link). See docs/design/PLAYER_VOICE.md for the exact
-- wording this test checks verbatim.
--
-- Engine doubles below demand a receiver, exactly like Kahlua does for a real
-- Java method: a plain-table mock that tolerates player.Say(text) as well as
-- player:Say(text) would let a receiver-less call pass here and then throw on
-- the first real player in game. See test/reachability_gate.lua for the same
-- discipline.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

local says,haloNotes,uiSounds,otherSounds={},{},{},{}
local clock=0
getTimeInMillis=function() return clock end

-- receiverFor(owner) builds a check bound to that specific mock object, so a
-- call landing on the wrong receiver (or none at all, Lua's plain function
-- form) is caught exactly like Kahlua would refuse it.
local function receiverFor(owner)
    return function(self,name)
        assert(self==owner,name..": engine methods need a receiver; call it as owner:"..name.."(), not owner."..name.."()")
    end
end

local player
local playerReceiver
player={
    Say=function(self,text) playerReceiver(self,"Say"); says[#says+1]=text end,
    setHaloNote=function(self,text,r,g,b,duration)
        playerReceiver(self,"setHaloNote")
        haloNotes[#haloNotes+1]={text=text,r=r,g=g,b=b,duration=duration}
    end,
}
playerReceiver=receiverFor(player)
getPlayer=function() return player end

local manager
local managerReceiver
manager={
    playUISound=function(self,name) managerReceiver(self,"playUISound"); uiSounds[#uiSounds+1]=name end,
    -- Present so a bug that reaches for a zombie-attracting API is caught
    -- immediately rather than silently doing nothing.
    playSound=function(self,name) managerReceiver(self,"playSound"); otherSounds[#otherSounds+1]=name end,
}
managerReceiver=receiverFor(manager)
getSoundManager=function() return manager end

-- No world-sound/emitter globals exist at all: if PlayerVoice ever reached
-- for getWorld():getSound(...), addSound(...) or character:playSound(...) it
-- would throw here (`attempt to call a nil value`) instead of silently
-- attracting zombies.
ConspiracyFiles={}
local Voice=dofile("mod/common/media/lua/client/ConspiracyFiles/PlayerVoice.lua")
-- Lines are paced one after another in play; test/voice_pacing.lua pins that.
-- This file pins wording, rotation and gating, so it hears every line at once.
Voice.HOLD_MS=0

-- ---------------------------------------------------------------------
-- Set A is gone (P4-R132, stage 2): a new discovery says nothing at all - no
-- bubble, no halo, no sound. The progress bar and the item changing say it.
-- ---------------------------------------------------------------------
for i=1,12 do
    clock=clock+60000
    Voice.onDiscovery("evidence","doc-"..i)
    Voice.onDiscovery("identity","identity:"..i)
    Voice.onDiscovery("connection","observedKeyLead:door:"..i)
end
assert(#says==0 and #haloNotes==0 and #uiSounds==0,"noting evidence must say nothing, got "..#says.." lines")
for _,gone in ipairs({"SET_A","describe","Noted"}) do
    local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/PlayerVoice.lua","r")); local src=f:read("*a"); f:close()
    assert(not src:find(gone,1,true),"Set A's lines and naming are removed, found "..gone)
end

-- ---------------------------------------------------------------------
-- Set B: a name observed on a document with the body is used verbatim.
-- ---------------------------------------------------------------------
Voice.reset(); says={}; haloNotes={}; uiSounds={}
ConspiracyFiles.PersonNameLog={nameFor=function(token) if token=="corpse-item:1" then return "Dana Vale" end end}
local SET_B_COUNT=8
local seenB,previousB={},nil
for i=1,24 do
    Voice.onKeyDoorLink("corpse-item:1")
    local line=haloNotes[#haloNotes].text
    assert(line:find("Dana Vale",1,true),"Set B must speak the observed name verbatim: "..line)
    assert(not line:find("<name>",1,true),"the <name> placeholder must always be substituted")
    assert(line~=previousB,"Set B must never repeat the previous line twice running")
    previousB=line
    seenB[line]=true
end
local distinctB=0
for _ in pairs(seenB) do distinctB=distinctB+1 end
assert(distinctB==SET_B_COUNT,"every Set B line must be reachable, got "..distinctB)

-- ---------------------------------------------------------------------
-- Set C: no name known falls back, and no name is ever fabricated even
-- when OTHER tokens are known.
-- ---------------------------------------------------------------------
Voice.reset(); says={}
local SET_C_COUNT=4
local seenC,previousC={},nil
for i=1,16 do
    Voice.onKeyDoorLink("corpse-item:unknown-"..i)
    local line=haloNotes[#haloNotes].text
    for _,forbidden in ipairs({"Dana Vale","<name>"}) do
        assert(not line:find(forbidden,1,true),"Set C must never fabricate or leak a name: "..line)
    end
    assert(line~=previousC,"Set C must never repeat the previous line twice running")
    previousC=line
    seenC[line]=true
end
local distinctC=0
for _ in pairs(seenC) do distinctC=distinctC+1 end
assert(distinctC==SET_C_COUNT,"every Set C line must be reachable, got "..distinctC)

-- A name lookup that itself misbehaves (throws, or returns a non-string)
-- must still fall back to Set C rather than erroring or fabricating a name.
Voice.reset(); says={}
ConspiracyFiles.PersonNameLog={nameFor=function() error("boom") end}
Voice.onKeyDoorLink("corpse-item:1")
assert(#says==1,"a misbehaving name lookup must not prevent the link line from speaking")
ConspiracyFiles.PersonNameLog={nameFor=function() return "" end}
Voice.onKeyDoorLink("corpse-item:1")
assert(not haloNotes[#haloNotes].text:find("<name>",1,true) and not haloNotes[#haloNotes].text:find("'s key",1,true),"an empty name must fall back to Set C, not speak a blank name")
ConspiracyFiles.PersonNameLog=nil
Voice.onKeyDoorLink("corpse-item:1")
assert(#says==3,"a missing PersonNameLog module must degrade to Set C, not throw")

-- ---------------------------------------------------------------------
-- The link line is the more significant event: it must NOT be suppressed by
-- a Set D line that just fired (and just consumed the musing cooldown).
-- ---------------------------------------------------------------------
Voice.reset(); says={}
ConspiracyFiles.PersonNameLog={nameFor=function() return "Dana Vale" end}
clock=clock+60000
local evidence={md={}}; function evidence:getModData() return self.md end
Voice.onEvidenceFound(evidence) -- Set D fires, cooldown now active
assert(#says==1)
Voice.onKeyDoorLink("corpse-item:1") -- fired moments later, must still speak
assert(#says==2,"the link line must not be suppressed by a Set D line fired moments earlier")
assert(haloNotes[#haloNotes].text:find("Dana Vale",1,true))
-- And repeating the link back-to-back (still within the cooldown) keeps
-- speaking too -- Set B/C carries no cooldown of its own.
Voice.onKeyDoorLink("corpse-item:1")
assert(#says==3,"Set B/C is never gated by the Set D cooldown")

-- The first paper already on the survivor is its own one-time event. It asks
-- the opening question immediately, persists on the item, and consumes the
-- ordinary unread-pickup hint so the two lines never overlap.
Voice.reset(); says={}; haloNotes={}
local opening={md={}}; function opening:getModData() return self.md end
assert(Voice.onOpeningClue(opening)==true)
assert(opening.md.cfOpeningAnnounced==true and opening.md.cfVoiceHinted==true)
assert(haloNotes[#haloNotes].text=="This has my name on it. Why was I supposed to be here?")
assert(Voice.onOpeningClue(opening)==false and #says==1,"the persisted opening line is exactly once")
Voice.onEvidenceFound(opening)
assert(#says==1,"the normal pickup musing cannot follow the opening line")

-- ---------------------------------------------------------------------
-- Delivery channel: halo note carries an explicit duration, and the sound is
-- exclusively the UI channel -- never the world-sound/emitter path.
-- ---------------------------------------------------------------------
Voice.reset(); says={}; haloNotes={}; uiSounds={}; otherSounds={}
clock=clock+60000
Voice.onBody("halo-check")
-- Two channels, two strings (owner, 2026-09-10: "some messages on top of the
-- player repeated once in colour once in white"). The bubble carries the
-- survivor's line; the halo carries the fact in as few words as fit above a
-- head. This assertion used to demand the opposite - it pinned the echo - so
-- it is inverted deliberately, not relaxed.
assert(#haloNotes==1,"one halo note per line")
assert(haloNotes[1].text~=says[1],"the halo must not repeat the bubble")
-- Swapped round (owner, Windows, 2026-09-14): the survivor's words in white,
-- the tag in the coloured bubble, and the tag is what is read at a glance.
assert(#says[1]<=30,"the bubble's tag is read at a glance: "..says[1])
assert(type(haloNotes[1].duration)=="number" and haloNotes[1].duration>=300,
    "the halo note must carry an explicit, generous duration")
assert(#uiSounds==1,"exactly one UI-channel sound per spoken line")
assert(#otherSounds==0,"never a world-sound/emitter channel -- the survivor's thinking must not attract zombies")

Voice.onKeyDoorLink("corpse-item:1")
assert(#haloNotes==2 and #uiSounds==2 and #otherSounds==0,"the link line uses the same guarded UI-only delivery")

-- ---------------------------------------------------------------------
-- Every engine call degrades rather than throws when the receiver methods
-- are simply absent (a stripped-down/older player object, or setHaloNote
-- missing on some build).
-- ---------------------------------------------------------------------
Voice.reset(); says={}
local bareCalls=0
player={Say=function(self,text) assert(self==player,"Say needs an explicit receiver"); bareCalls=bareCalls+1; says[#says+1]=text end}
getSoundManager=nil
clock=clock+60000
local ok=pcall(Voice.onBody,"bare")
assert(ok and #says==1,"a player without setHaloNote/sound manager must still speak, not throw")
assert(says[1]~="A body","with no halo, the survivor's words go in the bubble rather than the tag")

print("PASS player voice: noting says nothing (Set A removed), every Set B/C line reachable, no immediate repeats, name never fabricated, link line escapes the Set D cooldown, halo duration and UI-only sound")

-- The defect this guards: Say and setHaloNote were both handed the same
-- sentence, so every line appeared twice above the player - once in the
-- bubble's colour, once in the halo's white. Reported in play, and it survived
-- because two tests asserted the echo rather than questioning it.
--
-- A source check as well as a behavioural one, because the behavioural test
-- only covers the paths it exercises and this defect was in every path.
local f = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/PlayerVoice.lua', 'r'))
local voice = f:read('*a'); f:close()
-- Swapped round on 2026-09-14: the words go in the halo and the tag in the bubble.
assert(voice:find('setHaloNote(text', 1, true),
    "the survivor's words go in the white halo")
assert(voice:find('Say(halo and label or text)', 1, true),
    'the bubble carries the tag, or the words when there is no halo')
assert(voice:find('label~=text', 1, true),
    'the split must be enforced at the call, not left to whoever adds the next line')
-- The wordless cue (which replaced the clue hints) has no halo at all: the
-- speech bubble only, never a name.
local g = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/ClueCue.lua', 'r'))
local cue = g:read('*a'); g:close()
assert(not cue:find('setHaloNote', 1, true) and not cue:find('HaloTextHelper', 1, true), 'the cue has no halo')
assert(cue:find('player:Say(line)', 1, true), 'the cue is said in the bubble')
print('PASS player voice: the bubble and the halo never say the same thing')
