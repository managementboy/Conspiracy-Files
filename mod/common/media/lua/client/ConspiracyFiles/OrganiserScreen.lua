-- The organiser as the player sees it: a case, a screen, and buttons that work.
--
-- Owner, 2026-09-12, with a drawing of the shell: "the buttons on the bottom
-- and the on off light and button on the top of the device shall work. please
-- decide what they be maped with and give real click feedback. the Screen is
-- touchscreen? 1993 did not have that."
--
-- The glass WAS inert, and is not any more: the owner reversed that ruling the
-- same afternoon, giving the device a stylus (docs/design/KNOX_OS.md). So a
-- tap picks a record, a tap works the scroll arrows, and the keys still do
-- everything they did - the rocker beats a stylus when something is coming.
-- The device is held in the main hand to be read, which is what makes reading
-- it a decision rather than a menu.
--
-- THE MAP, which is now Knox.OS's:
--   POWER (top)        screen on and off; the light is lit while it is on.
--   POWER, held        the lamp, as a real Palm's backlight was.
--   ROCKER up/down     page through what is open.
--   VIEW   (button 1)  the program list, and back.
--   PREV   (button 2)  the record before; in the program list, the program before.
--   NEXT   (button 3)  the record after.
--   LIST   (button 4)  open the selected record, or back out of one.
-- Keys mirror them for a player whose hand is on WASD: arrows, M, I, L, and
-- Escape to close. The stylus does all of it by tapping.
local CFLog=require("ConspiracyFiles/Log")
local Font=require("ConspiracyFiles/Generated/OrganiserFont")
local Case=require("ConspiracyFiles/Generated/OrganiserCase")
local K=require("ConspiracyFiles/KnoxUI")
local Apps=require("ConspiracyFiles/KnoxApps")
require("ISUI/ISPanel")
ConspiracyFiles=ConspiracyFiles or {}
local S=ConspiracyFiles.OrganiserScreen or {}
ConspiracyFiles.OrganiserScreen=S

local function log(message) CFLog.message("casefile","note",message) end
local function safe(fn,...) local ok,v=pcall(fn,...) if ok then return v end end

-- The case is a PICTURE, not a stack of rectangles: the game's Lua draws only
-- rectangles, so a shell drawn in code came out as grey plates (owner,
-- 2026-09-12: "that looks nothing like your or my mockup ... All sqare"). The
-- art and these hit boxes are generated together by tools/build_organiser_art.py,
-- in native pixels, multiplied by a whole-number scale so a pixel stays square.
-- Portrait, like the shell the owner drew: the glass is nearly square and the
-- keypad sits under it. A first pass was 34 columns by 6 lines, which made a
-- letterbox - correct in code, wrong on screen (2026-09-12).
-- The glass is the original's own 160 x 160. How much fits is measured by the
-- widget kit, not chosen here.
S.HOLD_MS=450                     -- how long a held POWER becomes the lamp
S.PRESS_MS=110                    -- how long a button shows as pressed

-- Palm III colours: a graphite case, a near-black surround, and the grey-green
-- LCD. Only the glass is green.
local SHELL={0.31,0.31,0.32}
local SHELL_EDGE={0.10,0.10,0.11}
local SHELL_DEEP={0.22,0.22,0.24}
local GLASS={0.66,0.70,0.59}
local GLASS_LIT={0.76,0.70,0.46}
local INK={0.15,0.17,0.13}
local INK_DIM={0.38,0.42,0.33}
local LED_ON={0.85,0.35,0.30}
local LED_OFF={0.30,0.20,0.19}

-- The screen draws its own letters. Handing the game a font in its own format
-- was tried first and killed it on startup: the manifest override is picked up,
-- then the engine looks for the .fnt through its own file access, which cannot
-- see a mod's files ("FileNotFoundException: media/palmos.fnt", 2026-09-12).
-- So: one small texture per glyph, kept once it is found or missed.
local glyphs={}
local function glyph(code,scale)
    local key=scale.."/"..code
    local hit=glyphs[key]
    if hit~=nil then return hit or nil end
    local texture=getTexture and safe(getTexture,"media/ui/CFOrg/"..scale.."x/"..code..".png")
    glyphs[key]=texture or false
    return texture
end
local function measure(text,scale) return Font.width(text,scale) end

local Screen=ISPanel:derive("CFOrganiserScreen")
S.Screen=Screen

