-- The pure scene matcher (task 3 plan, step 5; directive NH-D7): two traces
-- of different sorts per kind, one of them exclusive to the story (ordinary
-- clutter never confirms), only jar-verified signatures, the game's own
-- story lists as a prefilter, and traces kept across looks.
-- WRITER/ENGINEER TEST: scene kinds and traces are named here, as in the data.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local DIRECTIVE="NH-D7"
local M=require("OIShared/Generated/SceneMatch")
local Scenes=require("OIShared/Generated/VanillaScenes")
assert(M.DIRECTIVE==DIRECTIVE,"the matcher names its directive")

-- Every signature: an allowed kind, a story name, two or more traces of at
-- least two sorts, a must trace that is more than an ordinary house, and an
-- exclusive (`only`) trace.
local families={}
for _,s in ipairs(M.SIGNATURES) do
    assert(Scenes.allowed(s.kind),s.kind.." is not an allowed kind")
    assert(M.status(s.kind)=="verified" and M.signature(s.kind)==s,s.kind)
    assert(type(s.story)=="string" and s.story~="","a story name")
    local sorts,n,rareMust,only={},0,false,false
    for _,t in ipairs(s.traces) do
        assert(M.SORTS[t.sort],s.kind.." unknown sort "..tostring(t.sort))
        if not sorts[t.sort] then sorts[t.sort]=true; n=n+1 end
        if t.must and not t.common then rareMust=true end
        if t.only then only=true; assert(not t.common,s.kind.." an exclusive trace is not common") end
    end
    assert(n>=2,s.kind.." needs traces of two sorts")
    assert(rareMust,s.kind.." needs a must trace that anchors it")
    assert(only,s.kind.." needs an exclusive trace")
    -- ORDINARY CLUTTER NEVER CONFIRMS: every non-exclusive trace together.
    local clutter={}
    for _,t in ipairs(s.traces) do
        if not t.only then for _,name in ipairs(t.any) do clutter[#clutter+1]=t.sort..":"..name end end
    end
    assert(M.match(clutter)==nil,s.kind.." confirmed from ordinary clutter alone")
    families[Scenes.get(s.kind).family]=true
end
for _,f in ipairs({"RB","RDS","RVS"}) do assert(families[f],"no verified kind in family "..f) end
-- Demoted kinds (no exclusive trace in 42.20) are unverified: never match.
for _,d in ipairs(M.DEMOTED) do
    assert(Scenes.allowed(d.kind) and not M.signature(d.kind) and M.status(d.kind)=="unverified",d.kind)
    assert(type(d.why)=="string" and d.why~="",d.kind.." says why")
end
-- The defect this guards: an ordinary parked car plus a stray case of money.
assert(M.match({"vehicle:CarLuxury","item:Base.Briefcase_Money"})==nil,"a parked luxury car and a stray case are not a scene")
assert(M.match({"vehicle:CarLightsPolice","zombie:Police","room:kitchen"})==nil,"a police car near a house is not a scene")
assert(M.match({"vehicle:VanAmbulance","zombie:AmbulanceDriver","zombie:HospitalPatient"})==nil,"an ambulance at a hospital")
assert(M.match({"sprite:location_community_cemetary_01_32","item:Base.Shovel","item:Base.EmptyPetrolCan"})==nil,"graves and a shovel")
assert(M.match({"vehicle:StepVan_Plonkies","item:Base.Plonkies"})==nil,"a parked Plonkies van with its own snacks")
assert(M.match({"room:jackiejayestudio","item:Base.Pen","item:Base.Microphone"})==nil,"the studio's office clutter")
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
local kind,found,anchor=M.match({"room:jackiejayestudio","zombie:Jackie_Jaye"})
assert(kind=="RBJackieJaye" and #found==2 and anchor=="room:jackiejayestudio","room and her zombie")
assert(M.match({"item:Base.Pen","zombie:Jackie_Jaye"})==nil,"the must trace is missing")
assert(M.match({"vehicle:StepVan_Plonkies"})==nil,"a van alone")
assert(M.match({"zombie:PlonkiesGuy"})==nil,"the driver alone")
kind,found,anchor=M.match({"vehicle:StepVan_Plonkies","zombie:PlonkiesGuy"})
assert(kind=="RVSPlonkies" and anchor=="vehicle:StepVan_Plonkies","anchored on the van")
assert(M.match({"vehicle:StepVan_Plonkies","body:PlonkiesGuy","item:Base.Plonkies"})=="RVSPlonkies","his body will do")
kind,_,anchor=M.match({"item:Base.RatKing","room:bedroom"})
assert(kind=="RDSRatKing" and anchor=="item:Base.RatKing","anchored on the rat king, not the bedroom")
assert(M.match({"item:Base.RatKing"})==nil,"one trace is not a scene")

-- THE PREFILTER: only stories the running game lists.
local allow=M.allowFromNames({"Plonkies","Rich Jerk","Zz Unrelated Story"})
assert(allow.RVSPlonkies and not allow.RBJackieJaye and not allow.RVSRichJerk,"story names map to verified kinds")
assert(M.match({"vehicle:StepVan_Plonkies","zombie:PlonkiesGuy"},allow)=="RVSPlonkies")
assert(M.match({"room:jackiejayestudio","zombie:Jackie_Jaye"},allow)==nil,"a story the game does not list never matches")
assert(M.allowFromNames({})==nil and M.allowFromNames(nil)==nil,"nothing readable: no prefilter")

-- PENDING TRACES: an emptied scene still confirms from what was seen before.
local first={"vehicle:StepVan_Plonkies"}
assert(M.match(first)==nil and M.worthKeeping(first),"a rare trace is worth keeping")
assert(not M.worthKeeping({"room:kitchen","room:bedroom"}),"an ordinary house is not")
local later={"item:Base.Plonkies"}   -- the driver wandered off; the van was seen earlier
assert(M.match(M.merge(later,first))==nil,"van and snacks are still ordinary")
assert(M.match(M.merge({"body:PlonkiesGuy"},first))=="RVSPlonkies","traces from two looks confirm")
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

print("nohelp_scene_match: ok ("..DIRECTIVE..", "..#M.SIGNATURES.." verified, "..#M.DEMOTED.." demoted, "..unverified.." unverified)")
