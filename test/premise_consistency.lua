-- Scenario rendering and generated-case calendar invariants. Discovery gates
-- belong to story_family_contract; this test keeps authored text and dates
-- honest without treating a coherent contradiction as a banned word.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Story=require("ConspiracyFiles/Generated/Story")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local Premises=require("ConspiracyFiles/Generated/Premises")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local MONTH={january=1,february=2,march=3,april=4,may=5,june=6,july=7,august=8,september=9,october=10,november=11,december=12}
local BEFORE={0,31,59,90,120,151,181,212,243,273,304,334}
local LENGTH={31,28,31,30,31,30,31,31,30,31,30,31}
local MAY_1,JUNE_28,JULY_8=121,179,189
local function get(id,variant) return Personal.get(id,variant) or Ordinary.get(id,variant) end
local function copy(v) if type(v)~="table" then return v end local out={} for k,x in pairs(v) do out[k]=copy(x) end return out end
local function equal(a,b,seen)
    if type(a)~=type(b) then return false end
    if type(a)~="table" then return a==b end
    seen=seen or {};if seen[a] then return seen[a]==b end;seen[a]=b
    for k,v in pairs(a) do if not equal(v,b[k],seen) then return false end end
    for k in pairs(b) do if a[k]==nil then return false end end
    return true
