-- CLUES ON THE MOVE (P4-R134, docs/design/CLUES_ON_THE_MOVE.md).
--
-- A carrier is a BODY the world already put there: something that can hold a
-- clue and need not stay where it was found. Two rules govern everything here.
--
-- THE MOD NEVER SPAWNS A CARRIER. It uses a body the world already put in
-- reach. If none is there, the clue waits, exactly as P4-R133 says. A body that
-- appears because the mod wanted somewhere to put a note would be invented
-- loot, and invented loot is the one thing this whole design refuses.
--
-- A CARRIER IS ADDRESSED BY OUR OWN MARK, never by a square. A cupboard cannot
-- be dragged off; a body can be, and the clue must still be found - so the
-- carrier's ModData carries a mark of ours, and the clue is found again by that
-- mark wherever the carrier now lies. The same trick a clue in a car has used
-- since VEHICLES_AS_PLACES, for the same reason. The mark identifies the
-- CARRIER, not the clue, which is what lets the distinctness register (P4-R67)
-- refuse a second clue on one body.
--
-- ONLY A CORPSE, NEVER A WALKING ZOMBIE (P4-R136, owner, 2026-09-18). A clue is
-- found by searching (P4-R132) and the game turns Search Mode off by itself
-- when a zombie is close - which is exactly where a zombie-carried clue would
-- have to be searched for (evidence 20260918T045929). A walker also carried one
-- out of reach and stranded a case for three in-game days while holding its one
-- mobile slot. So a candidate must be a body that is ALREADY DEAD. A zombie the
-- survivor kills later is an ordinary body like any other and may be chosen
-- then; nothing here looks at the cell's zombie list any more.
--
-- The pure rules are at the top and testable with no game at all; the engine
-- readers below are the only part that touches PZ.
local Searched=require("NHShared/SearchedContainers")
local Identity=require("NHShared/IdentityObservations")
local Outfits=require("NHShared/BodyOutfitObservations")
local C={}

C.CORPSE="corpse"
C.KINDS={[C.CORPSE]=true}

-- Our handle, stamped into the body's own ModData. Distinct
-- from CasePerson's `cfCasePerson`: a case person is somebody the case is
-- about, a carrier is only somewhere a clue happens to be.
C.MARK="cfClueCarrier"
C.MARK_MAX=120
-- A body another part of the mod has already claimed. CasePerson dresses a
-- zombie as the case's person, re-dresses her after a reload and re-binds her
-- to a new body when hers is lost; two systems writing into one body's
-- inventory is a fault waiting to happen, and the survivor finding the case's
-- own person holding one of its clues is a coincidence nobody wrote. So a case
-- person is never a carrier.
C.CASE_PERSON_MARK="cfCasePerson"
-- A PLAYER CHARACTER'S BODY IS NEVER A CARRIER (owner, 2026-09-27). The game
-- has two signals and neither is enough alone (projectzomboid.jar, Build 42,
-- IsoDeadBody bytecode read 2026-09-27):
--   * IsoDeadBody:isPlayer() answers whether the body's `player` field is set.
--     The constructor sets it only for a LOCAL player's death and load() never
--     restores it, so after a reload a dead player's body answers false.
--   * The constructor copies the dying character's ModData into the body
--     (LuaManager.copyTable), for every character, and IsoDeadBody.reanimate()
--     copies the body's ModData into the zombie it becomes - so a mark on the
--     living player survives death, reanimation, a second death and a reload.
-- So the player is stamped with this mark (C.stampPlayer, at game start and
-- on every new character) and a body holding it, or answering isPlayer(), is
-- refused. A player who died before this build stamped them is only caught
-- by isPlayer(), until the next reload.
C.PLAYER_MARK="cfNoHelpPlayer"

-- How close the survivor must be to where a carrier clue went in before "we
-- looked and it is not there" means anything at all (GeneratedRuntime's
-- carrierWatch). A body in an unloaded cell is not a body that is gone.
C.FIND_RADIUS=60
-- How far a marked CORPSE is looked for: a body does not walk, so its own
-- square and its immediate neighbours are the whole of it. Two tiles allows
-- for a body that was dragged or moved, not for one that was never there.
C.CORPSE_RADIUS=2

