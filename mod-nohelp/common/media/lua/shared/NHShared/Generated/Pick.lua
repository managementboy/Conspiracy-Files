-- Which written clues go to one area (No Help, task 3 plan step 3).
--
-- Content is authored; only its placement is decided in play (DECISIONS.md,
-- DR-20260927-NOHELP-RULE-PLACEMENT). This is the whole of that decision for
-- one area, as a pure function of the world: the world seed, the area, the
-- clue list, the content version, and what is already placed. It is never
-- given anything the player read, carried or believes, so reading a map can
-- change WHEN an area is chosen, never what it receives.
--
-- The owner's rules it keeps:
--   * both conspiracies in every area: one of each before any second clue;
--   * a first-development cap of 5 clues per conspiracy per area, and each area
--     gets a number between 2 and 10, fixed by the world;
--   * the conspiracy with fewer clues across the world is preferred;
--   * object sets are preferred while fewer than half of placed clues are sets;
--   * no maximum: object sets may be placed again as new copies whenever an
--     area has nothing fresh left for a conspiracy; written clues never are.
local P={}

-- The one and only cap. Nothing else may bound how many clues exist
-- (owner directive NH-D4: no real maximum, only this first-development cap).
P.FIRST_DEVELOPMENT_CAP=5
P.MIN_PER_AREA=2

-- A stable number from text, then scrambled (phase 4 review: the plain
-- multiply-and-add kept clues with similar ids in nearly the same order on
-- every seed). Every step stays below 2^53, so PUC Lua and Kahlua agree.
function P.hash(text)
    local h=5381; text=tostring(text or "")
    for i=1,#text do h=(h*33+string.byte(text,i))%2147483647 end
    for _=1,3 do h=(h*48271)%2147483647 end
    return h
end
-- The parts a choice is made from, each prefixed with its length so no two
-- different lists read the same, and numbers written as whole numbers so a
-- large seed cannot print as "1e+15" in one runtime and digits in another.
local function key(parts)
    local out={}
    for i,v in ipairs(parts) do
        if type(v)=="number" then v=string.format("%d",v) else v=tostring(v) end
        out[i]=#v..":"..v
    end
    return table.concat(out,"|")
end
P.key=key

-- How many clues this area gets, 2..(2 x cap), fixed by world and area.
function P.targetCount(seed,areaId,version)
    local span=P.FIRST_DEVELOPMENT_CAP*2-P.MIN_PER_AREA+1
    return P.MIN_PER_AREA+P.hash(key({seed,areaId,version,"count"}))%span
end

local function count(t,k) return (t and t[k]) or 0 end

