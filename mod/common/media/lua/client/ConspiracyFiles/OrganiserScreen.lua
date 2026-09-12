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
-- Auto-off. Every Palm did this, and for the reason this machine needs it:
-- the cells are the scarce thing. Real seconds, not game hours, because it is
-- the player who has stopped touching it. POWER wakes it again.
S.AUTO_OFF_MS=120000

-- Palm III colours: a graphite case, a near-black surround, and the grey-green
-- LCD. Only the glass is green.
local SHELL={0.31,0.31,0.32}
local SHELL_EDGE={0.10,0.10,0.11}
local SHELL_DEEP={0.22,0.22,0.24}
local GLASS={0.66,0.70,0.59}
local GLASS_LIT={0.76,0.70,0.46}
local INK={0.15,0.17,0.13}
local INK_DIM={0.38,0.42,0.33}

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
    -- The owner's case is 305 x 444 in its own pixels, so 1x is a real size
    -- on a small screen and 3x fills a big one.
    local want=math.floor(h*0.86/Case.h)
    if want<1 then want=1 elseif want>3 then want=3 end
    return want
end

-- Off to the side, never over the survivor. Owner, 2026-09-12: "mabye not
-- centered as it would make surviving a zombie at your home" - a machine that
-- opens itself in the middle of the screen at spawn is a machine that gets you
-- killed. It sits against the right edge, where the game keeps its own panels.
function S.place(m)
    local w=getCore():getScreenWidth()
    local h=getCore():getScreenHeight()
    return w-m.w-24,math.max(24,(h-m.h)/2)
end

function Screen:new(owner)
    local scale=S.scale or S.fit()
    local m=S.metrics(scale)
    local x,y=S.place(m)
    local o=ISPanel.new(self,x,y,m.w,m.h)
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
    o.touched=getTimeInMillis and getTimeInMillis() or 0
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

-- What the command line says. Normally the caller's own hint, but a machine
-- with a dying cell says that instead, on every screen, the way a Palm put its
-- battery warning in front of whatever you were doing. A refused lamp shows
-- briefly for the same reason: the player pressed something and must be told
-- why nothing happened.
function Screen:footText(hint)
    local now=getTimeInMillis and getTimeInMillis() or 0
    if self.lampRefused and now-self.lampRefused<2500 then
        return "LAMP NEEDS MORE CHARGE"
    end
    local organiser=ConspiracyFiles.Organiser
    local item=organiser and organiser.held and safe(organiser.held)
    if item and organiser.low and safe(organiser.low,item) then return "BATTERY LOW" end
    return hint
end

-- The boot screen has been read and dismissed. Anything it was there to
-- report - a lost memory, so far - can stop being reported now.
function Screen:bootSeen()
    local organiser=ConspiracyFiles.Organiser
    if not organiser or not organiser.clearMemoryNotice then return end
    local item=safe(organiser.held)
    if item then safe(organiser.clearMemoryNotice,item) end
end

-- Anything the player does to the machine counts as touching it.
function Screen:touch() self.touched=getTimeInMillis and getTimeInMillis() or 0 end

-- Idle long enough and it switches itself off, as the real machine did. The
-- lamp goes with it, because that is the whole point of auto-off.
function Screen:idleCheck()
    if not self.on then return end
    local now=getTimeInMillis and getTimeInMillis() or 0
    if now-(self.touched or now)<S.AUTO_OFF_MS then return end
    self.on=false
    self.lamp=false
    log("organiser auto-off: idle")
end

function Screen:prerender()
    self:idleCheck()
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
    -- No power light: the screen says whether it is on, which is how you can
    -- tell with any real machine (owner, 2026-09-12).
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
-- Always through Apps.visible(): the hidden program must not be reachable by
-- an index left over from a debug session.
function Screen:programs() return Apps.visible() end
function Screen:program()
    local programs=self:programs()
    return programs[self.app or 1] or programs[1]
end

function Screen:list()
    if self.cachedList then return self.cachedList end
    local program=self:program()
    self.cachedList=(program.list and safe(program.list)) or {}
    return self.cachedList
end