-- Why this carrier may not take a clue, or nil when it may. Pure, so every
-- refusal is testable without a game:
--   * a carrier already marked is somebody else's - never two clues on one
--     body (P4-R67, keyed on the mark);
--   * a container the survivor has already searched must not sprout a clue
--     behind them: that is the one thing that would read as software;
--   * nor one whose loot window is open right now, which is the same thing
--     happening in front of them.
function C.refusal(state)
    if type(state)~="table" then return "no carrier" end
    if not C.KINDS[state.kind] then return "not a carrier" end
    if not state.container then return "no inventory" end
    -- A dead deer is a body on a square and answers every call a dead man's
    -- body answers, so the engine's own loot window asks this question before
    -- it will show one (ISInventoryPage: `instanceof(so,"IsoDeadBody") and
    -- so:isAnimal()`). A note in a dog's jacket is not the design's example.
    if state.animal then return "an animal" end
    if state.player then return "a player's body" end
    if state.mark~=nil then return "already carries a clue" end
    if state.casePerson then return "already the case's person" end
    if state.searched then return "already searched" end
    if state.lootOpen then return "loot window open" end
    -- A body that already carries a vanilla ID card (or any named identity
    -- document the observer reads) is somebody already: our card on it would
    -- put two names on one body. Only cards we write belong to a conspiracy;
    -- the vanilla one is never renamed or removed, so the body is refused.
    if state.identity then return "already holds an ID" end
    return nil
end
function C.usable(state) return C.refusal(state)==nil end

-- A fresh mark. Only ever generated once per carrier and stamped straight into
-- its ModData, so it need only be distinct among the carriers alive at the
-- time: the square, the in-game hour and a counter are together enough for
-- that, and a collision could only ever REFUSE a second clue, never share a
-- body between two.
local seq=0
function C.newMark(x,y,z,hours)
    seq=seq+1
    local function whole(n) return math.floor(tonumber(n) or 0) end
    return string.format("cfc:%d:%d:%d:%d:%d",whole(x),whole(y),whole(z),whole((tonumber(hours) or 0)*10),seq)
end

-- The outfit id recorded for a body, or nil: the game's own getOutfitName
-- answer, trimmed and bounded so the Session target can hold it.
function C.outfitId(name)
    if type(name)~="string" then return nil end
    name=name:gsub("^%s+",""):gsub("%s+$","")
    if name=="" or #name>80 or not name:find("^[%w_%-]+$") then return nil end
    return name
end

-- Which of two usable bodies the clue prefers. `hint` is the clue's optional
-- outfit class (BodyOutfitObservations.OUTFIT_CLASS): a body whose clothing
-- is of that class is preferred, and that is all. A body is never refused for
-- not matching and nothing waits for a matching one: clothing is a soft hint
-- (owner, 2026-09-27).
function C.matches(state,hint)
    return hint~=nil and type(state)=="table" and Outfits.classOf(state.outfit)==hint
end

-- ---------------------------------------------------------------------------
-- The engine readers. Everything below asks PZ something.
-- ---------------------------------------------------------------------------
-- The keyed read of AGENTS.md's one measured exception (P4-R124): the method is
-- called inside a closure with the object passed explicitly, which behaves
-- exactly like the colon call. The method is never extracted.
local function read(o,k,...)
    if not o or not o[k] then return nil end
    local ok,v=pcall(function(...) return o[k](o,...) end,...)
    if ok then return v end
    return nil
end
C.read=read

-- The containers the loot window is showing, as a set. These are what the
-- survivor is looking into at this moment, and nothing may be written into one
-- of them.
function C.openContainers()
    local open={}
    pcall(function()
        local page=getPlayerLoot and getPlayerLoot(0)
        for _,button in ipairs(page and page.backpacks or {}) do
            if button.inventory then open[button.inventory]=true end
        end
    end)
    return open
end

