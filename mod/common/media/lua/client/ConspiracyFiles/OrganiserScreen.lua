-- The organiser as the player sees it: a case, a screen, and buttons that work.
--
-- Owner, 2026-09-12, with a drawing of the shell: "the buttons on the bottom
-- and the on off light and button on the top of the device shall work. please
-- decide what they be maped with and give real click feedback. the Screen is
-- touchscreen? 1993 did not have that."
--
-- So: the glass is inert. Nothing on the screen is clickable, nothing hovers,
-- nothing highlights. Every action is a button on the case, and every button
-- answers - it sinks a pixel, it darkens while held, it clicks, and the power
-- light responds. (For the record: 1993 did have stylus screens, the Newton
-- and the Zoomer both shipped that year. Buttons are still the right call for
-- a game played one-handed with a horde outside.)
--
-- THE MAP, and why:
--   POWER (top)        screen on and off. The light beside it is lit while on.
--   POWER, held        the lamp. This is how a real Palm lit its screen, and
--                      it keeps the sixth function off the face of the device.
--   ROCKER up/down     move through the text of what you are reading.
--   MODE   (button 1)  evidence, journal, places, round again.
--   PREV   (button 2)  the entry before this one.
--   NEXT   (button 3)  the entry after this one.
--   INDEX  (button 4)  out to the whole case, and back in again.
-- Keys mirror them for a player whose hand is on WASD: arrow keys for the
-- rocker and the entries, M, I, L, and Escape to close.
local CFLog=require("ConspiracyFiles/Log")
local Font=require("ConspiracyFiles/Generated/OrganiserFont")
require("ISUI/ISPanel")
ConspiracyFiles=ConspiracyFiles or {}
local S=ConspiracyFiles.OrganiserScreen or {}
ConspiracyFiles.OrganiserScreen=S

local function log(message) CFLog.message("casefile","note",message) end
local function safe(fn,...) local ok,v=pcall(fn,...) if ok then return v end end

-- Native-pixel geometry. Everything below is in the device's own pixels and is
-- multiplied by a whole number on the way to the screen, so a pixel is always
-- a square: 2x or 3x, chosen by the ZOOM the player last set.
-- Portrait, like the shell the owner drew: the glass is nearly square and the
-- keypad sits under it. A first pass was 34 columns by 6 lines, which made a
-- letterbox - correct in code, wrong on screen (2026-09-12).
S.LINES=10
S.COLS=22
local PAD=6                       -- glass margin
local CASE=10                     -- plastic around the glass
S.HOLD_MS=450                     -- how long a held POWER becomes the lamp
S.PRESS_MS=110                    -- how long a button shows as pressed

local SHELL={0.42,0.45,0.38}
local SHELL_EDGE={0.10,0.11,0.09}
local SHELL_DEEP={0.28,0.31,0.25}
local GLASS={0.72,0.77,0.63}
local GLASS_LIT={0.78,0.71,0.45}
local INK={0.17,0.20,0.14}
local INK_DIM={0.42,0.48,0.35}
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
    local inner=S.COLS*8               -- 8 native px is the widest common glyph
    local glass={w=inner+PAD*2,h=(S.LINES+2)*Font.line+PAD*2+6}
    local w=glass.w+CASE*2
    local h=glass.h+CASE+12+26         -- lid above the glass, keypad and lip below
    return {scale=scale,glass=glass,w=w*scale,h=h*scale}
end

function Screen:new(owner)
    local scale=S.scale or 2
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

-- Text, letter by letter, from the device's own alphabet.
function Screen:text(value,x,y,colour)
    local scale=self.scale
    local cursor=x
    for i=1,#value do
        local code=string.byte(value,i)
        if code>=Font.first and code<=Font.last then
            local width=Font.w[code-Font.first+1]*scale
            local texture=glyph(code,scale)
            if texture then
                self:drawTextureScaled(texture,cursor,y,width,Font.line*scale,1,colour[1],colour[2],colour[3])
            end
            cursor=cursor+width
        end
    end
    return cursor-x
end

