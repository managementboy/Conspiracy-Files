-- WHERE ON OPEN GROUND A CLUE MAY LIE (task 3 plan, step 2/4; owner,
-- 2026-09-27: "You can place the clues anywhere that is interesting").
--
-- Pure rules over a plain "facts" table; the runtime (GeneratedRuntime's
-- groundScan) reads the facts from the engine, lazily, so a rule that fails
-- early saves the engine calls behind it. Nothing here touches the engine.
--
-- Which squares are tried, and in what order, is a function of the world:
-- Pick.hash of (world seed, area, clue, try number). A reload tries the same
-- squares in the same order.
local Pick=require("NHShared/Generated/Pick")
local G={}
G.MAX_TRIES=64          -- squares looked at per filler attempt, at most
G.MAX_BOX=44            -- the searched box is at most 44 x 44 squares
G.CROWD_ZOMBIES=4       -- this many zombies ...
G.CROWD_RADIUS=6        -- ... within this many tiles is a crowd
G.MAX_LABEL=80
-- Tries wrap after this many rounds of MAX_TRIES, so a clue whose squares all
-- fail today starts over rather than counting forever.
G.MAX_ROUNDS=64

-- The box searched around a site: its bounds widened by `margin`, then
-- clamped to MAX_BOX a side around the site's centre. x2/y2 exclusive.
function G.box(bounds,margin)
    margin=margin or 0
    local x1,y1,x2,y2=bounds.x1-margin,bounds.y1-margin,bounds.x2+margin,bounds.y2+margin
    if x2-x1>G.MAX_BOX then
        local cx=math.floor((bounds.x1+bounds.x2)/2)
        x1=cx-G.MAX_BOX/2; x2=x1+G.MAX_BOX
    end
    if y2-y1>G.MAX_BOX then
        local cy=math.floor((bounds.y1+bounds.y2)/2)
        y1=cy-G.MAX_BOX/2; y2=y1+G.MAX_BOX
    end
    return {x1=x1,y1=y1,x2=x2,y2=y2,z=bounds.z}
end

-- The square of try number `index` (1-based) in `box`, in hash order.
function G.square(seed,areaId,docId,index,box)
    local w,h=box.x2-box.x1,box.y2-box.y1
    local n=w*h
    if n<=0 then return nil end
    local k=Pick.hash(Pick.key({seed,areaId,docId,index,"ground"}))%n
    return box.x1+k%w,box.y1+math.floor(k/w)
end

-- The rules, cheap first. `facts` fields (the runtime reads each only when a
-- rule asks for it):
--   key          "ground:x:y:z" (Session.physicalKey)
--   spent[key]   the spot already gave up a clue (never reused)
--   used[key]    another clue already lies there
--   exists       the square is loaded;  z / wantZ  its floor and the site's
--   floor        vanilla's TreatAsSolidFloor();  solid  isSolid() or isSolidTrans()
--   outside      isOutside() (only for the spot's label)
--   nearSurvivor the survivor could see the square: same floor, within the
--                proximity guard, and the square visible to them (the
--                runtime's guard; see GeneratedRuntime.hiddenFromSurvivor)
--   zombies      how many zombies are within CROWD_RADIUS
-- Returns true, or false and the rule that refused. A dark room is no reason
-- (owner, 2026-09-27): a loose floor clue there is spotted with the player's
-- own light, like foraging.
function G.check(facts)
    local key=facts.key
    if key and facts.spent and facts.spent[key] then return false,"spent" end
    if key and facts.used and facts.used[key] then return false,"used" end
    if not facts.exists then return false,"missing" end
    if facts.z~=facts.wantZ then return false,"floor-level" end
    if not facts.floor or facts.solid then return false,"unwalkable" end
    if facts.nearSurvivor then return false,"near-survivor" end
    if (facts.zombies or 0)>=G.CROWD_ZOMBIES then return false,"crowded" end
    return true
end

-- A short plain word for the spot, from facts already read or cheap ones:
-- doorway, yard, floor, else ground. ("roadside" and "porch" need a fact the
-- engine does not give cheaply and verifiably yet; they are not guessed.)
function G.label(facts)
    local word
    if facts.door then word="doorway"
    elseif facts.outside then word="yard"
    elseif facts.exists then word="floor" end
    word=word or "ground"
    if #word>G.MAX_LABEL then word=string.sub(word,1,G.MAX_LABEL) end
    return word
end

-- Zombies within CROWD_RADIUS of (x,y), from a list of {x=,y=} read once per
-- scan.
function G.zombiesNear(list,x,y)
    local n=0
    for _,z in ipairs(list or {}) do
        if math.max(math.abs(z.x-x),math.abs(z.y-y))<=G.CROWD_RADIUS then n=n+1 end
    end
    return n
end

return G
