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
--   MENU  (button 1)  the programs; and it wakes a sleeping machine.
--   MENU, held         the lamp, as a real Palm's backlight was.
--   UP    (button 2)  the line above, or the page above inside a record.
--   DOWN  (button 3)  the line below, or the page below.
--   BACK  (button 4)  out of a record, then out to the programs.
--
-- There is no power tab. The owner's case does not draw one (2026-09-13), so
-- there is not one: MENU wakes the machine and three idle minutes switch it
-- off. A control the case does not have is a lie about the object.
--   NEXT   (button 3)  the record after.
--   LIST   (button 4)  open the selected record, or back out of one.
-- Keys mirror them for a player whose hand is on WASD: arrows, M, I, L, and
-- Escape to close. The stylus does all of it by tapping.
local CFLog=require("ConspiracyFiles/Log")
local Font=require("ConspiracyFiles/Generated/OrganiserFont")
local FG=require("Fieldnote/Geometry")
require("Fieldnote/Panel")
-- The case is the Fieldnote device, drawn from its design manifest with
-- native rectangles - no picture, no art pipeline (P4-R87..R89). A Case-shaped
-- view of it so the rest of this file keeps speaking in the same terms the
-- bitmap shell taught it: device units, multiplied by a whole-number scale.
local Case={w=FG.device.w,h=FG.device.h,
            glass={x=FG.lcd.x,y=FG.lcd.y,w=FG.lcd.w,h=FG.lcd.h},
            buttons={}}