function S.metrics(scale)
    return {scale=scale,glass=Case.glass,w=Case.w*scale,h=Case.h*scale}
end

local art={}
-- With a scale, a piece of case art (case_3x.png); without one, a path that
-- already carries its own scale (icons/3x/files.png).
local function texture(name,scale)
    local key=name..tostring(scale)
    local hit=art[key]
    if hit~=nil then return hit or nil end
    local path=scale and ("media/ui/CFOrg/"..name.."_"..scale.."x.png") or ("media/ui/CFOrg/"..name..".png")
    local t=getTexture and safe(getTexture,path)
    art[key]=t or false
    return t
end

-- Palm's own guidance is to use the whole screen: "go to the edge". The device
-- therefore takes about four fifths of the window's height, at a whole-number
-- scale so the pixels stay square. ZOOM steps it down for anyone who wants the
-- game visible behind it.
function S.fit()
    local h=getCore and getCore():getScreenHeight() or 720
    local want=math.floor(h*0.82/Case.h)
    if want<2 then want=2 elseif want>4 then want=4 end
    return want
end

function Screen:new(owner)
    local scale=S.scale or S.fit()
    local m=S.metrics(scale)
    local o=ISPanel.new(self,(getCore():getScreenWidth()-m.w)/2,(getCore():getScreenHeight()-m.h)/2,m.w,m.h)
    o.backgroundColor={r=0,g=0,b=0,a=0}
    o.borderColor={r=0,g=0,b=0,a=0}
    o.owner=owner
    o.scale=scale
    o.section="evidence"
    o.entry=1
    o.card=1
    o.index=false
    o.on=true
    o.lamp=false
    o.pressed={}
    o.moveWithMouse=true
    return o
end

function Screen:initialise() ISPanel.initialise(self); self:setWantKeyEvents(true) end

