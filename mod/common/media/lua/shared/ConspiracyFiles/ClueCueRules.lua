-- The wordless cue (P4-R132, docs/design/SEARCH_TO_FIND.md, "Sense").
--
-- The rules only, with no game in them, so they can be tested in plain Lua.
-- ClueCue (client) asks the game what the survivor can see and how dark and
-- wet it is, and says the line.
--
-- Passing close to a clue nobody has recognised, where the survivor could see
-- it, they may make a sound: "Hm?". It never names the thing, its direction or
-- its distance, so it can only ever mean "somewhere around here".
local S={}

-- The only teaching in the mod: the very first cue of the save.
S.FIRST="Hm? I should have a proper look around here."
S.CUE="Hm?"
-- An earlier cue of the same case was already given.
S.AGAIN="...again?"

-- Close enough to notice (tiles, same floor), and how far away the survivor
-- must go before the same spot is weighed again. The gap keeps a survivor
-- standing at the edge from rolling the chance on every step.
S.RADIUS=3
S.FORGET_RADIUS=5
-- No cue within this long of the last one, wherever it was.
S.COOLDOWN_MS=60000
-- The chance in good light and clear weather. It falls with the game's own
-- light and weather factors for foraging (1 = bright and clear).
S.BASE_CHANCE=0.8
-- Bounded save: at most this many cued places are remembered.
S.MAX_PLACES=64

-- Checks only: a fixed chance. Never set by the mod itself.
S.debugChance=nil

local function clamp(v)
    v=tonumber(v) or 0
    if v<0 then return 0 elseif v>1 then return 1 end
    return v
end

function S.chance(light,weather)
    if S.debugChance then return S.debugChance end
    return S.BASE_CHANCE*clamp(light)*clamp(weather)
end

function S.near(px,py,pz,x,y,z,r)
    if math.floor(pz)~=z then return false end
    return math.abs(math.floor(px)-x)<=r and math.abs(math.floor(py)-y)<=r
end

-- The saved state: {first=true once any cue was given, cases={caseId=n},
-- places={"caseId|place"=true}}. Created lazily in whatever table the caller
-- keeps (ModData in game).
function S.state(store)
    store.cases=type(store.cases)=="table" and store.cases or {}
    store.places=type(store.places)=="table" and store.places or {}
    return store
end

local function placeKey(clue) return tostring(clue.case).."|"..tostring(clue.place) end
S.placeKey=placeKey

-- Which line, for a cue about to be given.
function S.line(store,caseId)
    if not store.first then return S.FIRST end
    if store.cases and (store.cases[tostring(caseId)] or 0)>0 then return S.AGAIN end
    return S.CUE
end

-- Should this clue give a cue now? Returns the line, or nil and why.
-- `lastAt` is the time of the last cue this session; `roll` is in [0,1).
function S.decide(store,clue,now,lastAt,roll,light,weather)
    if type(clue)~="table" then return nil,"no clue" end
    if clue.recognised then return nil,"recognised" end
    if clue.status~="placed" then return nil,"not placed" end
    if store.places and store.places[placeKey(clue)] then return nil,"place already cued" end
    if lastAt and now-lastAt<S.COOLDOWN_MS then return nil,"cooldown" end
    local chance=S.chance(light,weather)
    if (roll or 1)>=chance then return nil,string.format("chance %.2f",chance) end
    return S.line(store,clue.case)
end

-- Remember a cue given for this clue's place.
function S.record(store,clue)
    store.first=true
    local case=tostring(clue.case)
    store.cases[case]=(store.cases[case] or 0)+1
    store.places[placeKey(clue)]=true
end

-- Forget cases that are no longer live (`live` = {caseId=true}), and keep the
-- place list bounded. The first-cue flag is never forgotten.
function S.prune(store,live)
    for case in pairs(store.cases) do
        if not live[case] then store.cases[case]=nil end
    end
    local keys={}
    for key in pairs(store.places) do
        local case=key:match("^(.-)|")
        if not live[case] then store.places[key]=nil else keys[#keys+1]=key end
    end
    if #keys>S.MAX_PLACES then
        table.sort(keys)
        for i=1,#keys-S.MAX_PLACES do store.places[keys[i]]=nil end
    end
end

return S
