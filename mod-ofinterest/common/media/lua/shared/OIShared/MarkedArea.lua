-- A WHOLE AREA A MAP MARKS (task 3 plan, step 4; owner, 2026-09-27: "a map
-- marking a large area may have clues anywhere in that area, preferably near
-- the map's own annotation marks"). Generated/MapSites gives such a place
-- (kind "area") the whole reviewed rectangle as its bounds - up to 430 x 630
-- tiles - and keeps the map's own marks and annotations. These pure rules keep
-- placement there as bounded as at any other place:
--   * open ground: at most GroundSpots.MAX_TRIES squares per attempt, as
--     everywhere; most of them in growing rings around the marks, the last
--     few anywhere in the area;
--   * furniture: one window of at most WINDOW x WINDOW tiles per attempt,
--     centred on a mark, cycling through the marks, then the rest of the area;
--   * arriving: the distance to the nearest mark, not to the area's edge.
-- Which square or window comes when is Pick.hash of (world seed, area, clue,
-- try or attempt): the same world tries the same spots in the same order.
-- Nothing here touches the engine.
local Pick=require("OIShared/Generated/Pick")
local A={}
A.WINDOW=44
A.RINGS={4,8,16,22}     -- ring radii near a mark, growing through an attempt
A.NEAR_TRIES=48         -- of GroundSpots.MAX_TRIES (64) per attempt; the rest anywhere

-- The marks as distinct {x=,y=} points, first occurrence first (a target the
-- map also annotates counts once).
function A.points(marks)
    local out,seen={},{}
    for _,m in ipairs(marks or {}) do
        if type(m.x)=="number" and type(m.y)=="number" then
            local k=m.x..":"..m.y
            if not seen[k] then seen[k]=true; out[#out+1]={x=m.x,y=m.y} end
        end
    end
    return out
end

-- Pick.hash of Pick.key, hashed once more: Pick.hash alone moves almost in
-- step with a changed seed or index, so a small modulus (which of 37 marks)
-- came out the same for most worlds.
local function mix(parts) return Pick.hash(Pick.key({Pick.hash(Pick.key(parts))})) end

local function clamp(v,lo,hi) if v<lo then return lo elseif v>hi then return hi end return v end

-- Open ground: the square of try `try` (1..MAX_TRIES within this attempt) at
-- running index `index` (the clue's cursor). Tries 1..NEAR_TRIES lie within
-- A.RINGS[band] tiles of a mark the hash picks (the band grows through the
-- attempt), the rest anywhere in `bounds`. Always inside bounds (x2/y2
-- exclusive). Returns x, y and whether it was near a mark.
-- own (optional, {x=,y=}): the clue's own mark (owner, 2026-09-27: "each mark
-- its own minimum"). Then every near try rings THAT mark; the last tries are
-- still anywhere in the area. Without it the squares are exactly as before.
function A.groundSquare(seed,areaId,docId,index,try,bounds,points,own)
    local w,h=bounds.x2-bounds.x1,bounds.y2-bounds.y1
    if w<=0 or h<=0 then return nil end
    local hash=mix({seed,areaId,docId,index,"area-ground"})
    if #points==0 or try>A.NEAR_TRIES then
        local k=hash%(w*h)
        return bounds.x1+k%w,bounds.y1+math.floor(k/w),false
    end
    local perBand=math.ceil(A.NEAR_TRIES/#A.RINGS)
    local r=A.RINGS[math.min(#A.RINGS,1+math.floor((try-1)/perBand))]
    local m=own or points[1+hash%#points]
    local side=2*r+1
    local k=mix({seed,areaId,docId,index,"area-ring"})%(side*side)
    local x=clamp(m.x-r+k%side,bounds.x1,bounds.x2-1)
    local y=clamp(m.y-r+math.floor(k/side),bounds.y1,bounds.y2-1)
    return x,y,true
end

-- Furniture: the window searched on attempt `attempt` (0-based, the clue's
-- attempt count). Attempts cycle: first a window centred on each mark, in an
-- order rotated by the world (seed, area, clue), then each WINDOW-sized tile
-- of the whole area; then again. Every window lies inside `bounds` and is at
-- most WINDOW a side. Returns {x1,y1,x2,y2,z} and "mark" or "rest".
-- own (optional, {x=,y=}): the clue's own mark. Then each cycle starts with
-- the window centred on it, and goes on as above. Without it, as before.
function A.window(seed,areaId,docId,attempt,bounds,points,own)
    local w,h=bounds.x2-bounds.x1,bounds.y2-bounds.y1
    if own then
        local cycle=1+#points+math.ceil(w/A.WINDOW)*math.ceil(h/A.WINDOW)
        local k=attempt%cycle
        if k>0 then return A.window(seed,areaId,docId,k-1,bounds,points) end
        points={own}; attempt=0
    end
    local cols,rows=math.ceil(w/A.WINDOW),math.ceil(h/A.WINDOW)
    local n=#points
    local cycle=n+cols*rows
    local k=attempt%cycle
    local turn=mix({seed,areaId,docId,"area-window"})
    local function span(lo,hi,p)
        local width=math.min(A.WINDOW,hi-lo)
        local start=clamp(p-math.floor(width/2),lo,hi-width)
        return start,start+width
    end
    if k<n then
        local m=points[1+(turn+k)%n]
        local x1,x2=span(bounds.x1,bounds.x2,m.x)
        local y1,y2=span(bounds.y1,bounds.y2,m.y)
        return {x1=x1,y1=y1,x2=x2,y2=y2,z=bounds.z},"mark"
    end
    local t=(turn+k-n)%(cols*rows)
    local x1=bounds.x1+(t%cols)*A.WINDOW
    local y1=bounds.y1+math.floor(t/cols)*A.WINDOW
    return {x1=x1,y1=y1,x2=math.min(x1+A.WINDOW,bounds.x2),y2=math.min(y1+A.WINDOW,bounds.y2),z=bounds.z},"rest"
end

-- Arriving: Chebyshev distance from (px,py) to the nearest mark. A huge area
-- is "arrived at" where its map drew, not 40 tiles outside a far corner.
function A.distance(points,px,py)
    local best
    for _,m in ipairs(points) do
        local d=math.max(math.abs(m.x-px),math.abs(m.y-py))
        if not best or d<best then best=d end
    end
    return best and math.floor(best) or nil
end

return A
