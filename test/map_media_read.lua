package.path="mod/common/media/lua/client/?.lua;"..package.path
local mp=false; isClient=function() return mp end; isServer=function() return false end
local mode="cancel"; local printMode="ok"; local maps,prints={},{}
ISMapWrapper={addToUIManager=function() return nil,"attached",nil end}
ISMap={revealOnWorldMap=function() return "revealed" end}
ISInventoryPaneContextMenu={onCheckMap=function(item,player)
    if mode=="throw" then error("native failed") end
    if mode=="read" or mode=="late-error" then
        ISMapWrapper.addToUIManager({mapUI={mapObj=item,playerNum=player}})
    end
    if mode=="late-error" then error("native failed after attachment") end
    return nil,"native",nil
end}
ISReadABook={displayPrintMedia=function()
    if printMode=="throw" then error("print failed") end
    return nil,"print-native",nil
end}
for _,name in ipairs({"ISUI/ISInventoryPaneContextMenu","ISUI/Maps/ISMap","TimedActions/ISReadABook"}) do
    package.preload[name]=function() return true end
end
local H=require("ConspiracyFiles/MapMediaRead")
assert(H.start(function(id) maps[#maps+1]=id end,function(id) prints[#prints+1]=id end))
local item={getStashMap=function(self) assert(self); return "design" end}
local function pack(...) return {n=select("#",...),...} end
local result=pack(ISInventoryPaneContextMenu.onCheckMap(item,0))
assert(result.n==3 and result[1]==nil and result[2]=="native" and result[3]==nil)
assert(#maps==0,"transfer-queued return is not a read")
ISMap.revealOnWorldMap(); assert(#maps==0,"reveal must remain inert")
mode="throw"; assert(not pcall(ISInventoryPaneContextMenu.onCheckMap,item,0)); assert(#maps==0)
mode="late-error"; assert(not pcall(ISInventoryPaneContextMenu.onCheckMap,item,0)); assert(#maps==0)
mode="read"; ISInventoryPaneContextMenu.onCheckMap(item,0); assert(maps[1]=="design")
ISInventoryPaneContextMenu.onCheckMap(item,0); assert(#maps==2,"rereads reach the idempotent domain")
local action={character={getPlayerNum=function()return 0 end},item={getModData=function()return {printMedia={id="flyer"}}end}}
result=pack(ISReadABook.displayPrintMedia(action))
assert(result.n==3 and result[2]=="print-native" and prints[1]=="flyer")
printMode="throw"; assert(not pcall(ISReadABook.displayPrintMedia,action)); assert(#prints==1)
mp=true; ISInventoryPaneContextMenu.onCheckMap(item,0); assert(#maps==2)
mp=false; H.stop(); ISInventoryPaneContextMenu.onCheckMap(item,0); assert(#maps==2)
print("PASS native attachment, cancellation, error propagation, nil tuples, reread and multiplayer gates")
