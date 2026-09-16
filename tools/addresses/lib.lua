-- Whole-map house numbers (AD-10, steps B and C), offline and plain Lua 5.1.
-- docs/design/WHOLE_MAP_ADDRESSES.md; owner go-ahead P4-R129.
--
-- Turns a building export (from the real game), the installed streets.xml and
-- regions.lua into one address book for the whole map. build.lua is the command
-- line; this file holds every rule so test/address_numbering*.lua can drive it
-- with small synthetic inputs.
--
-- The matching, parity and slot rules are copied from
-- mod/common/media/lua/shared/ConspiracyFiles/Generated/AddressIndex.lua and
-- must stay identical to it. What changes: roads cover the whole map, every
-- building belongs to an area, each area has its own baseline street, and
-- labels are unique per area instead of per map.
--
-- CONVENTIONS (the generator of the trial AddressRoads.lua is not in the repo;
-- what could be read from that file's shape, and what this tool decides):
--  * A block is {street=, block=, segments={{x1,y1,x2,y2,cumulativeStart},...}},
--    cumulativeStart measured from the start of the block (first segment 0),
--    as in AddressRoads.lua. Coordinates are streets.xml's own (half tiles).
--  * The trial numbered separate streets.xml polylines of one name 1,2,3
--    (Irma Dr, Perrine St) and cut only a few of them where another street
--    ends on them (Wood St at Perrine St). It did NOT cut S Main St at its
--    cross streets, so its cutting rule cannot be recovered. This tool cuts
--    every polyline wherever a street with a DIFFERENT name crosses it, or ends
--    within (its width/2 + TOUCH) tiles of its centre line (a T junction).
--    streets.xml stores centre lines, so a side street's end point stops short
--    of the through street: over the whole 42.20 map 1,359 of 2,097 street ends
--    lie between 0 and 1 tile beyond half the through street's width, 90 more
--    within 2, 25 within 3, then the count falls to single digits and the
--    remaining ~500 are dead ends 12+ tiles away. Cuts closer than MIN_GAP tiles to
--    a polyline end or to the previous cut are dropped (no slivers).
--  * Block numbers are per AREA: all polylines of one street name that belong
--    to the area (or that the area's buildings matched) are ordered by how
--    close their nearer end is to the area's baseline (then streets.xml order),
--    each is walked from its end nearer the baseline, and its blocks are
--    numbered 1,2,3... continuing across the polylines.
--  * Railways never count as streets (no cuts, no matches, no baseline).
local L={}
L.REVISION="whole-map-1"
L.MATCH_DISTANCE2=3600   -- AddressIndex.lua: 60 tiles
L.SLOTS=49               -- AddressIndex.lua: slots per block side
L.TOUCH=3.0              -- a street ending within half the other's width plus this is a junction
L.PAD=12                 -- grid padding: widest street (17) / 2 + TOUCH
L.MIN_GAP=1.0            -- no block shorter than this at a cut
L.SAMPLE=4.0             -- step when measuring how much of a street is in an area
L.ORDER_QUANTUM=1.0      -- distance from the baseline is compared in whole tiles

---------------------------------------------------------------------------
-- Names
---------------------------------------------------------------------------
-- Railways on the 42.20 map: "... Railroad (A - B)" and one "Old Muldraugh
-- Station Branch Line". Streets that merely mention rails (Back Rail Lane,
-- Railview Road, Railway St) are ordinary streets.
function L.isRailway(name)
    return name:find("Railroad",1,true)~=nil or name:find("Branch Line",1,true)~=nil
end
-- Highways: never a baseline. On 42.20 this catches the KY-nnn roads, the Dixie
-- Highway (Route 31W) entries, Brandenburg Bypass and Lakeshore Pkwy. The other
-- patterns match nothing today and are kept for later map builds. Parkway Ave
-- and Pike St are ordinary streets and do not match.
function L.isHighway(name)
    return name:find("Highway",1,true)~=nil or name:find("Hwy",1,true)~=nil
        or name:find("Route",1,true)~=nil or name:find("Bypass",1,true)~=nil
        or name:find("Interstate",1,true)~=nil or name:find("Expressway",1,true)~=nil
        or name:find("Freeway",1,true)~=nil or name:find("Pkwy",1,true)~=nil
        or name:find(" Parkway$")~=nil or name:find("^KY%-%d")~=nil
        or name:find("^US%-%d")~=nil or name:find("^I%-%d")~=nil
end
local PREFIX={[""]=true,["N "]=true,["S "]=true,["E "]=true,["W "]=true,
    ["North "]=true,["South "]=true,["East "]=true,["West "]=true}
function L.isMainSt(name)
    local p=name:match("^(.-)Main St$"); return p~=nil and PREFIX[p]==true
end
function L.isFirstSt(name)
    local p=name:match("^(.-)1st St$") or name:match("^(.-)First St$")
    return p~=nil and PREFIX[p]==true
end

---------------------------------------------------------------------------
-- Inputs
---------------------------------------------------------------------------
local function readAll(path)
    local f=assert(io.open(path,"rb")); local s=f:read("*a"); f:close(); return s
end
L.readAll=readAll
local function unescape(s)
    return (s:gsub("&quot;",'"'):gsub("&apos;","'"):gsub("&lt;","<"):gsub("&gt;",">"):gsub("&amp;","&"))
end
-- streets.xml text -> list of {index,name,width,pts={{x,y},...},len,cum,railway,highway}
function L.parseStreets(text)
    local out={}
    for attrs,body in text:gmatch("<street%s+([^>]*)>(.-)</street>") do
        local name=assert(attrs:match('name="([^"]*)"'),"street without name")
        local pts={}
        for tag in body:gmatch("<point%s+([^>]*)>") do
            local x,y=tonumber(tag:match('x="([^"]*)"')),tonumber(tag:match('y="([^"]*)"'))
            assert(x and y,"bad point in "..name)
            pts[#pts+1]={x,y}
        end
        name=unescape(name)
        local cum,len={0},0
        for i=2,#pts do
            local dx,dy=pts[i][1]-pts[i-1][1],pts[i][2]-pts[i-1][2]
            len=len+math.sqrt(dx*dx+dy*dy); cum[i]=len
        end
        out[#out+1]={index=#out+1,name=name,width=tonumber(attrs:match('width="([^"]*)"')),pts=pts,
            len=len,cum=cum,railway=L.isRailway(name),highway=L.isHighway(name)}
    end
    return out
end
-- regions.lua text -> areas sorted by name: {name,boxes={{x,y,w,h}},area,bbox}
-- Only type="Region" entries are towns; BuildingName entries and commented
-- lines are ignored. The file runs in an empty environment.
function L.parseRegions(text)
    local fn=assert(loadstring(text,"=regions.lua"))
    local env={}; setfenv(fn,env); fn()
    local byName,names={},{}
    for _,r in ipairs(env.regions or {}) do
        if r.type=="Region" and type(r.name)=="string" and r.name~="" and (r.width or 0)>0 and (r.height or 0)>0 then
            if not byName[r.name] then byName[r.name]={}; names[#names+1]=r.name end
            local t=byName[r.name]; t[#t+1]={r.x,r.y,r.width,r.height}
        end
    end
    table.sort(names)
    local areas={}
    for _,name in ipairs(names) do
        local boxes=byName[name]
        local minX,minY,maxX,maxY=math.huge,math.huge,-math.huge,-math.huge
        for _,b in ipairs(boxes) do
            minX,minY=math.min(minX,b[1]),math.min(minY,b[2])
            maxX,maxY=math.max(maxX,b[1]+b[3]),math.max(maxY,b[2]+b[4])
        end
        areas[#areas+1]={name=name,boxes=boxes,area=L.unionArea(boxes),bbox={minX,minY,maxX,maxY}}
    end
    return areas
end
-- Exact area of a union of boxes (duplicated and overlapping boxes count once).
function L.unionArea(boxes)
    local xs,seen={},{}
    for _,b in ipairs(boxes) do
        for _,v in ipairs({b[1],b[1]+b[3]}) do if not seen[v] then seen[v]=true; xs[#xs+1]=v end end
    end
    table.sort(xs)
    local total=0
    for i=1,#xs-1 do
        local x1,x2=xs[i],xs[i+1]
        local spans={}
        for _,b in ipairs(boxes) do
            if b[1]<=x1 and b[1]+b[3]>=x2 then spans[#spans+1]={b[2],b[2]+b[4]} end
        end
        table.sort(spans,function(a,c) return a[1]<c[1] end)
        local covered,s,e=0,nil,nil
        for _,sp in ipairs(spans) do
            if not s then s,e=sp[1],sp[2]
            elseif sp[1]>e then covered=covered+e-s; s,e=sp[1],sp[2]
            elseif sp[2]>e then e=sp[2] end
        end
        if s then covered=covered+e-s end
        total=total+covered*(x2-x1)
    end
    return total
end
-- The named area a point belongs to. Boxes are half-open [x,x+w). Where the
-- boxes of two names overlap (Muldraugh/Rosewood, Jefferson/LAA) the name with
-- the SMALLER total area wins; equal areas fall back to name order.
function L.areaAt(areas,x,y)
    local best
    for i,a in ipairs(areas) do
        local bb=a.bbox
        if x>=bb[1] and x<bb[3] and y>=bb[2] and y<bb[4] then
            for _,b in ipairs(a.boxes) do
                if x>=b[1] and x<b[1]+b[3] and y>=b[2] and y<b[2]+b[4] then
                    if not best or a.area<areas[best].area then best=i end
                    break
                end
            end
        end
    end
    return best
end
-- Export: '#' header lines, then TAB-separated rows
-- id x y x2 y2 basement roomCount roomNames. Ids stay strings.
function L.parseExport(text)
    local header,rows={},{}
    local n=0
    for line in (text.."\n"):gmatch("([^\n]*)\n") do
        n=n+1
        line=line:gsub("\r$","")
        if line:sub(1,1)=="#" then
            local k,v=line:match("^#%s*(%S+)%s*(.-)%s*$")
            if k then header[k]=v end
        elseif line:find("%S") then
            local f={}
            for field in (line.."\t"):gmatch("([^\t]*)\t") do f[#f+1]=field end
            local id=f[1]
            assert(id and id:match("^%d+$"),"export line "..n..": bad id")
            local num=function(i)
                local v=tonumber(f[i]); assert(v and v==math.floor(v),"export line "..n..": bad column "..i); return v
            end
            local rooms={}
            for r in (f[8] or ""):gmatch("[^,]+") do rooms[#rooms+1]=r end
            rows[#rows+1]={id=id,x=num(2),y=num(3),x2=num(4),y2=num(5),basement=num(6)==1,
                roomCount=num(7),rooms=rooms}
        end
    end
    return header,rows
end
-- Filter, unchanged from AddressMap.lua: no basements, no roomless buildings,
-- and at least one room that is not garage, garagestorage, shed or unnamed.
local IGNORED={garage=true,garagestorage=true,shed=true,[""]=true}
function L.eligible(b)
    if b.basement then return false,"basement" end
    if b.roomCount==0 then return false,"no rooms" end
    for _,r in ipairs(b.rooms) do if not IGNORED[r] then return true end end
    return false,"garage/shed only"
end

---------------------------------------------------------------------------
-- Geometry
---------------------------------------------------------------------------
local function cross(ax,ay,bx,by) return ax*by-ay*bx end
local function projectT(px,py,x1,y1,x2,y2)
    local dx,dy=x2-x1,y2-y1; local l=dx*dx+dy*dy
    if l==0 then return 0,x1,y1 end
    local t=math.max(0,math.min(1,((px-x1)*dx+(py-y1)*dy)/l))
    return t,x1+t*dx,y1+t*dy
end
local function pointSegment2(px,py,x1,y1,x2,y2)
    local _,qx,qy=projectT(px,py,x1,y1,x2,y2); return (px-qx)^2+(py-qy)^2
end
L.pointSegment2=pointSegment2

-- Cut every non-railway polyline into blocks and find which polylines touch.
-- Returns pieces (in streets.xml order, then along each polyline) and a
-- neighbour list per polyline index.
function L.splitBlocks(streets)
    local CELL=64
    local grid={}
    local function cells(x1,y1,x2,y2,pad,fn)
        for cx=math.floor((math.min(x1,x2)-pad)/CELL),math.floor((math.max(x1,x2)+pad)/CELL) do
            for cy=math.floor((math.min(y1,y2)-pad)/CELL),math.floor((math.max(y1,y2)+pad)/CELL) do
                fn(cx..":"..cy)
            end
        end
    end
    for _,p in ipairs(streets) do
        if not p.railway then
            for i=1,#p.pts-1 do
                local a,b=p.pts[i],p.pts[i+1]
                local seg={p=p,i=i}
                cells(a[1],a[2],b[1],b[2],L.PAD,function(k) grid[k]=grid[k] or {}; local g=grid[k]; g[#g+1]=seg end)
            end
        end
    end
    local neighbours={}
    local function link(a,b)
        neighbours[a.index]=neighbours[a.index] or {}; neighbours[a.index][b.index]=true
        neighbours[b.index]=neighbours[b.index] or {}; neighbours[b.index][a.index]=true
    end
    local pieces={}
    for _,p in ipairs(streets) do
        if not p.railway and #p.pts>=2 then
            local cuts={}
            for i=1,#p.pts-1 do
                local a,b=p.pts[i],p.pts[i+1]
                local sx,sy=b[1]-a[1],b[2]-a[2]
                local slen=math.sqrt(sx*sx+sy*sy)
                local seen={}
                local T2=((p.width or 0)/2+L.TOUCH)^2
                cells(a[1],a[2],b[1],b[2],L.PAD,function(k)
                    for _,o in ipairs(grid[k] or {}) do
                        local q=o.p
                        if q~=p and not seen[o] then
                            seen[o]=true
                            local c,d=q.pts[o.i],q.pts[o.i+1]
                            local ox,oy=d[1]-c[1],d[2]-c[2]
                            local hit
                            local den=cross(sx,sy,ox,oy)
                            if slen>0 and den~=0 then
                                local t=cross(c[1]-a[1],c[2]-a[2],ox,oy)/den
                                local u=cross(c[1]-a[1],c[2]-a[2],sx,sy)/den
                                if t>=0 and t<=1 and u>=0 and u<=1 then hit=t end
                            end
                            -- the other street ends on this one: a T junction
                            if not hit and slen>0 then
                                local ends={}
                                if o.i==1 then ends[#ends+1]=c end
                                if o.i==#q.pts-1 then ends[#ends+1]=d end
                                for _,e in ipairs(ends) do
                                    if pointSegment2(e[1],e[2],a[1],a[2],b[1],b[2])<=T2 then
                                        hit=(projectT(e[1],e[2],a[1],a[2],b[1],b[2])); break
                                    end
                                end
                            end
                            -- this street ends on the other one: linked, not cut
                            local touches=hit~=nil
                            if not touches then
                                local ends={}
                                if i==1 then ends[#ends+1]=a end
                                if i==#p.pts-1 then ends[#ends+1]=b end
                                for _,e in ipairs(ends) do
                                    if pointSegment2(e[1],e[2],c[1],c[2],d[1],d[2])<=((q.width or 0)/2+L.TOUCH)^2 then touches=true; break end
                                end
                            end
                            if touches then link(p,q) end
                            if hit and q.name~=p.name then cuts[#cuts+1]=p.cum[i]+hit*slen end
                        end
                    end
                end)
            end
            table.sort(cuts)
            local kept,last={},0
            for _,c in ipairs(cuts) do
                if c-last>=L.MIN_GAP and p.len-c>=L.MIN_GAP then kept[#kept+1]=c; last=c end
            end
            kept[#kept+1]=math.huge
            -- walk the polyline, closing a piece at every kept cut
            local piece={poly=p,piece=1,segments={},start=0}
            local ci=1
            local function close(at)
                piece.len=at-piece.start
                pieces[#pieces+1]=piece
                piece={poly=p,piece=piece.piece+1,segments={},start=at}
            end
            for i=1,#p.pts-1 do
                local a,b=p.pts[i],p.pts[i+1]
                local s0,s1=p.cum[i],p.cum[i+1]
                local x,y,pos=a[1],a[2],s0
                while kept[ci]<s1 do
                    local c=kept[ci]
                    local f=(c-s0)/(s1-s0)
                    local cx,cy=a[1]+f*(b[1]-a[1]),a[2]+f*(b[2]-a[2])
                    if c>pos then piece.segments[#piece.segments+1]={x,y,cx,cy,pos-piece.start} end
                    close(c); x,y,pos=cx,cy,c; ci=ci+1
                end
                if s1>pos or #piece.segments==0 and i==#p.pts-1 then
                    piece.segments[#piece.segments+1]={x,y,b[1],b[2],pos-piece.start}
                end
            end
            close(p.len)
        end
    end
    return pieces,neighbours
end

---------------------------------------------------------------------------
-- Road match (AddressIndex.build, match phase, unchanged)
---------------------------------------------------------------------------
function L.segmentIndex(pieces)
    local nearby={}
    for _,piece in ipairs(pieces) do
        for _,s in ipairs(piece.segments) do
            local part={piece=piece,s=s}
            for x=math.floor((math.min(s[1],s[3])-60)/128),math.floor((math.max(s[1],s[3])+60)/128) do
                for y=math.floor((math.min(s[2],s[4])-60)/128),math.floor((math.max(s[2],s[4])+60)/128) do
                    local k=x..":"..y; nearby[k]=nearby[k] or {}
                    nearby[k][#nearby[k]+1]=part
                end
            end
        end
    end
    return nearby
end
-- Nearest street block side within 60 tiles, or nil.
-- accept(piece) optionally limits which blocks may match (area grouping only).
function L.match(nearby,b,accept)
    local x,y=(b.x+b.x2-1)/2,(b.y+b.y2-1)/2
    local best
    for _,part in ipairs(nearby[math.floor(x/128)..":"..math.floor(y/128)] or {}) do
        local s=part.s
        local dx,dy=s[3]-s[1],s[4]-s[2]; local length=dx*dx+dy*dy
        if length~=0 and (not accept or accept(part.piece)) then
            local t=math.max(0,math.min(1,((x-s[1])*dx+(y-s[2])*dy)/length))
            local px,py=s[1]+t*dx,s[2]+t*dy
            local horizontal=math.abs(dx)>=math.abs(dy)
            local side
            if horizontal then
                local sign=dx>=0 and 1 or -1
                side=sign*(dx*(y-py)-dy*(x-px))/math.sqrt(length)
            else
                local sign=dy>=0 and 1 or -1
                side=sign*(dy*(x-px)-dx*(y-py))/math.sqrt(length)
            end
            if math.abs(side)>=1 then
                local odd=horizontal and side<0 or not horizontal and side>0
                local piece=part.piece
                local key=string.format("%s:%05d:%04d:%s",piece.poly.name,piece.poly.index,piece.piece,tostring(odd))
                local distance=(x-px)^2+(y-py)^2
                if not best or distance<best.distance or distance==best.distance and key<best.key then
                    best={key=key,distance=distance,odd=odd,piece=piece,px=px,py=py,
                        along=s[5]+t*math.sqrt(length)}
                end
            end
        end
    end
    if best and best.distance<=L.MATCH_DISTANCE2 then return best end
    return nil
end

---------------------------------------------------------------------------
-- Areas, baselines, numbering
---------------------------------------------------------------------------
-- Which named area each polyline belongs to: the area holding most of its
-- length (sampled every SAMPLE tiles, overlap tie-break as for buildings),
-- and only if that is at least half the polyline. Also the length per area.
function L.polylineAreas(streets,areas)
    for _,p in ipairs(streets) do
        local inside={}
        for i=1,#p.pts-1 do
            local a,b=p.pts[i],p.pts[i+1]
            local l=p.cum[i+1]-p.cum[i]
            local n=math.max(1,math.ceil(l/L.SAMPLE))
            for k=0,n-1 do
                local f=(k+0.5)/n
                local ai=L.areaAt(areas,a[1]+f*(b[1]-a[1]),a[2]+f*(b[2]-a[2]))
                if ai then inside[ai]=(inside[ai] or 0)+l/n end
            end
        end
        local best
        for ai,l in pairs(inside) do
            if not best or l>inside[best] or l==inside[best] and ai<best then best=ai end
        end
        p.inside=inside
        p.area=(best and inside[best]*2>=p.len and p.len>0) and best or nil
    end
end
local function distanceToLines(lines,x,y)
    local best
    for _,p in ipairs(lines) do
        for i=1,#p.pts-1 do
            local a,b=p.pts[i],p.pts[i+1]
            local d=pointSegment2(x,y,a[1],a[2],b[1],b[2])
            if not best or d<best then best=d end
        end
    end
    return best and math.sqrt(best) or 0
end
L.distanceToLines=distanceToLines
-- Baseline from candidate polylines: Main St, else 1st St, else the longest
-- street name (by length inside the area when lengthOf is given). Railways and
-- highways are never chosen. Returns names, polylines, rule.
function L.chooseBaseline(candidates,lengthOf)
    lengthOf=lengthOf or function(p) return p.len end
    local usable={}
    for _,p in ipairs(candidates) do if not p.railway and not p.highway then usable[#usable+1]=p end end
    local function pick(test)
        local names,lines,seen={}, {}, {}
        for _,p in ipairs(usable) do
            if test(p.name) then
                lines[#lines+1]=p
                if not seen[p.name] then seen[p.name]=true; names[#names+1]=p.name end
            end
        end
        table.sort(names)
        return names,lines
    end
    local names,lines=pick(L.isMainSt)
    if #lines>0 then return names,lines,"Main St rule" end
    names,lines=pick(L.isFirstSt)
    if #lines>0 then return names,lines,"1st St rule" end
    local total,order={},{}
    for _,p in ipairs(usable) do
        if not total[p.name] then total[p.name]=0; order[#order+1]=p.name end
        total[p.name]=total[p.name]+lengthOf(p)
    end
    table.sort(order,function(a,b) return total[a]>total[b] or total[a]==total[b] and a<b end)
    if order[1] then
        names,lines=pick(function(n) return n==order[1] end)
        return names,lines,string.format("longest street (%d tiles)",math.floor(total[order[1]]+0.5))
    end
    return {},{},"no street besides highways/railways: ordered along the street only"
end

-- The whole numbering. opts: streets (parsed), regions (parsed areas),
-- buildings (parsed export rows). Returns a result table (see build.lua).
function L.number(streets,regions,buildings)
    local pieces,neighbours=L.splitBlocks(streets)
    L.polylineAreas(streets,regions)
    local nearby=L.segmentIndex(pieces)
    -- Connected street networks group buildings outside the named areas.
    -- Railways are not streets. Highways join only polylines of their own name:
    -- with highways as links the whole 42.20 map is one network (1,082 of 1,098
    -- polylines), without them it falls into 84 networks plus the highways.
    local parent={}
    local function find(i) while parent[i]~=i do parent[i]=parent[parent[i]]; i=parent[i] end return i end
    for _,p in ipairs(streets) do if not p.railway then parent[p.index]=p.index end end
    for a,set in pairs(neighbours) do
        for b in pairs(set) do
            local pa,pb=streets[a],streets[b]
            if (not pa.highway and not pb.highway) or (pa.highway and pb.highway and pa.name==pb.name) then
            local ra,rb=find(a),find(b)
            if ra~=rb then if ra<rb then parent[rb]=ra else parent[ra]=rb end end
            end
        end
    end
    local stats={considered=0,filtered={},noStreet=0,outsideNoStreet=0}
    local areas={}          -- output areas in order
    local named={}          -- region index -> area
    for i,r in ipairs(regions) do
        local a={name=r.name,town=1,region=r,buildings={},considered=0,numbered=0,noStreet=0,overflow=0}
        areas[#areas+1]=a; named[i]=a
    end
    local unnamedByRoot,unnamedList={},{}
    local sorted={}
    for _,b in ipairs(buildings) do sorted[#sorted+1]=b end
    table.sort(sorted,function(a,b) return a.id<b.id end)
    for _,b in ipairs(sorted) do
        local ok,why=L.eligible(b)
        if not ok then stats.filtered[why]=(stats.filtered[why] or 0)+1 else
            stats.considered=stats.considered+1
            local cx,cy=(b.x+b.x2-1)/2,(b.y+b.y2-1)/2
            local m=L.match(nearby,b)
            local ri=L.areaAt(regions,cx,cy)
            local area
            if ri then area=named[ri]
            elseif m then
                -- A house on a highway outside the towns joins the network of
                -- the nearest ordinary street within 60 tiles, if there is one,
                -- so a highway through an unnamed town does not split it. Its
                -- address stays on the highway it matched.
                local via=m
                if m.piece.poly.highway then
                    via=L.match(nearby,b,function(piece) return not piece.poly.highway end) or m
                end
                local root=find(via.piece.poly.index)
                area=unnamedByRoot[root]
                if not area then
                    area={name="",town=0,root=root,buildings={},considered=0,numbered=0,noStreet=0,overflow=0}
                    unnamedByRoot[root]=area; unnamedList[#unnamedList+1]=area
                end
            end
            if area then
                area.considered=area.considered+1
                if m then area.buildings[#area.buildings+1]={building=b,match=m}
                else area.noStreet=area.noStreet+1 end
            else stats.outsideNoStreet=stats.outsideNoStreet+1 end
        end
    end
    table.sort(unnamedList,function(a,b) return a.root<b.root end)
    for n,a in ipairs(unnamedList) do
        a.number=n; areas[#areas+1]=a
        -- nearest named area: by distance from the network's streets to area boxes
        local best,bestD
        for _,p in ipairs(streets) do
            if parent[p.index] and find(p.index)==a.root then
                for _,pt in ipairs(p.pts) do
                    for _,r in ipairs(regions) do
                        for _,bx in ipairs(r.boxes) do
                            local dx=math.max(bx[1]-pt[1],0,pt[1]-(bx[1]+bx[3]))
                            local dy=math.max(bx[2]-pt[2],0,pt[2]-(bx[2]+bx[4]))
                            local d=dx*dx+dy*dy
                            if not bestD or d<bestD or d==bestD and r.name<best then best,bestD=r.name,d end
                        end
                    end
                end
            end
        end
        a.near=best
    end
    for ai,a in ipairs(areas) do
        a.index=ai
        -- baseline candidates
        local candidates={}
        if a.town==1 then
            local ri
            for i,r in ipairs(regions) do if r==a.region then ri=i end end
            for _,p in ipairs(streets) do if p.area==ri then candidates[#candidates+1]=p end end
            local inside=function(p) return p.inside[ri] or 0 end
            a.baselineNames,a.baselineLines,a.rule=L.chooseBaseline(candidates,inside)
            if #a.baselineLines==0 then
                -- no street lies mostly inside (LAA: Terminal Dr is mostly in
                -- Jefferson's boxes): use every street with any length inside
                candidates={}
                for _,p in ipairs(streets) do if (p.inside[ri] or 0)>0 then candidates[#candidates+1]=p end end
                local names,lines,rule=L.chooseBaseline(candidates,inside)
                if #lines>0 then a.baselineNames,a.baselineLines,a.rule=names,lines,rule.." (streets partly inside)" end
            end
        else
            local outside,all={}, {}
            for _,p in ipairs(streets) do
                if parent[p.index] and find(p.index)==a.root then
                    all[#all+1]=p
                    if not p.area then outside[#outside+1]=p end
                end
            end
            a.baselineNames,a.baselineLines,a.rule=L.chooseBaseline(outside)
            if #a.baselineLines==0 then
                local names,lines,rule=L.chooseBaseline(all)
                if #lines>0 then a.baselineNames,a.baselineLines,a.rule=names,lines,rule.." (network streets inside towns)" end
            end
        end
        -- block numbers for this area
        local polysByName,matched={},{}
        for _,v in ipairs(a.buildings) do matched[v.match.piece.poly]=true end
        local ri
        for i,r in ipairs(regions) do if r==a.region then ri=i end end
        for _,p in ipairs(streets) do
            if not p.railway and (matched[p] or ri and p.area==ri) then
                polysByName[p.name]=polysByName[p.name] or {}
                local t=polysByName[p.name]; t[#t+1]=p
            end
        end
        local lines=a.baselineLines
        local blockOf,reversed={},{}
        local piecesOf={}
        for _,piece in ipairs(pieces) do
            piecesOf[piece.poly]=piecesOf[piece.poly] or {}
            local t=piecesOf[piece.poly]; t[#t+1]=piece
        end
        local names={}
        for n in pairs(polysByName) do names[#names+1]=n end
        table.sort(names)
        for _,n in ipairs(names) do
            local polys=polysByName[n]
            local near={}
            for _,p in ipairs(polys) do
                local s,e=p.pts[1],p.pts[#p.pts]
                local ds,de=distanceToLines(lines,s[1],s[2]),distanceToLines(lines,e[1],e[2])
                near[p]=math.min(ds,de); reversed[p]=de<ds
            end
            table.sort(polys,function(x,y) return near[x]<near[y] or near[x]==near[y] and x.index<y.index end)
            local k=0
            for _,p in ipairs(polys) do
                local list=piecesOf[p] or {}
                if reversed[p] then
                    for j=#list,1,-1 do k=k+1; blockOf[list[j]]=k end
                else
                    for j=1,#list do k=k+1; blockOf[list[j]]=k end
                end
            end
        end
        a.reversed=reversed
        -- groups per street block side, numbered in order away from the baseline
        local groups,keys={}, {}
        for _,v in ipairs(a.buildings) do
            local m=v.match
            m.block=blockOf[m.piece]
            local d=distanceToLines(lines,m.px,m.py)
            m.order=math.floor(d/L.ORDER_QUANTUM+0.5)
            m.position=reversed[m.piece.poly] and (m.piece.len-m.along) or m.along
            local key=string.format("%s\0%06d\0%s",m.piece.poly.name,m.block,m.odd and "1" or "0")
            if not groups[key] then groups[key]={}; keys[#keys+1]=key end
            local g=groups[key]; g[#g+1]=v
        end
        table.sort(keys)
        local used={}
        a.records={}
        for _,key in ipairs(keys) do
            local group=groups[key]
            table.sort(group,function(x,y)
                local p,q=x.match,y.match
                if p.order~=q.order then return p.order<q.order end
                if p.position~=q.position then return p.position<q.position end
                return x.building.id<y.building.id
            end)
            for _,v in ipairs(group) do
                local b,m=v.building,v.match
                local label,number
                for slot=1,L.SLOTS do
                    local candidate=m.block*100+slot*2-(m.odd and 1 or 0)
                    local text=candidate.." "..m.piece.poly.name
                    if not used[text] then label,number=text,candidate; break end
                end
                if label then
                    used[label]=true
                    a.records[#a.records+1]={id=b.id,x=b.x,y=b.y,x2=b.x2,y2=b.y2,street=m.piece.poly.name,number=number,label=label}
                    a.numbered=a.numbered+1
                else a.overflow=a.overflow+1 end
            end
        end
        table.sort(a.records,function(x,y) return x.id<y.id end)
    end
    return {areas=areas,pieces=pieces,stats=stats,streets=streets}
end

---------------------------------------------------------------------------
-- Output
---------------------------------------------------------------------------
local function q(s) return string.format("%q",s) end
L.CHUNK=1000
-- Lua source of the shipped book. Rows are packed strings
-- "id|x|y|x2|y2|area|street|number" (area and street are 1-based indexes into
-- areas/streets), sorted by id, and handed over in chunks of CHUNK rows, each
-- chunk inside its own function so no single function carries more than CHUNK
-- string constants (Kahlua compiles every function's constants separately).
function L.render(result,meta)
    local out={}
    local function w(s) out[#out+1]=s end
    w("-- DERIVED FILE - do not edit by hand. Whole-map house numbers (AD-10).\n")
    w("--   lua5.1 tools/addresses/build.lua --export <export> --streets <streets.xml> --regions <regions.lua> --out <this file> --report <report.md>\n")
    w("-- game: "..tostring(meta.game).."\n")
    w("-- map: "..tostring(meta.map).."\n")
    w("-- streets.xml sha256: "..tostring(meta.streetsSha).."\n")
    w("-- regions.lua sha256: "..tostring(meta.regionsSha).."\n")
    w("-- export sha256: "..tostring(meta.exportSha).."\n")
    w("-- numbering revision: "..L.REVISION.."\n")
    w("-- rows: id|x|y|x2|y2|area|street|number; label = number..\" \"..streets[street];\n")
    w("-- areas[i].town is 0 for an unnamed area (never show a town name for it).\n")
    local streetIndex,streetNames={},{}
    for _,a in ipairs(result.areas) do
        for _,r in ipairs(a.records) do
            if not streetIndex[r.street] then streetIndex[r.street]=true; streetNames[#streetNames+1]=r.street end
        end
    end
    table.sort(streetNames)
    for i,n in ipairs(streetNames) do streetIndex[n]=i end
    w("local B={revision="..q(L.REVISION)..",game="..q(tostring(meta.game))..",map="..q(tostring(meta.map))
        ..",streetsSha256="..q(tostring(meta.streetsSha))..",exportSha256="..q(tostring(meta.exportSha)).."}\n")
    w("B.areas={\n")
    for _,a in ipairs(result.areas) do
        local bl={}
        for _,n in ipairs(a.baselineNames) do bl[#bl+1]=q(n) end
        w("{name="..q(a.name)..",town="..a.town..(a.near and ",near="..q(a.near) or "")..",baseline={"..table.concat(bl,",").."}},\n")
    end
    w("}\n")
    w("B.streets={\n")
    for i=1,#streetNames,10 do
        local line={}
        for j=i,math.min(i+9,#streetNames) do line[#line+1]=q(streetNames[j]) end
        w(table.concat(line,",")..",\n")
    end
    w("}\n")
    local rows={}
    for _,a in ipairs(result.areas) do
        for _,r in ipairs(a.records) do
            rows[#rows+1]=r.id.."|"..r.x.."|"..r.y.."|"..r.x2.."|"..r.y2.."|"..a.index.."|"..streetIndex[r.street].."|"..r.number
        end
    end
    table.sort(rows)
    w("B.count="..#rows.."\n")
    w("local rows={}\nB.rows=rows\n")
    w("local function add(f) local t=f() for i=1,#t do rows[#rows+1]=t[i] end end\n")
    for i=1,#rows,L.CHUNK do
        w("add(function() return {\n")
        for j=i,math.min(i+L.CHUNK-1,#rows) do w(q(rows[j])..",\n") end
        w("} end)\n")
    end
    w("return B\n")
    return table.concat(out)
end
-- Unpack one row of a loaded book.
function L.unpackRow(book,row)
    local id,x,y,x2,y2,area,street,number=row:match("^(%d+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%d+)|(%d+)|(%d+)$")
    local name=book.streets[tonumber(street)]
    return {id=id,x=tonumber(x),y=tonumber(y),x2=tonumber(x2),y2=tonumber(y2),area=tonumber(area),
        street=name,number=tonumber(number),label=number.." "..name}
end

function L.report(result,meta)
    local out={}
    local function w(s) out[#out+1]=s end
    w("# Whole-map address report ("..L.REVISION..")\n\n")
    w("- game: "..tostring(meta.game).."\n- map: "..tostring(meta.map).."\n")
    w("- streets.xml sha256: "..tostring(meta.streetsSha).."\n- export sha256: "..tostring(meta.exportSha).."\n\n")
    w("| # | Area | Baseline | Chosen by | Considered | Numbered | No street within 60 | Overflow |\n")
    w("|---|---|---|---|---|---|---|---|\n")
    local tot={considered=0,numbered=0,noStreet=0,overflow=0}
    for _,a in ipairs(result.areas) do
        local name=a.town==1 and a.name or ("unnamed area "..a.number.." near "..tostring(a.near))
        local bl=#a.baselineNames>0 and table.concat(a.baselineNames," / ") or "none"
        w(string.format("| %d | %s | %s | %s | %d | %d | %d | %d |\n",a.index,name,bl,a.rule,a.considered,a.numbered,a.noStreet,a.overflow))
        for k in pairs(tot) do tot[k]=tot[k]+a[k] end
    end
    local s=result.stats
    w(string.format("| | **Total** | | | %d | %d | %d | %d |\n\n",tot.considered,tot.numbered,tot.noStreet,tot.overflow))
    w(string.format("- Eligible buildings outside every named area with no street within 60 tiles (no area, no number): %d\n",s.outsideNoStreet))
    local reasons={}
    for k,v in pairs(s.filtered) do reasons[#reasons+1]=k..": "..v end
    table.sort(reasons)
    w("- Filtered out before matching: "..(#reasons>0 and table.concat(reasons,", ") or "none").."\n")
    w("- Street blocks: "..#result.pieces.."\n\n")
    local rail,hwy,seenR,seenH={},{},{},{}
    for _,p in ipairs(result.streets) do
        if p.railway and not seenR[p.name] then seenR[p.name]=true; rail[#rail+1]=p.name end
        if p.highway and not seenH[p.name] then seenH[p.name]=true; hwy[#hwy+1]=p.name end
    end
    table.sort(rail); table.sort(hwy)
    w("## Railways (never streets)\n\n")
    for _,n in ipairs(rail) do w("- "..n.."\n") end
    w("\n## Highways (never a baseline)\n\n")
    for _,n in ipairs(hwy) do w("- "..n.."\n") end
    return table.concat(out)
end
return L