end
local function dateOrdinals(text,where)
    local out={}
    for month,day,year in text:lower():gmatch("(%a+) (%d+), (%d%d%d%d)") do
        local m,d=MONTH[month],tonumber(day)
        if m and year=="1993" then
            assert(d>=1 and d<=LENGTH[m],where..": impossible 1993 date")
            local ordinal=BEFORE[m]+d
            assert(ordinal>=120 and ordinal<=JULY_8,where..": source date after the outbreak or before DATE0")
            out[#out+1]=ordinal
        end
    end
    return out
end
local function fill(map)
    return function(text)
        return (text:gsub("{([%u%d]+)}",function(key) return assert(map[key],"unbound scenario slot "..key) end))
    end
end
local function calendarOK(cal,where)
    assert(cal.claimDate>=MAY_1 and cal.claimDate<=JUNE_28,where..": claim outside generation range")
    assert(cal.claimDate<cal.responseDate and cal.responseDate<cal.reviewDate,where..": ordinary calendar out of order")
    assert(cal.responseDate-cal.claimDate<=9 and cal.reviewDate-cal.responseDate<=9,where..": gap exceeds nine days")
    assert(cal.reviewDate<=JULY_8,where..": review after July 8")
end
local function includes(list,value) for _,item in ipairs(list) do if item==value then return true end end return false end

-- DATE0 must cross month boundaries correctly; SINCE11 is a real month/year
-- calculation, not a string that happens to work during June.
local may=G.dateFields({claimDate=121,responseDate=122,reviewDate=123})
assert(may.DATE0=="April 30, 1993" and may.PRIORMONTH=="April" and may.SINCE11=="June 1992")
local june=G.dateFields({claimDate=152,responseDate=153,reviewDate=154})
assert(june.DATE0=="May 31, 1993" and june.PRIORMONTH=="May" and june.SINCE11=="July 1992")

local function lcg(seed) return function(n) seed=(seed*48271)%2147483647;return seed%n+1 end end
local calendars={{claimDate=121,responseDate=122,reviewDate=123},{claimDate=178,responseDate=179,reviewDate=180},
    {claimDate=179,responseDate=188,reviewDate=189}}
for seed=1,80 do calendars[#calendars+1]=G.calendar(lcg(seed*7919+1)) end
for i,cal in ipairs(calendars) do calendarOK(cal,"calendar "..i) end

-- Every authored family and variant renders through Story.build using the same
-- date-field map as generation. The source may cite historical 1991/1992
-- facts, but every actual 1993 date must stay in the calm-date range.
local renders=0
for _,cal in ipairs(calendars) do
    for _,id in ipairs(Premises.list()) do
        -- A continuation inherits the source case's closing day, so its three
        -- records intentionally use one date. Ordinary cases keep the ordered
        -- calendar asserted above; personal_story covers continuation flow.
        local sourceCal=id=="still-filing" and {claimDate=cal.reviewDate,responseDate=cal.reviewDate,reviewDate=cal.reviewDate} or cal
        local dates=G.dateFields(sourceCal)
        for variant=1,2 do
            local scenario=assert(get(id,variant),id.." variant "..variant.." missing")
            local map=copy(dates)
            map.CODE="PC-229";map.ORG=scenario.organisation;map.P1="Marion Ellis";map.P2="Roy Hale";map.A="201 N Carl St";map.B="113 Walker Road"
            map.SELF="Buddy Schuster";map.FROMPOINT="213 Harris St";map.FROMREF="OLD-104"
            local built=assert(Story.build(scenario,fill(map),id..":"..variant..":",{id="a"},{id="b"},
                {{id="person-1"},{id="person-2"}},{id="organisation"},function(n) return n end))
            assert(built.story.question==fill(map)(scenario.question) and built.story.event==fill(map)(scenario.event)
                and built.story.outcome==fill(map)(scenario.outcome),id.." metadata differs from its scenario")
            assert(built.story.unresolved==(scenario.unresolved and fill(map)(scenario.unresolved) or nil),
                id.." unresolved metadata differs from its scenario")
            for n,reading in ipairs(scenario.readings) do assert(built.story.readings[n]==fill(map)(reading)) end
            for _,doc in ipairs(built.documents) do
                assert(not doc.title:match("{%u[%u%d]*}") and not doc.body:match("{%u[%u%d]*}"),id..": unresolved placeholder")
                dateOrdinals(doc.body,id.." / "..variant.." / "..doc.id)
            end
            if id:match("%-start$") then
                -- Every profession opening (the Fitness ten and the 2026-09-25
                -- occupation families) has the same shape: a thing in the
                -- pocket, then the dated appointment card.
                assert(includes(dateOrdinals(built.documents[2].body,id.." appointment"),JULY_8),
                    "the origin opening must use its outbreak-eve appointment date")
            else
                -- A DATED ANCHOR IS A DOCUMENT. An object carries no readable
                -- text - nothing is written on a starter motor - so it cannot
                -- render a calendar date, and requiring one would quietly turn
                -- every physical anchor back into a page. Paper establishes
                -- dates; the object establishes what is physically true.
                local function dated(n,label,expected)
                    local doc=built.documents[n]
                    local carrier=assert(Kinds.get(doc.kind))
                    if carrier.capacity=="object" then
                        -- Strengthened, not relaxed: an object must carry NO
                        -- date, or the mod has written text onto a thing.
                        assert(#dateOrdinals(doc.body,id.." "..label)==0,
                            id.." "..label.." is an object and must not carry a date: "..doc.body)
                        return true
                    end
                    return includes(dateOrdinals(doc.body,id.." "..label),expected)
                end
                assert(dated(1,"claim",sourceCal.claimDate)
                    and dated(2,"response",sourceCal.responseDate)
                    and dated(3,"review",sourceCal.reviewDate),
                    id.." anchors must render their ordered calendar dates")
            end
            renders=renders+#built.documents
        end
    end
end

-- Four hundred ordinary seeds must cover each of the twenty ordinary families
-- in both authored variants. Generated cases rebuild exactly under the current
-- event-story revision; follow-up same-day dates are exercised separately by
-- personal_story, so this deliberately checks only ordinary generated cases.
-- UPDATED 2026-09-25 for DR-20260925-RECORD-VOICE: the record now speaks in
-- the survivor's first person, with doubt (owner: "we still write 'what YOU
-- found'"). The old wording is pinned nowhere; the new set is Headings.lua,
-- and test/record_voice_is_mine.lua is what holds it to first person.
assert(G.REVISION=="g19-record-speaks-as-me")
local seen,cases={},0
for seed=1,400 do
    local case=G.generate(catalog,seed,opts)
    if case then
        cases=cases+1;assert(G.validate(case),"seed "..seed.." must validate under current revision")
        assert(case.generatorRevision==G.REVISION and equal(case,assert(G.restore(case))),"seed "..seed.." must rebuild exactly")
        assert(equal(case,assert(G.generate(catalog,seed,opts))),"seed "..seed.." must be deterministic")
        calendarOK({claimDate=case.facts.claimDate,responseDate=case.facts.responseDate,reviewDate=case.facts.reviewDate},"seed "..seed)
        local variant=case.outline=="corroboration" and 1 or 2
        local scenario=assert(get(case.premiseId,variant))
        assert(case.facts.subject==case.story.question and case.facts.unknown==case.story.unresolved
            and case.organisation.name==scenario.organisation,"seed "..seed.." lost rendered scenario metadata")
        for _,doc in ipairs(case.documents) do
            assert(not doc.title:match("{%u[%u%d]*}") and not doc.body:match("{%u[%u%d]*}"),"seed "..seed..": unresolved placeholder")
            dateOrdinals(doc.body,"seed "..seed.." / "..doc.id)
        end
        seen[case.premiseId..":"..variant]=true
    end
end
local variants=0;for _ in pairs(seen) do variants=variants+1 end
assert(cases>0 and variants==Premises.choosableCount()*2,"400 seeds must cover all ordinary authored variants")
print(string.format("PASS scenario consistency: %d source renders across %d calendars; %d generated cases cover %d ordinary variants",renders,#calendars,cases,variants))
