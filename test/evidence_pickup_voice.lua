-- Player voice Set D: the survivor points at reading evidence properly the
-- first time an uninspected generated-evidence item settles into the
-- inventory. See docs/design/UI_POLISH_PROPOSALS.md #8,
-- docs/design/PLAYER_VOICE.md and the delivery rules PlayerVoice.lua already
-- follows for Set A/B/C.
--
-- Covers both halves of the feature: PlayerVoice.onEvidenceFound (rotation,
-- once-per-item, cooldown, delivery) and EvidencePickupHint (the gate that
-- decides a call is warranted at all, wired onto the same engine entry
-- points ClueMarkers and LocalPersonHooks already wrap).
--
-- Engine doubles demand a receiver, exactly like Kahlua does for a real Java
-- method -- see test/player_voice.lua and test/reachability_gate.lua for the
-- same discipline.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

local says,haloNotes,uiSounds={},{},{}
local clock=0
getTimeInMillis=function() return clock end

local function receiverFor(owner)
    return function(self,name)
        assert(self==owner,name..": engine methods need a receiver; call it as owner:"..name.."(), not owner."..name.."()")
    end
end

local player,playerReceiver
player={
    Say=function(self,text) playerReceiver(self,"Say"); says[#says+1]=text end,
    setHaloNote=function(self,text,r,g,b,duration)
        playerReceiver(self,"setHaloNote")
        haloNotes[#haloNotes+1]={text=text,duration=duration}
    end,
    getInventory=function(self) playerReceiver(self,"getInventory"); return player.inv end,
}
playerReceiver=receiverFor(player)
player.inv={}
getPlayer=function() return player end

local manager,managerReceiver
manager={playUISound=function(self,name) managerReceiver(self,"playUISound"); uiSounds[#uiSounds+1]=name end}
managerReceiver=receiverFor(manager)
getSoundManager=function() return manager end

Events={OnGameStart={Add=function() end}}

ConspiracyFiles={}
local Voice=dofile("mod/common/media/lua/client/ConspiracyFiles/PlayerVoice.lua")
ConspiracyFiles.PlayerVoice=Voice

-- Fake GeneratedRuntime: a per-item registry standing in for real
-- session/assignment lookups. subject=false (the default, i.e. no entry) is
-- exactly what an ordinary loot item looks like: R.subject returns false
-- because it carries no cfGeneratedId at all.
local registry={}
local Runtime={
    subject=function(item) local e=registry[item]; return e~=nil and e.subject==true end,
    isInspected=function(item) local e=registry[item]; return e~=nil and e.inspected==true end,
}
ConspiracyFiles.GeneratedRuntime=Runtime

local transferCalls,grabCalls,performCalls=0,0,0
ISTransferAction={transferItem=function(self,character,item,source,destination,...)
    transferCalls=transferCalls+1
    item.outer=player.inv
    return item
end}
ISGrabItemAction={transferItem=function(self,worldItem,...)
    grabCalls=grabCalls+1
    local item=worldItem:getItem()
    item.outer=player.inv
end}
ISInventoryTransferAction={perform=function(action,...)
    performCalls=performCalls+1
    action.item.outer=player.inv
    return "transfer-result"
end}
for _,name in ipairs({"TimedActions/ISTransferAction","TimedActions/ISGrabItemAction","TimedActions/ISInventoryTransferAction"}) do
    package.preload[name]=({
        ["TimedActions/ISTransferAction"]=function() return ISTransferAction end,
        ["TimedActions/ISGrabItemAction"]=function() return ISGrabItemAction end,
        ["TimedActions/ISInventoryTransferAction"]=function() return ISInventoryTransferAction end,
    })[name]
end

local Hook=dofile("mod/common/media/lua/client/ConspiracyFiles/EvidencePickupHint.lua")
ConspiracyFiles.EvidencePickupHint=Hook

local nextId=0
local function makeItem(subject,inspected)
    nextId=nextId+1
    local item={md={},outer=false} -- starts outside the player's inventory
    item.getModData=function(self) return self.md end
    item.getOutermostContainer=function(self) return self.outer end
    if subject~=nil then registry[item]={subject=subject,inspected=inspected==true} end
    return item
end

-- ---------------------------------------------------------------------
-- Fires for uninspected generated evidence entering the inventory.
-- ---------------------------------------------------------------------
local a=makeItem(true,false)
ISTransferAction.transferItem(nil,player,a,{},{})
assert(#says==1,"must speak once for uninspected generated evidence")
assert(a.md.cfVoiceHinted==true,"item must be flagged once hinted")

-- ---------------------------------------------------------------------
-- Does NOT fire for ordinary loot (no cfGeneratedId at all -> R.subject
-- reports false).
-- ---------------------------------------------------------------------
clock=clock+60000
local loot=makeItem(nil)
ISTransferAction.transferItem(nil,player,loot,{},{})
assert(#says==1,"ordinary loot must never trigger the evidence hint")

-- ---------------------------------------------------------------------
-- Does NOT fire for an already-inspected item.
-- ---------------------------------------------------------------------
clock=clock+60000
local read=makeItem(true,true)
ISTransferAction.transferItem(nil,player,read,{},{})
assert(#says==1,"an already-inspected item must never trigger the hint")
assert(not read.md.cfVoiceHinted,"an inspected item is never flagged, since it was never hinted")

-- ---------------------------------------------------------------------
-- Fires only once for the same item, even picked up repeatedly.
-- ---------------------------------------------------------------------
clock=clock+60000
ISTransferAction.transferItem(nil,player,a,{},{}) -- item `a` again
assert(#says==1,"the same item must never speak a second time")

-- ---------------------------------------------------------------------
-- Cooldown prevents a burst when several evidence items are looted together.
-- ---------------------------------------------------------------------
clock=clock+60000
local b1=makeItem(true,false)
local b2=makeItem(true,false)
local before=#says
ISTransferAction.transferItem(nil,player,b1,{},{})
assert(#says==before+1,"the first evidence item in the batch must speak")
ISTransferAction.transferItem(nil,player,b2,{},{})
assert(#says==before+1,"a second evidence item looted moments later must be suppressed by the cooldown")
assert(not b2.md.cfVoiceHinted,"an item suppressed by the cooldown is not consumed -- it can still speak once the cooldown clears")
clock=clock+45000
ISTransferAction.transferItem(nil,player,b2,{},{})
assert(#says==before+2,"once the cooldown elapses, a still-uninspected item can speak")

-- ---------------------------------------------------------------------
-- Every Set D line reachable, and never repeated back to back.
-- ---------------------------------------------------------------------
Voice.reset(); says={}
local SET_D_COUNT=8
local seenD,previous={},nil
for i=1,40 do
    clock=clock+60000
    local item=makeItem(true,false)
    ISTransferAction.transferItem(nil,player,item,{},{})
    assert(#says==1,"exactly one line once the cooldown has cleared")
    local line=says[1]
    seenD[line]=true
    assert(line~=previous,"must never repeat the previous line twice running")
    previous=line
    says={}
end
local distinctD=0
for _ in pairs(seenD) do distinctD=distinctD+1 end
assert(distinctD==SET_D_COUNT,"every Set D line must be reachable, got "..distinctD)

-- ---------------------------------------------------------------------
-- Delivery channel: halo note carries the same explicit duration, UI-channel
-- sound only, exactly like Set A/B/C.
-- ---------------------------------------------------------------------
Voice.reset(); says={}; haloNotes={}; uiSounds={}
clock=clock+60000
local halo=makeItem(true,false)
ISTransferAction.transferItem(nil,player,halo,{},{})
-- Two channels, two strings (owner, 2026-09-10: "some messages on top of the
-- player repeated once in colour once in white"). The bubble carries the
-- survivor's line; the halo carries the fact in as few words as fit above a
-- head. This assertion used to demand the opposite - it pinned the echo - so
-- it is inverted deliberately, not relaxed.
assert(#haloNotes==1,"one halo note per line")
assert(haloNotes[1].text~=says[1],"the halo must not repeat the spoken line")
assert(haloNotes[1].text=="Unread","unread evidence in hand is stated, not wondered about")
assert(type(haloNotes[1].duration)=="number" and haloNotes[1].duration>=300,
    "the halo note must carry an explicit, generous duration")
assert(#uiSounds==1,"exactly one UI-channel sound per spoken line")

-- ---------------------------------------------------------------------
-- The other two hook points (world pickup, UI drag-transfer) reach the same
-- gate -- EvidencePickupHint follows ClueMarkers/LocalPersonHooks, it does
-- not invent a third path that only some pickups go through.
-- ---------------------------------------------------------------------
Voice.reset(); says={}
clock=clock+60000
local grabbed=makeItem(true,false)
local worldItem={getItem=function() return grabbed end}
ISGrabItemAction.transferItem({character=player},worldItem)
assert(#says==1,"a world pickup via ISGrabItemAction must reach the same hint")

clock=clock+60000
local dragged=makeItem(true,false)
local action={character=player,item=dragged}
ISInventoryTransferAction.perform(action)
assert(#says==2,"a UI drag-transfer via ISInventoryTransferAction must reach the same hint")

-- ---------------------------------------------------------------------
-- Degrades to silence, never throws, when the item never actually arrives in
-- the player's inventory (still mid-transfer, or moved somewhere else).
-- ---------------------------------------------------------------------
clock=clock+60000
local elsewhere=makeItem(true,false)
elsewhere.outer={} -- some other container, not the player's inventory
-- Called directly (not through the transferItem mock, which unconditionally
-- relocates the item): this exercises the gate itself, for an item whose
-- transfer never actually landed it in the player's inventory.
local ok=pcall(Hook.consider,player,elsewhere)
assert(ok and #says==2,"an item that never reaches the player's inventory must not speak")

print("PASS evidence pickup voice: Set D reachable with no immediate repeats, fires only for uninspected generated evidence, never for ordinary loot or inspected items, once per item, cooldown gates a burst, all three pickup/transfer hook points reach it")
