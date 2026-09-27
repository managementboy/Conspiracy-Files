-- The shipped vanilla scene table (task 3 plan, step 5; directive NH-D7,
-- "vanilla mysteries detected and used"): every one of the 140 vanilla scene
-- kinds once, refused exactly where the owner decided, each allowed kind with
-- a valid anchor and a fit pair within the cap, and the first hand-checked
-- citation matching the shipped container index.
-- WRITER/ENGINEER TEST: scene kinds are named here, as in the data files; the
-- owner plays blind and reads neither.
package.path="mod-nohelp/common/media/lua/shared/?.lua;tools/nohelp_content/?.lua;"..package.path
local DIRECTIVE="NH-D7"
local Scenes=require("NHShared/Generated/VanillaScenes")
local Manifest=require("NHShared/Mystery/Manifest")
local Carriers=require("NHShared/Carriers")
local J=require("json")
assert(Scenes.DIRECTIVE==DIRECTIVE,"the table names its directive")

local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path); local s=f:read("*a"); f:close(); return s
end

-- ALL 140, EACH ONCE. The list is the jar's (writer-only input, 42.20).
local listed={}
local n=0
for k in read("docs/writer-only/nohelp-adhd-inputs/vanilla-scene-kinds.txt"):gmatch("%w+") do listed[k]=true; n=n+1 end
assert(n==140,"the jar lists 140 scene kinds")
assert(#Scenes.rows==140,"the table has 140 rows, has "..#Scenes.rows)
local seen={}
for _,r in ipairs(Scenes.rows) do
    assert(listed[r.id],r.id.." is not a vanilla scene kind")
    assert(not seen[r.id],r.id.." twice")
    seen[r.id]=true
    assert(Scenes.get(r.id)==r and Scenes.kinds[r.id]==r,"lookup by kind")
    local prefix=r.id:match("^(R%u%u?%u?)")
    assert(r.family==(r.id:find("^RZS") and "RZS" or r.id:find("^RZ") and "RZ" or r.id:find("^RDS") and "RDS"
        or r.id:find("^RVS") and "RVS" or "RB"),r.id.." family "..tostring(r.family).." ("..tostring(prefix)..")")
end

-- REFUSALS EXACTLY AS DECIDED (owner, 2026-09-27): nothing to hold a clue
-- (animals with no vehicle, a named zombie alone, the never-built base class,
-- generic house dressing), and the two scenes the spoilers file leaves alone.
local leftAlone={}
local on=false
for line in read("docs/writer-only/NOHELP_SPOILERS.md"):gmatch("[^\n]+") do
    if line:find("Left alone entirely",1,true) then on=true
    elseif line:find("^%s*%- ") or line:find("^#") then on=false end
    if on then for k in line:gmatch("`(%u%w+)`") do leftAlone[k]=true end end
end
local expected={
    ["owner-leave-alone"]=leftAlone,
    ["animals-only"]={RVSAnimalOnRoad=true,RVSHerdOnRoad=true,RVSRoadKillSmall=true,RZSAttachedAnimal=true,
        RZSEscapedAnimal=true,RZSEscapedHerd=true,RZSHogWild=true},
    ["named-zombie-only"]={RZJackieJaye=true,RZSDuke=true,RZSFrankHemingway=true,RZSKirstyKormick=true},
    ["never-built"]={RBTableStoryBase=true},
    dressing={RBBasic=true},
}
local nLeft=0; for _ in pairs(leftAlone) do nLeft=nLeft+1 end
assert(nLeft==2,"the spoilers file leaves exactly two scenes alone")
local refused=0
for _,r in ipairs(Scenes.rows) do
    if r.refused then
        refused=refused+1
        assert(Scenes.REFUSALS[r.refused],r.id.." refused for an unknown reason")
        assert(expected[r.refused][r.id],r.id.." is refused ("..r.refused..") but the owner did not refuse it")
        assert(r.anchor=="none" and r.spot==nil and r.c==nil and r.a==nil,r.id.." refused rows hold no clue")
        assert(not Scenes.allowed(r.id) and Scenes.spotFor(r.id)==nil and Scenes.lean(1,"x",r.id)==nil,r.id)
    else
        for why,set in pairs(expected) do assert(not set[r.id],r.id.." should be refused ("..why..")") end
    end
end
local nExpected=0
for _,set in pairs(expected) do for _ in pairs(set) do nExpected=nExpected+1 end end
assert(refused==nExpected,"refused "..refused..", decided "..nExpected)
assert(#Scenes.allowedKinds()==140-refused,"the allowed list")

-- ALLOWED WHERE THE DRAFT HAD REFUSED FOR TONE: the owner allowed party,
-- meal, comedy, suicide/self-harm and killer scenes "just as much as any
-- other"; each keeps the draft's anchor if it had one, else its family's
-- default (building and dead-survivor: the room's container; zone: the
-- ground; vehicle family: the vehicle the story builds).
local draft=assert(J.decode(read("docs/writer-only/nohelp-adhd-inputs/vanilla-scene-table-draft.json")))
local default={RB="room-container",RDS="room-container",RZS="ground",RVS="vehicle"}
local reopened=0
for _,d in ipairs(draft.rows) do
    local r=Scenes.get(d.id)
    if d.status~="allowed" and not r.refused then
        reopened=reopened+1
        local want=d.anchor~="none" and d.anchor or default[r.family]
        assert(r.anchor==want,d.id.." anchor "..r.anchor..", expected "..want)
    elseif d.status=="allowed" then
        assert(not r.refused and r.anchor==d.anchor,d.id.." keeps the draft's anchor")
    end
end
assert(reopened>=30,"the owner's decisions reopened the tone refusals ("..reopened..")")

-- ANCHORS AND FITS. Every allowed kind: a known anchor, the spot it becomes,
-- fits neither zero nor more than twice the other.
local anchors={}; for _,a in ipairs(Scenes.ANCHORS) do anchors[a]=true end
for _,r in ipairs(Scenes.rows) do
    if not r.refused then
        assert(anchors[r.anchor],r.id.." anchor "..tostring(r.anchor))
        assert(r.spot==Scenes.SPOT_OF[r.anchor] and Scenes.spotFor(r.id)==r.spot,r.id.." spot")
        assert(r.spot==Manifest.SCENE_SPOTS[r.anchor],r.id..": the table and the clue rules agree on the spot")
        local okSpot=false; for _,s in ipairs(Manifest.SPOTS) do if s==r.spot then okSpot=true end end
        assert(okSpot,r.id.." spot is an engine spot")
        assert(type(r.c)=="number" and type(r.a)=="number" and r.c>=1 and r.a>=1 and r.c%1==0 and r.a%1==0,r.id.." fit")
        assert(r.c<=2*r.a and r.a<=2*r.c,r.id.." fit more than twice the other")
        -- A clue anchored to it passes the clue rules on its spot, not elsewhere.
        local other=r.spot=="ground" and "furniture" or "ground"
        local function clue(spot,version)
            return {id="scene-t",kind="set",pieces={"Twine","Tarp"},anchor={scene=r.id,version=version},
                where={{place="farm",spot=spot,lean="containment",rival="agricultural"}}}
        end
        assert(Manifest.validClue(clue(r.spot)),r.id..": a clue on its anchor is valid")
        assert(Manifest.validClue(clue(r.spot,"A")),r.id..": version A leans containment")
        local _,_,code=Manifest.validClue(clue(other)); assert(code=="ANCHOR_SPOT_MISMATCH",r.id..": wrong spot refused")
        _,_,code=Manifest.validClue(clue(r.spot,"B")); assert(code=="ANCHOR_SPOT_MISMATCH",r.id..": B leans agricultural")
        -- The lean is the world's, and over many seeds follows c:a.
        local c=0
        for seed=1,400 do
            local lean=Scenes.lean(seed,"scene:cell:1:2:0",r.id)
            assert(lean==Scenes.lean(seed,"scene:cell:1:2:0",r.id),"the same world, the same lean")
            if lean=="containment" then c=c+1 end
        end
        local want=400*r.c/(r.c+r.a)
        assert(c>0 and c<400 and math.abs(c-want)<=60,r.id.." lean share "..c.." of 400, expected about "..want)
    else
        local _,_,code=Manifest.validClue({id="scene-t",kind="set",pieces={"Twine","Tarp"},anchor={scene=r.id},
            where={{place="farm",spot="ground",lean="containment",rival="agricultural"}}})
        assert(code=="ANCHOR_UNKNOWN",r.id..": a refused kind takes no clue")
    end
end

-- NEVER ON A VANILLA NAMED CHARACTER: bodies in their outfits are refused.
for outfit in pairs(Scenes.NAMED_OUTFITS) do
    assert(Carriers.refusal({kind="corpse",container={},outfit=outfit})=="a vanilla named character",outfit)
end
assert(Carriers.refusal({kind="corpse",container={},outfit="Police"})==nil,"an ordinary uniform is not a named character")

-- THE FIRST HAND-CHECKED CITATION: a unique scene, room-container, fit 2:2,
-- its containers exactly the shipped index's rows for that building and room.
assert(#Scenes.CITATIONS==1,"exactly one citation so far")
local cite=Scenes.CITATIONS[1]
local row=Scenes.get(cite.kind)
assert(row and not row.refused and row.anchor=="room-container" and row.c==row.a,"the citation's kind")
assert(cite.key=="cite:"..cite.kind and Scenes.citation(cite.kind)==cite,"keyed by its kind")
local F=require("NHShared/Generated/FixedContainerIndex")
local D=require("NHShared/Generated/FixedContainerIndexData")
local index=assert(F.open(D,"Muldraugh, KY","42.20"))
local fromIndex={}
for _,c in ipairs(index.candidates(cite.buildingId)) do
    if c.room==cite.room then fromIndex[#fromIndex+1]=c.x..","..c.y..","..c.z..","..c.containerType..","..c.sprite end
end
local fromCite={}
local b=cite.bounds
for _,c in ipairs(cite.containers) do
    fromCite[#fromCite+1]=c.x..","..c.y..","..c.z..","..c.containerType..","..c.sprite
    assert(c.x>=b.x1 and c.x<b.x2 and c.y>=b.y1 and c.y<b.y2 and c.z==b.z,"every container inside the citation's bounds")
end
table.sort(fromIndex); table.sort(fromCite)
assert(#fromIndex>=2 and table.concat(fromIndex,";")==table.concat(fromCite,";"),
    "the citation's containers are the index's for its room")
assert(type(cite.avoidProps)=="table" and #cite.avoidProps>=1,"vanilla's own items are named, to be avoided")
assert(cite.named and Scenes.NAMED_OUTFITS[cite.named.outfit],"its named character is never a carrier")
local book=read("mod-nohelp/common/media/lua/shared/NHShared/Generated/AddressBook.lua")
local x1,y1,x2,y2=book:match('"'..cite.buildingId..'|(%d+)|(%d+)|(%d+)|(%d+)|')
assert(x1 and b.x1>=tonumber(x1) and b.x2<=tonumber(x2)+1 and b.y1>=tonumber(y1) and b.y2<=tonumber(y2)+1,
    "the citation lies inside its building's address-book footprint")

-- The content targets count the table's allowed kinds.
local T=dofile("content/nohelp/targets.lua")
assert(T.scenesShipped and #T.scenes==#Scenes.allowedKinds(),"progress counts every allowed scene kind")

print("nohelp_scenes: ok ("..DIRECTIVE..", "..#Scenes.allowedKinds().." of 140 kinds hold a clue)")
