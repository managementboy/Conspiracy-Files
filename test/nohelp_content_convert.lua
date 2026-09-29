-- The No Help content converter (tools/nohelp_content/convert.lua; content-
-- writer handoff sections 6, 7 and 9), end to end on a scratch folder.
-- PLACEHOLDERS ONLY: every row is an obvious placeholder, items are real only
-- because the rules demand real vanilla items; scene kinds are read from the
-- shipped Generated/VanillaScenes (never named here) or invented tokens.
package.path="mod-nohelp/common/media/lua/shared/?.lua;tools/nohelp_content/?.lua;"..package.path
local J=require("json")
local Convert=dofile("tools/nohelp_content/convert.lua")
local Manifest=require("NHShared/Mystery/Manifest")
local Scenes=require("NHShared/Generated/VanillaScenes")
local bodyKind,leftAloneKind
for _,r in ipairs(Scenes.rows) do
    if not bodyKind and r.spot=="corpse" then bodyKind=r.id end
    if not leftAloneKind and r.refused=="owner-leave-alone" then leftAloneKind=r.id end
end
assert(bodyKind and leftAloneKind,"the scene table has a body kind and a kind left alone")

-- JSON round trip.
local decoded=assert(J.decode('{"a":[1,2,{"b":"x\\n\\u00e9"}],"c":null,"d":true}'))
assert(decoded.a[3].b=="x\n\195\169" and decoded.c==nil and decoded.d==true,"json decodes")
assert(J.decode(J.encode(decoded)).a[2]==2,"json round-trips")
assert(not J.decode('{"a":1,}'),"malformed json is refused")

-- A scratch content root.
local root=os.tmpname(); os.remove(root)
assert(os.execute('mkdir -p "'..root..'/incoming" "'..root..'/accepted/sidecar" "'..root..'/rejected"')==0)
local out=root.."/Clues.lua"
local function write(ticket,data)
    local f=assert(io.open(root.."/incoming/"..ticket..".json","wb")); f:write(J.encode(data)); f:close()
end
local function read(path)
    local f=io.open(path,"rb"); if not f then return nil end
    local s=f:read("*a"); f:close(); return s
end
local OPTS={root=root,out=out,retired={salt="t",hashes={}},reserved={names={}},axioms=false,
    sceneKinds={Zzscene=true,Zzleftalone=true},sceneDraft={Zzscene={anchor="body"}},leftAlone={Zzleftalone=true}}
local function run() return Convert.run(OPTS) end

local N=0
local function row(ticket,kind,lean,extra)
    N=N+1
    local r={id=ticket:lower().."-"..N,kind=kind,
        pieces=kind=="set" and {"Twine","Tarp"} or {"letter"},
        where={{place="farm",spot="furniture",lean=lean,rival=lean=="containment" and "agricultural" or "containment"}},
        title="Placeholder title "..N,body="Placeholder body token "..N..".",
        rival_reading="placeholder rival reading",gloss="placeholder gloss",
        axioms={containment={"ax-a1"},agricultural={"ax-b1"}},
        prov={writer="placeholder-model",handoff="2026-09-27",batch=ticket}}
    for k,v in pairs(extra or {}) do if v==J.null then r[k]=nil else r[k]=v end end
    return r
end
local function rejectedCodes(ticket)
    local data=J.decode(read(root.."/rejected/"..ticket..".json") or "[]")
    local byId={}
    for _,r in ipairs(data) do byId[(r.row or {}).id or "?"]={code=r.reasons[1].code,merged=r.merged} end
    return byId,#data
end