-- Four round buttons with a rocker between them, spaced across the foot of the
-- case: the arrangement on the shell the owner drew.
function Screen:buttons()
    local s=self.scale
    local m=S.metrics(s)
    local width=m.w/s
    local row=m.h/s-17
    local b=12                              -- button
    local out={}
    -- Two buttons, the rocker, two buttons - measured in from each edge so the
    -- pair on the right never walks off the case.
    local left={CASE,CASE+b+6}
    local right={width-CASE-b-b-6,width-CASE-b}
    local names={"MODE","PREV","NEXT","INDEX"}
    local xs={left[1],left[2],right[1],right[2]}
    for i=1,4 do out[#out+1]={id=names[i],x=xs[i]*s,y=row*s,w=b*s,h=b*s} end
    local rx=(width-24)/2
    out[#out+1]={id="UP",x=rx*s,y=row*s,w=24*s,h=5*s}
    out[#out+1]={id="DOWN",x=rx*s,y=(row+7)*s,w=24*s,h=5*s}
    out[#out+1]={id="POWER",x=(CASE+1)*s,y=3*s,w=12*s,h=5*s}
    return out
end

function Screen:prerender()
    local s=self.scale
    local m=S.metrics(s)
    -- Case.
    self:drawRect(0,0,self.width,self.height,1,SHELL[1],SHELL[2],SHELL[3])
    self:drawRectBorder(0,0,self.width,self.height,1,SHELL_EDGE[1],SHELL_EDGE[2],SHELL_EDGE[3])
    -- Power light, beside the power button.
    local led=self.on and LED_ON or LED_OFF
    self:drawRect((CASE+16)*s,3*s,5*s,5*s,1,led[1],led[2],led[3])
    self:drawRectBorder((CASE+16)*s,3*s,5*s,5*s,1,SHELL_EDGE[1],SHELL_EDGE[2],SHELL_EDGE[3])
    -- Glass.
    local gx,gy=CASE*s,12*s
    local glass=self.lamp and GLASS_LIT or GLASS
    self:drawRect(gx,gy,m.glass.w*s,m.glass.h*s,1,glass[1],glass[2],glass[3])
    self:drawRectBorder(gx,gy,m.glass.w*s,m.glass.h*s,1,SHELL_EDGE[1],SHELL_EDGE[2],SHELL_EDGE[3])
    if self.on then self:draw(gx+PAD*s,gy+PAD*s,m.glass.w*s-PAD*2*s) end
    -- Keypad.
    local now=getTimeInMillis and getTimeInMillis() or 0
    for _,b in ipairs(self:buttons()) do
        local held=self.pressed[b.id] and now-self.pressed[b.id]<S.PRESS_MS
        local y=held and b.y+math.max(1,s/2) or b.y
        local c=held and SHELL_EDGE or SHELL_DEEP
        self:drawRect(b.x,y,b.w,b.h,1,c[1],c[2],c[3])
        self:drawRectBorder(b.x,y,b.w,b.h,1,SHELL_EDGE[1],SHELL_EDGE[2],SHELL_EDGE[3])
    end
end

-- What the glass says. Never clickable, never hovering: it is a display.
function Screen:draw(x,y,width)
    local s=self.scale
    local line=Font.line*s
    local rows=self:rows()
    local entry=rows[self.entry]
    local top=({evidence="EV",journal="JN",places="PL"})[self.section] or "EV"
    local right=self.index and (#rows.." ENTRIES") or ("#"..self.entry.." CARD "..self.card.."/"..math.max(1,entry and #entry.cards or 1))
    self:text(top,x,y,INK_DIM)
    local rw=measure(right,s)
    self:text(right,x+width-rw,y,INK_DIM)
    local body=y+line+2*s
    if self.index then
        for i,row in ipairs(rows) do
            if i>S.LINES then break end
            local mark=i==self.entry and ">" or " "
            self:text(mark..i.." "..(row.title or ""),x,body+(i-1)*line,i==self.entry and INK or INK_DIM)
        end
    elseif entry then
        local card=entry.cards[self.card] or {}
        for i,text in ipairs(card) do
            self:text(text,x,body+(i-1)*line,i==1 and INK or (i==2 and INK_DIM or INK))
        end
    else
        self:text("NOTHING RECORDED YET",x,body,INK_DIM)
    end
    local legend=self.index and "MODE  < >  INDEX BACK" or "^ v TEXT   < > ENTRY   INDEX"
    self:text(legend,x,y+(S.LINES+1)*line+4*s,INK_DIM)
end

-- Rows come from the notebook's own projection: one store, two surfaces.
function Screen:rows()
    if self.cachedRows then return self.cachedRows end
    local out={}
    local runtime=ConspiracyFiles.GeneratedRuntime
    local known=runtime and runtime.known and safe(runtime.known) or {}
    for _,row in ipairs(known) do
        local cards,current={},{}
        local title=tostring(row.title or "")
        current[#current+1]=title
        if row.summary then current[#current+1]=tostring(row.summary) end
        for word in tostring(row.detailText or ""):gmatch("[^\n]+") do
            if #current>=S.LINES then cards[#cards+1]=current; current={} end
            current[#current+1]=word
        end
        if #current>0 then cards[#cards+1]=current end
        out[#out+1]={title=title,cards=cards}
    end
    self.cachedRows=out
    return out
end

function Screen:press(id)
    self.pressed[id]=getTimeInMillis and getTimeInMillis() or 0
    safe(function() getSoundManager():playUISound("UIActivateButton") end)
    local rows=self:rows()
    if id=="POWER" then
        self.on=not self.on
        if not self.on then self.lamp=false end
    elseif not self.on then
        return
    elseif id=="MODE" then
        self.section=({evidence="journal",journal="places",places="evidence"})[self.section]
        self.entry,self.card,self.index=1,1,false
    elseif id=="INDEX" then
        self.index=not self.index
    elseif id=="PREV" then
        self.entry=math.max(1,self.entry-1); self.card=1
    elseif id=="NEXT" then
        self.entry=math.min(math.max(1,#rows),self.entry+1); self.card=1
    elseif id=="UP" then
        self.card=math.max(1,self.card-1)
    elseif id=="DOWN" then
        local entry=rows[self.entry]
        self.card=math.min(entry and #entry.cards or 1,self.card+1)
    end
    log("organiser key "..id)
end

function Screen:onMouseDown(x,y)
    self.downAt=getTimeInMillis and getTimeInMillis() or 0
    for _,b in ipairs(self:buttons()) do
        if x>=b.x and x<=b.x+b.w and y>=b.y and y<=b.y+b.h then self.down=b.id; return true end
    end
    self.down=nil
    return ISPanel.onMouseDown(self,x,y)
end

function Screen:onMouseUp(x,y)
    local id=self.down
    self.down=nil
    if not id then return ISPanel.onMouseUp(self,x,y) end
    local held=(getTimeInMillis and getTimeInMillis() or 0)-(self.downAt or 0)
    -- A held POWER is the lamp, the way a real one worked.
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
    if key==Keyboard.KEY_L then self.lamp=not self.lamp; log("organiser lamp "..tostring(self.lamp)); return end
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
    S.scale=(scale==3 or scale==2) and scale or (S.scale==2 and 3 or 2)
    if S.window then S.close(); S.open() end
    return S.scale
end

return S
