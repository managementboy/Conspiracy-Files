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
--   * no maximum: once every written clue is placed, object sets may be placed
--     again as new copies - and earlier too, only when an area would
--     otherwise miss one of the two conspiracies.
local P={}

-- The one and only cap. Nothing else may bound how many clues exist
-- (owner directive NH-D4: no real maximum, only this first-development cap).
P.FIRST_DEVELOPMENT_CAP=5
P.MIN_PER_AREA=2

-- A stable number from text (the same hash as Placement.seedFromString).
function P.hash(text)
    local h=5381; text=tostring(text or "")
    for i=1,#text do h=(h*33+string.byte(text,i))%2147483647 end
    return h
end

-- How many clues this area gets, 2..(2 x cap), fixed by world and area.
function P.targetCount(seed,areaId,version)
    local span=P.FIRST_DEVELOPMENT_CAP*2-P.MIN_PER_AREA+1
    return P.MIN_PER_AREA+P.hash(table.concat({tostring(seed),tostring(areaId),tostring(version),"count"},"|"))%span
end

local function count(t,k) return (t and t[k]) or 0 end

-- args: {clues=list, area={id=..., place=...}, ledger=..., seed=n, version=s}
-- ledger (world state, never belief):
--   areas[areaId][lean] = clues already there;  world[lean] = clues anywhere;
--   world.set / world.written = placed clues of each kind;
--   placed[clueId] = copies of that clue already placed.
-- Returns a list of {clue=id, copy=n, kind=, lean=, rival=, spot=}.
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
        -- A set already placed is kept as a "spare": used only if this area
        -- would otherwise miss a conspiracy (both-in-every-area outranks
        -- sets-return-only-after-written-run-out; a new copy is never the
        -- taken one coming back).
        local spare=copies>0 and c.kind=="set" and writtenLeft
        local available=copies==0 or c.kind=="set"
        if available then
            for _,w in ipairs(c.where) do
                if w.place==area.place then
                    candidates[#candidates+1]={clue=c,where=w,copy=copies+1,spare=spare,
                        order=P.hash(table.concat({tostring(seed),tostring(area.id),c.id,tostring(copies+1),tostring(version)},"|"))}
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
    local want=P.targetCount(seed,area.id,version)-already
    local picks,taken={}, {}
    local leans={"containment","agricultural"}
    while #picks<want do
        -- Which conspiracy next: one missing here first, then the one with
        -- fewer clues across the world, never one at its cap.
        local lean
        for _,l in ipairs(leans) do
            if count(here,l)==0 and not taken["lean:"..l] then lean=l; break end
        end
        if not lean then
            for _,l in ipairs(leans) do
                if count(here,l)<P.FIRST_DEVELOPMENT_CAP and not taken["lean:"..l]
                    and (not lean or count(world,l)<count(world,lean)) then lean=l end
            end
        end
        if not lean then break end
        -- Sets first while they are fewer than half of what is placed.
        local wantSet=count(world,"set")*2<count(world,"set")+count(world,"written")
        local choice
        local missing=count(here,lean)==0
        for pass=1,3 do
            for _,cand in ipairs(candidates) do
                if not taken[cand.clue.id] and cand.where.lean==lean
                    and (not cand.spare or (pass==3 and missing))
                    and (pass>=2 or (cand.clue.kind=="set")==wantSet) then choice=cand; break end
            end
            if choice then break end
        end
        if not choice then
            taken["lean:"..lean]=true   -- nothing left for this conspiracy here
        else
            taken[choice.clue.id]=true
            picks[#picks+1]={clue=choice.clue.id,copy=choice.copy,kind=choice.clue.kind,
                lean=lean,rival=choice.where.rival,spot=choice.where.spot}
            here[lean]=count(here,lean)+1
            world[lean]=count(world,lean)+1
            world[choice.clue.kind]=count(world,choice.clue.kind)+1
        end
    end
    return picks
end

return P
