-- A completed case is retired to {caseId, rows, known}: no assignments, no case
-- envelope. The marker worker indexed c.assignments[id] and threw the moment a
-- case completed, logging "Worker stopped" (Linux core-loop run, 2026-09-11);
-- the map overlay read root.case.documents the same way. Same class as 3fe1813.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local retired={schema=1,caseId="R-552",rows={{id="a",title="Staff photograph / R-552"}},known={"a"}}
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
Cases.current=function(store) return store end
Cases.find=function(_,id) if id=="a" then return retired end end
Cases.discoveries=function() return {"a"} end

local tick
Events={OnTick={Add=function(f) tick=f end,Remove=function(f) if tick==f then tick=nil end end},OnGameStart={Add=function() end}}
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
local data,tool={},false
local inv={containsTypeRecurse=function(_,s) return tool and s=="Pencil" end,containsTagRecurse=function() return false end}
local player={getInventory=function() return inv end,getModData=function() return data end}
getPlayer=function() return player end
ItemTag={get=function(s) return s end};ResourceLocation={of=function(s) return s end}
ModData={get=function(k) if k=="ConspiracyFiles.Generated.G2" then return {canonical=retired} end end}
getWorld=function() return {getMap=function() return "Muldraugh, KY" end} end
getTimeInMillis=function() return 0 end
ISTransferAction={transferItem=function() end};ISGrabItemAction={transferItem=function() end};ISWorldMap={render=function() end}
for _,name in ipairs({'TimedActions/ISTransferAction','TimedActions/ISGrabItemAction','ISUI/Maps/ISWorldMap'}) do package.preload[name]=function() return {} end end
local M=require('ConspiracyFiles/ClueMarkers');assert(M.start())

-- Found without a pen before the case completed: a pending finding record.
data['ConspiracyFiles.ClueMarkers']={schema=1,records={a={x=10840,y=10148,z=0,map="Muldraugh, KY",written=false}}}

-- No pen yet: nothing happens, and nothing throws.
M.update()
assert(not data['ConspiracyFiles.ClueMarkers'].records.a.written)
assert(M.note("a")=="Finding location remembered. Map marking waits for a pen or pencil.", M.note("a"))

-- A pen after completion still writes the retired case's mark (catch-up).
tool=true
M.update()
assert(data['ConspiracyFiles.ClueMarkers'].records.a.written, "a retired case's finding is still marked once a pen is held")
assert(M.note("a")=="Finding location marked on your world map.", M.note("a"))

-- The map overlay reads titles from the retired rows instead of throwing.
local drawn={}
M.drawRecords=function(_,c) for _,d in ipairs(c.case.documents) do drawn[d.id]=d.title end end
M.draw({})
assert(drawn.a=="Staff photograph / R-552", tostring(drawn.a))

-- And the worker is still running.
assert(tick, "the marker worker must not stop when a case retires")
print("PASS clue markers: a retired case neither stops the worker nor the map overlay")
