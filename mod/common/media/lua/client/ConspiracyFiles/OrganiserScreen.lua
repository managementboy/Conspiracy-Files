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
local Case=require("ConspiracyFiles/Generated/OrganiserCase")
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
-- The glass is the original's own 160 x 160, so how much fits is measured, not
-- chosen: the title bar takes a line, the command line takes one with a rule
-- above it, and the rest is the document. Wrapping is by pixel width, because
-- this face is proportional - an "i" is two pixels and an "m" is eight.
local PADX,PADY=3,2               -- Palm's own rule: one or two pixels, no more
function S.lines() return math.floor((Case.glass.h-PADY*2)/Font.line)-3 end
function S.textWidth() return Case.glass.w-PADX*2-7 end   -- 7 px kept for the scroll arrows
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
    return {scale=scale,glass=Case.glass,w=Case.w*scale,h=Case.h*scale}
end

local art={}
local function texture(name,scale)
    local key=name..scale
    local hit=art[key]
    if hit~=nil then return hit or nil end
    local t=getTexture and safe(getTexture,"media/ui/CFOrg/"..name.."_"..scale.."x.png")
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
    local out={}
    for _,b in ipairs(Case.buttons) do
        out[#out+1]={id=b.id,x=b.x*s,y=b.y*s,w=b.w*s,h=b.h*s,round=b.round,nx=b.x,ny=b.y}
    end
    return out
end

function Screen:prerender()
    local s=self.scale
    local case=texture("case",s)
    if case then
        self:drawTextureScaled(case,0,0,Case.w*s,Case.h*s,1,1,1,1)
    else
        -- No art: a flat shell is ugly but readable, and a missing texture must
        -- never cost the player their notes.
        self:drawRect(0,0,self.width,self.height,1,SHELL[1],SHELL[2],SHELL[3])
        self:drawRect(Case.glass.x*s,Case.glass.y*s,Case.glass.w*s,Case.glass.h*s,1,GLASS[1],GLASS[2],GLASS[3])
    end
    -- The lamp warms the glass.
    if self.on and self.lamp then
        self:drawRect(Case.glass.x*s,Case.glass.y*s,Case.glass.w*s,Case.glass.h*s,0.55,GLASS_LIT[1],GLASS_LIT[2],GLASS_LIT[3])
    end
    -- The light beside the power key, lit only while the screen is on.
    if self.on then
        local led=texture("led",s)
        if led then self:drawTextureScaled(led,Case.led.x*s,Case.led.y*s,Case.led.d*s,Case.led.d*s,1,1,1,1)
        else self:drawRect(Case.led.x*s,Case.led.y*s,Case.led.d*s,Case.led.d*s,1,LED_ON[1],LED_ON[2],LED_ON[3]) end
    end
    -- A key that was just hit sinks and darkens for a moment.
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
    if self.on then
        self:draw((Case.glass.x+PADX)*s,(Case.glass.y+PADY)*s,(Case.glass.w-PADX*2)*s)
    end
end

-- What the glass says, in the shape Palm OS used: a dark title bar naming the
-- view with the record count on the right, the body filling the width to the
-- edge, scroll arrows in the right margin, and the commands along the foot.
-- (Palm OS User Interface Guidelines; users.fuw.edu.pl/~michalj/palmos.)
function Screen:draw(x,y,width)
    local s=self.scale
    local line=Font.line*s
    local rows=self:rows()
    local entry=rows[self.entry]
    local view=({evidence="EVIDENCE",journal="JOURNAL",places="PLACES"})[self.section] or "EVIDENCE"
    -- Title bar: dark, full width, light letters.
    self:drawRect(x-PADX*s,y,width+PADX*2*s,line,1,INK[1],INK[2],INK[3])
    self:text(view,x,y,GLASS)
    local count=#rows>0 and (self.entry.." of "..#rows) or "empty"
    self:text(count,x+width-measure(count,s),y,GLASS)
    local body=y+line+math.floor(s/2)
    local room=S.lines()
    if self.index then
        local first=math.max(1,math.min(self.entry-math.floor(room/2),#rows-room+1))
        if first<1 then first=1 end
        for i=0,room-1 do
            local row=rows[first+i]
            if not row then break end
            local selected=(first+i)==self.entry
            local label=(first+i)..". "..row.title
            if selected then self:drawRect(x-PADX*s,body+i*line,width+PADX*2*s,line,1,INK[1],INK[2],INK[3]) end
            self:text(label,x,body+i*line,selected and GLASS or INK)
        end
        if first>1 then self:text("^",x+width-measure("^",s),body,INK_DIM) end
        if first+room-1<#rows then self:text("v",x+width-measure("v",s),body+(room-1)*line,INK_DIM) end
    elseif entry then
        local card=entry.cards[self.card] or {}
        for i,text in ipairs(card) do
            if i>room then break end
            self:text(text,x,body+(i-1)*line,i<=(self.card==1 and entry.head or 0) and INK or INK)
        end
        -- Scroll arrows in the right margin, exactly where Palm put them.
        if self.card>1 then self:text("^",x+width-measure("^",s),body,INK_DIM) end
        if self.card<#entry.cards then self:text("v",x+width-measure("v",s),body+(room-1)*line,INK_DIM) end
    else
        self:text("Nothing recorded yet.",x,body,INK_DIM)
    end
    -- Command line at the foot: the four keys, named as they are on the case.
    local foot=y+(room+1)*line+math.floor(s/2)
    self:drawRect(x-PADX*s,foot,width+PADX*2*s,1*s,1,INK_DIM[1],INK_DIM[2],INK_DIM[3])
    local legend=self.index and "LIST: open   PREV/NEXT: move" or "LIST: all   ^v: page"
    self:text(legend,x,foot+2*s,INK_DIM)
end

-- Rows come from the notebook's own projection: one store, one set of rows,
-- two surfaces. The screen only decides how many fit on the glass.
-- Wrap to the glass in PIXELS. Counting characters is wrong for a proportional
-- face: "Illinois" and "McCoy Logging" are the same length and not the same
-- width.
local function wrap(text,width,out)
    for paragraph in (tostring(text).."\n"):gmatch("([^\n]*)\n") do
        if paragraph=="" then
            if #out>0 and out[#out]~="" then out[#out+1]="" end
        else
            local line=""
            for word in paragraph:gmatch("%S+") do
                local candidate=line=="" and word or (line.." "..word)
                if Font.width(candidate,1)<=width then line=candidate
                else
                    if line~="" then out[#out+1]=line end
                    line=word
                end
            end
            if line~="" then out[#out+1]=line end
        end
    end
    return out
end

function Screen:rows()
    if self.cachedRows then return self.cachedRows end
    local out={}
    local ui=ConspiracyFiles.NotebookUI
    local rows=(ui and ui.generatedRows and safe(ui.generatedRows,self.section=="journal" and "journal" or "evidence")) or {}
    for _,row in ipairs(rows) do
        if not row.cfHeading then
            -- The window's own furniture stays in the window: its filing line
            -- ("Dispatch document - Discovery 1 - Case LD-340") and its block
            -- headings are bookkeeping, and a pocket screen has no room for
            -- bookkeeping. Title, then what the survivor actually wrote.
            local lines={}
            wrap(row.title or "",S.textWidth(),lines)
            local head=#lines
            for paragraph in (tostring(row.detailText or "").."\n\n"):gmatch("(.-)\n\n") do
                local heading=paragraph:match("^(%u[%u%s]+)\n")
                local text=heading and paragraph:sub(#heading+2) or paragraph
                if text and text:find("%S") then wrap(text,S.textWidth(),lines); lines[#lines+1]="" end
            end
            while lines[#lines]=="" do lines[#lines]=nil end
            local cards,card={},{}
            for i,line in ipairs(lines) do
                card[#card+1]=line
                if #card>=S.lines() or i==#lines then cards[#cards+1]=card; card={} end
            end
            out[#out+1]={title=tostring(row.title or ""),head=head,cards=cards}
        end
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
        self.cachedRows=nil
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
    if scale==2 or scale==3 or scale==4 then S.scale=scale
    else S.scale=((S.scale or S.fit())%4)+1; if S.scale<2 then S.scale=2 end end
    if S.window then S.close(); S.open() end
    return S.scale
end

return S
