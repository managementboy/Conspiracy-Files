-- A clue's anchor (content-writer handoff, section 6; task 3 plan): which
-- vanilla map mark, annotation, flyer or scene it was written for. Checked
-- against Generated/MapSites, carried onto the world record, and used by
-- placement. PLACEHOLDERS ONLY: map designs are read from MapSites at run
-- time and scene kinds from Generated/VanillaScenes, never named here.
package.path="mod-nohelp/common/media/lua/shared/?.lua;test/fixtures/?.lua;"..package.path
local Manifest=require("NHShared/Mystery/Manifest")
local AreaCase=require("NHShared/Generated/AreaCase")
local Sites=require("NHShared/Generated/MapSites")
local Inventory=require("nohelp_inventory")
local Scenes=require("NHShared/Generated/VanillaScenes")
-- A scene kind whose clue lies on open ground, one whose clue is in a body,
-- and a kind the table refuses: read from the shipped table.
local groundKind,bodyKind,refusedKind
for _,r in ipairs(Scenes.rows) do
    if not groundKind and r.spot=="ground" then groundKind=r.id end
    if not bodyKind and r.spot=="corpse" then bodyKind=r.id end
    if not refusedKind and r.refused then refusedKind=r.id end
end
assert(groundKind and bodyKind and refusedKind,"the scene table has ground, body and refused kinds")

-- Real anchors, found in MapSites: a design's own mark, an annotation note
-- of an area place, a flyer.
local markSite,noteSite,noteMark,printSite,printMark
for _,e in ipairs(Sites.sites) do
    for _,m in ipairs(e.marks) do
        if not markSite and m.design and m.mark then markSite=e end
        if not noteSite and m.design and m.note then noteSite,noteMark=e,m end
        if not printSite and m.print then printSite,printMark=e,m end
    end
end
assert(markSite and noteSite and printSite,"MapSites has marks, annotations and flyers")
local mark=markSite.marks[1]
local function clue(anchor,where)
    return {id="anchor-01",kind="set",pieces={"Twine","Tarp"},anchor=anchor,
        where=where or {{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}}}
end
local function code(c) local ok,_,k=Manifest.validClue(c); return ok and "ok" or k end

-- The shapes the handoff names.
assert(code(clue({map=mark.design,mark=mark.mark}))=="ok","a design's own mark")
assert(code(clue({map=noteMark.design,note=noteMark.note}))=="ok","one of an area's annotations")
assert(code(clue({print=printMark.print}))=="ok","a flyer")
assert(code(clue({scene=groundKind}))=="ok","a scene kind")
assert(code(clue({scene=groundKind,version="A"}))=="ok","a scene version A, leaning containment")
assert(Manifest.anchorStatus(clue({scene=groundKind}))=="verified",
    "a scene anchor is verified against the shipped Generated/VanillaScenes")
assert(code(clue({scene="Zzplaceholderscene"}))=="ANCHOR_UNKNOWN","a kind the table does not have")
assert(code(clue({scene=refusedKind},{{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}}))=="ANCHOR_UNKNOWN",
    "a kind the table refuses holds no clue")
assert(code(clue({scene=bodyKind}))=="ANCHOR_SPOT_MISMATCH","a scene clue goes on its scene's anchor")
assert(Manifest.anchorStatus(clue({print=printMark.print}))=="verified","a map anchor is verified")
assert(Manifest.anchorStatus(clue(nil))==nil,"no anchor, no status")

-- Refused: ANCHOR_UNKNOWN for what names nothing real or is badly shaped.
assert(code(clue({map="ZzNoSuchDesign",mark=1}))=="ANCHOR_UNKNOWN","an unknown design")
assert(code(clue({map=mark.design,mark=999}))=="ANCHOR_UNKNOWN","a mark the design lacks")
assert(code(clue({map=mark.design}))=="ANCHOR_UNKNOWN","a map anchor names one mark or note")
assert(code(clue({map=mark.design,mark=1,note=1}))=="ANCHOR_UNKNOWN","not both")
assert(code(clue({map=mark.design,mark=1.5}))=="ANCHOR_UNKNOWN","a whole number")
assert(code(clue({print="ZzNoSuchFlyer"}))=="ANCHOR_UNKNOWN","an unknown flyer")
assert(code(clue({print=printMark.print,mark=1}))=="ANCHOR_UNKNOWN","a flyer anchor names the flyer only")
assert(code(clue({scene="Zz scene"}))=="ANCHOR_UNKNOWN","a scene kind is one word")
assert(code(clue({scene=groundKind,version="C"}))=="ANCHOR_UNKNOWN","a version is A or B")
assert(code(clue({map=mark.design,mark=mark.mark,scene="Zz"}))=="ANCHOR_UNKNOWN","one form only")
assert(code(clue({colour="red"}))=="ANCHOR_UNKNOWN","unknown fields")
assert(code(clue("somewhere"))=="ANCHOR_UNKNOWN","an anchor is a table")
-- ANCHOR_SPOT_MISMATCH: an anchor its places contradict.
assert(code(clue({map=mark.design,mark=mark.mark},{{place="police",spot="ground",lean="containment",rival="agricultural"}}))
    =="ANCHOR_SPOT_MISMATCH","a map-anchored clue goes to the kind of place its mark is")
