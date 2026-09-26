-- Reviewed source geometry for maps whose marks describe places, not a single
-- building interior. Rectangles are bounded authoring search footprints around
-- the cited marks, not claims of safe/working facilities. No nearest-building
-- substitution, floor placement, new loot or world loading is performed here.
-- Primary: docs/research/vanilla-print-2026-09-19/catalogue.json, record IDs below.
local M={}
local reviewed={
 IrvingtonStashMap1={label="Irvington Speedway, by the lap-time notes",storyFamilies={"repairs"},
  areas={{x1=850,y1=12770,x2=1279,y2=13399}},
  areaSource="IrvingtonSpeedway print footprint; IrvingtonStashMap1 lap-time arrow at 929,13035"},
 IrvingtonStashMap9={label="the refuge marked with hearts near Irvington",storyFamilies={"housing","beds","keys"},
  areas={{x1=3960,y1=13621,x2=4053,y2=13694}},
  targets={{x=4012,y=13637}},
  areaSource="ArrowSouth 4012,13637 and five Heart marks 3976..4037,13676..13678; sixteen-tile margin"},
 WorldStashMap3={label="the marked fuel and repair stop near Doe Valley",storyFamilies={"fuel","repairs"},
  areas={{x1=5450,y1=9694,x2=5482,y2=9726},{x1=5455,y1=9647,x2=5487,y2=9679}},
  targets={{x=5466,y=9710},{x=5471,y=9663}},
  areaSource="Gas Asterisk 5466,9710 and Wrench 5471,9663, each with sixteen-tile margin; Wrench overlaps Lenny's print footprint"},
 WorldStashMap6={label="the large loot site marked near Andy's cross",storyFamilies={"keys","housing"},
  areas={{x1=10067,y1=6641,x2=10301,y2=6708}},
  targets={{x=10104,y=6657},{x=10285,y=6677}},
  areaSource="The two loot-site text positions and named Cross, with sixteen-tile margin; separate fishing mark excluded"},
 WorldStashMap9={label="the rail yard marked near Muldraugh",storyFamilies={"bus","road","keys"},
  areas={{x1=11484,y1=9660,x2=11809,y2=9973}},
  areaSource="Railyard arrow, offices, warehouses, crates and trains text positions; sixteen-tile margin around the described yard"},
 WorldStashMap10={label="the circled fuel, clothes, Spiffo's and car stops at Dixie",storyFamilies={"fuel","food","repairs"},
  areas={{x1=11580,y1=8293,x2=11612,y2=8325},{x1=11588,y1=8238,x2=11620,y2=8270},
         {x1=11655,y1=8288,x2=11687,y2=8320},{x1=11659,y1=8350,x2=11691,y2=8382}},
  targets={{x=11596,y=8309},{x=11604,y=8254},{x=11671,y=8304},{x=11675,y=8366}},
  areaSource="All four labelled Circle marks, each with sixteen-tile margin; source does not designate one building"},
 WorldStashMap11={label="the marked Tower 2 service area",storyFamilies={"power","radio"},
  areas={{x1=10180,y1=8677,x2=10284,y2=8792}},
  areaSource="Tower 2 / Dish 3 service annotations and Sun/X at 10267..10268,8743; sixteen-tile margin"},
 WorldStashMap16={label="the marked camp, checkpoint and barriers",storyFamilies={"road","bus"},
  areas={{x1=12469,y1=4283,x2=12533,y2=4510}},
  areaSource="Camp, checkpoint, barrier labels and two Trap marks along the annotated approach; sixteen-tile margin"},
 WorldStashMap18={label="the area covered by fire, weapon and face marks",storyFamilies={"housing","road"},
  areas={{x1=13486,y1=4003,x2=13762,y2=4173}},
  areaSource="Extent of all 38 conflict symbols (13502..13746,4019..4157), plus sixteen tiles; no textual safety claim"},
 WorldStashMap21={label="the fuel, food and repair marks west of Muldraugh",storyFamilies={"fuel","food","repairs"},
  areas={{x1=3550,y1=10879,x2=3592,y2=10925},{x1=3667,y1=10882,x2=3699,y2=10914}},
  targets={{x=3566,y=10909},{x=3576,y=10895},{x=3683,y=10898}},
  areaSource="Fuel 3566,10909; Apple 3576,10895; Hammer 3683,10898; sixteen-tile margins"},
 WorldStashMap23={label="Thunder Gas and the marked basement",storyFamilies={"fuel","repairs"},
  areas={{x1=8677,y1=14037,x2=8743,y2=14115}},
  targets={{x=8727,y=14099},{x=8727,y=14082}},
  areaSource="Thunder Gas fuel/hammer symbols and basement text position, plus sixteen tiles; includes actual loaded basement levels"},
 -- Two independent vanilla designs really mark this restaurant. The bank gun
 -- mark and native stash of map 16 stay untouched; our recipient file follows
 -- its separate KnifeFork mark. Map 11 explicitly calls the place Spiffo's.
 MulStashMap11={label="Spiffo's marked in Muldraugh",storyFamilies={"food"},
  targets={{x=10612,y=9649}},sharedPeer="MulStashMap16",
  areaSource="MulStashMap11 native restaurant anchor and named Spiffo's annotation"},
 MulStashMap16={label="Spiffo's at the knife-and-fork mark in Muldraugh",storyFamilies={"names"},
  targets={{x=10612,y=9649}},sharedPeer="MulStashMap11",relatedDestination=true,
  areaSource="MulStashMap16 KnifeFork at 10611,9644; same restaurant named by MulStashMap11 at 10612,9649. The bank stash is not moved"},
}
function M.apply(binding)
 local r=reviewed[binding.id]
 if r then for key,value in pairs(r) do binding[key]=value end end
 return binding
end
function M.contains(binding,x,y)
 for _,a in ipairs(binding.areas or {}) do
  if x>=a.x1 and x<=a.x2 and y>=a.y1 and y<=a.y2 then return true end
 end
 return false
end
function M.intersects(binding,x1,y1,x2,y2)
 if binding.areas then
  for _,a in ipairs(binding.areas) do
   if x1<=a.x2 and x2>a.x1 and y1<=a.y2 and y2>a.y1 then return true end
  end
 else
  for _,p in ipairs(binding.targets) do if p.x>=x1 and p.x<x2 and p.y>=y1 and p.y<y2 then return true end end
 end
 return false
end
return M
