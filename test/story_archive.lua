-- Source history and knowledge gates through real retirement; budget admission
-- uses the actual adapter with synthetic peer-root padding. No engine claims.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local R=require("ConspiracyFiles/Generated/RetiredCase")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
local V=require("ConspiracyFiles/Validator")
local Budget=require("ConspiracyFiles/SaveBudget")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true,
    opening=true,self="Buddy Schuster"}
local function copy(v)
    if type(v)~="table" then return v end
    local out={};for k,x in pairs(v) do out[k]=copy(x) end;return out
end
local function equal(a,b)
    if type(a)~=type(b) then return false end
    if type(a)~="table" then return a==b end
    for k,v in pairs(a) do if not equal(v,b[k]) then return false end end
    for k in pairs(b) do if a[k]==nil then return false end end
    return true
end
local case=assert(G.generate(catalog,701,opts))
assert(case.story and #case.essential==3,"fixture must be an authored personal story")
local function discoveredExcept(missing)
    local root=assert(S.createDistributed(case,{},nil,nil,0))
    local api=assert(S.open(root,function(next) root=next end))
    for i,doc in ipairs(case.documents) do
        if doc.id==missing then assert(api.drop(doc.id))
        else
            local site
            for _,candidate in ipairs(case.locations) do if candidate.id==doc.locationId then site=candidate end end
            local target={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=i,
                containerIndex=0,containerType=site.containerTypes[1],sprite="archive"}
            assert(api.assign(doc.id,target,0))
            assert(api.status(doc.id,"placed",0))
            assert(api.inspect(doc.id))
        end
    end
    return api.snapshot()
end
local complete=discoveredExcept(nil)
local retired=assert(R.retire(complete,nil,1))
assert(R.validate(retired))
assert(#retired.rows==#retired.known and #retired.locations==2)
assert(retired.reference==case.facts.code)
assert(equal(retired.rows,G.project(case,complete.known)))
assert(R.shrink(retired)==retired,"age cannot discard source rows")
local wrapper={canonical=retired}
assert(Cases.find(wrapper,retired.known[1])==retired)
assert(Cases.pendingThread(wrapper),"complete source chain must carry its follow-up")
local sources={};for _,row in ipairs(retired.rows) do sources[#sources+1]=Pages.text(row.body) end
sources=table.concat(sources,"\n")
for _,name in ipairs(retired.offered.people) do assert(sources:find(name,1,true),"unread actor leaked into choices") end
if retired.offered.organisation then assert(sources:lower():find(retired.offered.organisation:lower(),1,true)) end
for _,missing in ipairs(case.essential) do
    local partial=assert(R.retire(discoveredExcept(missing),nil,1))
    assert(R.validate(partial) and partial.completion==S.INCOMPLETE)
    assert(partial.offered==nil and partial.thread==nil,"missing essential source cannot unlock ending or follow-up")
    assert(Cases.pendingThread({canonical=partial})==nil)
    assert(#partial.rows==#case.documents-1,"discovered sources still survive an incomplete case")
end
local bad=copy(retired);bad.reference=""
assert(not R.validate(bad))
bad=copy(retired);bad.locations[2]=copy(bad.locations[1])
assert(not R.validate(bad),"duplicate archived locations are rejected")
bad=copy(retired);bad.rows[1].locationId="unknown-site"
assert(not R.validate(bad),"unknown archive row location is rejected")
bad=copy(retired);bad.rows[1].leads={"unknown-site"}
assert(not R.validate(bad),"unknown archive lead is rejected")
bad=copy(retired);bad.thread.document="undiscovered-source"
assert(not R.validate(bad),"a carried thread must refer to retained evidence")
bad=copy(retired);bad.offered.people={};bad.answers={matters="person1"}
assert(not R.validate(bad),"an answer cannot name an unoffered actor")

-- Make a second candidate; stage does not write the store or authorize bytes.
local nextCase=assert(G.generate(catalog,702,opts))
-- createDistributed returns TWO values and assert() passes both on, so the
-- second was arriving at stage() as createdHours - which a schedule-less
-- legacy wrapper refuses ("schedule absent"). Take the root alone.
local nextRoot=assert(S.createDistributed(nextCase,{},nil,nil,0))
local candidate=assert(Cases.stage(wrapper,nextRoot))
local generated={campaign=wrapper}
local peers={ ["ConspiracyFiles.Generated.G2"]=generated }
ModData={get=function(tag) return peers[tag] end}
getPlayer=function() return nil end
local before=copy(generated)
local emptyPeer={canonical={padding=""}}
local allowance=V.MAX_ENCODED_BYTES
assert(allowance==1000000)
local baseBytes=V.estimateEncodedBytes(generated)+V.estimateEncodedBytes(emptyPeer)
-- Derive the charge from the estimator so this fixture actually reaches the
-- current boundary instead of quietly ceasing to test it when a limit moves.
local perChar=V.estimateEncodedBytes({canonical={padding="x"}})-V.estimateEncodedBytes(emptyPeer)
local count=math.floor((allowance-baseBytes)/perChar)
assert(count>0 and perChar>0)
peers["ConspiracyFiles.AddressBook.Muldraugh"]={canonical={padding=string.rep("x",count)}}
local admitted,total=Budget.check("generatedCampaign",wrapper)
assert(admitted and total<=allowance and allowance-total<perChar,"fixture must reach the live allowance")
local accepted,reason=Budget.check("generatedCampaign",candidate)
assert(not accepted and reason:find("combined canonical save budget exceeded",1,true))
assert(peers["ConspiracyFiles.Generated.G2"]==generated and equal(generated,before),
    "budget refusal must not mutate existing history")
assert(Cases.validate(wrapper) and Cases.validate(candidate),"size refusal is distinct from structural rejection")
print("PASS retained story sources, missing-essential gates, archive context and real budget-boundary refusal")
