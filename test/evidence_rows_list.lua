-- What a screen reads: EvidenceRows.list (P4-R128). The old evidence window
-- did the second half of this for itself - other findings, discovery order,
-- where each was found, place headings - so the organiser never received it.
-- Asserted on the real module with the real ledger and place index.
package.path='mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;'..package.path
package.preload['ConspiracyFiles/Generated/PlaceNames']=function() return {render=function(text) return text end} end
local Ledger=require('ConspiracyFiles/DiscoveryLedger')
local PlaceIndex=require('ConspiracyFiles/PlaceIndex')
ConspiracyFiles={}
local Rows=require('ConspiracyFiles/EvidenceRows')

local known={}
ConspiracyFiles.GeneratedRuntime={metrics=function() return {} end,known=function() return known end}
known={{id='existing',title='Dispatch',body='body'}}
ConspiracyFiles.IdentityObserver={rows=function() return {{id='identity:1',title='Observed card',detailText='card'}} end}

-- Identity rows belong to NAMES and PLACES, never to FILES or the evidence set.
assert(#Rows.list('evidence')==1)
assert(#Rows.list('files')==1)
local places=Rows.list('places')
assert(places[1].cfHeading and places[1].title==PlaceIndex.EMPTY,'a flat place list says why')
assert(#places==3 and places[3].id=='identity:1')

-- Key findings reach FILES (they had no home but the old window's journal).
ConspiracyFiles.KeyJournal={rows=function() return {{id='connection:1',title='Possible connection: Voss',detailText='A key.'}} end}
ConspiracyFiles.KeyObserver={rows=function() return {{id='key:1',title='A key on a body',detailText='One key.'}} end}
local files=Rows.list('files')
assert(#files==3 and files[2].id=='connection:1' and files[3].id=='key:1' and files[3].ordinal==3)
assert(#Rows.list('evidence')==1,'the evidence set stays evidence')
print('PASS evidence rows list: key findings in FILES, identity only where it belongs, flat places say why')

-- With a shared ledger present every list is in true discovery order.
local ledger=Ledger.empty()
for _,step in ipairs({{'evidence','cover',4,'109 Walker Road'},{'evidence','shift',5,'42 McCoy Lane'},
 {'identity','identity:1',5},{'evidence','review',9}}) do
 ledger=assert(Ledger.record(ledger,step[1],step[2],step[3],step[4]))
end
ConspiracyFiles.DiscoveryLog={order=function(rows) return Ledger.order(ledger,rows) end,
 places=function() return Ledger.places(ledger) end}
ConspiracyFiles.KeyJournal=nil; ConspiracyFiles.KeyObserver=nil
known={{id='review',title='Review',kind='letter',body='body'},{id='cover',title='Cover',kind='letter',body='body'},
 {id='shift',title='Shift',kind='letter',body='body'}}
local ordered=Rows.list('places')
local ids={}
for _,row in ipairs(ordered) do if not row.cfHeading then ids[#ids+1]=row.id; assert(row.ordinal==#ids) end end
assert(table.concat(ids,',')=='cover,shift,identity:1,review',table.concat(ids,','))

-- WP1. The place is the subtitle; the carrier moves into FOUND; a placeless row admits it.
local evidence=Rows.list('evidence')
assert(evidence[1].id=='cover' and evidence[1].summary:find('109 Walker Road',1,true),evidence[1].summary)
assert(evidence[2].summary:find('42 McCoy Lane',1,true),evidence[2].summary)
assert(evidence[1].detailText:find('\n\nFOUND\n109 Walker Road',1,true),evidence[1].detailText)
assert(evidence[3].detailText:find("didn't note where",1,true),evidence[3].detailText)
for _,row in ipairs(evidence) do assert(not row.detailText:find('Unknown',1,true)) end
print('PASS evidence rows list: discovery order across sources, the place as subtitle, FOUND for every row')

-- P4-R81. A heading is laid over a place the survivor came back to; the rows keep their order.
ConspiracyFiles.PlaceVisitLog={counts=function() return {['109 Walker Road']=3} end}
local headed=Rows.list('places')
assert(headed[1].cfHeading and headed[1].title:find('109 Walker Road',1,true),tostring(headed[1].title))
assert(headed[2].id=='cover' and #headed==5)
for _,row in ipairs(headed) do assert(row.title~=PlaceIndex.EMPTY,'no empty line once a heading is earned') end
print('PASS evidence rows list: a place earns a heading by a return, and the order is kept')

-- Where evidence is: knowledge, never fate.
local states={a={'accounted','Carried.'},b={'uncertain','In a desk.'},c={'lastseen'},d={'unchecked'},e={'conflict'},f={}}
ConspiracyFiles.GeneratedRuntime.whereabouts=function(id) local s=states[id]; return s[1],s[2] end
assert(Rows.where('a')=='Carried.')
assert(Rows.where('b')=='Not seen recently. Its whereabouts are uncertain. Last seen: In a desk.',Rows.where('b'))
assert(Rows.where('c')==nil,'last seen with no place says nothing')
assert(Rows.where('d')=='Not checked since you loaded this save.')
assert(Rows.where('e'):find('uncertain',1,true))
assert(Rows.where('f')==nil)
print('PASS evidence rows list: whereabouts words for every state, none claiming loss')
