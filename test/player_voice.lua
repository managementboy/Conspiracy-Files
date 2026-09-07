-- Player voice lines: Set A (journal entry added), Set B/C (person-key-door
-- link). See docs/design/PLAYER_VOICE.md for the exact wording this test
-- checks verbatim, and ClueHints.announce for the delivery pattern.
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

-- ---------------------------------------------------------------------
-- Set A: every line reachable, never repeated back to back.
-- ---------------------------------------------------------------------
local SET_A_COUNT=10
local seenA={}
local previous
for i=1,40 do
    clock=clock+60000 -- clear the cooldown every time, isolating rotation
    local before=#says
    Voice.onDiscovery("evidence","doc-"..i)
    assert(#says==before+1,"Set A must speak once cooldown has cleared")
    local line=says[#says]
    seenA[line]=true
    assert(line~=previous,"must never repeat the previous line twice running")
    previous=line
end
local distinctA=0
for _ in pairs(seenA) do distinctA=distinctA+1 end
assert(distinctA==SET_A_COUNT,"every Set A line must be reachable, got "..distinctA)

-- ---------------------------------------------------------------------
-- Cooldown: a burst of Set A discoveries does not produce a burst of chatter.
-- ---------------------------------------------------------------------
Voice.reset(); says={}
clock=clock+60000
Voice.onDiscovery("evidence","burst-0") -- primes the cooldown
local burstStart=#says
for i=1,10 do Voice.onDiscovery("evidence","burst-"..i) end
assert(#says==burstStart,"a burst of Set A triggers within the cooldown window must not add chatter, got "..(#says-burstStart).." extra lines")
clock=clock+45000
Voice.onDiscovery("evidence","burst-after")
assert(#says==burstStart+1,"once the cooldown elapses, Set A must speak again")

-- ---------------------------------------------------------------------
-- Set B: a name observed on a document with the body is used verbatim.
-- ---------------------------------------------------------------------
Voice.reset(); says={}; haloNotes={}; uiSounds={}
ConspiracyFiles.PersonNameLog={nameFor=function(token) if token=="corpse-item:1" then return "Dana Vale" end end}
local SET_B_COUNT=8
local seenB,previousB={},nil
for i=1,24 do
    Voice.onKeyDoorLink("corpse-item:1")
    local line=says[#says]
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
    local line=says[#says]
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
assert(not says[#says]:find("<name>",1,true) and not says[#says]:find("'s key",1,true),"an empty name must fall back to Set C, not speak a blank name")
ConspiracyFiles.PersonNameLog=nil
Voice.onKeyDoorLink("corpse-item:1")
assert(#says==3,"a missing PersonNameLog module must degrade to Set C, not throw")

-- ---------------------------------------------------------------------
-- The link line is the more significant event: it must NOT be suppressed by
-- a Set A line that just fired (and just consumed the Set A cooldown).
-- ---------------------------------------------------------------------
Voice.reset(); says={}
ConspiracyFiles.PersonNameLog={nameFor=function() return "Dana Vale" end}
clock=clock+60000
Voice.onDiscovery("connection","observedKeyLead:door:corpse-item:1") -- Set A fires, cooldown now active
assert(#says==1)
Voice.onKeyDoorLink("corpse-item:1") -- fired moments later, must still speak
assert(#says==2,"the link line must not be suppressed by a Set A line fired moments earlier")
assert(says[2]:find("Dana Vale",1,true))
-- And repeating the link back-to-back (still within the Set A cooldown)
-- keeps speaking too -- Set B/C carries no cooldown of its own.
Voice.onKeyDoorLink("corpse-item:1")
assert(#says==3,"Set B/C is never gated by the Set A cooldown")

-- ---------------------------------------------------------------------
-- Delivery channel: halo note carries an explicit duration, and the sound is
-- exclusively the UI channel -- never the world-sound/emitter path.
-- ---------------------------------------------------------------------
Voice.reset(); says={}; haloNotes={}; uiSounds={}; otherSounds={}
clock=clock+60000
Voice.onDiscovery("evidence","halo-check")
assert(#haloNotes==1 and haloNotes[1].text==says[1],"the halo note must repeat the spoken line")
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
local ok=pcall(Voice.onDiscovery,"evidence","bare")
assert(ok and #says==1,"a player without setHaloNote/sound manager must still speak, not throw")

print("PASS player voice: every Set A/B/C line reachable, no immediate repeats, name never fabricated, cooldown gates Set A only, link line escapes it, halo duration and UI-only sound")
