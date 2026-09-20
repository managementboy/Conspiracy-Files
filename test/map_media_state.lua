package.path="mod/common/media/lua/shared/?.lua;"..package.path
local S=require("ConspiracyFiles/MapMediaState")
local C=require("ConspiracyFiles/MapMediaCatalogue")
local id=C.list[1]; local other=C.list[2]
assert(#C.list==125 and type(id)=="string")
local root=S.empty(); root=assert(S.activate(root,id,17,1,C)); assert(S.validate(root,C))
assert(select(2,S.activate(root,id,18,2,C))==false,"same design is one trail")
root=assert(S.activate(root,other,18,2,C)); assert(root.trails[id] and root.trails[other],"shared destinations do not merge designs")
local target={x=1,y=2,z=0,objectIndex=0,containerIndex=0,sprite="s",containerType="desk"}
root=assert(S.set(root,id,1,{target=target,state="unknown",attempt=1,at=3}))
assert(S.nextFragment(root,id,200,200,20)==nil,"unknown insertion blocks retry")
root=assert(S.set(root,id,1,{target=target,state="placed",attempt=1,at=3,recognised=true,noted=true}))
assert(S.validate(root,C)); assert(S.nextFragment(root,id,200,200,999999)==2,"noted contribution never expires")
root=assert(S.set(root,id,4,{state="noted",attempt=1,at=4,recognised=true,noted=true}))
assert(S.validate(root,C),"noted payoff remains valid after its physical target disappears")
print("PASS map media state: design identity, uncertain intent, durable noted contributions")

for _,kind in ipairs({"wardrobe","fridge","crate","counter","bedside"}) do
    local t=S.copy(target);t.containerType=kind
    local candidate=S.set(root,id,2,{target=t,state="intent",attempt=1,at=4})
    assert(S.validate(candidate,C),"identified non-floor furniture is valid: "..kind)
end
for _,kind in ipairs({"floor","none","vehicle","carrier","","bad\nkind"}) do
    local t=S.copy(target);t.containerType=kind
    local candidate=S.set(root,id,2,{target=t,state="intent",attempt=1,at=4})
    assert(not S.validate(candidate,C),"ineligible map placement target: "..kind)
end
