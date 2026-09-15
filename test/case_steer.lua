-- "What do I make of it?" steers the next case (P4-R113, P4-R121). The
-- survivor's answers about a finished case are handed to the generator as
-- `steer`. What must hold:
--   - a case with no steer is byte-for-byte what the generator built before
--     steering existed, or every save in play would be refused;
--   - a returning person or organisation appears, and a returning person never
--     gets a second body;
--   - the chosen way of investigating and the chosen reading each bring a paper;
--   - the story and its agree/disagree outline are never changed by steering;
--   - the same seed and steer always give the same case, and a tampered or
--     invalid steer is refused.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local D=dofile("test/fixtures/case_digest.lua")
local fixture=dofile("test/fixtures/generator_unsteered_digest.lua")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local function opts(extra)
    local o={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
    for k,v in pairs(extra or {}) do o[k]=v end
    return o
end

-- 1. Unsteered cases are unchanged.
local variants={plain=opts(),met=opts{names={"Una Carver","Bill Ross"}},memo=opts{relayMemo=true}}
local checked=0
for name,o in pairs(variants) do
    for seed=1,fixture.seeds do
        local case=G.generate(catalog,seed,o)
        local got=case and D.digest(case) or "nil"
        assert(got==fixture.digests[name][seed],
            string.format("unsteered %s case for seed %d changed: %s, expected %s",name,seed,got,fixture.digests[name][seed]))
        checked=checked+1
    end
end
print("PASS "..checked.." unsteered cases are byte-for-byte unchanged")

local FROM="generated:77:case"
local function hasTitle(case,test)
    for _,d in ipairs(case.documents) do if test(d) then return true end end
    return false
end
local function starts(prefix) return function(d) return d.title:sub(1,#prefix)==prefix end end

-- 2. A returning person, and no second body; a returning organisation.
for seed=1,80 do
    local base=G.generate(catalog,seed,opts())
    if base then
        local person="Una Carver"
        local c=assert(G.generate(catalog,seed,opts{steer={fromCase=FROM,person=person}}))
        assert(c.facts.sender==person and c.identities[1].name==person,"the returning person is the case's first person")
        assert(c.identities[1].met==true,"a returning person never gets a second body")
        assert(c.identities[2].name~=person,"the returning person is not both people")
        assert(c.premiseId==base.premiseId and c.outline==base.outline,"steering never changes the story or its outline")
        assert(G.validate(c))
        -- A returning name that the draw gave to the second person moves that person on.
        local clash=G.generate(catalog,seed,opts{steer={fromCase=FROM,person=base.facts.recipient}})
        assert(clash.identities[1].name==base.facts.recipient and clash.identities[2].name~=base.facts.recipient)
        local org="Cumberland Signal Services"
        local o=assert(G.generate(catalog,seed,opts{steer={fromCase=FROM,organisation=org}}))
        assert(o.organisation.name==org and o.facts.organisation==org,"the returning organisation replaces the drawn one")
        assert(o.identities[1].met==base.identities[1].met,"an organisation's return does not touch the people")
        assert(o.outline==base.outline and G.validate(o))
    end
end
print("PASS a returning person or organisation appears; a returning person gets no body; the story is untouched")

-- 3. The way of investigating and the reading each bring a paper.
local ways={
    person=function(d) return starts("Private diary /")(d) or starts("Duty log /")(d) or d.title:find(", marked ",1,true)
        or d.title:find(": ",1,true) and not d.title:find(" / ",1,true) end,
    records=function(d) return starts("Tagged key /")(d) or starts("Shift notebook /")(d) or starts("Payment slip /")(d) or d.quantity~=nil end,
    listen=starts("Press clipping /"),
}
local leans={
    one=function(d) return starts("Payment slip /")(d) or d.quantity~=nil or (d.title:find(": ",1,true) and d.kind~="dispatch" and not d.title:find(" / ",1,true)) end,
    two=starts("Duty log /"),
}
local total,wayHits,leanHits={},{},{}
for seed=1,120 do
    local base=G.generate(catalog,seed,opts())
    if base then
        for way,test in pairs(ways) do
            local c=assert(G.generate(catalog,seed,opts{steer={fromCase=FROM,way=way}}))
            assert(c.outline==base.outline and c.premiseId==base.premiseId and G.validate(c))
            total[way]=(total[way] or 0)+1
            if hasTitle(c,test) then wayHits[way]=(wayHits[way] or 0)+1 end
        end
        for reading,test in pairs(leans) do
            local c=assert(G.generate(catalog,seed,opts{steer={fromCase=FROM,reading=reading}}))
            assert(c.outline==base.outline,"the reading leans on a paper and never changes the outline")
            total[reading]=(total[reading] or 0)+1
            if hasTitle(c,test) then leanHits[reading]=(leanHits[reading] or 0)+1 end
        end
    end
end
for way in pairs(ways) do
    assert((wayHits[way] or 0)==total[way],string.format("way %s brought its paper in %d of %d cases",way,wayHits[way] or 0,total[way]))
end
for reading in pairs(leans) do
    assert((leanHits[reading] or 0)==total[reading],string.format("reading %s brought its paper in %d of %d cases",reading,leanHits[reading] or 0,total[reading]))
end
print("PASS each way of investigating and each reading brings its paper in every case")

-- 4. Deterministic, saved, and tamper-proof.
local s={fromCase=FROM,reading="one",way="records",person="Una Carver"}
local c1=assert(G.generate(catalog,5,opts{steer=s}))
local c2=assert(G.generate(catalog,5,opts{steer=s}))
assert(D.digest(c1)==D.digest(c2),"the same seed and steer give the same case")
assert(c1.steer and c1.steer.fromCase==FROM and c1.steer.person=="Una Carver","the steer is saved in the case")
local tampered=G.restore(c1); tampered.steer.person="Roy Hale"
assert(not G.validate(tampered),"a changed steer no longer matches the case")
local smuggled=G.restore(assert(G.generate(catalog,5,opts()))); smuggled.steer={fromCase=FROM,way="listen"}
assert(not G.validate(smuggled),"a steer added to an unsteered case is refused")
local bad={
    {fromCase=FROM},                                   -- nothing to steer
    {way="records"},                                   -- no source case
    {fromCase=FROM,way="cold"},                        -- leave it cold is not in the first cut
    {fromCase=FROM,reading="unsure"},                  -- can't tell is simply no reading
    {fromCase=FROM,person="Una Carver",organisation="X Office"}, -- one returning name at most
    {fromCase=FROM,person="Una"},                      -- not a name the cast would accept
    {fromCase=FROM,way="records",verdict="right"},     -- never a verdict
}
for i,steer in ipairs(bad) do
    assert(G.generate(catalog,5,opts{steer=steer})==nil,"invalid steer "..i.." must be refused")
end
print("PASS a steered case rebuilds from its seed; a tampered, smuggled or invalid steer is refused")
