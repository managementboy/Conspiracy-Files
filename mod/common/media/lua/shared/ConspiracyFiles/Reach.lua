-- P4-R55: pure policy for new cases; never updates an existing case.
local R={}
local function finite(n) return type(n)=="number" and n==n and n~=math.huge and n~=-math.huge end
function R.radius(hours)
    if not finite(hours) or hours<0 then return nil,"invalid character survival hours" end
    if hours<96 then return 250 end
    if hours<264 then return 500 end
    if hours<504 then return 1000 end
    return 1500
end
function R.validAnchor(a)
    return type(a)=="table" and finite(a.x) and finite(a.y)
end
function R.contains(bounds,anchor,radius)
    local dx=math.max(bounds.x1-anchor.x,0,anchor.x-(bounds.x2-1))
    local dy=math.max(bounds.y1-anchor.y,0,anchor.y-(bounds.y2-1))
    return dx*dx+dy*dy<=radius*radius
end
return R
