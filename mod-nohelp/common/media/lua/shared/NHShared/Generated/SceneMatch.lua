-- Which vanilla scene a patch of the world shows (task 3 plan, step 5;
-- directive NH-D7). PURE: no engine calls; the runtime (VanillaSceneRuntime)
-- reads the world and hands a snapshot here. WRITER/ENGINEER DATA.
--
-- Vanilla builds its scenes when a chunk first loads and raises no Lua event
-- for them, so a scene is recognised from what it leaves: room names, placed
-- tile objects, items lying on the floor, bodies, zombies and vehicles. A
-- snapshot becomes TOKENS ("room:jackiejayestudio", "item:Base.Microphone",
-- "vehicle:StepVan_Plonkies"...), keeping only tokens some signature names.
-- A kind matches when its signature finds TWO TRACES OF DIFFERENT SORTS and
-- every trace it marks `must`. Tokens seen on earlier looks at the same cell
-- are kept (the pending-traces record in the world record), so a scene the
-- player emptied before it was confirmed still confirms, and its clue keeps
-- waiting (owner, 2026-09-27).
--
-- SIGNATURES ARE ONLY WHAT WAS READ IN THE JAR (projectzomboid.jar, build
-- 42.20, javap -c on zombie.randomizedWorld.*, 2026-09-27): the string
-- constants each class passes to addItemOnGround, addTileObject, addZombies*,
-- addVehicle / spawnCarOnNearestNav and BuildingDef.getRoom / getRoom, and
-- the `name` its constructor stores (getName(), `story` below). At least one
-- kind per family is verified; every other allowed kind is "unverified": it
-- never matches until a signature is added here.
--
-- PREFILTER (M.allowFromNames): a kind only matches when the running game's
-- own story lists name its story (getWorld():getRandomizedBuildingList(),
-- getRBBasic():getSurvivorStories(), getRandomizedZoneList(),
-- getRandomizedVehicleStoryList(), each entry's getName(); as vanilla's
-- DebugContextMenu reads them). The stories' isValid(...) is NOT called: for
-- a building story it can run customizeStartingHouse on the player's own house
-- (RandomizedBuildingBase.isValid, javap 42.20) - a side effect, not a query.
local Scenes=require("NHShared/Generated/VanillaScenes")
local M={DIRECTIVE="NH-D7"}

M.SORTS={room=true,sprite=true,item=true,body=true,zombie=true,vehicle=true}
M.MAX_TOKENS=24
M.CELL=10

-- `story`: the name the game's own story list gives the kind. `common`: a
-- trace any ordinary house shows (a kitchen); alone it is no reason to keep
-- pending traces in the save (M.worthKeeping).
M.SIGNATURES={
    -- RBJackieJaye: BuildingDef.getRoom("jackiejayestudio"); Microphone,
    -- Notepad, Pen by addItemOnGround on one RoomDef.getFreeSquare().
    {kind="RBJackieJaye",story="JackieJaye",traces={
        {id="studio",sort="room",any={"jackiejayestudio"},must=true},
        {id="props",sort="item",any={"Base.Microphone","Base.Notepad","Base.Pen"}}}},
    -- RDSPoliceAtHouse: addZombies(def,n,"Police",...) in the room
    -- getLivingRoomOrKitchen picks, spawnCarOnNearestNav("Base.CarLightsPolice").
    -- All three: a police car and police zombies alone are a road blockade.
    {kind="RDSPoliceAtHouse",story="Police at House",traces={
        {id="car",sort="vehicle",any={"CarLightsPolice"},must=true},
        {id="police",sort="zombie",any={"Police"},must=true},
        {id="home",sort="room",any={"livingroom","kitchen"},must=true,common=true}}},
    -- RDSRatKing: addItemOnGround("Base.RatKing") on a free square of a
    -- bedroom, kitchen or living room (getRoom), with Base.Dung_Rat.
    {kind="RDSRatKing",story="Rat King",traces={
        {id="king",sort="item",any={"Base.RatKing"},must=true},
        {id="room",sort="room",any={"bedroom","kitchen","livingroom"},common=true}}},
    -- RVSPlonkies: addVehicle(...,"StepVan_Plonkies",...), addItemOnGround of
    -- a Base.Plonkies.
    {kind="RVSPlonkies",story="Plonkies",traces={
        {id="van",sort="vehicle",any={"StepVan_Plonkies"},must=true},
        {id="bag",sort="item",any={"Base.Plonkies"}}}},
    -- RVSRichJerk: addVehicle(...,"CarLuxury",...), addItemOnGround of a
    -- Base.Briefcase_Money.
    {kind="RVSRichJerk",story="Rich Jerk",traces={
        {id="car",sort="vehicle",any={"CarLuxury"},must=true},
        {id="case",sort="item",any={"Base.Briefcase_Money"}}}},
    -- RVSAmbulanceCrash: addVehicle(...,"Base.VanAmbulance",...) with
    -- addZombiesOnVehicle dressed AmbulanceDriver / HospitalPatient.
    {kind="RVSAmbulanceCrash",story="Ambulance Crash",traces={
        {id="van",sort="vehicle",any={"VanAmbulance"},must=true},
        {id="crew",sort="zombie",any={"AmbulanceDriver","HospitalPatient"}}}},
    -- RZSMurderScene: addTileObject cemetary_01_32/33, addItemOnGround
    -- Base.EmptyPetrolCan and Base.Shovel. Checked before the burying camp,
    -- which also uses 32/33 and a shovel but never a petrol can.
    {kind="RZSMurderScene",story="Murder Scene",traces={
        {id="grave",sort="sprite",any={"location_community_cemetary_01_32","location_community_cemetary_01_33"}},
        {id="can",sort="item",any={"Base.EmptyPetrolCan"},must=true}}},
    -- RZSBuryingCamp: addTileObject cemetary_01_22/23/34/35/40-43 (and 32/33),
    -- addItemOnGround Base.Shovel, Base.WhiskeyEmpty, Base.WineEmpty.
    {kind="RZSBuryingCamp",story="Burying Camp",traces={
        {id="graves",sort="sprite",any={"location_community_cemetary_01_22","location_community_cemetary_01_23",
            "location_community_cemetary_01_34","location_community_cemetary_01_35","location_community_cemetary_01_40",
            "location_community_cemetary_01_41","location_community_cemetary_01_42","location_community_cemetary_01_43"},must=true},
        {id="left",sort="item",any={"Base.Shovel","Base.WhiskeyEmpty","Base.WineEmpty"}}}},
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
-- missing from it never matches. Refused kinds never match. Returns the kind,
-- the ids of the traces found and the token of the first `must` trace found
-- (where the scene is anchored: M.anchorToken).
function M.match(tokens,allow)
    local have={}
    for _,t in ipairs(tokens or {}) do have[t]=true end
    for _,s in ipairs(M.SIGNATURES) do
        if Scenes.allowed(s.kind) and (allow==nil or allow[s.kind]) then
            local sorts,nSorts,found,missing,anchor={},0,{},false,nil
            for _,t in ipairs(s.traces) do
                local hit
                for _,name in ipairs(t.any) do
                    local token=t.sort..":"..name
                    if not hit and have[token] then hit=token end
                end
                if hit then
                    found[#found+1]=t.id
                    if t.must and not t.common and not anchor then anchor=hit end
                    if not sorts[t.sort] then sorts[t.sort]=true; nSorts=nSorts+1 end
                elseif t.must then missing=true end
            end
            if not missing and nSorts>=2 then return s.kind,found,anchor end
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
