-- CLUES ON THE MOVE (P4-R134, docs/design/CLUES_ON_THE_MOVE.md).
--
-- A carrier is something the world already put there that can hold a clue and
-- need not stay where it was found: a fresh corpse or a wandering zombie. Two
-- rules govern everything here.
--
-- THE MOD NEVER SPAWNS A CARRIER. It uses a body or a zombie the world already
-- put in reach. If none is there, the clue waits, exactly as P4-R133 says. A
-- body that appears because the mod wanted somewhere to put a note would be
-- invented loot, and invented loot is the one thing this whole design refuses.
--
-- A CARRIER IS ADDRESSED BY OUR OWN MARK, never by a square. A cupboard cannot
-- walk away; a zombie can, and does. So the carrier's ModData carries a mark of
-- ours, and the clue is found again by that mark wherever the carrier now is -
-- the same trick a clue in a car has used since VEHICLES_AS_PLACES, for the
-- same reason. The mark identifies the CARRIER, not the clue, which is what
-- lets the distinctness register (P4-R67) refuse a second clue on one body.
--
-- The pure rules are at the top and testable with no game at all; the engine
-- readers below are the only part that touches PZ.
local C={}

C.CORPSE="corpse"
C.ZOMBIE="zombie"
C.KINDS={[C.CORPSE]=true,[C.ZOMBIE]=true}

-- Our handle, stamped into the body's or the zombie's own ModData. Distinct
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

-- Bounds. The zombie list is walked at most this far (CasePerson.MAX_SCAN uses
-- the same number for the same reason: a cell can hold a great many).
C.MAX_ZOMBIES=60
-- How far a marked ZOMBIE is looked for. It walks, so it is looked for in the
-- cell's own list rather than on a square, and this is only the box that list
-- is filtered by.
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
    if state.mark~=nil then return "already carries a clue" end
    if state.casePerson then return "already the case's person" end
    if state.explored then return "already searched" end
    if state.lootOpen then return "loot window open" end
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
function C.stateOf(object,kind,open,x,y,z)
    local container=read(object,"getInventory")
    local md=read(object,"getModData")
    local mark=type(md)=="table" and md[C.MARK] or nil
    return {kind=kind,object=object,container=container,
            mark=type(mark)=="string" and mark or nil,
            casePerson=type(md)=="table" and md[C.CASE_PERSON_MARK]~=nil or false,
            explored=read(container,"isExplored")==true,
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
-- scan in this mod: one bounded pass over the cell's zombie list, then one
-- square per step for the bodies lying about. `done` is called with the carrier
-- or with nil when there is none; `accept` is the caller's own extra guard (the
-- filler uses it for the site's footprint).
--
-- Zombies first, deliberately: a zombie is reachable by definition, whereas a
-- body might be behind a locked door.
function C.scan(x,y,z,radius,done,accept)
    radius=math.floor(tonumber(radius) or 12)
    x,y,z=math.floor(x),math.floor(y),math.floor(z)
    local open=C.openContainers()
    local phase,dx,dy=1,-radius,-radius
    local function offer(object,kind,ox,oy,oz)
        if not object then return false end
        local state=C.stateOf(object,kind,open,ox,oy,oz)
        if not C.usable(state) then return false end
        if accept and not accept(state) then return false end
        done(state); return true
    end
    return function()
        if phase==1 then
            phase=2
            local cell=getCell and getCell()
            local list=read(cell,"getZombieList")
            local total=read(list,"size")
            if type(total)=="number" then
                local limit=total<C.MAX_ZOMBIES and total or C.MAX_ZOMBIES
                for i=1,limit do
                    local zombie=read(list,"get",i-1)
                    local zx,zy,zz=position(zombie)
                    if zx and zz==z and math.abs(zx-x)<=radius and math.abs(zy-y)<=radius then
                        -- A zombie already on the floor is a corpse, and it is
                        -- searched as one; the kind is what the survivor would
                        -- call it, not which list it came out of.
                        local kind=read(zombie,"isDead")==true and C.CORPSE or C.ZOMBIE
                        if offer(zombie,kind,zx,zy,zz) then return true end
                    end
                end
            end
            return false
        end
        if dx>radius then done(nil); return true end
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
function C.claim(state,mark)
    if type(state)~="table" or type(mark)~="string" or mark=="" or #mark>C.MARK_MAX then return false end
    local fresh=C.stateOf(state.object,state.kind,C.openContainers(),state.x,state.y,state.z)
    if not C.usable(fresh) then return false,C.refusal(fresh) end
    local md=read(state.object,"getModData")
    if type(md)~="table" then return false,"no modData" end
    md[C.MARK]=mark
    return true
end

-- The carrier we marked, wherever it now is: its container, and its CURRENT
-- square, which is what Search Mode anchors the clue's icon to.
function C.findMark(mark,x,y,z,radius)
    if type(mark)~="string" or mark=="" then return nil,"no mark" end
    x,y,z=math.floor(x or 0),math.floor(y or 0),math.floor(z or 0)
    local open=C.openContainers()
    local function matches(object,kind,ox,oy,oz)
        local md=read(object,"getModData")
        if type(md)~="table" or md[C.MARK]~=mark then return nil end
        local state=C.stateOf(object,kind,open,ox,oy,oz)
        if not state.container then return nil end
        state.mark=mark
        return state
    end
    -- A zombie walks: it is looked for in the cell's list, not on a square.
    local cell=getCell and getCell()
    local list=read(cell,"getZombieList")
    local total=read(list,"size")
    local reach=math.floor(tonumber(radius) or C.FIND_RADIUS)
    if type(total)=="number" then
        local limit=total<C.MAX_ZOMBIES and total or C.MAX_ZOMBIES
        for i=1,limit do
            local zombie=read(list,"get",i-1)
            local zx,zy,zz=position(zombie)
            if zx and zz==z and math.abs(zx-x)<=reach and math.abs(zy-y)<=reach then
                local found=matches(zombie,read(zombie,"isDead")==true and C.CORPSE or C.ZOMBIE,zx,zy,zz)
                if found then return found end
            end
        end
    end
    -- A body does not: its own square and the ones beside it are the whole of
    -- the search, so a burned or removed body is simply not found.
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
function C.resolve(target,radius)
    if type(target)~="table" or type(target.carrierMark)~="string" then return nil,"not a carrier target" end
    local found,why=C.findMark(target.carrierMark,target.x,target.y,target.z,radius)
    if not found then return nil,why end
    return found.container,found
end

return C
