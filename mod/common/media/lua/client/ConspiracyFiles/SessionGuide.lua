require "ISUI/ISCollapsableWindow"
require "ISUI/ISButton"
local Document=require("ConspiracyFiles/DocumentPane")
local Content=require("ConspiracyFiles/Content")
local Bindings=require("ConspiracyFiles/Bindings")
ConspiracyFiles=ConspiracyFiles or {}
local Guide=ConspiracyFiles.SessionGuide or {index=1,verdicts={},failures=0}
ConspiracyFiles.SessionGuide=Guide
Guide.VERSION="GUIDE-0.1 / candidate DEV-0.6"
Guide.steps={
    {id="ui-scroll",mode="T12",title="1. Readability and scrolling",text="Enable ConspiracyFiles + T12 only in a disposable debug save. Open test UI. Start at 3200 x 2000 / font setting 3. Check ordinary and high-contrast ink, visible scrollbar, wheel, track paging, thumb drag and both ends. Titles/actions must stay fixed. Record your observation; stop on a repeatable failure."},
    {id="ui-navigation",mode="T12",title="2. Navigation and scale",text="Check wide/compact resize, long titles, Back, Help, native X and repeated reopening. Test Tab/arrows/Enter/Page Up/Down and a configured notebook toggle. Escape must remain with the game. Try lower resolution/font settings. Controller is unimplemented: record Not tested with a note, not a guessed pass. This step's verdict covers keyboard/mouse only."},
    {id="relay",mode="T12",title="3. Electronics / relay location",text="Travel manually to the Muldraugh candidate around (10614,9604,0). Check believable paperwork/tool storage and access. Snapshot the exact square at each useful container. Test inside, adjacent-room/outside, boundary and wrong-floor squares. The candidate rectangle is x [10613,10617), y [9603,9607), z 0. A match alone is not proof that the room is suitable."},
    {id="police",mode="T12",title="4. Police location and route",text="Travel by an ordinary road route to police around (10637,10410,0). Record route/access plausibility and exact storage squares. Test inside, adjacent room/outside, boundary and wrong floor. Candidate rectangle: x [10636,10640), y [10409,10413), z 0. Return observations for a binding patch; Pass here does not set Bindings.accepted."},
    {id="placement",mode="T11",title="5. One real D1 placement",text="Leave the save. Disable T12 and enable T11 with ConspiracyFiles. Use a fresh disposable schema-2 save. Never enable both wrappers. Reopen this guide. T11 permits D1 only; inspect its snapshot after loading the relay target. Require one stamped physical item and placed status. Repeat callbacks and stream out/in. Exact binding is still provisional unless an observed binding patch has been applied."},
    {id="inspect",mode="T11",title="6. Manual Inspect and real reload",text="Use the real item in the inventory or Ground/loot inventory pane. Manually choose Inspect Document. Verify full text and explanatory context, one Evidence and two initial journal events (asset-discovered plus thread-introduced). Save, leave and reload, then Inspect again: no new Evidence or journal events. Snapshot before and after. Synthetic T12 rows do not count."},
    {id="identity",mode="T11",title="7. Moves, conflict and faults",text="Move D1 through inventory/bag/floor/storage and reload. Zero at its source must not cause respawn or imply loss. Use separate disposable scenarios for copied-token conflict and the documented one-shot fault matrix. Empty persisted intent is a known recovery gap, not a pass. Follow dev/t11-adapter-integration/README.md; do not mark this step passed unless every claimed case has archived evidence."},
    {id="handoff",mode="T11",title="8. Evidence handoff",text="Capture final snapshot and archive console.txt before restarting the game. Verdicts are operator notes, not acceptance or automatic gate closure. This guide writes no save data; on reload reopen the guide and select the next step. Earlier results remain in the console log for this game process. T11/T12 do not accept death, multiplayer, full coexistence or real frame timing. Share failures and untested cases before full E01-E13."}
}
function Guide.allowed()
    return isDebugEnabled and isDebugEnabled() and not (isClient and isClient()) and not (isServer and isServer())
end
function Guide.mode()
    if ConspiracyFiles.T11Mode and ConspiracyFiles.T12Mode then return "INVALID: both wrappers" end
    return ConspiracyFiles.T12Mode and "T12" or ConspiracyFiles.T11Mode and "T11" or "candidate (no wrapper)"
end
local function clean(value) return tostring(value or ""):gsub("[\r\n|]"," "):sub(1,700) end
local function log(kind,value) print("[CF-GUIDE]|"..kind.."|version="..Guide.VERSION.."|mode="..Guide.mode().."|"..clean(value)) end
local function safe(fn)
    if not Guide.allowed() or Guide.failures>=3 then return false end
    local ok,why=pcall(fn)
    if not ok then Guide.failures=Guide.failures+1; if Guide.failures==1 or Guide.failures==3 then log("ERROR",why) end end
    return ok
