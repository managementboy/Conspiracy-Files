local Content = require("ConspiracyFiles/Content")
local Bindings = { accepted = false }
-- Owner-selected Muldraugh candidates. These tight service-area rectangles
-- remain debug-only until the versioned room/floor/boundary/route matrix passes.
Bindings.locations = {
    [Content.ids.relay] = { x1=10613,y1=9603,x2=10617,y2=9607,z=0 },
    [Content.ids.police] = { x1=10636,y1=10409,x2=10640,y2=10413,z=0 }
}
function Bindings.match(id, square)
    local b=Bindings.locations[id]
    return b and square and square.z==b.z and square.x>=b.x1 and square.x<b.x2 and square.y>=b.y1 and square.y<b.y2
end
function Bindings.referenced(snapshot,id)
    for _,e in ipairs(snapshot.evidence) do
        local asset=e.assetId and Content.assets[e.assetId]
        for _,ref in ipairs(asset and asset.references or {}) do if ref==id then return true end end
        for _,ref in ipairs(asset and asset.leadLocationIds or {}) do if ref==id then return true end end
    end
    return false
end
function Bindings.newSampler()
    local previous, repeats = nil,0
    return function(snapshot,square)
        local id
        for _,candidate in ipairs(Content.thread.locationIds) do
            if Bindings.referenced(snapshot,candidate) and Bindings.match(candidate,square) then id=candidate; break end
        end
        local key=id and id..":"..square.x..":"..square.y..":"..square.z or nil
        repeats=key and key==previous and repeats+1 or 1
        previous=key
        if not key or repeats<2 then return nil end
        for _,known in ipairs(snapshot.confirmedLocationIds) do if known==id then return nil end end
        return id
    end
end
return Bindings
