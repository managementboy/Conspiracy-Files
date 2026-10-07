-- Which vanilla scene a patch of the world shows (task 3 plan, step 5;
-- directive NH-D7). PURE: no engine calls; the runtime (VanillaSceneRuntime)
-- reads the world and hands a snapshot here. WRITER/ENGINEER DATA.
--
-- Vanilla builds its scenes when a chunk first loads and raises no Lua event
-- for them, so a scene is recognised from what it leaves: room names, placed
-- tile objects, items lying on the floor, bodies, zombies and vehicles. A
-- snapshot becomes TOKENS ("room:jackiejayestudio", "item:Base.Microphone",
-- "vehicle:StepVan_Plonkies"...), keeping only tokens some signature names.
-- A kind matches when its signature finds TWO TRACES OF DIFFERENT SORTS,
-- every trace it marks `must`, and at least one trace it marks `only`
-- (exclusive to the story). Tokens seen on earlier looks at the same cell
-- are kept (the pending-traces record in the world record), so a scene the
-- player emptied before it was confirmed still confirms, and its clue keeps
-- waiting (owner, 2026-09-27).
--
-- SIGNATURES ARE ONLY WHAT WAS READ IN THE JAR (projectzomboid.jar, build
-- 42.20, javap -c on zombie.randomizedWorld.*, 2026-09-27): the string
-- constants each class passes to addItemOnGround, addTileObject, addZombies*,
-- addVehicle / spawnCarOnNearestNav and BuildingDef.getRoom / getRoom, and
-- the `name` its constructor stores (getName(), `story` below), each trace
-- then checked for EXCLUSIVITY against the game's Lua (`only` below). Every
-- other allowed kind is "unverified": it never matches until a signature
-- with an exclusive trace is added here (M.DEMOTED lists those checked and
-- found without one).
--
-- PREFILTER (M.allowFromNames): a kind only matches when the running game's
-- own story lists name its story (getWorld():getRandomizedBuildingList(),
-- getRBBasic():getSurvivorStories(), getRandomizedZoneList(),
-- getRandomizedVehicleStoryList(), each entry's getName(); as vanilla's
-- DebugContextMenu reads them). The stories' isValid(...) is NOT called: for
-- a building story it can run customizeStartingHouse on the player's own house
-- (RandomizedBuildingBase.isValid, javap 42.20) - a side effect, not a query.
local Scenes=require("OIShared/Generated/VanillaScenes")
local M={DIRECTIVE="NH-D7"}

M.SORTS={room=true,sprite=true,item=true,body=true,zombie=true,vehicle=true}
M.MAX_TOKENS=24
M.CELL=10

-- `story`: the name the game's own story list gives the kind. `common`: a
-- trace any ordinary house shows (a kitchen); alone it is no reason to keep
-- pending traces in the save (M.worthKeeping). `only`: an EXCLUSIVE trace -
-- nothing in the game but this story (or its story family) creates it: not
-- the map, not a loot table (Distributions, ProceduralDistributions,
-- VehicleDistributions, StoryClutter), not a vehicle zone
-- (VehicleZoneDefinition), not a zombie zone (ZombiesZoneDefinition), not a
-- vehicle's zombieType, not another story class in the jar. A kind confirms
-- only when at least one `only` trace is found: an ordinary parked car and a
-- stray item from a loot table are not a scene (2026-09-27, build 42.20).
M.SIGNATURES={
    -- RBJackieJaye: BuildingDef.getRoom("jackiejayestudio"); Microphone,
    -- Notepad, Pen by addItemOnGround on one RoomDef.getFreeSquare();
    -- addZombies(def,1,"Jackie_Jaye",...,studio). The room is on the map
    -- whether or not the story ran, and RBBasic.doOfficeStuff fills it with
    -- office clutter; the props are ordinary. Jackie_Jaye is in no
    -- ZombiesZoneDefinition list, no vehicle zombieType; in the jar only
    -- RBJackieJaye and RZJackieJaye (her own family) name it. (Its citation
    -- decides the scene by place; this signature never makes a second one.)
    {kind="RBJackieJaye",story="JackieJaye",traces={
        {id="studio",sort="room",any={"jackiejayestudio"},must=true},
        {id="props",sort="item",any={"Base.Microphone","Base.Notepad","Base.Pen"}},
        {id="jackie",sort="zombie",any={"Jackie_Jaye"},only=true},
        {id="jackieDead",sort="body",any={"Jackie_Jaye"},only=true}}},
    -- RDSRatKing: addItemOnGround("Base.RatKing") on a free square of a
    -- bedroom, kitchen or living room (getRoom), with Base.Dung_Rat.
    -- Base.RatKing is in no loot table or recipe; in the jar only RDSRatKing
    -- creates it (RBBasic only lists the story).
    {kind="RDSRatKing",story="Rat King",traces={
        {id="king",sort="item",any={"Base.RatKing"},must=true,only=true},
        {id="room",sort="room",any={"bedroom","kitchen","livingroom"},common=true}}},
    -- RVSPlonkies: addVehicle(...,"StepVan_Plonkies",...), addItemOnGround of
    -- a Base.Plonkies, addZombiesOnVehicle(...,"PlonkiesGuy",...). The van
    -- parks in business vehicle zones and Plonkies are van/bag loot; the
    -- PlonkiesGuy outfit is in no zombie zone, no vehicle zombieType, and in
    -- the jar only RVSPlonkies names it. Killed, he leaves a body in it.
    {kind="RVSPlonkies",story="Plonkies",traces={
        {id="van",sort="vehicle",any={"StepVan_Plonkies"},must=true},
        {id="bag",sort="item",any={"Base.Plonkies"}},
        {id="guy",sort="zombie",any={"PlonkiesGuy"},only=true},
        {id="guyDead",sort="body",any={"PlonkiesGuy"},only=true}}},
}

