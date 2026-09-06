-- Pure Lua selection policy; labels are metadata hints, never verified story facts.
local S={}
local labels={
    grocery="retail",grocerystorage="retail",toolstore="retail",toolstorestorage="retail",bookstore="retail",
    restaurantdining="hospitality",restaurantkitchen="hospitality",
    clinic="medical",medclinic="medical",hospitalroom="medical",medicaloffice="medical",
    policeoffice="public-service",policegunstorage="public-service",
    office="office",broadcasting="communications",communications="communications",newsroom="communications",
    attic="attic-home",garage="garage",garagestorage="garage",livingroom="home",bedroom="home"}
local priority={communications=1,['public-service']=2,medical=3,office=4,retail=5,hospitality=6,['attic-home']=7,garage=8,home=9,other=10}
function S.category(names)
    local category="other"
    for name in pairs(names) do
        local c=labels[name]
        if c and priority[c]<priority[category] then category=c end
    end
    return category
end
local function before(a,b) return a.distance2<b.distance2 or (a.distance2==b.distance2 and a.id<b.id) end
function S.retain(pool,v)
    local bucket=pool[v.category] or {}; pool[v.category]=bucket
    for _,old in ipairs(bucket) do if old.id==v.id then return end end
    bucket[#bucket+1]=v; table.sort(bucket,before)
    if #bucket>12 then table.remove(bucket) end
end
function S.choose(pool,seed)
    assert(type(seed)=="number" and seed==math.floor(seed) and seed>=1 and seed<2147483647,"invalid seed")
    local categories,buckets={},{}
    for c,items in pairs(pool) do
        categories[#categories+1]=c; buckets[c]={}
        for i,v in ipairs(items) do buckets[c][i]=v end
        table.sort(buckets[c],before)
    end
    table.sort(categories)
    local function random(n) seed=seed*48271%2147483647; return seed%n+1 end
    -- Seeded category order, then one per category each round. Each choice is
    -- among the nearest three remaining candidates in that category.
    for i=#categories,2,-1 do local k=random(i); categories[i],categories[k]=categories[k],categories[i] end
    local out,seen={},{}
    while #out<12 do
        local progressed=false
        for _,c in ipairs(categories) do
            local bucket=buckets[c]
            if #bucket>0 and #out<12 then
                local v=table.remove(bucket,random(math.min(3,#bucket)))
                progressed=true
                if not seen[v.id] then out[#out+1]=v; seen[v.id]=true end
            end
        end
        if not progressed then break end
    end
    return out
end
return S
