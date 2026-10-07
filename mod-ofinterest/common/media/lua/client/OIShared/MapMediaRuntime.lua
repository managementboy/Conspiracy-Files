-- Printed-media integration. Fresh-save, single-player; ordinary Lua ModData.
--
-- What is left here (No Help, task 3 plan step 4): noticing that a vanilla map
-- or flyer was read, the metadata index of which buildings a design points
-- at, the organiser's lead rows, the flyer rows and the visits. The map system
-- no longer places documents of its own: every mark of every map is a clue
-- place of the No Help world record (Generated/MapSites), and its clues come
-- from there (GeneratedRuntime). Reading a map records the read hour, gives the
-- trail a seed from the world, and asks for its marked places to be decided.
local State=require("OIShared/MapMediaState")
local Catalogue=require("OIShared/MapMediaCatalogue")
local Destinations=require("OIShared/MapMediaDestinations")
local Content=require("OIShared/MapMediaContent")
local Budget=require("OIShared/SaveBudget")
local Scheduler=require("OIShared/Scheduler")
local Pick=require("OIShared/Generated/Pick")
local Trails=require("OIShared/Generated/Trails")
local Sites=require("OIShared/Generated/MapSites")
local CFLog=require("OIShared/Log")
OIShared=OIShared or {}
local R=OIShared.MapMediaRuntime or {}
OIShared.MapMediaRuntime=R
OIEngine=OIEngine or {};OIEngine.MapMediaRuntime=R
local TAG="OIShared.MapMedia"
-- The trail's seed is a function of the world and the map, never of the
-- moment it was read (owner, 2026-09-27: "Their seed comes from the world").
R.TRAIL_RULES_VERSION=Trails.VERSION
local state,scheduler,ready,metadata
local destinations={}
local ticks=0
local function allowed() return not (isClient and isClient()) and not (isServer and isServer()) end
local function log(why) CFLog.message("mapmedia","note",tostring(why)) end
local function hours() return getGameTime():getWorldAgeHours() end
local function clock() return getTimestampMs and getTimestampMs() or getTimeInMillis() end
local function root()
    if state then return state end
    local store=ModData.get(TAG)
    local candidate=store and store.canonical or State.empty()
    local ok,why=State.validate(candidate,Catalogue)
    if not ok then error(why) end -- Never replace corrupt current-build state.
    state=candidate; return state
end
function R.invalidate() state=nil end
local function save(next)
    local started=clock()
    local ok,why=State.validate(next,Catalogue)
    if ok then ok,why=Budget.check("mapMedia",{canonical=next}) end
    if not ok then R.lastRefusal=why; log(why); return false end
    ModData.getOrCreate(TAG).canonical=next; state=next
    R.peakWriteMs=math.max(R.peakWriteMs or 0,clock()-started)
    return true
end
local function defOf(square)
    local b=square and square:getBuilding(); return b and b:getDef()
end
local function buildingId(square)
    local def=defOf(square); return def and tostring(def:getIDString())
end
local function atDestination(id,square)
    if not square then return false end
    local binding=Catalogue.get(id)
    if binding.areas then return Destinations.contains(binding,square:getX(),square:getY()) end
    local bid=buildingId(square)
    if not bid then return false end
    -- A loaded target's actual building resolves overlapping metadata bounds.
    -- Where no target floor is observable, keep the indexed source candidates;
    -- coverage reports their multiplicity for native review.
    local resolved,match=false,false
    for _,point in ipairs(binding.targets) do
        local anchor=getCell():getGridSquare(point.x,point.y,0)
        local owner=buildingId(anchor)
        if owner then resolved=true;if owner==bid then match=true end end
    end
    if resolved then return match end
    return destinations[id]~=nil and destinations[id][bid]==true