-- DEMOTED (2026-09-27, build 42.20): every trace these stories leave also
-- occurs without them, and the jar shows nothing else they create that only
-- they create. Unverified: they never match. The citation path (decided by
-- place) is not affected.
M.DEMOTED={
    -- CarLightsPolice: VehicleZoneDefinition police/prison zones; Police
    -- outfit: ZombiesZoneDefinition (a police zone and Default, chance 0.25);
    -- kitchen/living room: every house; the rest are random dead bodies and
    -- the car's own zombieType.
    {kind="RDSPoliceAtHouse",why="police car, police zombies and a kitchen are all ordinary"},
    -- CarLuxury: VehicleZoneDefinition medium/good/luxuryDealership/sport/
    -- professional; Briefcase_Money: ProceduralDistributions (BankDeposit,
    -- DrugLab*) and StoryClutter.MurderSceneClutter (another story drops it
    -- on the ground); its zombies wear Classy/Gaudy (ZombiesZoneDefinition).
    {kind="RVSRichJerk",why="luxury car, case of money and Classy/Gaudy zombies are all ordinary"},
    -- VanAmbulance: VehicleZoneDefinition ambulance zone; AmbulanceDriver is
    -- the van's own zombieType; HospitalPatient: ZombiesZoneDefinition
    -- hospitalroom; the second car is a random one.
    {kind="RVSAmbulanceCrash",why="ambulance, its driver and hospital patients are all ordinary"},
    -- Base.EmptyPetrolCan names no item in 42.20 (the can is PetrolCan /
    -- PetrolCanEmpty), so it is never placed; graves 32/33 are map tiles and
    -- player-dug graves; Shovel is loot; MobCasual: ZombiesZoneDefinition Mob;
    -- the burnt car and the body are random.
    {kind="RZSMurderScene",why="its petrol can is never created; graves, shovel, MobCasual zombies are ordinary"},
    -- Every grave sprite it places (22/23/32-35/40-43) is on the map and
    -- 32-35/40-43 are what a player's dug and filled graves show; shovel and
    -- empty bottles are loot; the bodies are random.
    {kind="RZSBuryingCamp",why="graves are map tiles and player graves; shovel and bottles are loot"},
}

local relevant,rare,byKind,byStory={},{},{},{}
for _,s in ipairs(M.SIGNATURES) do
    byKind[s.kind]=s
    byStory[s.story]=s.kind
    for _,t in ipairs(s.traces) do
        for _,name in ipairs(t.any) do
            local token=t.sort..":"..name
            relevant[token]=true
            if not t.common then rare[token]=true end
        end
    end
end

-- "verified" (a signature read in the jar), "unverified" (allowed, never
-- matches yet) or "refused" (VanillaScenes refuses it, or unknown).
function M.status(kind)
    if not Scenes.allowed(kind) then return "refused" end
    return byKind[kind] and "verified" or "unverified"
end
function M.signature(kind) return byKind[kind] end
function M.relevant(token) return relevant[token]==true end
-- Pending traces are worth a line in the save only when one of them is
-- more than an ordinary house shows.
function M.worthKeeping(tokens)
    for _,t in ipairs(tokens or {}) do if rare[t] then return true end end
    return false
end

-- THE PREFILTER. names: the story names the running game lists (getName()).
-- Returns the set of kinds whose story is listed, or nil when the game listed
-- nothing readable (then no prefilter applies: the signatures alone decide).
function M.allowFromNames(names)
    local allow,any={},false
    for _,name in ipairs(names or {}) do
        if type(name)=="string" then
            any=true
            local kind=byStory[name]
            if kind then allow[kind]=true end
        end
    end
    if not any then return nil end
    return allow
