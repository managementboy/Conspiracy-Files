-- Pure incremental assignment, independent of case seed and exploration.
local A={REVISION="muldraugh-address-1"}
function A.build(buildings,roads,done,progress,frozen)
    local segments={}
    for _,b in ipairs(roads) do for _,s in ipairs(b.segments) do segments[#segments+1]={block=b,s=s} end end
    -- Index expanded segment bounds once; a building only compares nearby roads.
    -- Any segment within the existing 60-tile acceptance distance is included.
    local nearby={}
    for _,part in ipairs(segments) do
        local s=part.s
        for x=math.floor((math.min(s[1],s[3])-60)/128),math.floor((math.max(s[1],s[3])+60)/128) do
            for y=math.floor((math.min(s[2],s[4])-60)/128),math.floor((math.max(s[2],s[4])+60)/128) do
                local k=x..":"..y; nearby[k]=nearby[k] or {}
                nearby[k][#nearby[k]+1]=part
            end
        end
    end
    local bi,si,groups,keys,records=1,1,{},{},{}
    local fixed,used={},{}
    for _,r in ipairs(frozen or {}) do
        fixed[r.id]=r;used[r.label]=true
        records[#records+1]={id=r.id,x=r.x,y=r.y,x2=r.x2,y2=r.y2,label=r.label}
    end
    local best,second=nil,nil
    local phase,gi="match",1
    local rejected=0
    local function consider(candidate)
        if not best or candidate.distance<best.distance or candidate.distance==best.distance and candidate.key<best.key then
            if best and best.key~=candidate.key then second=best end
            best=candidate
        elseif candidate.key~=best.key and (not second or candidate.distance<second.distance) then second=candidate end
    end
    return function()
        if phase=="match" then
            local b=buildings[bi]
            if not b then
                for k in pairs(groups) do keys[#keys+1]=k end
                table.sort(keys); phase="number"; return false
            end
            if fixed[b.id] then
                local r=fixed[b.id]
                if b.x~=r.x or b.y~=r.y or b.x2~=r.x2 or b.y2~=r.y2 then error("saved building bounds changed; no addresses committed") end
                if progress then progress(bi,#buildings) end
                bi=bi+1;return false
            end
            local x,y=(b.x+b.x2-1)/2,(b.y+b.y2-1)/2
            local candidates=nearby[math.floor(x/128)..":"..math.floor(y/128)] or {}
            local part=candidates[si]
            if not part then
                if best and best.distance<=3600 then
                    local g=groups[best.key]
                    if not g then g={}; groups[best.key]=g end
                    g[#g+1]={building=b,match=best}
                else rejected=rejected+1 end
                if progress then progress(bi,#buildings) end
                bi,si,best,second=bi+1,1,nil,nil; return false
            end
            si=si+1
            local s=part.s; local x,y=(b.x+b.x2-1)/2,(b.y+b.y2-1)/2
            local dx,dy=s[3]-s[1],s[4]-s[2]; local length=dx*dx+dy*dy
            if length==0 then return false end
            local t=math.max(0,math.min(1,((x-s[1])*dx+(y-s[2])*dy)/length))
            local px,py=s[1]+t*dx,s[2]+t*dy
            local horizontal=math.abs(dx)>=math.abs(dy)
            -- Classify curved/diagonal segments by their dominant axis. Normalize
            -- direction before taking the perpendicular side, so reversing XML
            -- endpoints cannot swap parity. Exact diagonals use east/west.
            local side
            if horizontal then
                local sign=dx>=0 and 1 or -1
                side=sign*(dx*(y-py)-dy*(x-px))/math.sqrt(length)
            else
                local sign=dy>=0 and 1 or -1
                side=sign*(dy*(x-px)-dx*(y-py))/math.sqrt(length)
            end
            if math.abs(side)<1 then return false end
            local odd=horizontal and side<0 or not horizontal and side>0
            local key=part.block.street..":"..part.block.block..":"..tostring(odd)
            consider({key=key,distance=(x-px)^2+(y-py)^2,order=math.abs(px-10600)+math.abs(py-9750),odd=odd,block=part.block})
            return false
        end
        local key=keys[gi]
        if not key then done(records,rejected); return true end
        gi=gi+1
        local group=groups[key]
        table.sort(group,function(a,b) return a.match.order<b.match.order or a.match.order==b.match.order and a.building.id<b.building.id end)
        for i,v in ipairs(group) do
            local b,m=v.building,v.match
            local label
            for slot=1,49 do
                local number=m.block.block*100+slot*2-(m.odd and 1 or 0)
                local candidate=number.." "..m.block.street
                if not used[candidate] then label=candidate;break end
            end
            if label then
                used[label]=true
                records[#records+1]={id=b.id,x=b.x,y=b.y,x2=b.x2,y2=b.y2,label=label}
            else rejected=rejected+1 end
        end
        return false
    end
end
return A
