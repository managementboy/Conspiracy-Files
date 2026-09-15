package.path="dev/next-phase/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local B=require("ObjectBookmarks")
local input={intentId="player-mark-1",title="Bent brass key",itemIdentity="key:brass:17",sourceContext={mapId="SYNTHETIC-MAP",x=10,y=20,z=0,sourceLabel="Found in a desk"},markedHours=12,note="Try the basement"}
local list=assert(B.mark({},input)); assert(#list==1 and list[1].id:match("^bookmark:") and list[1].note==input.note)
input.title="mutated"; input.sourceContext.x=99; assert(list[1].title=="Bent brass key" and list[1].sourceContext.x==10,"input must be copied")
local same={intentId="player-mark-1",title="Bent brass key",itemIdentity="key:brass:17",sourceContext={mapId="SYNTHETIC-MAP",x=10,y=20,z=0,sourceLabel="Found in a desk"},markedHours=12,note="ignored"}
local again=assert(B.mark(list,same)); assert(again[1].note=="Try the basement","repeated intent preserves note")
same.itemIdentity="other"; assert(not B.mark(list,same),"intent conflicts reject")
local edited=assert(B.editNote(list,"player-mark-1","Later")); assert(edited[1].note=="Later" and edited[1].itemIdentity=="key:brass:17")
local unknown=assert(B.mark({}, {intentId="no-source",title="Loose switch",itemIdentity="switch:42",sourceContext=nil,markedHours=2,note=""})); local shown=B.display(unknown[1]); assert(shown.context=="Location not recorded" and shown.itemIdentity==nil,"unknown source is not guessed and identity stays internal")
for _,bad in ipairs({{intentId="x",title="x",itemIdentity="x",sourceContext={mapId="m",x=0/0,y=1,z=0},markedHours=1,note=""},{intentId="x",title="x",itemIdentity="x",sourceContext={mapId="m",x=1,y=1,z=0,extra=true},markedHours=1,note=""},{intentId="x",title="x",itemIdentity="x",sourceContext={mapId="m",x=1,y=1,z=0},markedHours=1,extra=true,note=""}}) do assert(not B.mark({},bad),"strict invalid input rejects") end
assert(not B.mark({}, {intentId="fraction",title="x",itemIdentity="x",sourceContext={mapId="m",x=1.5,y=1,z=0},markedHours=1,note=""}),"fractional source tiles reject")
local cyclic={intentId="x",title="x",itemIdentity="x",sourceContext={mapId="m",x=1,y=1,z=0},markedHours=1,note=""}; cyclic.loop=cyclic; assert(not B.mark({},cyclic),"cyclic input rejects")
local full={}; for i=1,64 do full=assert(B.mark(full,{intentId="i"..i,title="t",itemIdentity="o"..i,sourceContext={mapId="m",x=i,y=0,z=0},markedHours=i,note=""})) end; assert(not B.mark(full,{intentId="overflow",title="t",itemIdentity="o",sourceContext={mapId="m",x=0,y=0,z=0},markedHours=1,note=""}))
print("PASS ObjectBookmarks: bounded immutable marks and editable notes")