-- TICKET 1: two good sets, and one row per row-level reason.
local T1="PLACE-zzfarm"
local good1=row(T1,"set","containment")
local good2=row(T1,"set","agricultural",{pieces={"Rope","Wire"}})
local bad={
    BAD_ITEM=row(T1,"set","containment",{pieces={"ZzNoSuchItem","Tarp"}}),
    NOTE_IN_SET=row(T1,"set","containment",{pieces={"Note","Tarp"}}),
    SET_SIZE=row(T1,"set","containment",{pieces={"Tarp"}}),
    BAD_CARRIER=row(T1,"written","containment",{pieces={"Tarp"}}),
    SAME_LEAN=row(T1,"set","containment",{where={{place="farm",spot="furniture",lean="containment",rival="containment"}}}),
    TOO_LONG=row(T1,"set","containment",{body=string.rep("a",241)}),
    TOO_LONG_CARD=row(T1,"written","containment",{pieces={"idcard"},body=string.rep("a",281)}),
    NO_RIVAL=row(T1,"set","containment",{rival_reading=J.null}),
    NO_PROV=row(T1,"set","containment",{prov=J.null}),
    AXIOM_UNKNOWN=row(T1,"set","containment",{axioms={containment={"ax-a1"}}}),
    SCHEMA=row(T1,"set","containment",{colour="red"}),
    SCHEMA_PREFIX=row(T1,"set","containment",{id="zz-wrong-prefix"}),
    ANCHOR_UNKNOWN=row(T1,"set","containment",{anchor={map="ZzNoSuchDesign",mark=1}}),
    ANCHOR_SPOT_MISMATCH=row(T1,"set","containment",{anchor={scene=bodyKind}}),
    ANCHOR_LEFT_ALONE=row(T1,"set","containment",{anchor={scene=leftAloneKind},where={{place="farm",spot="corpse",lean="containment",rival="agricultural"}}}),
    ANCHOR_NOT_A_SCENE=row(T1,"set","containment",{anchor={scene="Zznotascene"}}),
    DENSITY=row(T1,"set","containment",{body="Placeholder q1 q2 q3."}),
    EMPHASIS=row(T1,"set","containment",{body="Placeholder token!"}),
}
local expectCode={TOO_LONG_CARD="TOO_LONG",SCHEMA_PREFIX="SCHEMA",ANCHOR_LEFT_ALONE="ANCHOR_UNKNOWN",ANCHOR_NOT_A_SCENE="ANCHOR_UNKNOWN"}
local rows={good1,good2}
local names={}
for name in pairs(bad) do names[#names+1]=name end
table.sort(names)
for _,name in ipairs(names) do rows[#rows+1]=bad[name] end
rows[#rows+1]=row(T1,"set","agricultural",{id=good1.id,pieces={"Rope","Twine"}})   -- same id twice
write(T1,rows)
local report=run()
local text=table.concat(report,"\n")
assert(not text:find("Placeholder",1,true),"the report never prints clue text")
assert(not io.open(root.."/incoming/"..T1..".json"),"the incoming file is consumed")
local codes,n=rejectedCodes(T1)
assert(n==#names+1,"every bad row is returned ("..n..")")
for _,name in ipairs(names) do
    local want=expectCode[name] or name
    assert(codes[bad[name].id] and codes[bad[name].id].code==want,
        name..": returned as "..want..", got "..tostring(codes[bad[name].id] and codes[bad[name].id].code))
end
local accepted=J.decode(read(root.."/accepted/"..T1..".json"))
assert(#accepted==2 and accepted[1].id==good1.id and accepted[2].id==good2.id,"the good rows are accepted, in order")
assert(accepted[1].prov==nil and accepted[1].gloss==nil and accepted[1].rival_reading==nil,"accepted rows keep game fields only")
local sidecar=J.decode(read(root.."/accepted/sidecar/"..T1..".json"))
assert(sidecar[good1.id].prov.batch==T1 and sidecar[good1.id].rival_reading and sidecar[good1.id].gloss
    and sidecar[good1.id].axioms and sidecar[good2.id],"the sidecar keeps the authoring fields")
local derived=assert(read(out))
assert(derived:find("^%-%- DERIVED FILE"),"the derived file says so")
local list=assert(loadstring(derived))()
assert(#list.clues==2 and list.clues[1].id==good1.id and list.clues[1].prov==nil,"the derived clue list holds the accepted game fields")
assert(Manifest.lint(list.clues),"and passes the clue-list rules")

-- TICKET 2: a person, accepted whole, merged with ticket 1.
local T2="PERSON-zzp1"
local t2a=row(T2,"written","containment",{pieces={"idcard"},person="zzp1",where={{place="farm",spot="corpse",lean="containment",rival="agricultural"}}})
local t2b=row(T2,"written","agricultural",{person="zzp1",where={{place="farm",spot="corpse",lean="agricultural",rival="containment"}}})
write(T2,{t2a,t2b})
run()
assert(#J.decode(read(root.."/accepted/"..T2..".json"))==2,"a whole person ticket is accepted")

-- TICKET 3: rows that pass alone but break the merged list (a card with no
-- mention): returned whole, marked merged.
local T3="PERSON-zzp2"
write(T3,{row(T3,"written","containment",{pieces={"idcard"},person="zzp2",where={{place="farm",spot="corpse",lean="containment",rival="agricultural"}}})})
run()
codes=rejectedCodes(T3)
local only=codes[T3:lower().."-"..N]
assert(only and only.code=="PERSON_ORPHAN" and only.merged,"a card never mentioned breaks the merged list")
assert(not read(root.."/accepted/"..T3..".json"),"nothing of it is accepted")

-- TICKET 4: written clues that tip the merged list under half object sets.
local T4="PLACE-zzoffice"
write(T4,{row(T4,"written","containment"),row(T4,"written","agricultural"),row(T4,"written","containment")})
run()
codes=rejectedCodes(T4)
for _,r in pairs(codes) do assert(r.code=="SET_RATIO" and r.merged,"SET_RATIO on the merged list") end
-- A person ticket with one bad row is returned whole.
local T5="PERSON-zzp3"
write(T5,{
    row(T5,"written","containment",{pieces={"idcard"},person="zzp3",where={{place="farm",spot="corpse",lean="containment",rival="agricultural"}}}),
    row(T5,"written","agricultural",{person="zzp3",prov=J.null}),
})
run()
local c5,n5=rejectedCodes(T5)
assert(n5==2 and c5[T5:lower().."-"..(N-1)].code=="PERSON_SPLIT" and c5[T5:lower().."-"..N].code=="NO_PROV","a person ticket is returned whole")
-- A duplicate id across tickets.
local T6="PLACE-zzdup"
local dup=row(T6,"set","containment"); dup.id=good1.id
write(T6,{dup})
run()
codes=rejectedCodes(T6)
assert(codes[good1.id] and codes[good1.id].code=="SCHEMA","an id is prefixed with its own ticket")
-- A map ticket's rows name their anchor; a classifier stop comes back whole.
local T7="MAP-zzmap"
write(T7,{row(T7,"set","containment")})
run()
assert(select(2,rejectedCodes(T7))==1 and rejectedCodes(T7)[T7:lower().."-"..N].code=="ANCHOR_UNKNOWN","a map row without an anchor")
local T8="PLACE-zzstop"
write(T8,{status="CLASSIFIER_STOP",rows={row(T8,"set","containment")}})
run()
assert(rejectedCodes(T8)[T8:lower().."-"..N].code=="CLASSIFIER_STOP","CLASSIFIER_STOP returns the ticket")
write("PLACE-zzbroken",{})
local f=io.open(root.."/incoming/PLACE-zzbroken.json","wb"); f:write("{not json"); f:close()
run()
assert(select(2,rejectedCodes("PLACE-zzbroken"))==1,"an unreadable ticket is returned")

-- Delivering ticket 1 again with one set replaced replaces its rows.
local again=row(T1,"set","containment",{pieces={"Rope","Tarp"}})
write(T1,{again,good2})
run()
list=assert(loadstring(read(out)))()
local ids={}
for _,c in ipairs(list.clues) do ids[#ids+1]=c.id end
assert(table.concat(ids,",")==table.concat({t2a.id,t2b.id,again.id,good2.id},","),
    "the redelivered ticket replaced its rows: "..table.concat(ids,","))
os.execute('rm -rf "'..root..'"')

-- THE SHIPPED DERIVED FILE is current with content/nohelp/accepted, and the
-- game's clue list is it (empty while nothing is accepted).
local shipped=read(Convert.OUT)
assert(shipped==Convert.renderClues(Convert.loadAccepted(Convert.ROOT)),
    "Content/Clues.lua is current (lua5.1 tools/nohelp_content/convert.lua --rebuild)")
local loaded=require("NHShared/Mystery/Content/Clues")
assert(type(Manifest.clues)=="table" and #Manifest.clues==#loaded.clues,"Manifest.clues is the derived file")
assert(Manifest.lint(Manifest.clues),"the shipped clue list passes the clue-list rules")

-- The writer-only draft path, used only while no scene table ships.
local ctx={scenesShipped=false,sceneKinds={Zzscene=true,Zzleftalone=true},sceneDraft={Zzscene={anchor="body"}},leftAlone={Zzleftalone=true}}
local function draft(anchor,spot)
    local r=Convert.sceneCheck({anchor=anchor,where={{place="farm",spot=spot or "furniture",lean="containment",rival="agricultural"}}},ctx)
    return r and r.code or "ok"
end
assert(draft({scene="Zzscene"})=="ANCHOR_SPOT_MISMATCH","draft: not on the scene's anchor")
assert(draft({scene="Zzscene"},"corpse")=="ok","draft: on its anchor")
assert(draft({scene="Zzleftalone"},"corpse")=="ANCHOR_UNKNOWN","draft: a scene left alone")
assert(draft({scene="Zznotascene"})=="ANCHOR_UNKNOWN","draft: not a scene kind")
ctx.scenesShipped=true
assert(draft({scene="Zzscene"})=="ok","with the table shipped the draft is not consulted")


-- RECIPES AND REPEATS (owner, 2026-09-29): a ticket's recipe names its form
-- and whether a key ring may appear; no clue repeats another's text; an empty
-- ticket fails the check.
do
    local rctx={recipes={T9001={form="written",keyRing=false},T9002={form="set",keyRing=false},T9003={form="set",keyRing=true}}}
    local set={id="t9002-01",kind="set",pieces={"KeyRing","Twine"},title="t",body="b"}
    assert(Convert.recipeCheck({id="t9001-01",kind="set",pieces={"Twine"}},"T9001",rctx).code=="RECIPE_FORM","the recipe's form")
    assert(Convert.recipeCheck(set,"T9002",rctx).code=="RECIPE_KEY","no key ring unless the recipe allows one")
    assert(Convert.recipeCheck({id="t9003-01",kind="set",pieces={"KeyRing","Twine"}},"T9003",rctx)==nil,"a key ring where allowed")
    assert(Convert.recipeCheck(set,"T9999",rctx)==nil,"no recipe, no recipe check")
    assert(Convert.textKey({title="A  Title",body="Same, body!"})==Convert.textKey({title="a title",body="same body"}),"case, spaces and punctuation ignored")
    local lctx={registry={},recipes={T9005={leanShare={containment=0.75}}}}
    local function lrow(n,lean) return {id="t9005-0"..n,kind="set",pieces={"Twine","Tarp"},title="Lean title "..n,body="Lean body "..n..".",
        where={{place="farm",spot="furniture",lean=lean,rival=lean=="containment" and "agricultural" or "containment"}},
        rival_reading="r",gloss="g",axioms={containment={"ax-a1"},agricultural={"ax-b1"}},prov={writer="w",handoff="h",batch="T9005"}} end
    local lo=Convert.convertTicket("T9005",{lrow(1,"containment"),lrow(2,"agricultural")},{},lctx)
    assert(#lo.accepted==0 and lo.rejected[1].reasons[1].code=="RECIPE_LEAN","a ticket under its lean share comes back whole")
    local out=Convert.convertTicket("T9004",{},{},{registry={}},"CLASSIFIER_STOP")
    assert(#out.rejected==1 and out.rejected[1].reasons[1].code=="EMPTY","an empty ticket is returned, not dropped silently")
end

-- RECALLS (owner, 2026-09-29): a recalled clue is replaced on its own; the
-- ticket's other rows stay; the old clue goes to retired/ with its recall.
do
    assert(os.execute('mkdir -p "'..root..'/incoming" "'..root..'/accepted/sidecar" "'..root..'/rejected"')==0)
    local TR="PLACE-zzrecall"
    local keep=row(TR,"set","containment",{pieces={"Twine","Tarp"}})
    local old=row(TR,"set","agricultural",{pieces={"KeyRing","Tarp"}})
    write(TR,{keep,old}); run()
    OPTS.recalls={R9={why="test",ban={"KeyRing"},rare=1,clues={[old.id]={side="B"}}}}
    local function try(new,with)
        write(TR,with or {new}); local rep=table.concat(run(),"\n")
        local c=rejectedCodes(TR); os.remove(root.."/rejected/"..TR..".json")
        return c[new.id] and c[new.id].code or "ok",rep
    end
    local function repl(extra) local r=row(TR,"set","agricultural",extra); r.id=old.id; return r end
    assert(try(repl({pieces={"KeyRing","Bucket"}}))=="RECALL_BAN","a banned piece")
    assert(try(repl({kind="written",pieces={"letter"}}))=="RECALL_FORM","the same form")
    assert(try(repl({pieces={"Twine","Tarp"}}))=="RECALL_RARE","at least one rare piece")
    local other=row(TR,"set","agricultural",{pieces={"Rope","Axe"}})
    local code,rep=try(other,{other,repl({pieces={"Tarp","Axe"}})})
    assert(code=="RECALL_ID","only recalled clues in a recall delivery")
    assert(rep:find(TR..": replaced 1, returned 1",1,true),"the good replacement goes in")
    local acc=J.decode(read(root.."/accepted/"..TR..".json"))
    assert(#acc==2 and acc[1].id==keep.id and acc[2].id==old.id and acc[2].pieces[2]=="Axe","swapped in place, the rest kept")
    local side=J.decode(read(root.."/accepted/sidecar/"..TR..".json"))
    assert(side[keep.id] and side[old.id],"both sidecars kept")
    local drawer=J.decode(read(root.."/retired/"..TR..".json"))
    assert(#drawer==1 and drawer[1].recall=="R9" and drawer[1].row.pieces[1]=="KeyRing","the old clue is in the drawer")
    assert(rep:find("recall R9: 1/1 replaced"),"progress")
    OPTS.recalls={}; os.execute('rm -rf "'..root..'"')
end

print("nohelp_content_convert: ok")