-- args: {clues=list, area={id=..., place=...}, ledger=..., seed=n, version=s}
-- Optional, for a place a vanilla map marks (task 3 plan, step 4; owner:
-- "a marked place leans toward its map's conspiracy but holds at least 3
-- clues, one of each side"):
--   favour    the conspiracy the place leans toward. After one of each, the
--             other side first gets up to `rivalMin` clues in all, then the
--             favoured side takes the next slots up to the cap, and only then
--             does the thinner-world rule decide the rest.
--   rivalMin  how many of the other side's clues come before the favoured
--             side's later slots (default 1: the opener's one);
--   minCount  the least number of clues the area gets, raising the world's
--             2..10 when it is lower.
-- Without them the result is exactly what it always was.
-- ledger (world state, never belief):
--   areas[areaId][lean] = clues already there;  world[lean] = clues anywhere;
--   world.set / world.written = placed clues of each kind;
--   placed[clueId] = copies of that clue already placed.
-- Returns a list of {clue=id, copy=n, kind=, lean=, rival=, spot=}, and
-- second, how many short of the area's number it fell (0 normally): an area
-- the clue list cannot fill says so rather than quietly holding fewer.
function P.choose(args)
    local clues,area,ledger=args.clues or {},args.area,args.ledger or {}
    local seed,version=args.seed or 1,args.version or ""
    local placed=ledger.placed or {}
    local here={}
    for lean,n in pairs((ledger.areas or {})[area.id] or {}) do here[lean]=n end
    local world={}
    for k,n in pairs(ledger.world or {}) do world[k]=n end

    -- Any written clue not yet placed anywhere? Until they run out, a set is
    -- placed once; after, sets may return as new copies (no maximum).
    local writtenLeft=false
    for _,c in ipairs(clues) do if c.kind=="written" and count(placed,c.id)==0 then writtenLeft=true end end

    local candidates={}
    for _,c in ipairs(clues) do
        local copies=count(placed,c.id)
        -- A set already placed is a "spare": a new copy of it is used only
        -- when nothing fresh is left for this area and conspiracy, so an area
        -- always gets both conspiracies and its whole number (phase 4: a
        -- clue list that ran short must not become a hidden cap). A new copy
        -- is never the taken one coming back.
        local spare=copies>0 and c.kind=="set" and writtenLeft
        local available=copies==0 or c.kind=="set"
        if available then
            for _,w in ipairs(c.where) do
                if w.place==area.place then
                    candidates[#candidates+1]={clue=c,where=w,copy=copies+1,spare=spare,
                        order=P.hash(key({seed,area.id,c.id,copies+1,version}))}
                end
            end
        end
    end
    table.sort(candidates,function(a,b)
        if a.order~=b.order then return a.order<b.order end
        return a.clue.id<b.clue.id
    end)

    local already=0
    for _,n in pairs(here) do already=already+n end
    local want=P.targetCount(seed,area.id,version)
    if args.minCount and args.minCount>want then want=args.minCount end
    want=want-already
    local favour=args.favour
    local rival=favour and (favour=="containment" and "agricultural" or "containment")
    local rivalMin=math.min(args.rivalMin or 1,P.FIRST_DEVELOPMENT_CAP)
    local picks,taken={}, {}
    local leans={"containment","agricultural"}
    while #picks<want do
        -- Which conspiracy next: one missing here first, then the one with
        -- fewer clues across the world, never one at its cap.
        local lean
        for _,l in ipairs(leans) do
            if count(here,l)==0 and not taken["lean:"..l] then lean=l; break end
        end
        -- A map-marked place: the other side's extra clues (one per extra
        -- map marking it), then the favoured side up to the cap.
        if not lean and favour then
            if count(here,rival)<rivalMin and not taken["lean:"..rival] then lean=rival
            elseif count(here,favour)<P.FIRST_DEVELOPMENT_CAP and not taken["lean:"..favour] then lean=favour end
        end
        if not lean then
            for _,l in ipairs(leans) do
                if count(here,l)<P.FIRST_DEVELOPMENT_CAP and not taken["lean:"..l]
                    and (not lean or count(world,l)<count(world,lean)) then lean=l end
            end
        end
        if not lean then break end
        -- Sets first while they are no more than half of what is placed.
        local wantSet=count(world,"set")*2<=count(world,"set")+count(world,"written")
        -- Fresh clues first (the wanted kind, then either kind); a copy of a
        -- set already placed elsewhere only when nothing fresh is left here.
        local choice
        for pass=1,3 do
            for _,cand in ipairs(candidates) do
                if not taken[cand.clue.id] and cand.where.lean==lean
                    and (not cand.spare or pass==3)
                    and (pass>=2 or (cand.clue.kind=="set")==wantSet) then choice=cand; break end
            end
            if choice then break end
        end
        if not choice then
            taken["lean:"..lean]=true   -- nothing left for this conspiracy here
        else
            taken[choice.clue.id]=true
            picks[#picks+1]={clue=choice.clue.id,copy=choice.copy,kind=choice.clue.kind,
                lean=lean,rival=choice.where.rival,spot=choice.where.spot,outfit=choice.where.outfit}
            here[lean]=count(here,lean)+1
            world[lean]=count(world,lean)+1
            world[choice.clue.kind]=count(world,choice.clue.kind)+1
        end
    end
    return picks,math.max(0,want-#picks)
end

return P
