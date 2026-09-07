-- Engine-facing outfit observation: LocalPersonIntegration.remember() reads
-- IsoDeadBody:getOutfitName() (colon call form -- AGENTS.md, "Engine call
-- form") and records it against the SAME provenance token PersonNameLog
-- already keys observations on. Engine doubles below demand a receiver, as
-- Kahlua does, so a call-form regression like the one AGENTS.md documents
-- (setHaloNote/playUISound, 2026-09-07) would fail this test instead of
-- shipping silently.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local strict=dofile('test/support/strict.lua')

local db,items={},{}
local activeContainer
local function item(kind,id,label)
    local md={}
    return {getFullType=function() return kind end,getID=function() return id end,
        getDisplayName=function() return label end,getModData=function() return md end,
        getContainer=function(self) return self.container end,
        getWorldItem=function() return nil end,
        getKeyId=function() return -1 end}
end
local function containerFor(body)
    return {getParent=function() return body end,
        getItems=function() return {size=function() return #items end,get=function(_,index) return items[index+1] end} end}
end

ModData={get=function(tag) return db[tag] end,getOrCreate=function(tag) db[tag]=db[tag] or {};return db[tag] end}
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
instanceof=function(object,class) return type(object)=="table" and object.class=="IsoDeadBody" and class=="IsoDeadBody" end
getPlayer=function() return {getX=function() return 0 end,getY=function() return 0 end,getZ=function() return 0 end,
    getInventory=function() return {} end,getModData=function() return {} end} end
getCell=function() return {getGridSquare=function() return nil end} end
InventoryItemFactory={CreateItem=function() error("no case binding needed for this test") end}
package.loaded['ConspiracyFiles/Generated/SuccessiveCases']={
    current=function() return nil end,
    sessions=function() return {} end}
ConspiracyFiles={GeneratedRuntime={metrics=function() return {} end,known=function() return {} end}}

local P=require('ConspiracyFiles/LocalPersonIntegration')
local Outfits=require('ConspiracyFiles/BodyOutfitLog')
local function tick() for _=1,30 do P.tick() end end

-- Two adjacent bodies: distinct provenance tokens, distinct engine doubles
-- that each demand their own receiver. Observing one must never leak its
-- outfit onto the other.
local bodyMDA,bodyMDB={},{}
local bodyA=strict.object("bodyA",{class="IsoDeadBody",getModData=function() return bodyMDA end,
    getOutfitName=function() return "PoliceStory" end})
local bodyB=strict.object("bodyB",{class="IsoDeadBody",getModData=function() return bodyMDB end,
    getOutfitName=function() return "JanitorFemale" end})
local containerA,containerB=containerFor(bodyA),containerFor(bodyB)

local shirtA=item("Base.Shirt",501,"Shirt");shirtA.container=containerA
items={shirtA};P.see(shirtA,containerA);tick()
assert(bodyMDA.cfObservedSource=="corpse-item:501")
assert(Outfits.outfitFor("corpse-item:501")=="PoliceStory")
assert(Outfits.outfitFor("corpse-item:502")==nil,"body B's token must not exist yet")

P.reset()
local shirtB=item("Base.Trousers",502,"Trousers");shirtB.container=containerB
items={shirtB};P.see(shirtB,containerB);tick()
assert(bodyMDB.cfObservedSource=="corpse-item:502")
assert(Outfits.outfitFor("corpse-item:502")=="JanitorFemale")
-- Body A's earlier observation is untouched by observing body B.
assert(Outfits.outfitFor("corpse-item:501")=="PoliceStory","adjacent bodies must keep separate outfits")

-- An unreadable outfit (the getter returns something that is not usable
-- text) degrades silently: nothing is recorded, and nothing else about the
-- body's observation is disrupted.
P.reset()
local bodyMDC={}
local bodyC=strict.object("bodyC",{class="IsoDeadBody",getModData=function() return bodyMDC end,
    getOutfitName=function() return "" end})
local containerC=containerFor(bodyC)
local shirtC=item("Base.Shirt",503,"Shirt");shirtC.container=containerC
items={shirtC};P.see(shirtC,containerC);tick()
assert(bodyMDC.cfObservedSource=="corpse-item:503","the body is still observed even without a usable outfit")
assert(Outfits.outfitFor("corpse-item:503")==nil,"an unreadable outfit is recorded as nothing, never guessed")

-- An absent getOutfitName (older/odd body descriptor) degrades the same way:
-- read() finds no method at all and returns nil rather than erroring.
P.reset()
local bodyMDD={}
local bodyD=strict.object("bodyD",{class="IsoDeadBody",getModData=function() return bodyMDD end})
local containerD=containerFor(bodyD)
local shirtD=item("Base.Shirt",504,"Shirt");shirtD.container=containerD
items={shirtD};P.see(shirtD,containerD);tick()
assert(bodyMDD.cfObservedSource=="corpse-item:504")
assert(Outfits.outfitFor("corpse-item:504")==nil,"an absent getter is recorded as nothing, never guessed")

-- A contradictory outfit reading for an already-settled token is refused at
-- the store, not overwritten -- exercised directly since a real corpse's
-- outfit cannot actually change mid-game.
assert(Outfits.record("corpse-item:501","PoliceStory")==true,"re-recording the same outfit is not a contradiction")
assert(Outfits.record("corpse-item:501","JanitorFemale")==false,"a disagreeing outfit for the same token is refused")
assert(Outfits.outfitFor("corpse-item:501")=="PoliceStory","the refusal must not overwrite the settled observation")

print("PASS body outfit log: engine receiver form, adjacent-body separation, unreadable/absent degrade silently, contradiction refused")
