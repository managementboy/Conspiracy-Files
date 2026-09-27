-- The pure scene matcher (task 3 plan, step 5; directive NH-D7): two traces
-- of different sorts per kind, only jar-verified signatures, the game's own
-- story lists as a prefilter, and traces kept across looks.
-- WRITER/ENGINEER TEST: scene kinds and traces are named here, as in the data.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local DIRECTIVE="NH-D7"
local M=require("NHShared/Generated/SceneMatch")
local Scenes=require("NHShared/Generated/VanillaScenes")
assert(M.DIRECTIVE==DIRECTIVE,"the matcher names its directive")

-- Every signature: an allowed kind, a story name, two or more traces of at
-- least two sorts, and a must trace that is more than an ordinary house.
local families={}
for _,s in ipairs(M.SIGNATURES) do
    assert(Scenes.allowed(s.kind),s.kind.." is not an allowed kind")
    assert(M.status(s.kind)=="verified" and M.signature(s.kind)==s,s.kind)
    assert(type(s.story)=="string" and s.story~="","a story name")
    local sorts,n,rareMust={},0,false
    for _,t in ipairs(s.traces) do
        assert(M.SORTS[t.sort],s.kind.." unknown sort "..tostring(t.sort))
        if not sorts[t.sort] then sorts[t.sort]=true; n=n+1 end
        if t.must and not t.common then rareMust=true end
    end
    assert(n>=2,s.kind.." needs traces of two sorts")
    assert(rareMust,s.kind.." needs a must trace that anchors it")
    families[Scenes.get(s.kind).family]=true
end
for _,f in ipairs({"RB","RDS","RVS","RZS"}) do assert(families[f],"no verified kind in family "..f) end
-- Every other allowed kind is unverified and can never match.
local unverified=0
for _,k in ipairs(Scenes.allowedKinds()) do
    if not M.signature(k) then unverified=unverified+1; assert(M.status(k)=="unverified",k) end
end
assert(unverified>0 and M.status("RBBasic")=="refused" and M.status("ZzNoSuch")=="refused")

-- Tokens: only relevant ones, a vehicle without its module, sorted, distinct.
local tokens=M.tokens({rooms={"jackiejayestudio","kitchen","zzcloset"},items={"Base.Microphone","Base.Microphone","Base.Apple"},
    vehicles={"Base.StepVan_Plonkies"},zombies={"Zzoutfit"}})
assert(table.concat(tokens,",")=="item:Base.Microphone,room:jackiejayestudio,room:kitchen,vehicle:StepVan_Plonkies",
    table.concat(tokens,","))
assert(M.vehicleToken("Base.CarLuxury")=="vehicle:CarLuxury" and M.vehicleToken("CarLuxury")=="vehicle:CarLuxury")

-- TWO TRACES OF DIFFERENT SORTS.
assert(M.match({"room:jackiejayestudio"})==nil,"one trace is not a scene")
local kind,found,anchor=M.match({"room:jackiejayestudio","item:Base.Pen"})
assert(kind=="RBJackieJaye" and #found==2 and anchor=="room:jackiejayestudio","room and props")
assert(M.match({"item:Base.Pen","item:Base.Notepad"})==nil,"the must trace is missing")
assert(M.match({"vehicle:StepVan_Plonkies"})==nil,"a van alone")
assert(M.match({"vehicle:StepVan_Plonkies","item:Base.Plonkies"})=="RVSPlonkies")
assert(M.match({"vehicle:CarLightsPolice","zombie:Police"})==nil,"a police car and police: not a house call without the house")
kind,_,anchor=M.match({"vehicle:CarLightsPolice","zombie:Police","room:kitchen"})
assert(kind=="RDSPoliceAtHouse" and anchor=="vehicle:CarLightsPolice","anchored on the car, not the kitchen")
assert(M.match({"item:Base.RatKing","room:bedroom"})=="RDSRatKing")
-- The murder scene is checked before the burying camp (both use graves).
assert(M.match({"sprite:location_community_cemetary_01_32","item:Base.EmptyPetrolCan","item:Base.Shovel"})=="RZSMurderScene")
assert(M.match({"sprite:location_community_cemetary_01_22","item:Base.Shovel"})=="RZSBuryingCamp")

-- THE PREFILTER: only stories the running game lists.
local allow=M.allowFromNames({"Plonkies","Zz Unrelated Story"})
assert(allow.RVSPlonkies and not allow.RBJackieJaye,"story names map to kinds")
assert(M.match({"vehicle:StepVan_Plonkies","item:Base.Plonkies"},allow)=="RVSPlonkies")
assert(M.match({"room:jackiejayestudio","item:Base.Pen"},allow)==nil,"a story the game does not list never matches")
assert(M.allowFromNames({})==nil and M.allowFromNames(nil)==nil,"nothing readable: no prefilter")

-- PENDING TRACES: an emptied scene still confirms from what was seen before.
local first={"vehicle:CarLuxury"}
assert(M.match(first)==nil and M.worthKeeping(first),"a rare trace is worth keeping")
assert(not M.worthKeeping({"room:kitchen","room:bedroom"}),"an ordinary house is not")
local later={"room:kitchen"}   -- the case of money was taken; the car was seen earlier
assert(M.match(M.merge(later,first))==nil)
assert(M.match(M.merge({"item:Base.Briefcase_Money"},first))=="RVSRichJerk","traces from two looks confirm")
local many={}
for i=1,40 do many[#many+1]="room:kitchen" end
assert(#M.merge(many,{"zz:not-relevant"})==1,"merge keeps relevant, distinct tokens")

-- CELLS.
assert(M.keyAt(12481,3915,0)=="cell:1248:391:0" and M.keyAt(-1,-1,0)=="cell:-1:-1:0")
local b=M.cellBounds(1248,391); assert(b.x1==12480 and b.x2==12490 and b.y1==3910 and b.y2==3920)
local flagged={["cell:0:0:0"]={cx=0,cy=0,z=0},["cell:3:0:0"]={cx=3,cy=0,z=0},["cell:9:0:0"]={cx=9,cy=0,z=0},
    ["cell:1:0:1"]={cx=1,cy=0,z=1}}
local near=M.nearCells(flagged,30,5,0,30,8)
assert(table.concat(near,",")=="cell:3:0:0,cell:0:0:0","nearest first, within reach, same floor: "..table.concat(near,","))
assert(#M.nearCells(flagged,30,5,0,30,1)==1,"at most the limit")

print("nohelp_scene_match: ok ("..DIRECTIVE..", "..#M.SIGNATURES.." verified, "..unverified.." unverified)")
