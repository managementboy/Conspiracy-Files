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
-- One step wider (P4-R133, the ladder's second rung). The survival ladder
-- above IS the step sizes, so "wider" means the next rung of it rather than an
-- invented multiplier; at the top there is nothing wider and the answer is the
-- same radius, which the caller treats as "this rung buys nothing".
R.STEPS={250,500,1000,1500}
function R.wider(radius)
    if not finite(radius) then return nil,"invalid radius" end
    for _,step in ipairs(R.STEPS) do if step>radius then return step end end
    return radius
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
