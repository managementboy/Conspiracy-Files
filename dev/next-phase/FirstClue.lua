-- Pure proposal for a natural first clue. It does not generate, persist, or expose knowledge.
local Catalog=require("ConspiracyFiles/Generated/Catalog")
local Reach=require("ConspiracyFiles/Reach")
local FirstClue={}
local function copy(v) if type(v)~="table" then return v end local out={} for k,c in pairs(v) do out[k]=copy(c) end return out end
local function distanceSquared(bounds,anchor)
    local dx=math.max(bounds.x1-anchor.x,0,anchor.x-(bounds.x2-1))
    local dy=math.max(bounds.y1-anchor.y,0,anchor.y-(bounds.y2-1))
    return dx*dx+dy*dy
end
local function ordered(sites,anchor)
    table.sort(sites,function(a,b)
        local da,db=distanceSquared(a.bounds,anchor),distanceSquared(b.bounds,anchor)
        return da==db and a.id<b.id or da<db
    end)
    return sites
end
function FirstClue.select(catalog,context)
    if type(context)~="table" then return nil,"first-clue context required" end
    for key in pairs(context) do
        if key~="mapId" and key~="buildLine" and key~="anchor" and key~="hoursSurvived" and key~="allowSynthetic" then return nil,"unknown first-clue context" end
    end
    if type(context.mapId)~="string" or type(context.buildLine)~="string" or not Reach.validAnchor(context.anchor) then return nil,"map, build, and anchor required" end
    local radius,why=Reach.radius(context.hoursSurvived); if not radius then return nil,why end
    local eligible,err=Catalog.eligible(catalog,context.mapId,context.buildLine,context.allowSynthetic)
    if not eligible then return nil,err end
    local nearby={}
    for _,site in ipairs(eligible) do if Reach.contains(site.bounds,context.anchor,radius) then nearby[#nearby+1]=site end end
    ordered(nearby,context.anchor)
    for _,intro in ipairs(nearby) do
        local partners={}
        for _,partner in ipairs(nearby) do if intro.id~=partner.id and Catalog.distinct(intro,partner) then partners[#partners+1]=partner end end
        if #partners>0 then
            ordered(partners,context.anchor)
            return copy({introductorySite=intro,partnerSite=partners[1],anchor=copy(context.anchor),radius=radius})
        end
    end
    return nil,"no distinct eligible first-clue pair within approved reach"
end
return FirstClue