end
-- Bounds are read ONCE per building, never once per design. These are engine
-- calls across the Lua bridge, and indexStep asks about all 125 designs for
-- every one of ~9,978 buildings: reading them inside that loop cost 500 engine
-- calls per building, five million overall, which pushed a single scheduler
-- step past its 2 ms budget (observed peak 10 ms) and starved indexing down to
-- roughly one building a tick. It then never finished.
local function matchesBounds(binding,x1,y1,x2,y2)
    return Destinations.intersects(binding,x1,y1,x2,y2)
end
-- A COARSE SPATIAL INDEX over the designs, built once.
--
-- Measured: testing all 125 designs against each of the map's ~9,978 buildings
-- is 1.25 million checks. In Kahlua one such step ate the scheduler's whole
-- 2 ms budget, so only ONE building was processed per tick - about fifteen a
-- second, roughly ELEVEN MINUTES for the pass, which no check waits for. A
-- single bounding box does not help: the designs span every town, so nearly
-- every building falls inside it.
--
-- Designs are bucketed by a coarse grid instead, and a building is tested only
-- against designs in the buckets its own bounds touch. This cannot miss a
-- match: a target point lies inside the matching building's bounds, so that
-- building necessarily overlaps the bucket holding the point, and an area is
-- registered in every bucket it touches. Designs that resolve to more than one
-- building still resolve to all of them.
local BUCKET=250
local designBuckets
local function bucketKey(bx,by) return bx*100000+by end
local function addToBucket(into,bx,by,id)
    local k=bucketKey(bx,by)
    local list=into[k]; if not list then list={}; into[k]=list end
    for _,existing in ipairs(list) do if existing==id then return end end
    list[#list+1]=id
end
local function buildDesignBuckets()
    if designBuckets then return designBuckets end
    local built={}
    for _,id in ipairs(Catalogue.list) do
        local b=Catalogue.get(id)
        for _,a in ipairs(b.areas or {}) do
            for bx=math.floor(a.x1/BUCKET),math.floor(a.x2/BUCKET) do
                for by=math.floor(a.y1/BUCKET),math.floor(a.y2/BUCKET) do addToBucket(built,bx,by,id) end
            end
        end
        for _,pt in ipairs(b.targets or {}) do
            addToBucket(built,math.floor(pt.x/BUCKET),math.floor(pt.y/BUCKET),id)
        end
    end
    designBuckets=built
    return designBuckets
end
-- Metadata only; no loading, entering, stash preparation, or visit fiction.
local function indexStep()
    if metadata.index>=metadata.buildings:size() then metadata=nil; R.indexed=true; return true end
    local def=metadata.buildings:get(metadata.index); metadata.index=metadata.index+1
    local x1,y1,x2,y2=def:getX(),def:getY(),def:getX2(),def:getY2()
    local buckets=buildDesignBuckets()
    local bid,seen=nil,nil
    for bx=math.floor(x1/BUCKET),math.floor(x2/BUCKET) do
        for by=math.floor(y1/BUCKET),math.floor(y2/BUCKET) do
            for _,id in ipairs(buckets[bucketKey(bx,by)] or {}) do
                if not (seen and seen[id]) and matchesBounds(Catalogue.get(id),x1,y1,x2,y2) then
                    seen=seen or {}; seen[id]=true
                    bid=bid or tostring(def:getIDString())
                    destinations[id]=destinations[id] or {};destinations[id][bid]=true
                end
            end
        end
    end
    return false
end
-- Designs with at least one clue place (every design MapSites did not exclude).
local siteDesigns
local function hasPlaces(id)
    if not siteDesigns then
        siteDesigns={}
        for _,d in ipairs(Sites.designs) do siteDesigns[d]=true end
    end
    return siteDesigns[id]==true
end
-- The trail seed for a design in this world: 1..2147483646.
function R.trailSeed(worldSeed,id)
    return 1+Pick.hash(Pick.key({worldSeed,id,R.TRAIL_RULES_VERSION,"trail"}))%2147483646
end
function R.read(id,item)
    if not allowed() or not Catalogue.get(id) then return false end
    if not hasPlaces(id) then
        log("no clue place for "..tostring(id).."; no trail started")
        return false
    end
    -- The world record's seed. Without it the read cannot be given its
    -- world's seed, and a seed drawn now would make the trail depend on when
    -- it was read, so the read is refused and said so.
    local okG,G=pcall(require,"OIShared/GeneratedRuntime")
    local worldSeed=okG and type(G)=="table" and G.worldSeed and G.worldSeed() or nil
    if type(worldSeed)~="number" then
        log("map "..tostring(id).." read with no No Help world record; the read is not recorded")
        return false
    end
    local next,changed=State.activate(root(),id,R.trailSeed(worldSeed,id),hours(),Catalogue)
    if not next then log("map "..tostring(id).." read refused: "..tostring(changed)); return false end
    if changed and not save(next) then return false end
    -- Every mark of the map is decided now (source "read"); what each holds
    -- was fixed by the world, so an earlier or later decision is the same.
    if G.decideMapDesign then
        local ok,why=pcall(G.decideMapDesign,id,"read")
        if not ok then log("deciding the places "..tostring(id).." marks failed: "..tostring(why)) end
    end
    -- The organiser must show the new lead at once. Reading a PRINT already
    -- invalidated the cached list here and reading a MAP did not, so the row
    -- this read creates could sit unseen behind a stale list.
    if changed then require("OIShared/Events/EngineEvents").emit("discovery.changed") end
    return true
end
function R.printRead(id)
    if not allowed() or not Catalogue.print(id) then return false end
    local next,changed=State.printRead(root(),id,hours())
    if changed and not save(next) then return false end
    require("OIShared/Events/EngineEvents").emit("discovery.changed")
    return true
end
-- No map-placed documents exist any more, so no item is the map system's to
-- claim and it has no clue squares to show. Kept because the menu, the search
-- and the clue marks ask every runtime.
function R.subject() return false end
function R.clueTargets() return {} end
-- WHERE A MAP POINTS, BEFORE THE PLAYER HAS BEEN.
--
-- The read leaves an open loop: the scrawl verbatim, where it points, and the
-- plain fact that the player has not been. No claim about what waits there -
-- the mod does not know what the writer meant, and must not pretend the marks
-- are about its own case.
local function leadRow(id)
    local b=Catalogue.get(id); if not b then return nil end
    local lead=Content.lead(b); if not lead then return nil end
    return {id="map-lead:"..id,title=lead.title,detailText=lead.detail,
        oiCarrier="Evidence",summary="Lead",oiMapMedia=true}
end
function R.rows()
    if not ready or not allowed() then return {} end
    local out={}
    -- FLYERS. Reading one names a place worth standing in; reaching it records
    -- what the survivor confirmed. Every print carries coordinates, so this
    -- covers the whole catalogue rather than the twelve a map happens to name.
    for id,_ in pairs(root().prints) do
        local record=Catalogue.print(id)
        if record then
            local visited=root().printVisits[id]~=nil
            local ok,built=pcall(visited and Content.flyerPayoff or Content.flyerLead,record)
            if ok and type(built)=="table" then
                out[#out+1]={id=(visited and "flyer-found:" or "flyer-lead:")..id,
                    title=built.title,detailText=built.detail,
                    oiCarrier="Evidence",summary=visited and "Place confirmed" or "Lead",
                    oiMapMedia=true}
            end
        end
    end
    -- Leads first: a place the player has read about and not yet reached is a
    -- question, and questions belong above answers.
    for _,id in ipairs(Catalogue.list) do
        if root().trails[id] and root().entries[id]==nil then
            local lead=leadRow(id)
            if lead then out[#out+1]=lead end
        end
    end
    return out
end
local function visitStep()
    local player=getPlayer();local square=player and player:getSquare()
    if not square then return end
    local bid,def=buildingId(square),defOf(square)
    -- Read once, not once per design: this runs every 15 ticks over all 125
    -- designs, and these are engine calls.
    local bx1,by1,bx2,by2
    if def then bx1,by1,bx2,by2=def:getX(),def:getY(),def:getX2(),def:getY2() end
    -- A READ FLYER'S PLACE IS REACHED THE SAME WAY A MAP'S IS: by standing
    -- there. Once per visit step, not once per design - this runs over all 125
    -- designs every fifteen ticks and these are engine calls.
    local px,py=square:getX(),square:getY()
    for pid,_ in pairs(root().prints) do
        if root().printVisits[pid]==nil then
            local record=Catalogue.print(pid)
            local where=record and record.locations and record.locations[1]
            if where and where.x and where.y
                and math.abs(px-where.x)<=12 and math.abs(py-where.y)<=12 then
                local next,changed=State.printVisit(root(),pid,hours())
                if changed and save(next) then
                    log("reached the place named by the "..tostring(pid).." flyer")
                    require("OIShared/Events/EngineEvents").emit("discovery.changed")
                end
            end
        end
    end
    local changes
    for _,id in ipairs(Catalogue.list) do
        -- A genuine current building can be indexed before the metadata pass.
        if def and matchesBounds(Catalogue.get(id),bx1,by1,bx2,by2) then
            destinations[id]=destinations[id] or {};destinations[id][bid]=true
        end
        if atDestination(id,square) and root().entries[id]==nil then
            changes=State.enter(changes or root(),id,hours())
        end
    end
    if changes then save(changes) end
end
function R.start()
    if not allowed() then return false end
    state=nil; root(); destinations={}
    -- Lazy, not a top-level require: InteractionAPI.lua's own construction
    -- reaches GeneratedMenu.lua, which reaches EngineAPI.lua, which
    -- reaches this file - a real circular require if resolved at file-load
    -- time instead of here, at the point of use.
    require("OIShared/InteractionAPI")
    ticks=0; R.indexed=false
    scheduler=Scheduler.new(clock,function(_,why) log(why) end)
    scheduler.maxSteps=16; scheduler.budgetMs=2
    metadata={buildings=getWorld():getMetaGrid():getBuildings(),index=0}
    scheduler.enqueue("metadata","map-metadata",indexStep)
    local hooks=require("OIShared/MapMediaRead")
    local ok,why=hooks.start(R.read,R.printRead)
    if not ok then error(why) end
    ready=true; return true
end
function R.tick()
    if not ready or not allowed() then return end
    ticks=ticks+1
    if ticks%15==0 then visitStep() end
    scheduler.step()
end
-- Diagnostics deliberately expose hidden state only through explicit debug use.
function R.status()
    if not (getDebug and getDebug()) then return nil end
    -- How far the metadata pass has got, so a stalled index is measurable
    -- rather than inferred from which designs happen to have resolved.
    return {ready=ready,indexed=R.indexed,peakMs=scheduler and scheduler.peakMs,peakWriteMs=R.peakWriteMs,
        indexAt=metadata and metadata.index or nil,
        indexOf=metadata and metadata.buildings:size() or nil,
        state=State.copy(root()),refusal=R.lastRefusal}
end
function R.coverage(id)
    if not (getDebug and getDebug()) then return nil end
    local binding=Catalogue.get(id); if not binding then return nil end
    local count=0; for _ in pairs(destinations[id] or {}) do count=count+1 end
    return {design=id,buildings=count,areas=binding.areas and #binding.areas or 0,
        source=binding.areaSource or binding.anchorSource,related=binding.relatedDestination,
        active=root().trails[id]~=nil,entered=root().entries[id]~=nil}
end
if Events and not R.hooked then
    R.hooked=true
    require("OIShared/Events/EngineEvents").on("OnGameStart", function() local ok,why=pcall(R.start); if not ok then ready=false; log(why) end end)
    require("OIShared/Events/EngineEvents").on("OnTick", function() local ok,why=pcall(R.tick); if not ok then ready=false; log(why) end end)
end
return R
