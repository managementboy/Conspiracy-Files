-- THE LETDOWN IN THE LAYOUT (owner, 2026-09-27, "How a read map changes the
-- game"): at a place a map or flyer marks, the clues that fit the map's
-- promise sit nearest the way in, and the other side's clues deepest inside.
--
-- Pure: plain numbers in, a rank out. The rank only ORDERS the spots a scan
-- already found (StorageChoices.choose, lower first); it never refuses one
-- and never makes a clue wait. The one wait is `hold`, bounded and named.
--
-- Depth of a spot:
--   * a place that is a building: how far inside its bounds the spot sits
--     (distance to the nearest edge, 0 on the edge or outside it). The
--     outdoor band - a mailbox, open ground, a vehicle - is 0, shallowest.
--   * a place that is a point or a window around a map's mark (no building
--     to be inside): how near the spot is to the nearest mark point. Nearer
--     the X is deeper.
local L={}
-- The other side's clue waits for a fuller look at the place: a building
-- seen from the street offers the front room only. It waits until the scan
-- has seen HOLD_MIN_CANDIDATES usable spots, or for HOLD_MAX_ATTEMPTS filler
-- attempts, then takes the deepest it has seen.
L.HOLD_MIN_CANDIDATES=4
L.HOLD_MAX_ATTEMPTS=8
-- Far enough that a spot nowhere near any mark is always shallowest.
L.FAR=100000

local OUTDOOR={postbox=true,floor=true,vehicle=true,carrier=true}
function L.outdoor(target)
    return type(target)=="table" and (target.ground==true or type(target.vehiclePart)=="string"
        or type(target.carrierMark)=="string" or OUTDOOR[target.containerType]==true)
end

-- How far inside bounds (x2/y2 exclusive) a square is; 0 at the edge or out.
function L.inset(x,y,b)
    local d=math.min(x-b.x1,(b.x2-1)-x,y-b.y1,(b.y2-1)-y)
    if d<0 then return 0 end
    return d
end

-- Depth of one spot. `marks` are the place's mark points ({x=,y=}), used only
-- when `byMark` is true (a place that is not a building).
function L.depth(target,bounds,marks,byMark)
    if type(target)~="table" or type(bounds)~="table" then return 0 end
    if byMark and type(marks)=="table" and #marks>0 then
        local best=L.FAR
        for _,m in ipairs(marks) do
            if type(m.x)=="number" and type(m.y)=="number" then
                local d=math.max(math.abs(target.x-m.x),math.abs(target.y-m.y))
                if d<best then best=d end
            end
        end
        return L.FAR-best
    end
    if L.outdoor(target) then return 0 end
    return L.inset(target.x,target.y,bounds)
end

-- Does this clue take the shallow end (its lean is the place's favour)?
function L.favoured(doc,favour)
    return type(doc)=="table" and favour~=nil and doc.lean==favour
end

-- The rank StorageChoices.choose orders by, lower first: shallow first for a
-- favoured clue, deepest first for the other side's.
function L.rank(doc,favour,depth)
    if L.favoured(doc,favour) then return depth end
    return -depth
end

-- A rank function over targets for one clue at one place, or nil when the
-- place has no lean (not marked by a map or flyer).
--   trail: the area's {designs, favour}; entry: its MapSites entry or nil.
function L.ranker(doc,site,trail,entry)
    if type(trail)~="table" or trail.favour==nil or type(site)~="table" or type(site.bounds)~="table" then return nil end
    local byMark=type(entry)=="table" and entry.kind~="building"
    local marks=type(entry)=="table" and entry.marks or nil
    return function(target) return L.rank(doc,trail.favour,L.depth(target,site.bounds,marks,byMark)) end
end

-- Should the other side's clue wait for a fuller scan? `seen` usable spots
-- this attempt, `attempts` made so far (this one included).
function L.hold(doc,favour,seen,attempts)
    if favour==nil or L.favoured(doc,favour) then return false end
    return (seen or 0)<L.HOLD_MIN_CANDIDATES and (attempts or 0)<L.HOLD_MAX_ATTEMPTS
end

return L