for _,ctl in ipairs(FG.controls) do
    Case.buttons[#Case.buttons+1]={id=ctl.id,x=ctl.x,y=ctl.y,w=ctl.w,h=ctl.h,action=ctl.action}
end
local K=require("ConspiracyFiles/KnoxUI")
local Apps=require("ConspiracyFiles/KnoxApps")
require("ISUI/ISPanel")
ConspiracyFiles=ConspiracyFiles or {}
local S=ConspiracyFiles.OrganiserScreen or {}
ConspiracyFiles.OrganiserScreen=S

local function log(message) CFLog.message("casefile","note",message) end
local function safe(fn,...) local ok,v=pcall(fn,...) if ok then return v end end

-- The case WAS a picture, because a shell drawn in code came out as grey
-- plates (owner, 2026-09-12: "that looks nothing like your or my mockup ...
-- All sqare"). The Fieldnote design solved that properly - stepped bevels,
-- highlights above and left, shadows below and right - so the shell is
-- rectangles again and the SVG-to-four-PNG-exports pipeline is gone.
-- Geometry comes from the design manifest and is generated, never
-- transcribed: tools/fieldnote-test/build_fieldnote.py is the only way the
-- device changes.
--
-- TWO SIZE CONTROLS, INDEPENDENT (P4-R89). `scale` is how big the DEVICE is
-- drawn; `fontSize` is how big the player wants the TEXT, as a real Palm's
-- font selector did. The glyph set used is the product of the two, so the
-- amount of text on screen depends only on fontSize and the device scale only
-- changes how big the whole thing is. Both step in whole numbers: a
-- fractional scale would soften the pixel face and misalign the housing,
-- which is the exact problem this rebuild exists to escape.
S.HOLD_MS=450                     -- how long a held MENU becomes the lamp
S.PRESS_MS=110                    -- how long a button shows as pressed
-- Auto-off. Every Palm did this, and for the reason this machine needs it:
-- the cells are the scarce thing. Real seconds, not game hours, because it is
-- the player who has stopped touching it. Any key wakes it again.
-- Three minutes: the longest a Palm would let you set, chosen because reading
-- one long record is a perfectly normal thing to spend two minutes doing and
-- having the machine die in your hand for it is not realism, it is a bug with
-- an excuse.
S.AUTO_OFF_MS=180000

-- What each physical button does, and what is printed under it. One table, so
-- a button can never be relabelled without its behaviour changing with it.
-- The labels belong in the case ART (art/organiser-case.svg, exported to
-- art/organiser-case-1x..4x.png, then tools/build_organiser_case.py),
-- silkscreened like the real machine's, not
-- drawn over it in the LCD typeface. That first attempt was rejected on sight
-- and rightly (owner, 2026-09-13: "extremely ugly. remove."). The mapping
-- stays here; the words go in the artwork the owner is drawing.
-- The one input map. Fieldnote control ids on the left, Knox.OS verbs on the
-- right (P4-R87): HOME and BACK on the outer keys, the rocker taking up and
-- down, and the two inner keys deliberately absent - they depress, they log,
-- and they do nothing until play shows what they are for. A key with no entry
-- here still wakes the machine, because every hardware key did on a Palm.
--
-- MODE/PREV/NEXT/INDEX stay as aliases: they are what the keyboard mirror and
-- the checks press, and they cost one table entry each.
S.ACTION={C09="MENU",C12="BACK",rocker_up="UP",rocker_down="DOWN",
          MODE="MENU",PREV="UP",NEXT="DOWN",INDEX="BACK",UP="UP",DOWN="DOWN"}

-- Palm III colours: a graphite case, a near-black surround, and the grey-green
-- LCD. Only the glass is green.
-- The shell's own colours are the manifest's now; only the lamp is still
-- painted from here, because it is light on the glass rather than hardware.
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

-- The player's font size, as a multiplier on the machine's own pixels. Three,
-- like a Palm's. Medium is the size this face was actually cut for; small is
-- the dense setting and large is for reading at arm's length.
S.FONT_SIZES={{id="small",label="Small",mult=1},
              {id="medium",label="Medium",mult=2},
              {id="large",label="Large",mult=3}}
S.FONT_DEFAULT=2
S.fontSize=S.fontSize or S.FONT_DEFAULT

-- Both size choices are the player's PREFERENCE, so they live in the machine
-- and survive a reload. The device scale never used to persist and reset to
-- whatever fit the screen on every load, which is tolerable for a thing you
-- set once and forget and not for one you can drag.
local PREFS="ConspiracyFilesOrganiserPrefs"
local function prefsStore()
    return ModData and safe(ModData.getOrCreate,PREFS)
end
function S.loadPrefs()
    local root=prefsStore(); if not root then return end
    if type(root.scale)=="number" and root.scale>=1 and root.scale<=S.MAX then
        S.scale=math.floor(root.scale)
    end
    if type(root.fontSize)=="number" and S.FONT_SIZES[root.fontSize] then
        S.fontSize=math.floor(root.fontSize)
    end
end
function S.savePrefs()
    local root=prefsStore(); if not root then return end
    root.scale=S.scale; root.fontSize=S.fontSize
end

-- The glyph set a given device scale and font size land on. Every product of
-- 1..3 and 1..3 is generated (tools/build_palm_font.py SCALES), so this is
-- always a whole number with pictures behind it.
function S.typeScale(scale,fontSize)
    local f=S.FONT_SIZES[fontSize or S.FONT_DEFAULT] or S.FONT_SIZES[S.FONT_DEFAULT]
    return scale*f.mult
end

local art={}
-- A program icon, at a path that already carries its own scale
-- (icons/3x/files.png). The case used to come through here too, as
-- case_3x.png; the shell is rectangles now and has no pictures.
local function texture(name)
    local hit=art[name]
    if hit~=nil then return hit or nil end
    local t=getTexture and safe(getTexture,"media/ui/CFOrg/"..name..".png")
    art[name]=t or false
    return t
end

-- Palm's own guidance is to use the whole screen: "go to the edge". The device
-- therefore takes about four fifths of the window's height, at a whole-number
-- scale so the pixels stay square. ZOOM steps it down for anyone who wants the
-- game visible behind it.
-- How much of the screen the machine should take up. It was 0.86, which on a
-- 4K display picks 3x and draws a 915 x 1332 organiser - most of the screen
-- height for a thing that is meant to fit in a pocket, and several times the
-- size of the game's own radio panel beside it (owner screenshot, 2026-09-13).
-- Half the height is a device you hold, not a window you live in.
S.FILL=0.5
-- Three, because the type is drawn at scale x fontSize and 3 x 3 = 9 is the
-- largest glyph set generated. A fourth device size would need 12x pictures
-- and would not fit a 4K screen anyway.
S.MAX=3
-- `height` is for the checks, which must be able to ask what this picks for a
-- screen they are not running on. It defaulted to the real screen and the
-- check reimplemented the formula instead, which is how it came to still be
-- asserting the old rounding after the rounding changed.
function S.fit(height)
    local h=tonumber(height) or (getCore and getCore():getScreenHeight()) or 720
    -- The largest whole size that is at most FILL of the screen height. This
    -- looked like a bug worth fixing - 1894 x 0.5 / 620 is 1.53 and flooring
    -- it opens the device at 620px on a 4K screen, a third of the height - but
    -- rounding to nearest gives 1240px, 65% of that screen, and the owner
    -- rejected 1332px (70%) as far too big for a thing meant to fit in a
    -- pocket. There is no whole size that lands near half on that screen: it
    -- is 33% or 65%. So the rule stands as the owner set it, and the DEFAULT
    -- is his open question - he now has a control that persists.
    local want=math.floor(h*S.FILL/Case.h)
    if want<1 then want=1 elseif want>S.MAX then want=S.MAX end
    -- Never taller than the window it opens in, whatever the rounding wanted.
    while want>1 and Case.h*want>h*0.95 do want=want-1 end
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
    o.fontSize=S.fontSize or S.FONT_DEFAULT
    o.section="evidence"
    o.entry=1
    o.card=1
    o.index=false
    -- The machine comes up on its Applications screen, as a Palm did. It used
    -- to open straight into FILES, which meant the icon grid - the only thing
    -- that says what the programs ARE - was somewhere you had to already know
    -- how to reach (owner, 2026-09-13).
    o.launcher=true
    o.on=true
    o.lamp=false
    o.touched=getTimeInMillis and getTimeInMillis() or 0
    o.pressed={}
    o.moveWithMouse=true
    return o
end

function Screen:initialise() ISPanel.initialise(self); self:setWantKeyEvents(true) end

-- Where the LCD is on the window, and how many of the machine's own pixels
-- fit on it at the player's font size. Everything Knox.OS draws is in those
-- pixels; everything the case draws is in device pixels. This is the one
-- place the two meet.
function Screen:lcd()
    local s=self.scale
    local t=S.typeScale(s,self.fontSize)
    return {x=Case.glass.x*s,y=Case.glass.y*s,
            w=math.floor(Case.glass.w*s/t),h=math.floor(Case.glass.h*s/t),t=t}
end

-- The size grip: the bottom-right corner of the case. Nothing is DRAWN there
-- - the design has no grip component and inventing hardware it does not have
-- is how the old case ended up with a power tab off the edge of the picture -
-- so SETUP and HELP both say the corner drags, and SETUP steps it on a tap for
-- anyone who never tries.
function Screen:grip()
    local s=self.scale
    local g=14*s
    return {x=Case.w*s-g,y=Case.h*s-g,w=g,h=g}
end

-- The control being held right now, for the case's pressed colours.
function Screen:heldControl()
    local now=getTimeInMillis and getTimeInMillis() or 0
    for id,at in pairs(self.pressed) do
        if now-at<S.PRESS_MS then return id end
    end
    return nil
end

function Screen:buttons()
    local s=self.scale
    local out={}
    for _,b in ipairs(Case.buttons) do
        out[#out+1]={id=b.id,x=b.x*s,y=b.y*s,w=b.w*s,h=b.h*s,round=b.round}
    end
    return out
end

-- The charge, read at most once a second. It was read TWICE per frame - the
-- footer's low warning and the launcher's battery both walked the whole
-- inventory looking for the device, every frame, on every screen. That is the
-- exact cost the five retry loops were stripped out for on 2026-09-12, put
-- back by the battery warning on 2026-09-13. A cell does not move in a frame.
function Screen:charge()
    local now=getTimeInMillis and getTimeInMillis() or 0
    if self.chargeAt and now-self.chargeAt<1000 then return self.chargeValue end
    local organiser=ConspiracyFiles.Organiser
    local item=organiser and organiser.held and safe(organiser.held)
    self.chargeValue=item and organiser.power and safe(organiser.power,item)
    self.chargeAt=now
    return self.chargeValue
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
    local charge=self:charge()
    if charge~=nil and charge>0 and charge<(organiser and organiser.LOW_POWER or 0) then
        return "BATTERY LOW"
    end
    return hint
end

-- Leaving the boot screen, by any of the three ways out of it: START, a tap,
-- or any key. All three land on the Applications screen, because "it finished
-- booting, now what?" should be answered by the icons rather than by dropping
-- the player into one program with no way of knowing the others exist.
function Screen:finishBoot()
    self.booting=false
    self.launcher=true
    self.record=nil
    self.entry,self.card,self.cachedList=1,1,nil
    self:bootSeen()
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

-- A machine with no cell in it is off. Checked on the cached once-a-second
-- read, not per frame: pulling the battery out used to leave the screen lit
-- because power was only ever looked at when the device was picked up or woken
-- (owner, 2026-09-13: "removing the battery does not shutt off our pda").
function Screen:powerCheck()
    if not self.on then return end
    local organiser=ConspiracyFiles.Organiser
    if not organiser or not organiser.hasCell then return end
    -- charge() is the throttle: it refreshes at most once a second and caches
    -- the item it found, so this costs nothing between reads.
    self:charge()
    local item=safe(organiser.held)
    if item and safe(organiser.hasCell,item)==false then
        self.on=false
        self.lamp=false
        log("organiser off: no cell")
    end
end

function Screen:prerender()
    self:idleCheck()
    self:powerCheck()
    local s=self.scale
    -- The whole shell, including its keys and their pressed faces, drawn from
    -- the design manifest. The LCD comes out of this as a filled rectangle,
    -- and Knox.OS draws over it below.
    Fieldnote.Panel.render(self,s,self:heldControl())
    if self.on and self.lamp then
        self:drawRect(Case.glass.x*s,Case.glass.y*s,Case.glass.w*s,Case.glass.h*s,0.55,GLASS_LIT[1],GLASS_LIT[2],GLASS_LIT[3])
    end
    -- No power light: the screen says whether it is on, which is how you can
    -- tell with any real machine (owner, 2026-09-12). A held key darkens its
    -- own face through the manifest's pressed colours, so there is no longer a
    -- separate pressed-button picture drawn on top of the shell.
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

-- The category a program is filtered by, per program, remembered while the
-- machine is on. Palm kept the category you left an application in.
function Screen:category(program)
    program=program or self:program()
    if not program or not program.filters then return nil end
    local names=safe(program.filters) or {}
    if #names==0 then return nil end
    self.categories=self.categories or {}
    local at=self.categories[program.id] or 1
    if at<1 or at>#names then at=1 end
    return names[at],names,at
end

function Screen:cycleCategory()
    local program=self:program()
    local current,names,at=self:category(program)
    if not current then return end
    self.categories[program.id]=(at%#names)+1
    self.entry,self.card,self.cachedList=1,1,nil
end

function Screen:list()
    if self.cachedList then return self.cachedList end
    local program=self:program()
    self.cachedList=(program.list and safe(program.list,self:category(program))) or {}
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
    local l=self:lcd()
    local c=K.begin(self,l.t,gx,gy,l.w,l.h)
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
        local y=K.status(c,nil,"All",self:charge())
        -- No record counts on the icons. Palm's launcher never showed any, and
        -- working them out means asking every program to read its whole store -
        -- which the fault check caught as an address lookup retrying forever,
        -- first every frame and then, after a cache, every second (suite,
        -- 2026-09-12). An icon and its name cost nothing.
        K.grid(c,self:programs(),y+2,self.app or 1,
            function(name) return texture("icons/"..self:lcd().t.."x/"..name) end)
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
            -- A field was capped at two lines and simply stopped, so a longer
            -- one ended mid-sentence with nothing to show it had (owner,
            -- 2026-09-13: "maybe some text got cut off?"). Four lines now, and
            -- when it still does not fit, it SAYS so with an ellipsis rather
            -- than pretending that was the whole fact.
            local LINES=4
            local value=wrapTo(field.value,c.w-38)
            for i,text in ipairs(value) do
                if i>LINES then break end
                if i==LINES and #value>LINES then
                    -- Trim a little to make room for the mark.
                    while K.width(text.."...")>c.w-38 and #text>0 do text=text:sub(1,-2) end
                    text=text.."..."
                end
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
    if self.writer then
        K.titleBar(c,program.title,nil)
        self:drawNote(c)
        return
    end
    -- A calendar program draws a month, not a list of rows (owner,
    -- 2026-09-13: "this should look like a calendar app").
    if program.calendar and program.month then
        local _,names,at=self:category(program)
        local month=safe(program.month,at or 1)
        if month then
            local y=K.titleBar(c,program.title,month.label,names and names[at or 1])
            local after=K.month(c,y+1,month.length,month.first,month.days,month.today,self.day)
            local count=0
            for _ in pairs(month.days or {}) do count=count+1 end
            if count==0 then
                K.text(c,"Nothing found this month.",2,after+2,K.DIM)
            else
                K.text(c,"Tap a marked day.",2,after+2,K.DIM)
            end
            K.foot(c,self:footText("MENU: programs"))
            return
        end
    end
    K.titleBar(c,program.title,#rows>0 and (self.entry.." of "..#rows) or "empty",
        self:category(program))
    local top=math.max(1,math.min(self.entry-math.floor(room/2),#rows-room+1))
    if top<1 then top=1 end
    if #rows==0 then K.text(c,"Nothing recorded yet.",2,line+2,K.DIM) end
    for i=0,room-1 do
        local row=rows[top+i]
        if not row then break end
        K.row(c,row.label,line+2+i*line,(top+i)==self.entry,"ROW",top+i)
    end
    K.arrows(c,line+2,room*line,top>1,top+room-1<#rows)
    -- The hint named keys this machine has never had: VIEW and LIST were the
    -- mapping before the buttons were MENU/UP/DOWN/BACK, and it was still on
    -- screen a version later (owner screenshot, 2026-09-13).
    K.foot(c,self:footText("MENU: programs   tap: open"))
end

function Screen:openRow(index)
    local rows=self:list()
    local row=rows[index]
    if not row then return end
    self.entry=index
    if row.todo and row.index then
        Apps.tickToDo(row.index); self.cachedList=nil
    elseif row.setup=="text" then
        S.stepFont(1)
    elseif row.setup=="machine" then
        S.step(S.scale>=S.MAX and -(S.MAX-1) or 1)
    else
        self.record=row; self.record.index=index; self.card=1
    end
end

function Screen:press(id)
    self:touch()
    self.pressed[id]=getTimeInMillis and getTimeInMillis() or 0
    safe(function() getSoundManager():playUISound("UIActivateButton") end)
    -- Asleep: any hardware key wakes it, exactly as the four application keys
    -- woke a Palm, and the press is spent on waking. Before this, a machine
    -- that had switched itself off ate every key and every tap in silence,
    -- which is the worst thing an input can do (knox check, 2026-09-13: the
    -- whole device went unresponsive mid-run and nothing said why).
    if not self.on then
        self.on=true
        -- Waking is the moment a fresh cell is noticed, and the moment the
        -- player is looking at the screen to be told about it. It is also the
        -- only way back on now that the case has no power tab.
        local organiser=ConspiracyFiles.Organiser
        if organiser and organiser.checkPower then safe(organiser.checkPower) end
        log("organiser wake: "..id)
        return
    end
    -- Any key leaves the boot screen. A machine that has finished booting and
    -- still insists you press the one button it is showing is a machine that
    -- annoys people (knox check, 2026-09-12: every tap landed on nothing
    -- because the boot screen was still up).
    if self.booting then self:finishBoot(); return end
    local rows=self:list()
    -- Four buttons, four verbs, nothing overloaded. They used to jump straight
    -- to FILES, NAMES, DATES and TO DO, which is what a Palm's four keys did -
    -- but a Palm PRINTED them on the case and this one did not, so the owner
    -- was left guessing what each button was for (owner, 2026-09-13). Labelled
    -- on the case below, and reduced to the set that makes the whole device
    -- usable without the stylus: Menu to go anywhere, Up and Down to read,
    -- Back to retreat. That keeps the design's own promise - "page with the
    -- keys, aim with the stylus" - which the program-jump mapping never did.
    local action=S.ACTION[id]
    -- Any navigation abandons a half-written note. It used to be a child of
    -- the whole screen, so it stayed on top of whatever you moved to.
    if action and self.writer then self:finishNote(false) end
    if action=="MENU" then
        self.launcher=true; self.record=nil; self.card=1
    elseif action=="BACK" then
        -- One step, and only one: out of a record to its list, out of a list
        -- to the programs. The launcher is the top, so Back stops there.
        if self.record then self.record=nil; self.card=1
        elseif not self.launcher then self.launcher=true end
    elseif action=="UP" then
        if self.record then self.card=math.max(1,self.card-1)
        else self.entry=math.max(1,self.entry-1) end
    elseif action=="DOWN" then
        if self.record then self.card=self.card+1
        else self.entry=math.min(math.max(1,#rows),self.entry+1) end
    end
    log("knox key "..id)
end

-- The stylus: whatever widget is under the tap.
function Screen:tap(x,y)
    self:touch()
    if self.booting then
        self:finishBoot()
        safe(function() getSoundManager():playUISound("UIActivateButton") end)
        return
    end
    local widget=self.context and K.at(self.context,x,y)
    if not widget then return end
    safe(function() getSoundManager():playUISound("UIActivateButton") end)
    local id=widget.id
    if self.writer and id~="NOTE_DONE" and id~="NOTE_CANCEL" then
        self:finishNote(false)
    end
    if id=="APP" then
        self.app=widget.payload; self.launcher=false; self.record=nil
        self.entry,self.card,self.cachedList=1,1,nil
    elseif id=="DAY" then
        local program=self:program()
        if program and program.day then
            local _,_,at=self:category(program)
            self.day=widget.payload
            self.record=safe(program.day,at or 1,widget.payload)
            self.card=1
        end
    elseif id=="CATEGORY" then self:cycleCategory()
    elseif id=="SELECT" then self.launcher=true; self.record=nil
    elseif id=="ROW" then
        if self.launcher then self.app=widget.payload; self.launcher=false; self.cachedList=nil; self.entry=1
        else
            local row=self:list()[widget.payload]
            if row and row.write then self:writeNote() else self:openRow(widget.payload) end
        end
    elseif id=="NOTE_DONE" then self:finishNote(true)
    elseif id=="NOTE_CANCEL" then self:finishNote(false)
    elseif id=="BACK" then self.record=nil; self.card=1; self.day=nil
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
        self:finishBoot()
    elseif id=="UP" then self:press("UP")
    elseif id=="DOWN" then self:press("DOWN") end
    log("knox tap: "..tostring(id))
end

function Screen:onMouseDown(x,y)
    self.downAt=getTimeInMillis and getTimeInMillis() or 0
    local g=self:grip()
    if x>=g.x and y>=g.y and x<g.x+g.w and y<g.y+g.h then
        self.resizing={scale=self.scale,dy=0}
        self.down="GRIP"
        return true
    end
    for _,b in ipairs(self:buttons()) do
        -- Half-open, exactly as the manifest states it: a pixel on the far
        -- edge belongs to whatever is next, not to this key.
        if x>=b.x and x<b.x+b.w and y>=b.y and y<b.y+b.h then self.down=b.id; return true end
    end
    local s=self.scale
    local gx,gy=Case.glass.x*s,Case.glass.y*s
    if self.on and x>=gx and y>=gy and x<Case.glass.x*s+Case.glass.w*s and y<Case.glass.y*s+Case.glass.h*s then
        self.down="GLASS"; return true
    end
    self.down=nil
    return ISPanel.onMouseDown(self,x,y)
end

-- Dragging the corner. The corner follows the pointer and the size SNAPS to a
-- whole multiple, because a fractional scale softens the pixel face and
-- misaligns the housing - the exact problem the rebuild exists to escape
-- (P4-R89). So it reads as a window you pull, and it clicks between sizes.
function Screen:onMouseMove(dx,dy)
    local r=self.resizing
    if r then
        r.dy=r.dy+(dy or 0)
        local want=math.floor((Case.h*r.scale+r.dy)/Case.h+0.5)
        if want<1 then want=1 elseif want>S.MAX then want=S.MAX end
        if want~=self.scale then S.zoom(want) end
        return true
    end
    return ISPanel.onMouseMove(self,dx,dy)
end

function Screen:onMouseUpOutside(x,y)
    self.resizing=nil; self.down=nil
    return ISPanel.onMouseUpOutside(self,x,y)
end

function Screen:onMouseUp(x,y)
    local id=self.down
    self.down=nil
    if id=="GRIP" then self.resizing=nil; S.savePrefs(); return true end
    if id=="GLASS" then self:tap(x,y); return true end
    if not id then return ISPanel.onMouseUp(self,x,y) end
    local held=(getTimeInMillis and getTimeInMillis() or 0)-(self.downAt or 0)
    -- The lamp moved from the power tab to a held MENU when the owner's case
    -- lost the tab (2026-09-13). Same gesture, the only button that can still
    -- carry it without stealing a press the player needs.
    -- Held MENU, by what the key DOES and not by which key it is: MENU moved
    -- from MODE to C09 when the housing changed, and an id test here would
    -- have silently taken the lamp away with it.
    if S.ACTION[id]=="MENU" and held>=S.HOLD_MS and self.on then
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

-- THE DEVICE TAKES NO GAME KEYS.
--
-- It used to swallow the arrows, M, I, Escape, L, P, - and = for as long as it
-- was open - which is to say it stole the map, the inventory and the pause
-- menu from a player holding it (owner, 2026-09-13: "while PDA open, we cant
-- open the map as M key is bound to a button. remove all button mappings to
-- key strokes"). A reading device that disables the map is not a trade
-- anybody would make.
--
-- The machine is driven the way the design always said it was: the stylus, and
-- the four keys on its own case. Nothing on the keyboard.
--
-- The two exceptions are the size controls, and they are consumed ONLY while
-- the pointer is actually over the device - so - and = resize the thing you
-- are pointing at, and mean whatever the game wants them to mean the rest of
-- the time.
function Screen:sizeKey(key)
    if key~=Keyboard.KEY_MINUS and key~=Keyboard.KEY_EQUALS then return false end
    return safe(function() return self:isMouseOver() end)==true
end

function Screen:isKeyConsumed(key)
    return self:sizeKey(key)==true
end

function Screen:onKeyRelease(key)
    if not self:sizeKey(key) then return end
    if key==Keyboard.KEY_MINUS then S.step(-1) else S.step(1) end
end

-- Writing a note ---------------------------------------------------------------
--
-- The game's own text box is used for the TYPING, because it is the only thing
-- that reliably receives keystrokes - but it is made invisible
-- (setFrameAlpha(0), setTextRGBA alpha 0) and the field is drawn by this
-- screen instead, in the machine's own typeface, inside the glass.
--
-- It used to be added as a plain child, so the owner got a white sans-serif
-- box in the game's font sitting on top of the case, which then STAYED on top
-- when he moved to another program, with no visible way to send what he had
-- written (owner, 2026-09-13, three faults in one screenshot).
function Screen:writeNote()
    if self.writer then return end
    require("ISUI/ISTextEntryBox")
    local l=self:lcd()
    -- Where the field is drawn, in the machine's own pixels.
    local fx,fy=2,l.h-Font.line*4
    -- Parked off the case, not merely made transparent. setFrameAlpha(0) and
    -- transparent text still left the box painting a dark slab over the glass,
    -- so the field's own text was drawn dark-on-dark and could not be read
    -- (owner, 2026-09-13: "unreadable"). Keystrokes follow FOCUS, not
    -- position, so a box nobody can see still types.
    local box=ISTextEntryBox:new("",-10000,-10000,(l.w-4)*l.t,Font.line*l.t)
    box:initialise(); box:instantiate()
    box:setMaxTextLength(200)
    safe(function()
        box.javaObject:setFrameAlpha(0)
        box.javaObject:setTextRGBA(0,0,0,0)
    end)
    box.onCommandEntered=function() self:finishNote(true) end
    self:addChild(box)
    box:focus()
    self.writer=box
    self.writerAt={x=fx,y=fy}
end

-- Done, or abandoned. Either way the field goes: it must never outlive the
-- program it was opened in.
function Screen:finishNote(commit)
    local box=self.writer
    if not box then return end
    self.writer=nil
    self.writerAt=nil
    local text=safe(function() return box:getText() end)
    safe(function() box:unfocus() end)
    safe(function() self:removeChild(box) end)
    if commit and type(text)=="string" and text:find("%S") then
        Apps.addNote(text)
        self.cachedList=nil
        log("owner note: "..text)
    end
end

-- Drawn as a Palm drew one: a framed field with a caret, and two command
-- buttons underneath saying what will happen.
function Screen:drawNote(c)
    local at=self.writerAt
    if not at or not self.writer then return end
    local text=safe(function() return self.writer:getText() end) or ""
    K.text(c,"Write a note:",at.x,at.y-Font.line,K.DIM)
    K.fill(c,at.x-1,at.y-1,c.w-at.x*2+2,Font.line+2,K.GLASS)
    K.frame(c,at.x-1,at.y-1,c.w-at.x*2+2,Font.line+2,K.INK)
    -- The tail of the line, so a long note keeps its caret in view.
    local shown=text
    while K.width(shown)>c.w-at.x*2-6 and #shown>0 do shown=shown:sub(2) end
    K.text(c,shown,at.x+1,at.y,K.INK)
    -- A caret that blinks, because a field with no caret does not look like
    -- one you can type into.
    local now=getTimeInMillis and getTimeInMillis() or 0
    if math.floor(now/500)%2==0 then
        K.fill(c,at.x+1+K.width(shown),at.y,1,Font.line-1,K.INK)
    end
    local foot=K.foot(c,self:footText(""))
    local x=K.command(c,"SEND",2,foot,"NOTE_DONE")
    K.command(c,"CANCEL",x,foot,"NOTE_CANCEL")
end

function Screen:close()
    -- A half-written note dies with the screen rather than outliving it.
    self:finishNote(false)
    self:removeFromUIManager()
    S.window=nil
end

-- Open it, or bring it back. One window: a second organiser on screen would be
-- a second reading surface, which is exactly what P4-R79 forbids.
function S.open()
    if S.window then S.window:bringToTop(); return S.window end
    -- The player's own sizes, read once per session before the first window is
    -- built - after that S.scale and S.fontSize are the truth.
    if not S.prefsLoaded then S.prefsLoaded=true; safe(S.loadPrefs) end
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
-- Resizing. S.zoom existed but NOTHING called it - no key, no menu, nothing -
-- so the machine could not be resized at all and HELP had nothing to say about
-- it (owner, 2026-09-13: "help gives us no information on how to resize").
-- Now it is on - and = , and HELP says so.
function S.zoom(scale)
    if type(scale)=="number" and scale>=1 and scale<=S.MAX then S.scale=math.floor(scale)
    else S.scale=((S.scale or S.fit())%S.MAX)+1 end
    -- Resized in place, not closed and reopened. A rebuild dropped the player
    -- back on the launcher, which made "tap here to step the machine size"
    -- throw away the screen you were reading to change its size.
    local w=S.window
    if w then
        -- A half-written note is positioned in the old size's pixels, and any
        -- navigation abandons one anyway.
        if w.writer then w:finishNote(false) end
        local m=S.metrics(S.scale)
        w.scale=S.scale
        safe(function() w:setWidth(m.w); w:setHeight(m.h) end)
        local x,y=S.place(m)
        safe(function() w:setX(x); w:setY(y) end)
        w.cachedList=nil
    end
    S.savePrefs()
    return S.scale
end

-- The text size steps round, because there are three of them and a selector
-- with three choices should cycle. The case does not change size, so the
-- window is left alone and only what it draws changes.
function S.stepFont(by)
    local n=#S.FONT_SIZES
    S.fontSize=(((S.fontSize or S.FONT_DEFAULT)-1+(by or 1))%n)+1
    local w=S.window
    if w then w.fontSize=S.fontSize; w.cachedList=nil end
    S.savePrefs()
    log("text size: "..S.FONT_SIZES[S.fontSize].id)
    return S.fontSize
end

-- One step smaller or larger, stopping at the ends rather than wrapping round
-- to the opposite extreme, which is what a size control should do.
function S.step(by)
    local now=S.scale or S.fit()
    local want=now+by
    if want<1 then want=1 elseif want>S.MAX then want=S.MAX end
    if want==now then return now end
    return S.zoom(want)
end

return S