-- One string, wrapped to a pixel width.
local function wrapTo(text,width)
    local out={}
    local line=""
    for word in tostring(text or ""):gmatch("%S+") do
        local candidate=line=="" and word or (line.." "..word)
        if Font.width(candidate,1)<=width then line=candidate
        else if line~="" then out[#out+1]=line end; line=word end
    end
    if line~="" then out[#out+1]=line end
    return out
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
    if self.booting then
        -- The machine waking up, with the mod's real state on it: no invented
        -- progress bar, just what is actually done and what is not. Read once a
        -- second; a boot screen that re-reads the mod sixty times a second is
        -- worse than the thing it is reporting on.
        local now=getTimeInMillis and getTimeInMillis() or 0
        if not self.bootText or now-(self.bootAt or 0)>1000 then
            self.bootText=Apps.bootLines()
            self.bootAt=now
        end
        local y=2
        for _,text in ipairs(self.bootText) do
            K.text(c,text,2,y,K.INK); y=y+line
        end
        local foot=K.foot(c,self:footText(""))
        K.command(c,"START",2,foot,"START")
        return
    end
    if self.launcher then
        -- The Applications launcher: battery, category, icon grid.
        -- No clock. The machine could plausibly have one, but the game's rule
        -- is that knowing the time costs you a watch, and a reading device
        -- should not quietly buy you back a slot the vanilla game charges for
        -- (owner, 2026-09-13, reversing the 09-12 ruling).
        local charge
        local organiser=ConspiracyFiles.Organiser
        if organiser and organiser.held then
            local item=safe(organiser.held)
            charge=item and organiser.power and safe(organiser.power,item)
        end
        local y=K.status(c,nil,"All",charge)
        -- No record counts on the icons. Palm's launcher never showed any, and
        -- working them out means asking every program to read its whole store -
        -- which the fault check caught as an address lookup retrying forever,
        -- first every frame and then, after a cache, every second (suite,
        -- 2026-09-12). An icon and its name cost nothing.
        K.grid(c,self:programs(),y+2,self.app or 1,
            function(name) return texture("icons/"..self.scale.."x/"..name,nil) end)
        K.foot(c,self:footText("tap a program"))
        return
    end
    local program=self:program()
    local rows=self:list()
    if self.record then
        -- A record, laid out as a Palm application laid one out: the title,
        -- the few facts as labelled fields, a rule, then what the survivor
        -- wrote. Fields never scroll away; the writing does.
        K.titleBar(c,program.title,self.record.index and (self.record.index.." of "..#rows) or nil)
        local y=line+2
        local title=self.record.title or ""
        for _,text in ipairs(wrapTo(title,c.w-4)) do
            K.text(c,text,2,y,K.INK); y=y+line
        end
        for _,field in ipairs(self.record.fields or {}) do
            K.text(c,field.label,2,y,K.DIM)
            local value=wrapTo(field.value,c.w-38)
            for i,text in ipairs(value) do
                if i>2 then break end            -- a field is a fact, not an essay
                K.text(c,text,36,y,K.INK); y=y+line
            end
            if #value==0 then y=y+line end
        end
        K.fill(c,0,y,c.w,1,K.DIM); y=y+2
        local room=math.floor((c.h-line-2-y+line)/line)-2
        if room<2 then room=2 end
        local body=pages(self.record.detail,c.w-4-8)
        local top=(self.card-1)*room+1
        for i=0,room-1 do
            local text=body[top+i]
            if not text then break end
            K.text(c,text,2,y+i*line,K.INK)
        end
        K.arrows(c,y,room*line,top>1,top+room-1<#body)
        local foot=K.foot(c,self:footText(""))
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
    K.foot(c,self:footText("VIEW: programs   LIST: open"))
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
    self:touch()
    self.pressed[id]=getTimeInMillis and getTimeInMillis() or 0
    safe(function() getSoundManager():playUISound("UIActivateButton") end)
    if id=="POWER" then
        self.on=not self.on
        if not self.on then self.lamp=false end
        return
    end
    if not self.on then return end
    -- Any key leaves the boot screen. A machine that has finished booting and
    -- still insists you press the one button it is showing is a machine that
    -- annoys people (knox check, 2026-09-12: every tap landed on nothing
    -- because the boot screen was still up).
    if self.booting then self.booting=false; self:bootSeen(); return end
    local rows=self:list()
    -- The four keys open the four programs, the way a Palm's Date, Address,
    -- To Do and Memo keys did. The launcher is a tap on the title bar.
    local DIRECT={MODE="FILES",PREV="NAMES",NEXT="DATES",INDEX="TODO"}
    local wanted=DIRECT[id]
    if wanted then
        local programs=self:programs()
        for i,program in ipairs(programs) do
            if program.id==wanted then
                if self.app==i and not self.record and not self.launcher then
                    -- Pressed again while already there: step through its records,
                    -- which is what the key did on the real machine.
                    self.entry=math.min(math.max(1,#rows),self.entry+1)
                else
                    self.app=i; self.record=nil; self.launcher=false
                    self.entry,self.card,self.cachedList=1,1,nil
                end
                break
            end
        end
    elseif id=="UP" then
        if self.record then self.card=math.max(1,self.card-1)
        else self.entry=math.max(1,self.entry-1) end
    elseif id=="DOWN" then
        if self.record then self.card=self.card+1
        else self.entry=math.min(math.max(1,#rows),self.entry+1) end
    end
    log("knox key "..id)
end

-- The stylus: whatever widget is under the tap.
function Screen:tap(x,y)
    self:touch()
    if self.booting then
        self.booting=false
        self:bootSeen()
        safe(function() getSoundManager():playUISound("UIActivateButton") end)
        return
    end
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
        else
            local row=self:list()[widget.payload]
            if row and row.write then self:writeNote() else self:openRow(widget.payload) end
        end
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
    elseif id=="START" then
        self.booting=false
        self:bootSeen()
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
        self:touch()
        local organiser=ConspiracyFiles.Organiser
        local item=organiser and safe(organiser.held)
        local power=item and organiser.power and safe(organiser.power,item)
        -- A backlight is the first thing a dying cell refuses to run. Asking
        -- for it is not a failure the player caused, so it says so quietly
        -- rather than doing nothing at all.
        if not self.lamp and power~=nil and power<(organiser.LAMP_MIN or 0) then
            self.lampRefused=getTimeInMillis and getTimeInMillis() or 0
            log("organiser lamp refused: charge "..tostring(power))
            return true
        end
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

-- Typing. The Palm had a writing area under its screen and so does this: the
-- game's own text box is placed there, because drawing a keyboard on a 160 x
-- 160 canvas would be a worse answer than borrowing one that works.
function Screen:writeNote()
    if self.writer then return end
    require("ISUI/ISTextEntryBox")
    local s=self.scale
    local x=Case.glass.x*s
    local y=(Case.glass.y+Case.glass.h)*s-Font.line*s*2
    local box=ISTextEntryBox:new("",x,y,Case.glass.w*s,Font.line*s*2)
    box:initialise(); box:instantiate()
    box:setMaxTextLength(200)
    box.onCommandEntered=function()
        local text=box:getText()
        self:removeChild(box); self.writer=nil
        if text and text:find("%S") then
            Apps.addNote(text); self.cachedList=nil
            log("owner note: "..text)
        end
    end
    self:addChild(box)
    box:focus()
    self.writer=box
end

function Screen:close()
    self:removeFromUIManager()
    S.window=nil
end

-- Open it, or bring it back. One window: a second organiser on screen would be
-- a second reading surface, which is exactly what P4-R79 forbids.
function S.open()
    if S.window then S.window:bringToTop(); return S.window end
    -- Picking the machine up is when a flat cell is discovered, and it is a
    -- cheap moment to look: once per open, not once per tick.
    local organiser=ConspiracyFiles.Organiser
    if organiser and organiser.checkPower then safe(organiser.checkPower) end
    local w=Screen:new()
    w:initialise(); w:instantiate(); w:addToUIManager()
    S.window=w
    log("organiser screen opened")
    return w
end

function S.close() if S.window then S.window:close() end end

-- Wake the machine up when the game starts: off to the side, booting, showing
-- what the mod is actually doing. It does NOT take the survivor's hand for
-- this - a boot screen is the device in your bag, not in your fist.
function S.boot()
    local w=S.open()
    if w then w.booting=true end
    return w
end
function S.zoom(scale)
    if scale==1 or scale==2 or scale==3 then S.scale=scale
    else S.scale=((S.scale or S.fit())%3)+1 end
    if S.window then S.close(); S.open() end
    return S.scale
end

return S