assert(code(clue({scene=groundKind,version="B"}))=="ANCHOR_SPOT_MISMATCH",
    "a version B clue leans agricultural wherever it goes")

-- PLACEMENT. anchorPool: no anchored clue anywhere leaves the list untouched
-- (the picker's output stays byte-identical: test/nohelp_pick.lua).
local plainList=Inventory.clues
assert(AreaCase.anchorPool(plainList,{"x"})==plainList,"no anchors: the very same list")
assert(AreaCase.anchorPool(plainList,nil)==plainList,"no anchors, no keys: the very same list")

local markKey=Manifest.markKey(mark)
local function set(id,lean,anchor)
    return {id=id,kind="set",pieces={"Twine","Tarp"},anchor=anchor,
        where={{place="mapNamed",spot="ground",lean=lean,rival=lean=="containment" and "agricultural" or "containment"}}}
end
local list={
    set("p1","containment"),set("p2","agricultural"),
    set("a1","containment",{map=mark.design,mark=mark.mark}),set("a2","agricultural",{map=mark.design,mark=mark.mark}),
    set("f1","containment",{print=printMark.print}),
    set("s1","containment",{scene=groundKind}),
}
local function ids(l) local out={}; for _,c in ipairs(l) do out[#out+1]=c.id end; return table.concat(out,",") end
assert(ids(AreaCase.anchorPool(list,{markKey}))=="a1,a2","a place its anchored clues name takes only those")
assert(ids(AreaCase.anchorPool(list,{markKey,"print:"..printMark.print}))=="a1,a2,f1","every anchor naming it")
assert(ids(AreaCase.anchorPool(list,{"map:ZzOther:mark:1"}))=="p1,p2","a marked place nothing is anchored to: unanchored clues")
assert(ids(AreaCase.anchorPool(list,nil))=="p1,p2","a place no map marks: unanchored clues only")
for _,c in ipairs(AreaCase.anchorPool(list,{"scene:"..groundKind})) do
    assert(c.id~="s1","a scene-anchored clue never goes to a place, only to its scene")
end

-- decide(): only anchored clues at their place, the anchor carried onto the
-- document, and the record valid.
local site={id="t3:anchor-test",bounds={x1=0,y1=0,x2=10,y2=10,z=0}}
local case=AreaCase.new(4242)
local next=assert(AreaCase.decide{case=case,site=site,place="mapNamed",clues=list,version="v",
    designs={mark.design},anchors={markKey}})
assert(#next.documents>=1,"the place is decided")
for _,d in ipairs(next.documents) do
    assert(d.clue=="a1" or d.clue=="a2","only clues anchored to its mark")
    assert(d.anchor and d.anchor.map==mark.design and d.anchor.mark==mark.mark,"the anchor is carried onto the document")
end
assert(AreaCase.validate(next),"a record with anchored documents is valid")
local bad=AreaCase.new(4242); bad=assert(AreaCase.decide{case=bad,site=site,place="mapNamed",clues=list,version="v",
    designs={mark.design},anchors={markKey}})
bad.documents[1].anchor={colour="red"}
assert(not AreaCase.validate(bad),"an unknown anchor field is refused")
bad.documents[1].anchor={map=mark.design,mark=0}
assert(not AreaCase.validate(bad),"a mark is a whole number from 1")
local other=assert(AreaCase.decide{case=AreaCase.new(4242),site=site,place="mapNamed",clues=list,version="v"})
for _,d in ipairs(other.documents) do
    assert(d.anchor==nil and (d.clue=="p1" or d.clue=="p2"),"a place with no anchors gets unanchored clues, no anchor field")
end

-- The runtime hands every map place its marks' keys.
local f=io.open("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua","rb")
local runtime=f:read("*a"); f:close()
assert(runtime:find("anchors=anchorsOf(entry)",1,true),"a map place is decided with its anchors")
f=io.open("mod-nohelp/common/media/lua/shared/NHShared/Generated/Session.lua","rb")
local session=f:read("*a"); f:close()
assert(session:find("anchors=args.anchors",1,true),"Session passes them through")

print("nohelp_anchor: ok")
