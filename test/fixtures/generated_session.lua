-- A REAL, valid generated session for offline tests, built through the shipped
-- generator and validated by the shipped validator.
--
-- WHY THIS EXISTS. test/local_person_integration.lua carried its own literal
-- root: {case={caseId="case",documents={{id="clue",locationId="t3:house"}}},
-- assignments={...}}. A hand-written case can NEVER be valid, by design -
-- Generator.validate reconstructs the whole case from its seed and demands
-- byte equality, precisely so a hand-edited save cannot smuggle evidence in.
-- So SuccessiveCases.current() refused the fixture, the refusal was swallowed
-- by a pcall three layers up, and the test failed with a bare "assertion
-- failed!" on an empty row list that said nothing about the cause.
--
-- Tests must therefore GENERATE a case, not describe one. Doing that by hand
-- in each test is how the fixture rotted in the first place, so it happens
-- once, here, and validates itself at require time.
package.path="mod/common/media/lua/shared/?.lua;test/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
-- Our own copy of the synthetic catalog with T3-PREFIXED ids. The shared
-- fixture's ids are bare ("synthetic-site-01"), and production code depends on
-- the real convention: LocalPersonIntegration.buildingFor only binds when
-- doc.locationId == "t3:"..building:getDef():getIDString(), while P.known
-- strips the same prefix back off. A catalog without the prefix can therefore
-- never bind, which is why the integration test could not reach a connection
-- no matter what else was fixed. The shared fixture is left alone; other tests
-- depend on its ids.
local catalog=dofile("test/fixtures/synthetic_locations.lua")
do
    local prefixed={revision=catalog.revision,locations={}}
    for i,site in ipairs(catalog.locations) do
        local copy={}
        for k,v in pairs(site) do copy[k]=v end
        copy.id="t3:"..site.id
        prefixed.locations[i]=copy
    end
    catalog=prefixed
end

local F={}

-- A target the session validator accepts: inside the site's own bounds and in
-- one of the container kinds that site actually declares.
local function targetFor(site)
    return {x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,
            objectIndex=0,containerIndex=0,sprite="synthetic_fixture_container",
            containerType=site.containerTypes[1]}
end

-- One valid session root. `seed` is optional and only changes which synthetic
-- sites and documents the generator picks.
-- The synthetic catalog's own map and build line, and allowSynthetic because
-- these are invented coordinates and never vanilla map data.
F.OPTIONS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}

function F.root(seed)
    local case,why=G.generate(catalog,seed or 1,F.OPTIONS)
    assert(case,"fixture could not generate a case: "..tostring(why))
    local targets={}
    for _,site in ipairs(case.locations) do targets[site.id]=targetFor(site) end
    local root,why=S.create(case,targets)
    assert(root,"fixture could not create a session: "..tostring(why))
    return root
end

-- The ModData value the mod reads, plus the generated ids a test needs to
-- build its own stubs against. Tests must bind to THESE rather than invent
-- strings: the ids come from the generator and are not ours to choose.
function F.store(seed)
    local root=F.root(seed)
    local doc=root.case.documents[1]
    return {
        store={campaign={canonical=root}},
        root=root,
        caseId=root.case.caseId,
        docId=doc.id,
        locationId=doc.locationId,
        -- What LocalPersonIntegration derives as a buildingId: the location id
        -- with the t3: prefix stripped (see P.known).
        buildingId=tostring(doc.locationId):gsub("^t3:",""),
        documents=root.case.documents,
        -- The case's own person: only a card with this name may bind the case
        -- to a body (owner, Windows, 2026-09-14).
        personName=root.case.identities and root.case.identities[1] and root.case.identities[1].name,
    }
end

-- Self-check at require time, through the SHIPPED path the mod reads it by, so
-- this fixture can never quietly stop being a valid session again.
do
    local f=F.store()
    local wrapper,why=Cases.current(f.store)
    assert(wrapper,"generated_session fixture is not a valid session: "..tostring(why))
    local sessions=Cases.sessions(wrapper)
    assert(sessions and #sessions>=1,"fixture validates but yields no sessions")
    assert(type(f.docId)=="string" and type(f.buildingId)=="string" and #f.buildingId>0,
        "fixture must expose the generated document and building ids")
end

return F