end
function Guide.note(text) return safe(function() log("OWNER_NOTE",text) end) end
function Guide.snapshot()
    if not Guide.allowed() then return {} end
    local lines={"Mode: "..Guide.mode(),"Guide: "..Guide.VERSION,"Bindings accepted: "..tostring(Bindings.accepted)}
    local rt=ConspiracyFiles.Runtime
    lines[#lines+1]="Runtime: "..tostring(rt and rt.VERSION).." / disabled: "..tostring(not rt or rt.disabled)
    local player=getPlayer and getPlayer()
    if player then
        local x,y,z=math.floor(player:getX()),math.floor(player:getY()),math.floor(player:getZ())
        lines[#lines+1]="Player square: "..x..","..y..","..z
        local pos={x=x,y=y,z=z}
        lines[#lines+1]="Candidate match relay/police: "..tostring(Bindings.match(Content.ids.relay,pos)).." / "..tostring(Bindings.match(Content.ids.police,pos))
        local square=getCell():getGridSquare(x,y,z); local objects=square and square:getObjects()
        -- On-demand, read-only, bounded furniture diagnostic. Never scans a map.
        for i=0,math.min(objects and objects:size() or 0,8)-1 do
            local object=objects:get(i); local sprite=object:getSprite()
            for j=0,math.min(object:getContainerCount(),4)-1 do
                local container=object:getContainerByIndex(j)
                if container then lines[#lines+1]="Object "..i.." / container "..j..": "..clean(container:getType()).." / "..clean(sprite and sprite:getName()) end
            end
        end
        lines[#lines+1]="Furniture scan limited to first 8 objects / 4 containers each on this square."
    end
    if rt and not rt.disabled and rt.state then
        local state=rt.state.snapshot(); local a=rt.assignment(Content.ids.d1)
        lines[#lines+1]="Evidence/journal: "..#state.evidence.." / "..#state.journal
        lines[#lines+1]="D1: "..a.status.." / "..a.availability.." / "..a.physicalToken
        if a.target then local t=a.target; lines[#lines+1]="D1 target: "..t.x..","..t.y..","..t.z.." object="..t.objectIndex.." container="..t.containerIndex end
        local metrics=rt.metrics(); lines[#lines+1]="Queued-work peak ms only (not full frame): "..tostring(metrics and metrics.peakMs)
    end
    return lines
end
function Guide.capture()
    return safe(function() for _,line in ipairs(Guide.snapshot()) do log("SNAPSHOT",line) end end)
end
function Guide.record(verdict)
    if verdict~="Pass" and verdict~="Fail" and verdict~="Not tested" then return false end
    local step=Guide.steps[Guide.index]
    if not Guide.allowed() or Guide.failures>=3 then return false end
    if verdict~="Not tested" and Guide.mode()~=step.mode then log("REFUSED","wrong mode for "..step.id); return false end
    local rt=ConspiracyFiles.Runtime
    if verdict~="Not tested" and step.mode=="T11" and (not rt or rt.disabled) then log("REFUSED","T11 runtime unavailable"); return false end
    return safe(function()
        Guide.verdicts[step.id]=verdict; log("OWNER_VERDICT",step.id.."="..verdict.."; observation only, not gate acceptance")
        for _,line in ipairs(Guide.snapshot()) do log("SNAPSHOT",line) end
        if Guide.window then Guide.window:refresh() end
    end)
end
local Window=ISCollapsableWindow:derive("CFSessionGuide")
function Window:refresh()
    local step=Guide.steps[Guide.index]
    self.document:setDocument(step.title.."\n\nRequired mode: "..step.mode.." | Current: "..Guide.mode().."\nRecorded: "..(Guide.verdicts[step.id] or "Not tested").."\n\n"..step.text.."\n\nOwner operates the game. No automatic pass, save, teleport or discovery. Use Snapshot and add notes in the ordinary console with ConspiracyFiles.SessionGuide.note('your observation').",true)
end
function Window:createChildren()
    ISCollapsableWindow.createChildren(self); self:setResizable(true)
    self.document=Document:new(12,40,self.width-24,self.height-145)
    self.document:initialise(); self.document:instantiate(); self:addChild(self.document)
    self.controls={}
    local actions={
        {"Previous",function() Guide.index=math.max(1,Guide.index-1); self:refresh() end},
        {"Next",function() Guide.index=math.min(#Guide.steps,Guide.index+1); self:refresh() end},
        {"Open test UI",function()
            if Guide.mode()=="T12" and ConspiracyFiles.T12Probe then ConspiracyFiles.T12Probe.open()
            elseif Guide.mode()=="T11" then ConspiracyFiles.NotebookUI.open() end
        end},
        {"Snapshot",Guide.capture},
        {"Pass",function() Guide.record("Pass") end},
        {"Fail",function() Guide.record("Fail") end},
        {"Not tested",function() Guide.record("Not tested") end}
    }
    for i,action in ipairs(actions) do
        local fn=action[2]
        local b=ISButton:new(12+((i-1)%4)*132,self.height-94+math.floor((i-1)/4)*40,124,32,action[1],self,function() safe(fn) end)
        b:initialise(); b:instantiate(); self:addChild(b); self.controls[i]=b
    end
    self:refresh()
end
function Window:prerender()
    safe(function()
        self.document:setWidth(self.width-24); self.document:setHeight(self.height-145)
        for i,b in ipairs(self.controls) do b:setY(self.height-94+math.floor((i-1)/4)*40) end
        ISCollapsableWindow.prerender(self)
    end)
end
function Window:close() self:removeFromUIManager(); Guide.window=nil end
function Guide.open()
    return safe(function()
        if Guide.window then Guide.window:bringToTop(); return end
        local w=ISCollapsableWindow.new(Window,20,20,570,math.min(600,getCore():getScreenHeight()-40))
        w.minimumWidth=560; w.minimumHeight=420; w:setTitle("Guided development session — "..Guide.VERSION)
        w:initialise(); w:instantiate(); w:addToUIManager(); Guide.window=w
        log("OPEN","Results remain in memory and console; no save data written")
    end)
end
if Events and Events.OnFillInventoryObjectContextMenu and not Guide.handler then
    Guide.handler=function(_,context)
        safe(function()
            for _,option in ipairs(context.options or {}) do if option.cfSessionGuide then return end end
            local option=context:addOption("CF Debug: Guided session",nil,function() Guide.open() end)
            if option then option.cfSessionGuide=true end
        end)
    end
    Events.OnFillInventoryObjectContextMenu.Add(Guide.handler)
end
return Guide