end

-- A vehicle's script name without its module ("Base.CarLuxury" -> "CarLuxury").
local function bare(name) return (string.gsub(name,"^[%w_]+%.","")) end
function M.vehicleToken(script) return "vehicle:"..bare(tostring(script)) end

-- snapshot: {rooms={...}, sprites={...}, items={...}, bodies={...outfits},
-- zombies={...outfits}, vehicles={...scripts}}, each a list of strings.
-- Returns the relevant tokens, sorted and distinct.
function M.tokens(snapshot)
    local seen,out={}, {}
    if type(snapshot)~="table" then return out end
    local lists={room=snapshot.rooms,sprite=snapshot.sprites,item=snapshot.items,
        body=snapshot.bodies,zombie=snapshot.zombies,vehicle=snapshot.vehicles}
    for sort,list in pairs(lists) do
        for _,name in ipairs(type(list)=="table" and list or {}) do
            if type(name)=="string" and name~="" then
                local token=sort..":"..(sort=="vehicle" and bare(name) or name)
                if relevant[token] and not seen[token] then seen[token]=true; out[#out+1]=token end
            end
        end
    end
    table.sort(out)
    return out
end

-- Tokens a and b together, relevant ones only, sorted, at most MAX_TOKENS.
function M.merge(a,b)
    local seen,out={}, {}
    for _,list in ipairs({a or {},b or {}}) do
        for _,t in ipairs(list) do
            if type(t)=="string" and relevant[t] and not seen[t] then seen[t]=true; out[#out+1]=t end
        end
    end
    table.sort(out)
    while #out>M.MAX_TOKENS do table.remove(out) end
    return out
end

-- The first kind the tokens show, in signature order, or nil. `allow`
-- (optional) is the prefilter: a set of kinds the running game lists; a kind
-- missing from it never matches. Refused kinds never match; nor does a kind
-- without an exclusive (`only`) trace among those found. Returns the kind,
-- the ids of the traces found and the token of the first `must` trace found
-- (where the scene is anchored: M.anchorToken).
function M.match(tokens,allow)
    local have={}
    for _,t in ipairs(tokens or {}) do have[t]=true end
    for _,s in ipairs(M.SIGNATURES) do
        if Scenes.allowed(s.kind) and (allow==nil or allow[s.kind]) then
            local sorts,nSorts,found,missing,anchor,exclusive={},0,{},false,nil,false
            for _,t in ipairs(s.traces) do
                local hit
                for _,name in ipairs(t.any) do
                    local token=t.sort..":"..name
                    if not hit and have[token] then hit=token end
                end
                if hit then
                    found[#found+1]=t.id
                    if t.only then exclusive=true end
                    if t.must and not t.common and not anchor then anchor=hit end
                    if not sorts[t.sort] then sorts[t.sort]=true; nSorts=nSorts+1 end
                elseif t.must then missing=true end
            end
            if not missing and exclusive and nSorts>=2 then return s.kind,found,anchor end
        end
    end
    return nil
end

-- CELLS. The world is watched in CELL x CELL squares; a scene is keyed by the
-- cell holding its anchoring trace, so the same scene seen from two
-- neighbouring cells is one record.
function M.cellOf(x,y) return math.floor(x/M.CELL),math.floor(y/M.CELL) end
function M.cellKey(cx,cy,z) return "cell:"..cx..":"..cy..":"..math.floor(z) end
function M.keyAt(x,y,z) local cx,cy=M.cellOf(x,y); return M.cellKey(cx,cy,z) end
function M.cellBounds(cx,cy)
    return {x1=cx*M.CELL,y1=cy*M.CELL,x2=cx*M.CELL+M.CELL,y2=cy*M.CELL+M.CELL}
end
-- The flagged cells to look at now: those whose centre is within `reach`
-- tiles (Chebyshev) of the survivor, on their floor, nearest first, at most
-- `limit`. flagged: {key={cx,cy,z}}. Pure, so the order is testable.
function M.nearCells(flagged,px,py,pz,reach,limit)
    local rows={}
    for key,c in pairs(flagged or {}) do
        if c.z==math.floor(pz) then
            local mx,my=c.cx*M.CELL+M.CELL/2,c.cy*M.CELL+M.CELL/2
            local d=math.max(math.abs(mx-px),math.abs(my-py))
            if d<=reach then rows[#rows+1]={key=key,d=d} end
        end
    end
    table.sort(rows,function(a,b) if a.d~=b.d then return a.d<b.d end return a.key<b.key end)
    local out={}
    for i=1,math.min(#rows,limit or #rows) do out[i]=rows[i].key end
    return out
end

return M
