-- No Help, body IDs, keys and clothing (task 3 plan section 8, items 3-6;
-- owner decisions DR-20260927-NOHELP-RULE-PLACEMENT):
--   3. a body already holding a vanilla ID, or a player's body, never carries
--      our card;
--   4. before recognition our card reads like a vanilla card with its name;
--   5. a key whose building is a decided area gets a plain phrase, nothing
--      else does, and the vanilla key record is not changed;
--   6. clothing is a soft hint: a matching body is preferred among those in
--      reach, never waited for and never required; the committed outfit is
--      saved on the carrier target.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
local Carriers=require("OIShared/Carriers")
local Identity=require("OIShared/IdentityObservations")
local Outfits=require("OIShared/BodyOutfitObservations")
local Kinds=require("OIShared/Generated/EvidenceKinds")
local Manifest=require("OIShared/Mystery/Manifest")
local AreaCase=require("OIShared/Generated/AreaCase")
local Pick=require("OIShared/Generated/Pick")
local S=require("OIShared/Generated/Session")
local Inventory=require("oi_inventory")

-- ---------------------------------------------------------------------------
-- 3. Refusals, pure.
local base={kind="corpse",container={}}
local function with(t) local o={}; for k,v in pairs(base) do o[k]=v end; for k,v in pairs(t) do o[k]=v end; return o end
assert(Carriers.refusal(with{})==nil,"an ordinary body may carry a clue")
assert(Carriers.refusal(with{identity=true})=="already holds an ID","a body with a vanilla ID is refused")
assert(Carriers.refusal(with{player=true})=="a player's body","a player's body is refused")
assert(Carriers.refusal(with{outfit="Police"})==nil,"clothing never refuses a body")

-- The identity list is the observer's own, not a copy.
assert(Identity.TYPES["Base.IDcard"] and Identity.TYPES["Base.Passport"] and Identity.TYPES["Base.BusinessCard"])
assert(Identity.isNamedIdentity("Base.IDcard","ID Card: Paris Stover"))
assert(not Identity.isNamedIdentity("Base.IDcard","ID Card"),"a card with no name names nobody")
assert(not Identity.isNamedIdentity("Base.Hammer","Hammer: Bob"))
local observerSource=assert(io.open("mod-ofinterest/common/media/lua/client/OIShared/IdentityObserver.lua")):read("*a")
assert(observerSource:find("local types=Model.TYPES",1,true),"the observer reads the shared list")
assert(not observerSource:find("['Base.IDcard']=true",1,true),"the list is not duplicated in the observer")