function Screen:buttons()
    local s=self.scale
    local out={}
    for _,b in ipairs(Case.buttons) do
        out[#out+1]={id=b.id,x=b.x*s,y=b.y*s,w=b.w*s,h=b.h*s,round=b.round}
    end
    return out
end

function Screen:prerender()
    local s=self.scale
    local case=texture("case",s)
    if case then
        self:drawTextureScaled(case,0,0,Case.w*s,Case.h*s,1,1,1,1)
    else
        self:drawRect(0,0,self.width,self.height,1,SHELL[1],SHELL[2],SHELL[3])
        self:drawRect(Case.glass.x*s,Case.glass.y*s,Case.glass.w*s,Case.glass.h*s,1,GLASS[1],GLASS[2],GLASS[3])
    end
    if self.on and self.lamp then
        self:drawRect(Case.glass.x*s,Case.glass.y*s,Case.glass.w*s,Case.glass.h*s,0.55,GLASS_LIT[1],GLASS_LIT[2],GLASS_LIT[3])
    end
    if self.on then
        local led=texture("led",s)
        if led then self:drawTextureScaled(led,Case.led.x*s,Case.led.y*s,Case.led.d*s,Case.led.d*s,1,1,1,1)
        else self:drawRect(Case.led.x*s,Case.led.y*s,Case.led.d*s,Case.led.d*s,1,LED_ON[1],LED_ON[2],LED_ON[3]) end
    end
    local now=getTimeInMillis and getTimeInMillis() or 0
    for _,b in ipairs(self:buttons()) do
        if self.pressed[b.id] and now-self.pressed[b.id]<S.PRESS_MS then
            local name=b.round and "press" or (b.id=="POWER" and "power" or "rocker")
            local t=texture(name,s)
            local sink=math.max(1,s/2)
            if t then self:drawTextureScaled(t,b.x,b.y+sink,b.w,b.h,0.9,1,1,1)
            else self:drawRect(b.x,b.y+sink,b.w,b.h,1,SHELL_EDGE[1],SHELL_EDGE[2],SHELL_EDGE[3]) end
        end
    end
    if self.on then self:draw(Case.glass.x*s,Case.glass.y*s) end
end

-- Knox.OS. The shell owns the title bar, the scrolling and the arrows; a
-- program only says what its rows are (ConspiracyFiles/KnoxApps).
function Screen:program() return Apps.programs[self.app or 1] or Apps.programs[1] end

function Screen:list()
    if self.cachedList then return self.cachedList end
    local program=self:program()
    self.cachedList=(program.list and safe(program.list)) or {}
    return self.cachedList
end

local function pages(detail,width)
    local lines={}
    for paragraph in (tostring(detail or "").."\n"):gmatch("([^\n]*)\n") do
        if paragraph=="" then
            if #lines>0 and lines[#lines]~="" then lines[#lines+1]="" end
        else
            local line=""
            for word in paragraph:gmatch("%S+") do
                local candidate=line=="" and word or (line.." "..word)
                if Font.width(candidate,1)<=width then line=candidate
                else if line~="" then lines[#lines+1]=line end; line=word end
            end
            if line~="" then lines[#lines+1]=line end
        end
    end
    return lines
end

function Screen:draw(gx,gy)
    local c=K.begin(self,self.scale,gx,gy,Case.glass.w,Case.glass.h)
    self.context=c
    local line=Font.line
    local room=K.rows(c)
    if self.launcher then
        -- The Applications launcher: clock, battery, category, icon grid.
        local clock=getGameTime and getGameTime()
        local hour=clock and safe(function() return clock:getHour() end) or 0
        local minute=clock and safe(function() return clock:getMinutes() end) or 0
        local charge
        local organiser=ConspiracyFiles.Organiser
        if organiser and organiser.held then
            local item=safe(organiser.held)
            charge=item and organiser.power and safe(organiser.power,item)
        end
        local y=K.status(c,string.format("%d:%02d",hour,minute),"All",charge)
        K.grid(c,Apps.programs,y+2,self.app or 1,function(name) return texture("icons/"..self.scale.."x/"..name,nil) end)
        K.foot(c,"tap a program")
        return
    end
    local program=self:program()
    local rows=self:list()
    if self.record then
        local lines=pages(self.record.detail,c.w-4-8)
        K.titleBar(c,program.title,self.record.index and (self.record.index.." of "..#rows) or nil)
        local top=(self.card-1)*room+1
        for i=0,room-1 do
            local text=lines[top+i]
            if not text then break end
            K.text(c,text,2,line+2+i*line,K.INK)
        end
        K.arrows(c,line+2,room*line,top>1,top+room-1<#lines)
        local foot=K.foot(c,"")
        local x=K.command(c,"BACK",2,foot,"BACK")
        if self.record.todo then K.command(c,"TICK",x,foot,"TICK")
        else K.command(c,"REMIND",x,foot,"REMIND") end
        return
    end
    K.titleBar(c,program.title,#rows>0 and (self.entry.." of "..#rows) or "empty")
    local top=math.max(1,math.min(self.entry-math.floor(room/2),#rows-room+1))
    if top<1 then top=1 end
    if #rows==0 then K.text(c,"Nothing recorded yet.",2,line+2,K.DIM) end
    for i=0,room-1 do
        local row=rows[top+i]
        if not row then break end
        K.row(c,row.label,line+2+i*line,(top+i)==self.entry,"ROW",top+i)
    end
    K.arrows(c,line+2,room*line,top>1,top+room-1<#rows)
    K.foot(c,"VIEW: programs   LIST: open")
end

function Screen:openRow(index)
    local rows=self:list()
    local row=rows[index]
    if not row then return end
    self.entry=index
    if row.todo and row.index then
        Apps.tickToDo(row.index); self.cachedList=nil
    else
        self.record=row; self.record.index=index; self.card=1
    end
end

function Screen:press(id)
    self.pressed[id]=getTimeInMillis and getTimeInMillis() or 0
    safe(function() getSoundManager():playUISound("UIActivateButton") end)
    if id=="POWER" then
        self.on=not self.on
        if not self.on then self.lamp=false end
        return
    end
    if not self.on then return end
    local rows=self:list()
    if id=="MODE" then
        self.launcher=not self.launcher; self.record=nil
    elseif id=="INDEX" then
        if self.launcher then
            self.launcher=false; self.cachedList=nil; self.entry,self.card=1,1
        elseif self.record then self.record=nil
        else self:openRow(self.entry) end
    elseif id=="PREV" then
        if self.launcher then self.app=math.max(1,(self.app or 1)-1)
        elseif self.record then self.record=nil
        else self.entry=math.max(1,self.entry-1) end
    elseif id=="NEXT" then
        if self.launcher then self.app=math.min(#Apps.programs,(self.app or 1)+1)
        else self.entry=math.min(math.max(1,#rows),self.entry+1); self.record=nil end
    elseif id=="UP" then
        self.card=math.max(1,self.card-1)
        if not self.record then self.entry=math.max(1,self.entry-1) end
    elseif id=="DOWN" then
        if self.record then self.card=self.card+1
        else self.entry=math.min(math.max(1,#rows),self.entry+1) end
    end
    log("knox key "..id)
end

-- The stylus: whatever widget is under the tap.
function Screen:tap(x,y)
    local widget=self.context and K.at(self.context,x,y)
    if not widget then return end
    safe(function() getSoundManager():playUISound("UIActivateButton") end)
    local id=widget.id
    if id=="APP" then
        self.app=widget.payload; self.launcher=false; self.record=nil
        self.entry,self.card,self.cachedList=1,1,nil
    elseif id=="SELECT" then self.launcher=true; self.record=nil
    elseif id=="ROW" then
        if self.launcher then self.app=widget.payload; self.launcher=false; self.cachedList=nil; self.entry=1
        else self:openRow(widget.payload) end
    elseif id=="BACK" then self.record=nil; self.card=1
    elseif id=="TICK" then
        if self.record and self.record.index then
            local rows=self:list(); local row=rows[self.record.index]
            if row and row.index then Apps.tickToDo(row.index) end
        end
        self.record=nil; self.cachedList=nil
    elseif id=="REMIND" then
        if self.record then Apps.addToDo(self.record.title) end
        self.record=nil; self.cachedList=nil
    elseif id=="UP" then self:press("UP")
    elseif id=="DOWN" then self:press("DOWN") end
    log("knox tap: "..tostring(id))
end

function Screen:onMouseDown(x,y)
    self.downAt=getTimeInMillis and getTimeInMillis() or 0
    for _,b in ipairs(self:buttons()) do
        if x>=b.x and x<=b.x+b.w and y>=b.y and y<=b.y+b.h then self.down=b.id; return true end
    end
    local s=self.scale
    local gx,gy=Case.glass.x*s,Case.glass.y*s
    if self.on and x>=gx and y>=gy and x<=gx+Case.glass.w*s and y<=gy+Case.glass.h*s then
        self.down="GLASS"; return true
    end
    self.down=nil
    return ISPanel.onMouseDown(self,x,y)
end

function Screen:onMouseUp(x,y)
    local id=self.down
    self.down=nil
    if id=="GLASS" then self:tap(x,y); return true end
    if not id then return ISPanel.onMouseUp(self,x,y) end
    local held=(getTimeInMillis and getTimeInMillis() or 0)-(self.downAt or 0)
    if id=="POWER" and held>=S.HOLD_MS then
        self.lamp=not self.lamp
        self.pressed[id]=getTimeInMillis and getTimeInMillis() or 0
        safe(function() getSoundManager():playUISound("UIActivateButton") end)
        log("organiser lamp "..tostring(self.lamp))
        return true
    end
    self:press(id)
    return true
end

local KEYS={[Keyboard.KEY_UP]="UP",[Keyboard.KEY_DOWN]="DOWN",[Keyboard.KEY_LEFT]="PREV",
            [Keyboard.KEY_RIGHT]="NEXT",[Keyboard.KEY_M]="MODE",[Keyboard.KEY_I]="INDEX"}
function Screen:isKeyConsumed(key)
    return KEYS[key]~=nil or key==Keyboard.KEY_ESCAPE or key==Keyboard.KEY_L or key==Keyboard.KEY_P
end
function Screen:onKeyRelease(key)
    if key==Keyboard.KEY_ESCAPE then self:close(); return end
    if key==Keyboard.KEY_P then self:press("POWER"); return end
    if key==Keyboard.KEY_L then self.lamp=not self.lamp; return end
    local id=KEYS[key]
    if id then self:press(id) end
end

function Screen:close()
    self:removeFromUIManager()
    S.window=nil
end

-- Open it, or bring it back. One window: a second organiser on screen would be
-- a second reading surface, which is exactly what P4-R79 forbids.
function S.open()
    if S.window then S.window:bringToTop(); return S.window end
    local w=Screen:new()
    w:initialise(); w:instantiate(); w:addToUIManager()
    S.window=w
    log("organiser screen opened")
    return w
end

function S.close() if S.window then S.window:close() end end
function S.zoom(scale)
    if scale==2 or scale==3 or scale==4 then S.scale=scale
    else S.scale=((S.scale or S.fit())%4)+1; if S.scale<2 then S.scale=2 end end
    if S.window then S.close(); S.open() end
    return S.scale
end

return S