-- What one candidate carrier is, as `refusal` above wants it.
--
-- A BODY'S INVENTORY IS `getContainer()`, NOT `getInventory()`. On Build 42.20
-- an `IsoDeadBody` answers `getInventory()` with nil and `getContainer()` with
-- its own `inventorymale`/`inventoryfemale` container - four fresh bodies said
-- so in a real game (evidence 20260918T035135-body-carrier.txt), and while this
-- read the wrong call every corpse was refused "no inventory" and the design's
-- headline example, a note in a dead man's jacket, could not happen.
--
-- `getContainer` is also the call the GAME itself makes for a body: the loot
-- window gathers a square's static moving objects through `so:getContainer()`
-- and marks that container explored (ISInventoryPage), and CasePerson has
-- written into a body through the same call since 2026-09-08. That identity
-- matters twice over - the loot-window guard below compares our container with
-- the one the loot page is showing, and only the same call can match it.
-- Does this container hold a vanilla identity document with a name on it -
-- loose, or one bag deep (a wallet, which is where the game rolls most of a
-- body's ID cards: Distributions.lua inventorymale/-female, Wallet_Male/
-- -Female)? A copy of ours (cfGeneratedId) is not vanilla and does not count.
local function holdsIdentity(container,depth)
    local items=read(container,"getItems")
    local n=read(items,"size")
    if type(n)~="number" then return false end
    for i=0,n-1 do
        local item=read(items,"get",i)
        local md=read(item,"getModData")
        local ours=type(md)=="table" and md.cfGeneratedId~=nil
        if not ours and Identity.isNamedIdentity(read(item,"getFullType"),read(item,"getDisplayName")) then return true end
        if (depth or 0)<1 and instanceof and instanceof(item,"InventoryContainer") then
            local inner=read(item,"getInventory")
            if inner and holdsIdentity(inner,(depth or 0)+1) then return true end
        end
    end
    return false
end
C.holdsIdentity=holdsIdentity

function C.stateOf(object,kind,open,x,y,z)
    local container=read(object,"getContainer")
    local md=read(object,"getModData")
    local mark=type(md)=="table" and md[C.MARK] or nil
    return {kind=kind,object=object,container=container,
            mark=type(mark)=="string" and mark or nil,
            animal=read(object,"isAnimal")==true,
            player=read(object,"isPlayer")==true or (type(md)=="table" and md[C.PLAYER_MARK]~=nil),
            -- A check that cannot be made refuses the body: two names on one
            -- body is the thing this guards against.
            identity=container~=nil and (function()
                local ok,v=pcall(holdsIdentity,container,0)
                return not ok or v==true
            end)(),
            outfit=C.outfitId(read(object,"getOutfitName")),
            casePerson=type(md)=="table" and md[C.CASE_PERSON_MARK]~=nil or false,
            -- The player looked into it; not the engine having generated its
            -- loot, which the engine's explored flag also reports (SearchedContainers.lua).
            searched=Searched.searched(container)==true,
            lootOpen=container~=nil and open[container]==true,
            x=x,y=y,z=z}
end

local function position(o)
    local x,y,z=read(o,"getX"),read(o,"getY"),read(o,"getZ")
    if type(x)~="number" or type(y)~="number" or type(z)~="number" then return nil end
    return math.floor(x),math.floor(y),math.floor(z)
end
C.position=position

-- The bodies on one square. `getDeadBodys` is the engine's own spelling.
local function bodiesOn(square)
    local out={}
    local list=read(square,"getDeadBodys")
    local n=read(list,"size")
    if type(n)~="number" then return out end
    for i=0,n-1 do
        local body=read(list,"get",i)
        if body then out[#out+1]=body end
    end
    return out
end
C.bodiesOn=bodiesOn

-- A carrier in reach of (x,y,z) that will take a clue, stepped like every other
-- scan in this mod: one square per step for the bodies lying about. `done` is
-- called with the carrier or with nil when there is none; `accept` is the
-- caller's own extra guard (the filler uses it for the site's footprint).
--
-- The cell's zombie list is not read at all (P4-R136): a walker is not a
-- carrier, and one that is killed later arrives here as an ordinary body on a
-- square like any other.
--
-- `hint` (optional) is the clue's outfit class. Without one the first usable
-- body is taken, as always. With one, the scan finishes the squares it was
-- going to look at anyway and takes the first body whose clothing matches, or
-- else the first usable body it passed: a preference among bodies already in
-- reach, never a wait and never a refusal.
function C.scan(x,y,z,radius,done,accept,hint)
    radius=math.floor(tonumber(radius) or 12)
    x,y,z=math.floor(x),math.floor(y),math.floor(z)
    local open=C.openContainers()
    local dx,dy=-radius,-radius
    local fallback
    local function offer(object,kind,ox,oy,oz)
        if not object then return false end
        local state=C.stateOf(object,kind,open,ox,oy,oz)
        if not C.usable(state) then return false end
        if accept and not accept(state) then return false end
        if hint~=nil and not C.matches(state,hint) then
            fallback=fallback or state
            return false
        end
        done(state); return true
    end
    return function()
        if dx>radius then
            -- The fallback is offered once: a body the claim then refuses is
            -- not offered again by a finished scan.
            local chosen=fallback; fallback=nil
            done(chosen); return true
        end
        local cell=getCell and getCell()
        local square=read(cell,"getGridSquare",x+dx,y+dy,z)
        for _,body in ipairs(square and bodiesOn(square) or {}) do
            if offer(body,C.CORPSE,x+dx,y+dy,z) then return true end
        end
        dy=dy+1
        if dy>radius then dy=-radius; dx=dx+1 end
        return false
    end
