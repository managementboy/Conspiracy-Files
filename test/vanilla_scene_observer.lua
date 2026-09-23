package.path="mod/common/media/lua/shared/?.lua;"..package.path
local O=require("ConspiracyFiles/Generated/VanillaSceneObserver")
local s=O.new()
local scene={key="10:20:0",vehicles={{script="Base.VanAmbulance",x=101,y=202,z=0,cargo={"Base.Cooler","Base.Gloves_Surgical"}}}}
local status;s,status=assert(O.observe(s,scene));assert(status=="candidate" and #O.confirmed(s)==0)
s,status=assert(O.observe(s,scene));assert(status=="confirmed" and #O.confirmed(s)==1)
local changed={key=scene.key,vehicles={{script="Base.VanAmbulance",x=101,y=202,z=0,cargo={"Base.Cooler"}}}}
s,status=assert(O.observe(s,changed));assert(status=="candidate" and #O.confirmed(s)==1,
 "a changed observation starts over and cannot rewrite the accepted scene")
local ordinary={key="11:20:0",vehicles={{script="Base.CarNormal",x=111,y=202,z=0,cargo={}}}}
local unchanged,why=assert(O.observe(s,ordinary));assert(why=="not a meaningful scene" and #O.confirmed(unchanged)==1)
local pair={key="12:20:0",vehicles={{script="Base.CarNormal",x=120,y=202,z=0,cargo={}},{script="Base.CarNormal",x=121,y=202,z=0,cargo={}}}}
s=assert(O.observe(s,pair));s,status=assert(O.observe(s,pair));assert(status=="confirmed" and #O.confirmed(s)==2)
print("PASS vanilla scene observer: only meaningful scenes survive two identical post-load observations")
