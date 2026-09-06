-- Exercise the actual generated journal integration without rendering the UI.
local f=assert(io.open('mod/common/media/lua/client/ConspiracyFiles/Notebook.lua','r'));local src=f:read('*a');f:close()
local a=assert(src:find('function Window:rows()',1,true));local b=assert(src:find('function Window:refresh(',a,true))
local env={Window={},generated=function() return true end,generatedRows=function() return {{id='existing'}} end,
 ConspiracyFiles={IdentityObserver={rows=function() return {{id='identity:1',title='Observed card'}} end}},ipairs=ipairs}
local chunk=assert(loadstring(src:sub(a,b-1)));setfenv(chunk,env);chunk()
local j=env.Window.rows({section='journal'});assert(#j==2 and j[2].id=='identity:1')
assert(j[1].ordinal==1 and j[2].ordinal==2)
local e=env.Window.rows({section='evidence'});assert(#e==1)
env.ConspiracyFiles.KeyJournal={rows=function() return {{id='connection:1',ordinal=1}} end}
local connected=env.Window.rows({section='journal'})
assert(#connected==3 and connected[3].id=='connection:1' and connected[3].ordinal==3)
assert(#env.Window.rows({section='evidence'})==1)
print('PASS Notebook actual journal integration: observed cards appended, evidence unchanged')