end

-- Claim a carrier: stamp the mark, once the guards have been checked again.
-- Between the scan finding it and this being called the survivor may have
-- opened it or emptied it, so nothing is taken on trust.
--
-- A BODY'S VANILLA LOOT IS ROLLED THE MOMENT IT IS FIRST OPENED, not when it
-- dies: the body of an ordinary zombie starts with its container unexplored
-- (IsoDeadBody constructor: setExplored(false) unless the character was a
-- player or a reanimated player), and the loot window fills an unexplored
-- container with ItemPicker.fillContainer and then marks it explored
-- (ISInventoryPage.lua, selectContainer). An ID card rolled THEN would land on
-- a body that already carries ours. So before the last check the body's loot
-- is rolled now, by the same two calls the loot window makes - the game's own
-- distribution, rolled once, never edited - and a body that turns out to hold
-- an ID is refused like any other.
function C.rollVanillaLoot(container)
    if not container or read(container,"isExplored")~=false then return false end
    if isClient and isClient() then return false end
    local ok=pcall(function()
        local picker=ItemPicker or ItemPickerJava
        picker.fillContainer(container,getPlayer and getPlayer() or nil)
        container:setExplored(true)
    end)
    return ok
end

function C.claim(state,mark)
    if type(state)~="table" or type(mark)~="string" or mark=="" or #mark>C.MARK_MAX then return false end
    C.rollVanillaLoot(state.container)
    local fresh=C.stateOf(state.object,state.kind,C.openContainers(),state.x,state.y,state.z)
    if not C.usable(fresh) then return false,C.refusal(fresh) end
    local md=read(state.object,"getModData")
    if type(md)~="table" then return false,"no modData" end
    md[C.MARK]=mark
    return true
end

-- Mark the living player so their body is never chosen (C.PLAYER_MARK).
-- Idempotent; the mark says nothing but "this was a player".
function C.stampPlayer(player)
    local md=read(player,"getModData")
    if type(md)~="table" then return false end
    if md[C.PLAYER_MARK]==nil then md[C.PLAYER_MARK]=true end
    return true
end

-- The carrier we marked, wherever it now is: its container, and its CURRENT
-- square, which is what Search Mode anchors the clue's icon to.
--
-- A body does not walk (P4-R136), so it is looked for on its own square and the
-- ones beside it, and nowhere else. Callers that still pass a radius are
-- ignored rather than obeyed: a sixty-tile square walk would be 14,641
-- getGridSquare calls in one frame.
function C.findMark(mark,x,y,z)
    if type(mark)~="string" or mark=="" then return nil,"no mark" end
    x,y,z=math.floor(x or 0),math.floor(y or 0),math.floor(z or 0)
    local open=C.openContainers()
    local cell=getCell and getCell()
    local function matches(object,kind,ox,oy,oz)
        local md=read(object,"getModData")
        if type(md)~="table" or md[C.MARK]~=mark then return nil end
        local state=C.stateOf(object,kind,open,ox,oy,oz)
        if not state.container then return nil end
        state.mark=mark
        return state
    end
    -- A burned or removed body is simply not found, which is what expiry is
    -- for; nothing here ever claims a clue is lost (P4-R104).
    for ddx=-C.CORPSE_RADIUS,C.CORPSE_RADIUS do
        for ddy=-C.CORPSE_RADIUS,C.CORPSE_RADIUS do
            local square=read(cell,"getGridSquare",x+ddx,y+ddy,z)
            for _,body in ipairs(square and bodiesOn(square) or {}) do
                local found=matches(body,C.CORPSE,x+ddx,y+ddy,z)
                if found then return found end
            end
        end
    end
    return nil,"carrier-not-found"
end

-- WorldAccess.resolve's carrier arm: the container a carrier clue is in, or nil
-- and why. `mark` comes off the target, never off the clue: the mark names the
-- body, which is what keeps two clues off one body.
function C.resolve(target)
    if type(target)~="table" or type(target.carrierMark)~="string" then return nil,"not a carrier target" end
    local found,why=C.findMark(target.carrierMark,target.x,target.y,target.z)
    if not found then return nil,why end
    return found.container,found
end

return C
