-- Exercise the actual generated journal integration without rendering the UI.
local f=assert(io.open('mod/common/media/lua/client/ConspiracyFiles/Notebook.lua','r'));local src=f:read('*a');f:close()
local a=assert(src:find('function Window:rows()',1,true));local b=assert(src:find('function Window:refresh(',a,true))
local env={Window={},generated=function() return true end,generatedRows=function() return {{id='existing'}} end,
 ConspiracyFiles={IdentityObserver={rows=function() return {{id='identity:1',title='Observed card'}} end}},ipairs=ipairs,
 -- Window:rows already uses type() and pcall() for the discovery-log path; the
 -- sandbox simply never reached those lines, so it passed while being an
 -- unfaithful stand-in. Providing them lets the whole function run.
 type=type,pcall=pcall}
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

