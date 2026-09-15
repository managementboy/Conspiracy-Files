-- Exercise the actual generated journal integration without rendering the UI.
local f=assert(io.open('mod/common/media/lua/client/ConspiracyFiles/Notebook.lua','r'));local src=f:read('*a');f:close()
local a=assert(src:find('function Window:rows()',1,true));local b=assert(src:find('function Window:refresh(',a,true))
local env={Window={},generated=function() return true end,generatedRows=function() return {{id='existing'}} end,
 ConspiracyFiles={IdentityObserver={rows=function() return {{id='identity:1',title='Observed card'}} end}},ipairs=ipairs,
 -- Window:rows already uses type() and pcall() for the discovery-log path; the
 -- sandbox simply never reached those lines, so it passed while being an
 -- unfaithful stand-in. Providing them lets the whole function run.
 type=type,pcall=pcall,tostring=tostring,
 -- Window:rows now folds the discovery place into every row (WP1). The real
 -- module is used rather than a stub: the subtitle rule is the thing under
 -- test everywhere else, and a stub here would let it drift.
 PlaceIndex=(function() package.path='mod/common/media/lua/shared/?.lua;'..package.path
  return require('ConspiracyFiles/PlaceIndex') end)()}
local chunk=assert(loadstring(src:sub(a,b-1)));setfenv(chunk,env);chunk()
local j=env.Window.rows({section='journal'});assert(#j==2 and j[2].id=='identity:1')
assert(j[1].ordinal==1 and j[2].ordinal==2)
local e=env.Window.rows({section='evidence'});assert(#e==1)
env.ConspiracyFiles.KeyJournal={rows=function() return {{id='connection:1',ordinal=1}} end}
local connected=env.Window.rows({section='journal'})
assert(#connected==3 and connected[3].id=='connection:1' and connected[3].ordinal==3)
assert(#env.Window.rows({section='evidence'})==1)
-- With a shared ledger present the journal renders in true discovery order.
package.path='mod/common/media/lua/shared/?.lua;'..package.path
local Ledger=require('ConspiracyFiles/DiscoveryLedger')
local placed
local ledger=Ledger.empty()
for _,step in ipairs({{'evidence','cover',4},{'evidence','shift',5},{'identity','identity:1',5},{'evidence','review',9}}) do
 ledger=assert(Ledger.record(ledger,step[1],step[2],step[3]))
end
env.ConspiracyFiles.DiscoveryLog={order=function(rows) return Ledger.order(ledger,rows) end}
env.generatedRows=function() return {{id='cover'},{id='shift'},{id='review'}} end
env.ConspiracyFiles.KeyJournal=nil
local ordered=env.Window.rows({section='journal'})
local ids={};for i,row in ipairs(ordered) do ids[i]=row.id;assert(row.ordinal==i) end
assert(table.concat(ids,',')=='cover,shift,identity:1,review',table.concat(ids,','))
local evidenceOnly=env.Window.rows({section='evidence'})
assert(#evidenceOnly==3 and evidenceOnly[1].id=='cover' and evidenceOnly[3].id=='review')
print('PASS Notebook actual journal integration: observed cards appended, evidence unchanged, ledger discovery order')

-- WP1. The place the survivor found something is what the subtitle says, and
-- the carrier item's name moves into the detail pane. Three documents from
-- three places must not all read "Handwritten cover letter" any more.
env.ConspiracyFiles.DiscoveryLog={
 order=function(rows) return Ledger.order(ledger,rows) end,
 places=function() return Ledger.places(placed) end}
placed=Ledger.empty()
for _,step in ipairs({{'evidence','cover',4,'109 Walker Road'},{'evidence','shift',5,'42 McCoy Lane'},
 {'evidence','review',9}}) do
 placed=assert(Ledger.record(placed,step[1],step[2],step[3],step[4]))
end
env.generatedRows=function() return {
 {id='cover',cfCarrier='Handwritten cover letter',cfCase='R-482',detailText='body'},
 {id='shift',cfCarrier='Handwritten cover letter',cfCase='R-482',detailText='body'},
 {id='review',cfCarrier='Handwritten cover letter',cfCase='R-482',detailText='body'}} end
env.ConspiracyFiles.IdentityObserver=nil
local decorated=env.Window.rows({section='journal'})
assert(decorated[1].summary:find('109 Walker Road',1,true),decorated[1].summary)
assert(decorated[2].summary:find('42 McCoy Lane',1,true),decorated[2].summary)
-- Nothing regresses: with no place recorded, the carrier name is still the
-- subtitle, exactly as before this change.
assert(decorated[3].summary:find('Handwritten cover letter',1,true),decorated[3].summary)
local seen={}
for _,row in ipairs(decorated) do
 assert(not seen[row.summary],'two rows read identically: '..row.summary)
 seen[row.summary]=true
end
-- The carrier name is demoted, not lost, and a placeless row says so rather
-- than inventing an "Unknown" place.
assert(decorated[1].detailText:find('FOUND',1,true) and decorated[1].detailText:find('handwritten cover letter',1,true))
assert(decorated[3].detailText:find("didn't note where",1,true),decorated[3].detailText)
for _,row in ipairs(decorated) do assert(not row.detailText:find('Unknown',1,true)) end
-- The place view reads the same rows as the journal, never the evidence set.
assert(#env.Window.rows({section='places'})==#decorated)
print('PASS notebook places: the subtitle says where, the carrier is demoted, '
 ..'a placeless row admits it, and the place view shares the journal\'s rows')
