-- A finished case's evidence says so (P4-R118). Owner, 2026-09-15: two clues of a
-- completed case had no Investigation option at all, which read as "these
-- cannot be logged". Now the loot list shows them as Evidence / Old and the
-- right-click menu says they are already in the organiser. An item from no
-- case gets neither, and a live case's clue keeps Inspect.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

local function read(path)
    local f=assert(io.open(path,'r'),'cannot open '..path)
    local s=f:read('*a'); f:close(); return s
end

-- The menu, driven with a runtime that knows one live and one retired clue.
local live,retired={['doc-live']=true},{['doc-old']=true}
package.preload['ConspiracyFiles/GeneratedRuntime']=function() return {
    metrics=function() return true end,
    subject=function(it) return live[it:getModData().cfGeneratedId]==true end,
    retiredPaper=function(it) return retired[it:getModData().cfGeneratedId]==true end,
    inspect=function() end,
} end
package.preload['ConspiracyFiles/ContextMenu']=function() return {normalize=function(items) return items,false end} end
package.preload['ConspiracyFiles/Notebook']=function() return {} end
getDebug=function() return true end; isClient=function() return false end; isServer=function() return false end
Events={OnFillInventoryObjectContextMenu={Add=function() end}}
getSpecificPlayer=function() return {getInventory=function() return 'inventory' end} end
ConspiracyFiles={}
local Menu=require('ConspiracyFiles/GeneratedMenu')

local function paper(id) local md={cfGeneratedId=id}; return {getModData=function() return md end,getOutermostContainer=function() return 'drawer' end} end
local function menu()
    local c={options={}}
    c.addOption=function(_,name,_,fn) local o={name=name,fn=fn}; c.options[#c.options+1]=o; return o end
    return c
end

local c=menu(); Menu.fill(0,c,{paper('doc-old')})
assert(#c.options==1,'retired case evidence must get exactly one option, got '..#c.options)
assert(c.options[1].name=='Already in the organiser','wrong wording: '..tostring(c.options[1].name))
assert(c.options[1].notAvailable==true,'the already-recorded option must be greyed out')

c=menu(); Menu.fill(0,c,{paper('doc-stranger')})
assert(#c.options==0,'an item from no case must get no option, got '..#c.options)
c=menu(); Menu.fill(0,c,{paper(nil)})
assert(#c.options==0,'an ordinary item must get no option')

c=menu(); Menu.fill(0,c,{paper('doc-live')})
assert(c.options[1] and c.options[1].name=='Inspect Investigation Evidence','a live clue must keep Inspect')

-- The category wiring in the runtime.
local runtime=read('mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua')
assert(runtime:find('local function categoryOf(id) return retiredId(id) and "EvidenceOld" or "Evidence" end',1,true),
    'the category must be chosen from the retired rows')
local restamp=runtime:match('local function restampEvidence%(container,depth%)(.-)\nend')
assert(restamp and restamp:find('setDisplayCategory(categoryOf(md.cfGeneratedId))',1,true),
    'reloading must not stamp every item as Evidence unconditionally')
assert(not (restamp or ''):find('setDisplayCategory("Evidence")',1,true),'reload still hard-codes Evidence')
local scan=runtime:match('local function lastSeenJob%(%)(.-)\nend\n')
assert(scan and scan:find('setDisplayCategory("EvidenceOld")',1,true),
    'the last-seen scan must mark retired evidence Old, covering reloads and older saves')
local done=runtime:match('Case complete; placement details retired%."%)(.-)\n%s*local v=')
assert(done and done:find('setDisplayCategory(categoryOf(md.cfGeneratedId))',1,true),
    'the item in hand must be marked Old when its case retires')
assert(runtime:find('function R.retiredPaper(item)',1,true),'R.retiredPaper must exist')

-- The category is a translation key, or the player sees IGUI_ItemCat_EvidenceOld.
local translations=read('mod/common/media/lua/shared/Translate/EN/IG_UI.json')
assert(translations:find('"IGUI_ItemCat_EvidenceOld": "Evidence / Old"',1,true),'the Old category needs its translation')

-- A live clue keeps showing as Evidence. The category is not saved with an
-- item, so a clue in an area that streamed out and back lost it while its case
-- was live (campaign check, 2026-09-15); the scan that finds a live case's
-- clues and inspecting a clue both restore it.
local identity=runtime:match('local function identity%(api%)(.-)\nend\n')
assert(identity and identity:find('it:setDisplayCategory(categoryOf(id))',1,true),
    "the scan over a live case's clues must restore their category")
local inspectFn=runtime:match('function R%.inspect%(item[^)]*%)(.-)\nfunction ')
assert(inspectFn and inspectFn:find('item:setDisplayCategory(categoryOf(md.cfGeneratedId))',1,true),
    "inspecting a clue must restore its category")

print('PASS retired_papers')
