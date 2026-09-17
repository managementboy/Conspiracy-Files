-- CLUES ON THE MOVE (P4-R134, docs/design/CLUES_ON_THE_MOVE.md).
--
-- Fixed containers are a finite resource near a settled player: that is the
-- whole of P4-R133's fault. A body in the street, a zombie in the yard, a
-- parked car's glovebox and a mailbox at the gate are not finite, and finding a
-- note in a dead man's jacket at your own fence is a better moment than the
-- twelfth cupboard.
--
-- What this test holds to account:
--   * the carrier target validates, and is checked as strictly as a car's;
--   * a carrier is keyed on its own mark, so two clues can never share a body
--     (P4-R67) and a body that wandered off is still the same container;
--   * a corpse and a zombie each take a clue and it is found again after the
--     carrier has moved;
--   * the guards refuse: a body already searched, a loot window open on it, a
--     carrier already carrying a clue, one outside the site's footprint, and
--     the survivor standing next to it;
--   * at most one mobile clue per case, at creation and at an instalment;
--   * a carrier clue's icon follows the carrier;
--   * a vanished carrier expires like any unplaceable clue and the case still
--     completes, with no row claiming a document is lost;
--   * the mailbox kind exists, is a named constant, and is declared unverified.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

-- ---------------------------------------------------------------------------
-- A world with bodies in it. No PZ, only what Carriers actually asks for.
-- ---------------------------------------------------------------------------
local function javaList(t)
    return {size=function() return #t end,get=function(_,i) return t[i+1] end}
end
local function inventory(explored)
    local inv={items={},explored=explored==true}
    function inv:getItems() return javaList(self.items) end
    function inv:isExplored() return self.explored end
    function inv:AddItem(item) self.items[#self.items+1]=item; return item end
    return inv
end
local function carrierObject(x,y,z,dead,explored)
    local o={md={},inv=inventory(explored),x=x,y=y,z=z,dead=dead==true}
    function o:getX() return self.x end
    function o:getY() return self.y end
    function o:getZ() return self.z end
    function o:getModData() return self.md end
    function o:getInventory() return self.inv end
    function o:isDead() return self.dead end
    -- The engine demands a receiver; a plain-table double that accepted
    -- `o.getX()` could not catch an extracted method (AGENTS.md, engine call
    -- form). This one refuses.
    return setmetatable(o,{__index=function(_,k) error("no such member: "..tostring(k)) end})
end
local zombies,bodies,openContainers={},{},{}
getCell=function()
    return {
        getZombieList=function() return javaList(zombies) end,
        getGridSquare=function(_,x,y,z)
            local here={}
            for _,b in ipairs(bodies) do if b.x==x and b.y==y and b.z==z then here[#here+1]=b end end
            if #here==0 then return nil end
            return {getDeadBodys=function() return javaList(here) end}
        end,
    }
end
getPlayerLoot=function() return {backpacks=openContainers} end

local Carriers=require("ConspiracyFiles/Carriers")
local S=require("ConspiracyFiles/Generated/Session")
local G=require("ConspiracyFiles/Generated/Generator")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")
local Rules=require("ConspiracyFiles/ClueSearchRules")
local Storage=require("ConspiracyFiles/Generated/Storage")

-- ---------------------------------------------------------------------------
-- 1. The target shape ------------------------------------------------------
-- ---------------------------------------------------------------------------
local site={id="site-a",mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",
    bounds={x1=100,x2=110,y1=100,y2=110,z=0},containerTypes={"counter"}}
local function target(over)
    local t={x=105,y=105,z=0,objectIndex=0,containerIndex=0,containerType=S.CARRIER_CONTAINER,
        sprite="zombie",carrierKind="zombie",carrierMark="cfc:105:105:0:100:1"}
    for k,v in pairs(over or {}) do t[k]=v end
    return t
end
assert(S.target(target(),site),"a zombie in the yard must be usable")
-- A carrier is deliberately NOT checked against the site's containerTypes: a
-- body is not the building's furniture and the scan would never list it there.
assert(#site.containerTypes==1 and site.containerTypes[1]=="counter")
assert(S.target(target({carrierKind="corpse",sprite="corpse"}),site),"a fresh corpse too")
assert(S.target(target({x=110+S.CARRIER_RADIUS-1}),site),"a body at the kerb belongs to the house")
assert(not S.target(target({x=110+S.CARRIER_RADIUS}),site),
    "a body in the next street does not; a site's clue must stay findable from the site")
assert(not S.target(target({z=1}),site),"a carrier target names the site's own floor")
assert(not S.target(target({carrierKind="dog"}),site),"a carrier is a corpse or a zombie, nothing else")
local kindless=target(); kindless.carrierKind=nil
assert(not S.target(kindless,site),"and it must say which")
assert(not S.target(target({carrierMark=""}),site),"an unmarked carrier could never be found again")
assert(not S.target(target({carrierMark=string.rep("m",121)}),site),"a mark is bounded")
assert(not S.target(target({containerType="counter"}),site),"a carrier target must say it is one")
assert(not S.target(target({objectIndex=2}),site),"a carrier has no object index into a square")
assert(not S.target(target({vehiclePart="GloveBox"}),site),"a carrier is not a car part")
-- Square and vehicle targets are untouched.
assert(S.target({x=105,y=105,z=0,objectIndex=2,containerIndex=1,containerType="counter",
    sprite="furniture_01"},site),"an ordinary container target must still validate")

-- Keyed on the mark and nothing else: one zombie does not stay on any square,
-- and two bodies may lie on one.
local a1=target({carrierMark="cfc:a"})
local a2=target({carrierMark="cfc:a",x=100,y=100})
local b1=target({carrierMark="cfc:b"})
assert(S.physicalKey(a1)==S.physicalKey(a2),"a carrier that walked is still the same container")
assert(S.physicalKey(a1)~=S.physicalKey(b1),"two bodies on one square are two containers")
assert(S.physicalKey(a1)~=S.physicalKey({x=105,y=105,z=0,objectIndex=0,containerIndex=0,
    containerType="counter",sprite="s"}),"a carrier key can never collide with a cupboard's")
assert(S.isMobile(a1) and S.isMobile(target({carrierMark=nil,vehiclePart="GloveBox",
    containerType="vehicle",carrierKind=nil}))==true,"both kinds of carrier travel")
assert(not S.isMobile({x=1,y=1,z=0,objectIndex=0,containerIndex=0,containerType="counter",sprite="s"}),
    "a cupboard does not")

-- ---------------------------------------------------------------------------
-- 2. Finding a carrier, claiming it, and finding it again after it moved ----
-- ---------------------------------------------------------------------------
local walker=carrierObject(105,105,0,false)
local corpse=carrierObject(106,105,0,true)
local searched=carrierObject(104,105,0,true,true)   -- the survivor already emptied it
local watched=carrierObject(103,105,0,true)         -- its loot window is open
local person=carrierObject(102,105,0,true)          -- the case's own person
person.md[Carriers.CASE_PERSON_MARK]="case-1"
bodies={corpse,searched,watched,person}
zombies={walker}
openContainers={{inventory=watched.inv}}

-- The guards, as pure rules first: every refusal has a reason.
assert(Carriers.refusal({kind="zombie",container=walker.inv})==nil,"an unmarked zombie takes a clue")
assert(Carriers.refusal({kind="zombie",container=walker.inv,mark="cfc:x"})=="already carries a clue",
    "never two clues on one carrier (P4-R67)")
assert(Carriers.refusal({kind="corpse",container=corpse.inv,explored=true})=="already searched",
    "a body the survivor has already emptied must never sprout a clue behind them")
assert(Carriers.refusal({kind="corpse",container=corpse.inv,lootOpen=true})=="loot window open",
    "nor one they are looking into right now")
assert(Carriers.refusal({kind="corpse",container=corpse.inv,casePerson=true})=="already the case's person",
    "nor the case's own person: CasePerson re-dresses and re-binds her, and two systems writing into one "
    .."body's inventory is a fault waiting to happen")
assert(Carriers.refusal({kind="corpse"})=="no inventory","nor one with nothing to put it in")
assert(Carriers.refusal({kind="dog",container=corpse.inv})=="not a carrier")

-- The scan: the zombie first (reachable by definition), then the bodies, and
-- never the two that are guarded.
local found
local step=Carriers.scan(105,105,0,4,function(entry) found=entry end)
for _=1,2000 do if step() then break end end
assert(found and found.object==walker and found.kind=="zombie","the zombie in the yard is the first carrier")
local mark=Carriers.newMark(found.x,found.y,found.z,120)
assert(#mark<=Carriers.MARK_MAX and mark:sub(1,4)=="cfc:","a mark is short and ours")
assert(Carriers.claim(found,mark),"claiming stamps the mark on the body itself")
assert(walker.md[Carriers.MARK]==mark)
assert(not Carriers.claim(found,Carriers.newMark(105,105,0,121)),
    "a carrier already carrying a clue refuses a second one")

-- With the zombie taken, the scan reaches the bodies - and refuses the one
-- already searched and the one being looked into.
found=nil
step=Carriers.scan(105,105,0,4,function(entry) found=entry end)
for _=1,2000 do if step() then break end end
assert(found and found.object==corpse and found.kind=="corpse","the fresh corpse is next")
local corpseMark=Carriers.newMark(found.x,found.y,found.z,120)
assert(Carriers.claim(found,corpseMark))
found=nil
step=Carriers.scan(105,105,0,4,function(entry) found=entry end)
for _=1,2000 do if step() then break end end
assert(found==nil,
    "a searched body, an open loot window and the case's own person leave no carrier at all")

-- The zombie walks. The clue goes with it, and is found by the mark.
walker.x,walker.y=118,121
local resolved,where=Carriers.resolve({carrierMark=mark,x=105,y=105,z=0})
assert(resolved==walker.inv,"a clue on a walker is found wherever it walked")
assert(where.x==118 and where.y==121,"and its CURRENT square is what comes back")
-- A body does not walk, so it is only ever looked for where it lies.
assert(Carriers.resolve({carrierMark=corpseMark,x=106,y=105,z=0})==corpse.inv)
corpse.x,corpse.y=106+Carriers.CORPSE_RADIUS+1,105
assert(Carriers.resolve({carrierMark=corpseMark,x=106,y=105,z=0})==nil,
    "a body that is not where it lay is not found, which is what expiry is for")
corpse.x=106
-- A carrier that is simply gone.
local gone=select(1,Carriers.resolve({carrierMark="cfc:never",x=105,y=105,z=0}))
assert(gone==nil,"a burned body is not found, and nothing pretends otherwise")

-- ---------------------------------------------------------------------------
-- 3. A case with a carrier clue: placed, found, and never two on one body ---
-- ---------------------------------------------------------------------------
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local case
for seed=1,300 do
    local candidate=G.generate(catalog(),seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true})
    if candidate and #candidate.documents>=4 then
        local atFirst=0
        for _,d in ipairs(candidate.documents) do
            if d.locationId==candidate.locations[1].id then atFirst=atFirst+1 end
        end
        if atFirst>=2 then case=candidate; break end
    end
end
assert(case,"no seed in 1..300 gave a four-clue case with two clues at the first site")
local siteA,siteB=case.locations[1],case.locations[2]
local function fixedAt(s,slot)
    return {x=s.bounds.x1,y=s.bounds.y1,z=s.bounds.z,objectIndex=slot,containerIndex=0,
        containerType=s.containerTypes[1],sprite="fixture"}
end
local function carrierAt(s,markId,kind)
    return {x=s.bounds.x1,y=s.bounds.y1,z=s.bounds.z,objectIndex=0,containerIndex=0,
        containerType=S.CARRIER_CONTAINER,sprite=kind or "corpse",carrierKind=kind or "corpse",
        carrierMark="cfc:"..markId}
end
-- One container at each site, so the rest wait (P4-R133) and a carrier is what
-- the filler would reach for.
local root,waiting=S.createDistributed(case,
    {[siteA.id]={fixedAt(siteA,0)},[siteB.id]={fixedAt(siteB,0)}},nil,nil,100)
assert(root and #waiting>0,"the fixture must really leave clues waiting")
local api=assert(S.open(root,function() end))
local first=waiting[1]
local waitingSite=(api.assignment(first).locationId==siteA.id) and siteA or siteB
assert(api.assign(first,carrierAt(waitingSite,"one","zombie"),101),
    "a clue with nowhere to go may arrive on a carrier")
assert(S.validate(api.snapshot()),"and the case still validates")
assert(api.assignment(first).target.carrierKind=="zombie")
-- Never two clues on one body: the same mark is the same container.
local second=S.deferredIds(api.snapshot())[1]
assert(second,"the fixture must leave a second clue waiting")
local secondSite=(api.assignment(second).locationId==siteA.id) and siteA or siteB
local sameBody=carrierAt(secondSite,"one","corpse")
sameBody.carrierMark="cfc:one"
assert(not api.assign(second,sameBody),"a second clue on one carrier must be refused")
-- And it is refused as a cap too: one mobile clue per case.
assert(not api.assign(second,carrierAt(secondSite,"two","corpse")),
    "at most one mobile clue per case (S.MOBILE_PER_CASE)")
assert(S.MOBILE_PER_CASE==1,"the default is one, named")
assert(not S.mobileAllowed(api.snapshot(),second),"and mobileAllowed says so before anything is written")
-- A fixed container still takes it.
assert(api.assign(second,fixedAt(secondSite,7),102))
-- The carrier clue is placed and found exactly like any other.
assert(api.status(first,"placed",103))
assert(api.inspect(first),"a clue on a carrier is noted like any other")
assert(S.validate(api.snapshot()))

-- The distinctness register keys carriers on the mark, across a whole case.
local keys={}
for _,assignment in pairs(api.snapshot().assignments) do
    if assignment.target then
        local key=S.physicalKey(assignment.target)
        assert(not keys[key],"two clues share a container: "..key)
        keys[key]=true
    end
end

-- ---------------------------------------------------------------------------
-- 4. The creation-time choice is deliberate, and capped --------------------
-- ---------------------------------------------------------------------------
-- Offer every site a car part and a carrier as well as cupboards. Exactly one
-- clue of the case may take one, and it is the case's last document - the
-- opening clue is never the one that drives off.
local rich,rooms,lived={},{},{}
for _,location in ipairs(case.locations) do
    location.containerTypes[#location.containerTypes+1]="vehicle"
    table.sort(location.containerTypes)
    local list,names,here={},{},{}
    for i=1,6 do
        list[i]=fixedAt(location,i-1); names[i]="office"; here[i]=true
    end
    list[7]={x=location.bounds.x2+1,y=location.bounds.y1,z=location.bounds.z,objectIndex=0,
        containerIndex=0,containerType="vehicle",sprite="Base.Van",vehiclePart="GloveBox"}
    names[7]="GloveBox"; here[7]=true
    list[8]=carrierAt(location,"yard-"..location.id,"corpse")
    rich[location.id],rooms[location.id],lived[location.id]=list,names,here
end
local spread=assert(S.createDistributed(case,rich,rooms,lived))
local mobile,mobileIds=0,{}
for id,assignment in pairs(spread.assignments) do
    if S.isMobile(assignment.target) then mobile=mobile+1; mobileIds[#mobileIds+1]=id end
end
assert(mobile==S.MOBILE_PER_CASE,"exactly one clue of the case is mobile, got "..mobile)
assert(mobileIds[1]==S.mobileDocId(case),"and it is the one the case named, not whichever asked first")
assert(spread.assignments[case.documents[1].id].target.vehiclePart==nil
    and spread.assignments[case.documents[1].id].target.carrierMark==nil,
    "the opening clue is never the one that moves")
assert(S.mobileCount(spread)==1)
-- Without any hint (the original counts-indexed path) the cap still holds.
local plainList={}
for _,location in ipairs(case.locations) do
    local list={}
    for i=1,#case.documents do list[i]=carrierAt(location,"c"..i..location.id,"corpse") end
    plainList[location.id]=list
end
local capped=assert(S.createDistributed(case,plainList))
assert(S.mobileCount(capped)<=S.MOBILE_PER_CASE,
    "a case cannot collect four carrier clues merely because nobody passed a hint")

-- ---------------------------------------------------------------------------
-- 5. The icon follows the carrier ------------------------------------------
-- ---------------------------------------------------------------------------
local clue={id="d1",x=118,y=121,z=0,status="placed",recognised=false,carrier=true,mark=mark}
assert(Rules.wantsIcon(clue,118,120,true),"a carrier clue gets the same icon as a cupboard's")
-- The icon is dropped once the carrier has really moved, and comes back on its
-- new square on the next pass. A step or two does not count: re-adding the icon
-- restarts the game's spot timer, so at zero tolerance a walker could never be
-- spotted at all.
assert(not Rules.dropIcon(clue,118,120,true,nil,0,118+Rules.MOVE_TILES,121),
    "a carrier that shuffled keeps its pin")
assert(Rules.dropIcon(clue,118,120,true,nil,0,118+Rules.MOVE_TILES+1,121),
    "one that walked on loses it, and gets a new one where it is now")
local add,drop=Rules.plan({clue},{["d1"]={x=100,y=100}},118,120,true,0)
assert(#drop==1 and drop[1]=="d1")
add=Rules.plan({clue},{},118,120,true,0)
assert(#add==1 and add[1]=="d1","and the icon goes up at the carrier's current square")
-- A driven car still loses its icon: the tolerance is two tiles, not a street.
local car={id="d2",x=130,y=12,z=0,status="placed",recognised=false,vehicle=true}
assert(Rules.dropIcon(car,130,12,true,nil,0,120,10),"the icon is not where the car is")
assert(not Rules.dropIcon(car,130,12,true,nil,0,130,10),"the icon is where the car is")

-- ---------------------------------------------------------------------------
-- 6. A carrier that is gone expires, and the case still completes ----------
-- ---------------------------------------------------------------------------
local lost=assert(S.createDistributed(case,
    {[siteA.id]={fixedAt(siteA,0)},[siteB.id]={fixedAt(siteB,0)}},nil,nil,100))
local lostApi=assert(S.open(lost,function() end))
local mobileId=S.deferredIds(lostApi.snapshot())[1]
local mobileSite=(lostApi.assignment(mobileId).locationId==siteA.id) and siteA or siteB
assert(lostApi.assign(mobileId,carrierAt(mobileSite,"walks-off","zombie"),200))
assert(lostApi.status(mobileId,"placed",200))
-- A carrier we could not find. Only the FIRST such hour counts: the wait is
-- measured from when it went, not from the last time we looked.
assert(lostApi.missing(mobileId,210))
assert(lostApi.missing(mobileId,260))
assert(lostApi.assignment(mobileId).missingHours==210,"the wait starts when the carrier went")
assert(S.validate(lostApi.snapshot()),"a clue whose carrier is missing still validates")
assert(#S.missingIds(lostApi.snapshot(),210+S.DEFER_EXPIRE_HOURS-0.1)==0,
    "a carrier has the same three in-game days as a clue with nowhere to go")
-- It turns up again: a zombie in an unloaded cell is not a zombie that is gone.
assert(lostApi.missing(mobileId,nil))
assert(lostApi.assignment(mobileId).missingHours==nil)
assert(#S.missingIds(lostApi.snapshot(),1000)==0,"a carrier that came back never expires")
-- Gone for good.
assert(lostApi.missing(mobileId,300))
local expired=S.missingIds(lostApi.snapshot(),300+S.DEFER_EXPIRE_HOURS)
assert(#expired==1 and expired[1]==mobileId)
-- A cupboard cannot go missing, and a clue already found is never dropped.
local fixedId
for _,d in ipairs(case.documents) do
    local assignment=lostApi.assignment(d.id)
    if assignment.target and not S.isMobile(assignment.target) then fixedId=d.id end
end
assert(fixedId and not lostApi.missing(fixedId,300),"only a clue on something that moves can lose its carrier")
assert(lostApi.dropMissing(mobileId,300+S.DEFER_EXPIRE_HOURS),"three days and the clue is dropped")
local after=lostApi.assignment(mobileId)
assert(after.status=="dropped" and after.target==nil and after.missingHours==nil,
    "a dropped clue has the same shape as one that never arrived: no target, nowhere")
assert(after.locationId and after.deferredHours==300+S.DEFER_EXPIRE_HOURS)
assert(S.validate(lostApi.snapshot()),"and the case validates")
assert(not lostApi.inspect(mobileId),"a dropped clue can never be found")
-- The case closes on the clues it got.
local placedIds={}
for _,d in ipairs(case.documents) do
    local assignment=lostApi.assignment(d.id)
    if assignment.status~="dropped" and assignment.status~="deferred" then placedIds[#placedIds+1]=d.id end
end
for _,id in ipairs(S.deferredIds(lostApi.snapshot())) do assert(lostApi.drop(id)) end
for _,id in ipairs(placedIds) do
    assert(lostApi.status(id,"placed",301) or lostApi.assignment(id).status=="placed")
    assert(lostApi.inspect(id))
end
assert(S.accounted(lostApi.snapshot()),"a clue whose carrier is gone is accounted for")
local closed=assert(Retired.retire(lostApi.snapshot(),nil,400),
    "the case must still finish - a case with one clue fewer is still a case")
for _,row in ipairs(closed.rows) do
    assert(row.id~=mobileId,"a clue whose carrier is gone leaves no row, so no record can call it lost")
end
assert(Retired.validate(closed))
-- A clue already recognised is never dropped, whatever the world did with the
-- body it was in.
local held=assert(S.createDistributed(case,
    {[siteA.id]={fixedAt(siteA,0)},[siteB.id]={fixedAt(siteB,0)}},nil,nil,100))
local heldApi=assert(S.open(held,function() end))
local heldId=S.deferredIds(heldApi.snapshot())[1]
local heldSite=(heldApi.assignment(heldId).locationId==siteA.id) and siteA or siteB
assert(heldApi.assign(heldId,carrierAt(heldSite,"in-hand","corpse"),200))
assert(heldApi.status(heldId,"placed",200))
assert(heldApi.recognise(heldId))
assert(not heldApi.dropMissing(heldId,900),"a clue already found is never dropped")

-- ---------------------------------------------------------------------------
-- 7. The mailbox kind ------------------------------------------------------
-- ---------------------------------------------------------------------------
assert(Storage.KINDS[Storage.MAILBOX],"a mailbox is a container kind")
assert(Storage.UNVERIFIED[Storage.MAILBOX],
    "and it is declared UNVERIFIED until a real game confirms the engine's own type string")
local Catalog=require("ConspiracyFiles/Generated/Catalog")
local mailSite={id="t3:mail",name="Mail",areaId="a",mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",
    bounds={x1=0,y1=0,x2=4,y2=4,z=0},source={kind="synthetic",reference="test"},
    paperStorage="observed",containerTypes={Storage.MAILBOX},excluded=false}
assert(Catalog.validate({revision="test-mailbox",locations={mailSite}}),
    "a site whose only storage is a mailbox must be a valid site")
assert(S.target({x=1,y=1,z=0,objectIndex=0,containerIndex=0,containerType=Storage.MAILBOX,
    sprite="mailbox_01"},mailSite),"and a clue may be placed in it, as in any fixed container")
assert(Storage.MAX_KINDS>=6,"six furniture kinds must fit in a site's list, or one is silently lost")
local Words=require("ConspiracyFiles/ContainerWords")
assert(Words.phrase(Storage.MAILBOX)=="In a mailbox","the record says where in words")

-- ---------------------------------------------------------------------------
-- 8. The runtime is wired the way the design says --------------------------
-- ---------------------------------------------------------------------------
local function read(path) local f=assert(io.open(path,"r")); local s=f:read("*a"); f:close(); return s end
local runtime=read("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua")
local filler=assert(runtime:match("local function filler%(api%)(.-)\nend\n"),"the filler must exist")
assert(filler:find("Session.mobileAllowed(api.snapshot(),id)",1,true),
    "the filler asks the cap before it ever looks for a carrier")
assert(filler:find("carrierScanFor(site,",1,true),"and looks for one at the clue's own site")
assert(filler:find("Carriers.claim(carrier,mark)",1,true),"the mark is claimed before the clue is written")
assert(filler:find("StaleClue.tooClose(",1,true),"nothing materialises under the survivor's feet")
assert(filler:find('scheduler.enqueue("place:"..id,"placement",placement(api,id))',1,true),
    "and the same placement job writes it as any other clue")
for _,forbidden in ipairs({"PlayerVoice","setHaloNote","ClueHints","ClueMarkers","onCase"}) do
    assert(not filler:find(forbidden,1,true),"a clue arriving on a carrier says nothing to the player: "..forbidden)
end
local watch=assert(runtime:match("local function carrierWatch%(api%)(.-)\nend\n"),"the carrier watch must exist")
assert(runtime:find('scheduler.enqueue("carrier:"..i,"carrier",carrierWatch(api))',1,true),
    "one carrier-watch job per session, on the existing tick dispatch beside the filler")
assert(watch:find("Session.missingIds(root,hours)",1,true) and watch:find("api.dropMissing(",1,true),
    "three in-game days with no carrier and the clue is dropped")
assert(watch:find("Carriers.FIND_RADIUS",1,true),
    '"gone" is only concluded where the survivor could actually have looked')
assert(watch:find("api.missing(d.id,found and nil or hours)",1,true),
    "and the hour is cleared the moment the carrier turns up again")
local relocate=assert(runtime:match("local function relocation%(api%)(.-)\nend\n"))
assert(relocate:find('type(a.target.carrierMark)=="string" then return true',1,true),
    "a clue on a carrier does not relocate; its answer to going stale is expiry")
local search=read("mod/common/media/lua/client/ConspiracyFiles/ClueSearch.lua")
assert(search:find("Carriers.findMark",1,true) and search:find("C.carrierSpot(clue)",1,true),
    "Search Mode anchors a carrier clue's icon to where the carrier is now")
assert(runtime:find('place=(carrier and ("carrier:"..t.carrierMark))',1,true),
    "the wordless cue's once-per-place key is the carrier, not the square it started on")
assert(runtime:find("integerish(t.x) and integerish(t.y) and integerish(t.z)",1,true),
    "clueTargets never hands nil coordinates to the icon layer")

print(string.format(
    "PASS clues on the move: carrier target validated and keyed on its mark, a zombie and a corpse each "
    .."took a clue and were found after moving, %d mobile clue per case, a vanished carrier dropped at %d "
    .."in-game hours and the case closed on %d rows, mailbox kind %q declared unverified",
    S.MOBILE_PER_CASE,S.DEFER_EXPIRE_HOURS,#closed.rows,Storage.MAILBOX))