-- The engine readers, against stub bodies.
local function list(items) return {size=function() return #items end,get=function(_,i) return items[i+1] end} end
local function item(fullType,name,md,inner)
    return {getFullType=function() return fullType end,getDisplayName=function() return name end,
        getModData=function() return md or {} end,getInventory=inner and function() return inner end or nil,
        isContainer=inner~=nil}
end
local function container(items,explored)
    local c={items=items,explored=explored}
    c.getItems=function() return list(c.items) end
    c.isExplored=function() return c.explored end
    c.setExplored=function(_,v) c.explored=v end
    c.isHasBeenLooted=function() return false end
    return c
end
instanceof=function(o,cls) return cls=="InventoryContainer" and type(o)=="table" and o.isContainer==true end
local function body(c,md,opts)
    opts=opts or {}
    return {getContainer=function() return c end,getModData=function() return md end,
        isAnimal=function() return false end,isPlayer=function() return opts.player==true end,
        getOutfitName=function() return opts.outfit end}
end
local open={}
local plain=Carriers.stateOf(body(container({item("Base.Tarp","Tarp")},true),{}),"corpse",open,1,2,0)
assert(Carriers.usable(plain),"a body with no ID is usable")
local loose=Carriers.stateOf(body(container({item("Base.IDcard_Male","ID Card: Ray Dunn")},true),{}),"corpse",open,1,2,0)
assert(loose.identity and Carriers.refusal(loose)=="already holds an ID","a loose vanilla ID refuses the body")
local wallet=container({item("Base.IDcard_Female","ID Card: Ada Vale")},true)
local inWallet=Carriers.stateOf(body(container({item("Base.Wallet_Female","Wallet",nil,wallet)},true),{}),"corpse",open,1,2,0)
assert(inWallet.identity,"an ID in a wallet on the body refuses it")
local ours=Carriers.stateOf(body(container({item("Base.IDcard","ID Card: Someone",{oiGeneratedId="nh:x"})},true),{}),"corpse",open,1,2,0)
assert(not ours.identity,"a card of ours is not a vanilla ID")
local blank=Carriers.stateOf(body(container({item("Base.IDcard","ID Card")},true),{}),"corpse",open,1,2,0)
assert(not blank.identity,"an unnamed card names nobody")
local live=Carriers.stateOf(body(container({},true),{},{player=true}),"corpse",open,1,2,0)
assert(live.player,"isPlayer() refuses the body")
local marked=Carriers.stateOf(body(container({},true),{[Carriers.PLAYER_MARK]=true}),"corpse",open,1,2,0)
assert(marked.player and Carriers.refusal(marked)=="a player's body",
    "the player's mark, copied into the body by the engine at death, refuses it after a reload")
local playerMd={}
assert(Carriers.stampPlayer({getModData=function() return playerMd end}))
assert(playerMd[Carriers.PLAYER_MARK]==true,"the living player is stamped")

-- An unexplored body's vanilla loot is rolled the way the loot window rolls
-- it before the last check, so an ID rolled then refuses the body.
getPlayer=function() return nil end
local fresh=container({},false)
ItemPicker={fillContainer=function(c) c.items[#c.items+1]=item("Base.IDcard_Male","ID Card: Rolled Now") end}
local bodyMd={}
local b=body(fresh,bodyMd)
local st=Carriers.stateOf(b,"corpse",open,1,2,0)
assert(Carriers.usable(st),"before its loot is rolled the body looks empty")
local claimed,why=Carriers.claim(st,"cfc:1")
assert(not claimed and why=="already holds an ID","an ID rolled at claim refuses the body")
assert(fresh.explored==true and bodyMd[Carriers.MARK]==nil,"rolled once, marked explored, not claimed")
local rolls=0
ItemPicker={fillContainer=function() rolls=rolls+1 end}
local fresh2=container({},false)
local b2md={}
assert(Carriers.claim(Carriers.stateOf(body(fresh2,b2md),"corpse",open,1,2,0),"cfc:2"),"a body without an ID is claimed")
assert(rolls==1 and b2md[Carriers.MARK]=="cfc:2")
assert(Carriers.claim(Carriers.stateOf(body(container({},true),{}),"corpse",open,1,2,0),"cfc:3"))
assert(rolls==1,"an explored body's loot is never rolled again")

-- ---------------------------------------------------------------------------
-- 4. A card reads like a vanilla card with its name.
assert(Kinds.plainCardName("idcard","Marla Voss","ID Card")=="ID Card: Marla Voss")
assert(Kinds.plainCardName("businesscard","Marla Voss","Business Card")=="Business Card: Marla Voss")
assert(Kinds.plainCardName("idcard","Marla Voss",nil)=="ID Card: Marla Voss","the kind's short name stands in")
assert(Kinds.plainCardName("idcard","ID Card: Marla Voss","ID Card")=="ID Card: Marla Voss","never doubled")
assert(Kinds.plainCardName("idcard","Identification card","ID Card")==nil,"a placeholder keeps the game's name")
assert(Kinds.plainCardName("letter","Marla Voss","Letter")==nil,"only cards")
local named,cat
local stub={getDisplayName=function() return named or "ID Card" end,setName=function(_,n) named=n end,
    setDisplayCategory=function(_,c) cat=c end,setCustomName=function() error("vanilla does not set a custom name") end}
assert(Kinds.nameAsVanillaCard(stub,{kind="idcard",title="Marla Voss"}))
assert(named=="ID Card: Marla Voss" and cat==nil,"only the name: no Evidence category, no stamp")
assert(Identity.isNamedIdentity("Base.IDcard",named),"it reads as a named vanilla card")
assert(not Kinds.nameAsVanillaCard(stub,{kind="idcard",title="x",members={{kind="idcard",quantity=1}}}),"never a set")
local runtime=assert(io.open("mod-ofinterest/common/media/lua/client/OIShared/GeneratedRuntime.lua")):read("*a")
assert(select(2,runtime:gsub("Kinds.nameAsVanillaCard%(",""))==2,"named at placement and when an unrecognised card is rebuilt")

-- ---------------------------------------------------------------------------
-- 5. Keys lead to decided areas, and nothing else.
local world=AreaCase.new(777)
local site={id="t3:4521",bounds={x1=0,y1=0,x2=10,y2=10,z=0},containerTypes={"shelves"}}
world=assert(AreaCase.decide{case=world,site=site,place="police",clues=Inventory.clues,version="v1",hours=1})
assert(AreaCase.keyPhrase(world,"4521")=="a police building","a key of a decided area gets a plain phrase")
assert(AreaCase.keyPhrase(world,"9999")==nil,"an undecided building says nothing")
assert(AreaCase.keyPhrase(world,"t3:4521")==nil,"the key's id is the bare building id")
assert(AreaCase.keyPhrase(nil,"4521")==nil)

-- Through the real observer: a home (never an area) says nothing, and the
-- vanilla key record is read, never written.
local store={canonical={schema=1,keys={
    k1={id="k1",keyId=11,token="t1",carrier="corpse",building="4521",label="12 Main St",x=1,y=2,z=0,observedAt=3},
    k2={id="k2",keyId=12,token="t2",carrier="corpse",building="home7",label="3 Elm St",x=1,y=2,z=0,observedAt=4}}}}
local before
local function snapshot(t) local o={}; for k,v in pairs(t) do o[k]=type(v)=="table" and snapshot(v) or v end; return o end
local function same(a,b)
    if type(a)~=type(b) then return false end
    if type(a)~="table" then return a==b end
    for k,v in pairs(a) do if not same(v,b[k]) then return false end end
    for k in pairs(b) do if a[k]==nil then return false end end
    return true
end
before=snapshot(store)
ModData={get=function(tag) return tag=="OIShared.KeyObservations" and store or nil end,
    getOrCreate=function() error("the key record is not written by a lookup") end}
OIShared={GeneratedRuntime={worldCase=function() return world end}}
local KeyObserver=require("OIShared/KeyObserver")
assert(KeyObserver.caseFor("4521")=="a police building")
assert(KeyObserver.caseFor("home7")==nil,"a home says nothing")
local rows=KeyObserver.rows()
local text={}
for _,r in ipairs(rows) do text[r.id]=r.detailText end
assert(text["keys:t1"]:find("cut for 12 Main St, a police building.",1,true),"the row names the kind of place")
assert(not text["keys:t2"]:find("police",1,true),"a home's key row is unchanged")
assert(same(before,store),"the vanilla key record is unchanged")
OIShared.GeneratedRuntime=nil
assert(KeyObserver.caseFor("4521")==nil,"no world record, nothing to say")

-- ---------------------------------------------------------------------------
-- 6. Clothing as a soft hint.
assert(Outfits.classOf("Police")=="uniform" and Outfits.classOf("Farmer")=="farm")
assert(Outfits.classOf("Doctor")=="medical" and Outfits.classOf("HazardSuit")=="hazard")
assert(Outfits.classOf("Generic03")==nil and Outfits.classOf("Generic_Skirt")==nil,"Generic has no class")
assert(Outfits.classOf("NotAnOutfit")==nil and Outfits.classOf(nil)==nil)
for id,class in pairs(Outfits.OUTFIT_CLASS) do assert(Outfits.isClass(class),id) end

-- Every listed id is a real vanilla outfit, when the game is installed here.
local xml=io.open((os.getenv("HOME") or "").."/.steam/steam/steamapps/common/ProjectZomboid/projectzomboid/media/clothing/clothing.xml")
if xml then
    local names={}
    for n in xml:read("*a"):gmatch("<m_Name>([^<]*)</m_Name>") do names[n]=true end
    xml:close()
    for id in pairs(Outfits.OUTFIT_CLASS) do assert(names[id],"not a vanilla outfit id: "..id) end
end

-- The clue list: only a body spot takes a hint, and only a known class.
local function clue(where)
    return {id="c",kind="written",pieces={"idcard"},body="Marla Voss",where={where}}
end
assert(Manifest.validClue(clue{place="police",spot="corpse",lean="containment",rival="agricultural",outfit="uniform"}))
assert(not Manifest.validClue(clue{place="police",spot="furniture",lean="containment",rival="agricultural",outfit="uniform"}))
assert(not Manifest.validClue(clue{place="police",spot="corpse",lean="containment",rival="agricultural",outfit="clown"}))

-- The hint rides from the clue list onto the world record.
local hinted={}
for _,c in ipairs(Inventory.clues) do
    local copy={}; for k,v in pairs(c) do copy[k]=v end
    copy.where={}
    for i,w in ipairs(c.where) do
        local ww={}; for k,v in pairs(w) do ww[k]=v end
        if ww.spot=="corpse" then ww.outfit="medical" end
        copy.where[i]=ww
    end
    hinted[#hinted+1]=copy
end
assert(Manifest.lint(hinted))
local w2=AreaCase.new(4242)
local found
for i,place in ipairs(Manifest.PLACES) do
    local s2={id="t3:h"..i,bounds={x1=0,y1=0,x2=10,y2=10,z=0},containerTypes={"shelves"}}
    local n=AreaCase.decide{case=w2,site=s2,place=place,clues=hinted,version="v1",hours=1}
    if n then w2=n end
end
for _,d in ipairs(w2.documents) do
    if d.spot=="corpse" then found=true; assert(d.outfit=="medical","a body clue carries its hint") end
    if d.spot~="corpse" then assert(d.outfit==nil,"only a body clue has a hint") end
end
assert(found,"the fixture places a body clue somewhere")
assert(AreaCase.validate(w2))
local bad=AreaCase.new(1)
bad=assert(AreaCase.decide{case=bad,site=site,place="police",clues=Inventory.clues,version="v1",hours=1})
bad.documents[1].outfit="clown"
assert(not AreaCase.validate(bad),"an unknown hint does not validate")
-- Placeholder picks without a hint are exactly as before.
local p1=Pick.choose{clues=Inventory.clues,area={id="t3:x",place="farm"},ledger={},seed=5,version="v1"}
for _,p in ipairs(p1) do assert(p.outfit==nil) end

-- The scan prefers a matching body among those in reach, never refuses one.
local squares={}
local function put(x,y,bodyObj) squares[x..","..y]={bodyObj} end
getCell=function()
    return {getGridSquare=function(_,x,y,z)
        local bs=squares[x..","..y]
        if not bs then return nil end
        return {getDeadBodys=function() return list(bs) end}
    end}
end
getPlayerLoot=nil
local function scanWith(hint)
    local chosen,finished
    local step=Carriers.scan(0,0,0,2,function(s) chosen=s; finished=true end,nil,hint)
    for _=1,100 do if step() then break end end
    return chosen
end
local civilian=body(container({},true),{},{outfit="Generic02"})
local nurse=body(container({},true),{},{outfit="Nurse"})
put(-2,-2,civilian); put(1,1,nurse)
assert(scanWith(nil).object==civilian,"without a hint the first usable body is taken, as before")
assert(scanWith("medical").object==nurse,"a matching body in reach is preferred")
local chosen=scanWith("hazard")
assert(chosen and chosen.object==civilian,"no match: the first usable body, never a wait")
squares={}
assert(scanWith("medical")==nil,"no body: nothing")
-- A finished scan offers its fallback once only.
put(0,0,civilian)
local calls={}
local step=Carriers.scan(0,0,0,1,function(s) calls[#calls+1]=s or false end,nil,"hazard")
for _=1,30 do if step() then break end end
assert(#calls==1 and calls[1].object==civilian)
assert(step() and calls[2]==false,"a finished scan does not offer the refused body again")

-- The committed outfit is saved on the carrier target, deliberately.
local t={x=5,y=5,z=0,objectIndex=0,containerIndex=0,containerType=S.CARRIER_CONTAINER,sprite="corpse",
    carrierKind="corpse",carrierMark="cfc:9"}
assert(S.target(t,site),"a carrier target without an outfit is valid")
t.outfit="Nurse"; assert(S.target(t,site),"with the body's outfit id")
t.outfit="bad id!"; assert(not S.target(t,site),"an outfit that is not an id is refused")
t.outfit=nil; t.extra=1; assert(not S.target(t,site),"the field list stays closed")
assert(Carriers.outfitId(" Nurse ")=="Nurse" and Carriers.outfitId("a b")==nil and Carriers.outfitId(nil)==nil)
assert(runtime:find("carrierMark=mark,outfit=carrier.outfit}",1,true),"the filler saves the committed outfit")
assert(runtime:find("carrierScanFor(site,function(entry) carrier=entry end,doc and doc.outfit)",1,true),
    "the filler passes the clue's hint")

print("nohelp_body_ids: ok")
