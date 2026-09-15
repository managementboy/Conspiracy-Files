-- Focused test for the evidence role/carrier split (EVIDENCE_ROLE_SCHEMA.md).
-- Covers: determinism for a fixed seed, that a role never receives a carrier
-- incapable of its text, that the four card/ticket carriers added
-- 2026-09-06 are actually reachable through Generator.build, and that the
-- generated evidence count still varies. Standalone script: plain `assert`
-- only, no test-harness globals, matching test/evidence_kinds.lua.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local K=require("ConspiracyFiles/Generated/EvidenceKinds")
local Roles=require("ConspiracyFiles/Generated/EvidenceRoles")
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local options={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}

local function deepEqual(a,b,seen)
    if type(a)~=type(b) then return false end
    if type(a)~="table" then return a==b end
    seen=seen or {}
    if seen[a] then return seen[a]==b end
    seen[a]=b
    for k,v in pairs(a) do if not deepEqual(v,b[k],seen) then return false end end
    for k in pairs(b) do if a[k]==nil then return false end end
    return true
end

-- 1. Determinism: the same seed against the same catalog produces
-- byte-identical cases, repeatedly, from fresh generator calls.
do
    local a=assert(G.generate(catalog(),4242,options))
    local b=assert(G.generate(catalog(),4242,options))
    local c=assert(G.generate(catalog(),4242,options))
    assert(deepEqual(a,b),"same seed must reproduce the same case")
    assert(deepEqual(b,c),"same seed must reproduce the same case on a third call")
    -- A different seed must be free to diverge, or the check above is vacuous.
    local other=assert(G.generate(catalog(),4243,options))
    assert(not deepEqual(a,other),"different seeds must be able to produce different cases")
end

-- 2. Text-capability hard constraint: a role may only pair with a carrier
-- that can actually hold its text. This is the two ways a role could
-- otherwise "emit a body of prose onto a card": a body too long for a
-- short carrier, and a carrier not even on the role's whitelist.
do
    local prose=string.rep("x",500)
    assert(Roles.fits("affiliationLead","idcard","Ref R-1\nM. Ellis\nCounty Equipment Service"),
        "a short body must fit its declared short carrier")
    assert(not Roles.fits("affiliationLead","idcard",prose),"a card must refuse a prose-length body")
    assert(not Roles.fits("access","idcard","short"),"idcard does not suit the access role even with short text")
    assert(Roles.fits("diaryContext","diary",prose),"a prose-capable carrier may hold a long body")
    assert(not K.fits("idcard",prose),"EvidenceKinds itself must also refuse a prose body on a short carrier")
    assert(K.fits("diary",prose),"EvidenceKinds must accept a long body on a prose carrier")
end

-- 2b. The same guard is live inside Generator.build itself: every generated
-- document's kind must actually be able to hold that document's body, for
-- every role the generator can produce, across a wide seed sample.
do
    for seed=1,200 do
        local case=assert(G.generate(catalog(),seed,options))
        for _,doc in ipairs(case.documents) do
            local carrier=assert(K.get(doc.kind))
            assert(K.fits(doc.kind,doc.body),
                "seed "..seed..": role carried by "..doc.kind.." exceeds its declared text capacity")
            if carrier.capacity=="short" then
                assert(#doc.body<=K.SHORT_MAX_CHARS,
                    "seed "..seed..": short carrier "..doc.kind.." got a body too long for a card")
            end
        end
    end
end

-- 3. Reachability: across a broad seed sample, every one of the four
-- card/ticket carriers added 2026-09-06 actually appears in a generated
-- case at least once. Before this change these kinds were listed in
-- EvidenceKinds but never selected by Generator.build.
do
    local seen={}
    for seed=1,400 do
        local case=assert(G.generate(catalog(),seed,options))
        for _,doc in ipairs(case.documents) do seen[doc.kind]=true end
    end
    for _,kind in ipairs({"idcard","creditcard","businesscard","ticket"}) do
        assert(seen[kind],"carrier "..kind.." was never reachable across 400 seeds")
    end
    -- The pre-existing prose carriers must remain reachable too; this is an
    -- addition to the generation surface, not a replacement of it.
    for _,kind in ipairs({"dispatch","letter","receipt","notepad","key","diary","notebook","clipping"}) do
        assert(seen[kind],"pre-existing carrier "..kind.." must remain reachable")
    end
end

-- 4. Evidence count still varies: the role/carrier split must not regress
-- Generator to a fixed evidence set, and must stay within MIN/MAX_EVIDENCE.
do
    local counts={}
    for seed=1,200 do
        local case=assert(G.generate(catalog(),seed,options))
        assert(#case.documents>=G.MIN_EVIDENCE and #case.documents<=G.MAX_EVIDENCE,
            "evidence count out of the declared MIN/MAX bounds")
        counts[#case.documents]=true
    end
    local distinct=0
    for _ in pairs(counts) do distinct=distinct+1 end
    assert(distinct>=2,"evidence count must still vary across seeds")
end

print("PASS evidence_role_carrier: deterministic build, hard text-capacity constraint, card/ticket reachability, variable evidence count")
