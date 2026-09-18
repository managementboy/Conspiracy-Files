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
-- The two cuts of the Palm face (P4-R99): 16 pt, drawn at 1x-3x, and 24 pt for
-- the size between Small and Medium. tools/build_palm_font.py makes both.
local FACE_BASE=require("ConspiracyFiles/Generated/OrganiserFont")
local FACE_24=require("ConspiracyFiles/Generated/OrganiserFont24")
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
for _,component in ipairs(FG.components) do
    if component.id=="C20" then Case.grip={x=component.x,y=component.y} end
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

-- What each physical button does. The words printed under them are
-- silkscreened into the housing by the design manifest, not drawn over the
-- case in the LCD typeface - that first attempt was rejected on sight and
-- rightly (owner, 2026-09-13: "extremely ugly. remove."). So the mapping is
-- here and the words are in the manifest, and the two have to be changed
-- together: a key that prints one thing and does another is worse than a key
-- that prints nothing, which is why the two unassigned keys print nothing.
--
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

-- The screen draws its own letters, one texture per glyph, in KnoxUI: handing
-- the game a font in its own format killed it on startup (2026-09-12). This
-- file's own copy of that glyph lookup was never called and is gone.

local Screen=ISPanel:derive("CFOrganiserScreen")
S.Screen=Screen

function S.metrics(scale)
    return {scale=scale,glass=Case.glass,w=Case.w*scale,h=Case.h*scale}
end

-- The player's text size (P4-R99, owner, 2026-09-14): four, because the jump
-- from Small to Medium was too big and the owner chose to keep Small and add a
-- size between them. A size is a face and a whole multiple of it, in screen
-- pixels - 11, 17, 22 and 33 px tall. The machine size no longer multiplies it.
S.FONT_SIZES={{id="small",label="Small",mult=1,face=FACE_BASE},
              {id="normal",label="Normal",mult=1,face=FACE_24},
              {id="medium",label="Medium",mult=2,face=FACE_BASE},
              {id="large",label="Large",mult=3,face=FACE_BASE}}
S.FONT_DEFAULT=3
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
    local at=S.scaleIndex(root.scale)
    if at then S.scale=S.SCALES[at] end
    -- By id, so adding a size never shifts a saved choice onto its neighbour. A
    -- save from before P4-R99 kept an index into three sizes; map it across.
    local byId
    for i,f in ipairs(S.FONT_SIZES) do if f.id==root.fontId then byId=i end end
    if byId then S.fontSize=byId
    elseif type(root.fontSize)=="number" then
        S.fontSize=({[1]=1,[2]=3,[3]=4})[root.fontSize] or S.fontSize
    end
end
function S.savePrefs()
    local root=prefsStore(); if not root then return end
    root.scale=S.scale; root.fontSize=S.fontSize
    local f=S.FONT_SIZES[S.fontSize or S.FONT_DEFAULT]
    root.fontId=f and f.id or nil
end

-- The glyph multiple a text size draws at. The machine size no longer enters
-- into it (P4-R99); `scale` is still accepted so older callers keep working.
function S.typeScale(scale,fontSize)
    local f=S.FONT_SIZES[fontSize or S.FONT_DEFAULT] or S.FONT_SIZES[S.FONT_DEFAULT]
    return f.mult
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
-- The machine sizes (P4-R99). Half size, because 1x is already big on the
-- owner's 4K screen and smaller screens need smaller still; a half step between
-- one and two. The type no longer scales with the machine, so a fractional
-- machine costs the text nothing - the case is rectangles. Three fills 4K.
S.SCALES={0.5,1,1.5,2,3}
S.MIN,S.MAX=S.SCALES[1],S.SCALES[#S.SCALES]
function S.scaleIndex(scale)
    if type(scale)~="number" then return nil end
    for i,v in ipairs(S.SCALES) do if math.abs(v-scale)<0.01 then return i end end
    return nil
end
function S.nearestScale(value)
    local best=S.SCALES[1]
    for _,v in ipairs(S.SCALES) do if math.abs(v-value)<math.abs(best-value) then best=v end end
    return best
end
function S.scaleLabel(scale)
    if type(scale)~="number" then return "?" end
    return (scale%1==0 and tostring(math.floor(scale)) or tostring(scale)).."x"
end
-- `height` is for the checks, which must be able to ask what this picks for a
-- screen they are not running on. It defaulted to the real screen and the
-- check reimplemented the formula instead, which is how it came to still be
-- asserting the old rounding after the rounding changed.
-- The size the organiser opens at when the player has never chosen one: the
-- smallest, on every screen (P4-R94). It used to aim for half the screen
-- height, which on the owner's display landed on the smallest size anyway and
-- on other displays did not. The player's own choice, once made, is kept by
-- savePrefs/loadPrefs and wins over this.
--
-- `height` is still accepted so the check can ask what this returns for a
-- screen it is not running on; the answer is simply the same everywhere now.
S.DEFAULT_SCALE=1
function S.fit(height)
    return S.DEFAULT_SCALE
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
    o.pressedId,o.pressedAt=nil,nil
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
    local f=S.FONT_SIZES[self.fontSize or S.FONT_DEFAULT] or S.FONT_SIZES[S.FONT_DEFAULT]
    local t=f.mult
    return {x=Case.glass.x*s,y=Case.glass.y*s,
            w=math.floor(Case.glass.w*s/t),h=math.floor(Case.glass.h*s/t),t=t,face=f.face}
end

-- The size grip: the bottom-right corner of the case. Nothing is DRAWN there
-- - the design has no grip component and inventing hardware it does not have
-- is how the old case ended up with a power tab off the edge of the picture -
-- so SETUP and HELP both say the corner drags, and SETUP steps it on a tap for
-- anyone who never tries.
function Screen:grip()
    local s=self.scale
    -- From the drawn grip (manifest component C20) out to the device's own
    -- corner, so the whole corner handles a drag and the part that SHOWS it is
    -- part of what you can grab.
    local g=Case.grip or {x=Case.w-14,y=Case.h-14}
    return {x=g.x*s,y=g.y*s,w=(Case.w-g.x)*s,h=(Case.h-g.y)*s}
end

-- The control being held right now, for the case's pressed colours. ONE
-- control: a hand presses one key at a time and the case shows one key down.
--
-- This was a table keyed by control id that nothing ever removed from, walked
-- with pairs() on every frame. Two faults in one. It iterated every id pressed
-- for the whole life of the window rather than the one that matters; and
-- pairs() has no defined order, so two presses inside the 110 ms window could
-- light whichever key the hash happened to yield first instead of the one the
-- player just pressed.
function Screen:heldControl()
    local id=self.pressedId
    if not id then return nil end
    local now=getTimeInMillis and getTimeInMillis() or 0
    if now-(self.pressedAt or 0)<S.PRESS_MS then return id end
    self.pressedId,self.pressedAt=nil,nil
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
-- The charge, read at most once a second, and the ITEM it was read from kept
-- with it. The item was thrown away before, so powerCheck below went and found
-- it again on every single frame - and finding it means walking the survivor's
-- whole inventory (Organiser.held).
--
-- `chargeFresh` says whether this call actually refreshed, so callers that
-- only care once a second can ask. It is a field rather than a second return
-- value because K.status(c,nil,"All",self:charge()) takes charge() in tail
-- position, where an extra return would slide into the next argument.
function Screen:charge()
    local now=getTimeInMillis and getTimeInMillis() or 0
    if self.chargeAt and now-self.chargeAt<1000 then
        self.chargeFresh=false
        return self.chargeValue
    end
    local organiser=ConspiracyFiles.Organiser
    local item=organiser and organiser.held and safe(organiser.held)
    self.chargeItem=item
    self.chargeValue=item and organiser.power and safe(organiser.power,item)
    self.chargeAt=now
    self.chargeFresh=true
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
    -- What a drop of evidence did (P4-R116), for as long as it takes to read.
    if self.dropped and now-self.dropped.at<3000 then
        return self.dropped.text
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
-- MEASURED, 2026-09-13: the three non-drawing checks in prerender cost
-- 0.4-0.6 ms of every frame, and nearly all of it was here. charge() is
-- throttled to once a second, but the two lines under it were not: held()
-- walked the survivor's entire inventory and hasCell asked the engine for the
-- battery, sixty times a second, to re-answer a question whose answer changes
-- when the player moves an item.
--
-- It now asks exactly as often as the charge does. A cell pulled out of the
-- device is noticed within a second instead of within a frame, which is the
-- same promise the battery readout has always made, and hardware.sh asserts
-- the behaviour either way.
-- The launcher's clock, as the Palm's home screen had one (owner, 2026-09-14,
-- with a photo of it) - but only while the survivor has something that tells
-- the time. P4-R85 stands: knowing the time costs a watch, and the organiser
-- does not buy that back. The rule is the vanilla clock's own: any alarm clock
-- or watch in the inventory, worn or not. Read once a second, because finding
-- one walks the inventory, and in the player's own 12- or 24-hour format.
function Screen:clockText()
    local now=getTimeInMillis and getTimeInMillis() or 0
    if self.clockAt and now-self.clockAt<1000 then return self.clockValue end
    self.clockAt=now
    self.clockValue=nil
    local player=getPlayer and getPlayer()
    local items=player and safe(function() return player:getInventory():getItems() end)
    local timed=false
    if items then
        for i=0,items:size()-1 do
            local item=items:get(i)
            if instanceof(item,"AlarmClockClothing") or instanceof(item,"AlarmClock") then timed=true; break end
        end
    end
    if not timed then return nil end
    local tod=safe(function() return getGameTime():getTimeOfDay() end)
    if type(tod)~="number" then return nil end
    local h,m=math.floor(tod),math.floor((tod%1)*60)
    if safe(function() return getCore():getOptionClock24Hour() end) then
        self.clockValue=string.format("%d:%02d",h,m)
    else
        self.clockValue=string.format("%d:%02d %s",(h+11)%12+1,m,h<12 and "am" or "pm")
    end
    return self.clockValue
end

function Screen:powerCheck()
    if not self.on then return end
    local organiser=ConspiracyFiles.Organiser
    if not organiser or not organiser.hasCell then return end
    self:charge()
    if not self.chargeFresh then return end
    local item=self.chargeItem
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
        if K.current.width(candidate,1)<=width then line=candidate
        else if line~="" then out[#out+1]=line end; line=word end
    end
    if line~="" then out[#out+1]=line end
    return out
end

-- A record's text carries the line breaks it was written with, and a document
-- is written to about sixty characters. Wrapping each stored line on its own
-- put a long line next to a stub on the survivor's screen - "under standing" /
-- "emergency-maintenance procedure." at 1.5x (owner, Windows, 2026-09-18). So a
-- paragraph is reflowed first: a line joins the one before it when it begins in
-- lower case, which is how a sentence continues. A numbered item, a letterhead,
-- a heading and anything starting with a capital keep their own break.
local function reflow(detail)
    local out={}
    for line in (tostring(detail or "").."\n"):gmatch("([^\n]*)\n") do
        local previous=out[#out]
        if line~="" and previous and previous~="" and line:find("^%l") then
            out[#out]=previous.." "..line
        else
            out[#out+1]=line
        end
    end
    return table.concat(out,"\n")
end

-- Where the view starts, in LINES. It used to be a page number, so reading a
-- record meant jumping a screenful at a time and losing the sentence you were
-- on (owner, Windows, 2026-09-18: "scrolling also only works page for page,
-- making reading uneccessary dififcult"). The top line is clamped here, at the
-- one place that knows how many lines there are and how many fit.
local function topLine(self,count,room)
    local highest=math.max(1,count-room+1)
    local top=math.max(1,math.min(math.floor(self.card or 1),highest))
    self.card=top
    return top
end

local function pages(detail,width)

    local lines={}
    for paragraph in (reflow(detail).."\n"):gmatch("([^\n]*)\n") do
        if paragraph=="" then
            if #lines>0 and lines[#lines]~="" then lines[#lines+1]="" end
        else
            local line=""
            for word in paragraph:gmatch("%S+") do
                local candidate=line=="" and word or (line.." "..word)
                if K.current.width(candidate,1)<=width then line=candidate
                else if line~="" then lines[#lines+1]=line end; line=word end
            end
            if line~="" then lines[#lines+1]=line end
        end
    end
    return lines
end

-- The screen, then a popup list over it when SETUP has one open.
function Screen:draw(gx,gy)
    self:drawScreen(gx,gy)
    local p=self.popup
    if p and self.context and self.on and not self.booting then
        local labels={}
        for i,o in ipairs(p.options) do labels[i]=o.label end
        K.popup(self.context,p.title,labels,p.index)
    end
end

function Screen:drawScreen(gx,gy)
    local l=self:lcd()
    local c=K.begin(self,l.t,gx,gy,l.w,l.h,l.face)
    self.context=c
    local line=K.current.line
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
        -- The Applications launcher: clock, battery, category, icon grid. The
        -- clock shows only while the survivor carries a watch or an alarm
        -- clock (P4-R85, P4-R100) - see Screen:clockText.
        local y=K.status(c,self:clockText(),"All",self:charge())
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
    if self.record and self.record.dayView then
        self:drawDay(c)
        return
    end
    if self.record and self.record.questions then
        self:drawQuestions(c)
        return
    end
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
        if self.record.entries then
            -- A day in DATES lists what was found on it, and each line opens
            -- the record it names (owner, Windows, 2026-09-14).
            local entries=self.record.entries
            local top=topLine(self,#entries,room)
            for i=0,room-1 do
                local entry=entries[top+i]
                if not entry then break end
                K.row(c,entry.text,y+i*line,false,"ENTRY",top+i)
            end
            K.scrollbar(c,y,room*line,top,room,#entries)
        else
            local body=pages(self.record.detail,c.w-4-8)
            local top=topLine(self,#body,room)
            for i=0,room-1 do
                local text=body[top+i]
                if not text then break end
                K.text(c,text,2,y+i*line,K.INK)
            end
            K.scrollbar(c,y,room*line,top,room,#body)
        end
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
            K.foot(c,self:footText("HOME: programs"))
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
    K.scrollbar(c,line+2,room*line,top,room,#rows)
    -- The hint named keys this machine has never had: VIEW and LIST were the
    -- mapping before the buttons were MENU/UP/DOWN/BACK, and it was still on
    -- screen a version later (owner screenshot, 2026-09-13).
    K.foot(c,self:footText("HOME: programs   tap: open"))
end

-- One day in DATES, as the Date Book drew it (owner, 2026-09-14, with a photo
-- of the real one): the date and its week across the top, a line for every
-- hour of the working day, and each find on the line of the hour it was made.
-- Eight to six, as the Date Book opened, widened to take in anything earlier
-- or later. A line opens its record; a day in the week opens that day.
function Screen:drawDay(c)
    local line=K.current.line
    local day=self.record
    local y=K.dayHeader(c,day.short or day.title or "",day.shorter,day.week,day.dayNumber)
    local entries=day.entries or {}
    local first,last=8,18
    for _,e in ipairs(entries) do
        if type(e.hour)=="number" then
            if e.hour<first then first=e.hour end
            if e.hour>last then last=e.hour end
        end
    end
    local lines={}
    for hour=first,last do
        local shown=false
        for index,e in ipairs(entries) do
            if e.hour==hour then
                lines[#lines+1]={hour=(not shown) and hour or nil,text=e.title or e.text,index=index}
                shown=true
            end
        end
        if not shown then lines[#lines+1]={hour=hour} end
    end
    local foot=c.h-line-1
    local room=math.max(2,math.floor((foot-2-y)/line))
    local top=topLine(self,#lines,room)
    for i=0,room-1 do
        local l=lines[top+i]
        if not l then break end
        K.hourLine(c,y+i*line,l.hour,l.text,l.index and "ENTRY" or nil,l.index)
    end
    K.scrollbar(c,y,room*line,top,room,#lines)
    local footY=K.foot(c,self:footText(""))
    K.command(c,"BACK",2,footY,"BACK")
end

-- SETUP's choices open as a Palm popup list (owner, 2026-09-14, with a photo of
-- one): tap a line to choose it, tap outside to leave the setting as it was.
-- The rocker moves the choice and applies it as it goes; BACK closes the list.
function Screen:openPopup(title,labels,index,apply)
    local options={}
    for i,label in ipairs(labels) do options[i]={label=label} end
    self.popup={title=title,options=options,index=index or 1,apply=apply}
end

-- "What do I make of it?" (P4-R113, wording P4-R122): the three questions with
-- the answer so far or "(not yet)", then the survivor's own note. Nothing here
-- ever says right or wrong. Once a case has been built from the answers the
-- note says so and ANSWER is gone.
function Screen:drawQuestions(c)
    local line=K.current.line
    local q=self.record.questions
    local Q=require("ConspiracyFiles/Generated/Questions")
    K.titleBar(c,"FILES","Case "..tostring(q.number))
    local y=line+2
    for i,question in ipairs(Q.QUESTIONS) do
        y=K.row(c,question.text,y,i==(self.question or 1),"QUESTION",i)
        local answer=Q.answerLabel(question.key,q.answers,q.offered)
        for _,text in ipairs(wrapTo(answer,c.w-14)) do
            K.text(c,text,10,y,answer==Q.NOT_YET and K.DIM or K.INK); y=y+line
        end
    end
    local note=Q.note(q.answers,q.offered)
    if note then
        K.fill(c,0,y,c.w,1,K.DIM); y=y+2
        for _,text in ipairs(wrapTo(note,c.w-4)) do
            if y>c.h-line*2-2 then break end
            K.text(c,text,2,y,K.INK); y=y+line
        end
    end
    local foot=K.foot(c,self:footText(""))
    local x=K.command(c,"BACK",2,foot,"BACK")
    if not (q.answers and q.answers.usedBy) then K.command(c,"ANSWER",x,foot,"ANSWER") end
end

-- One question's pick list. Choosing saves through the runtime straight away,
-- as SETUP's lists apply as they go; "Clear my answer." takes it back to
-- "(not yet)". Answers that already shaped a case do not open.
function Screen:openQuestion(i)
    local q=self.record and self.record.questions
    if not q or (q.answers and q.answers.usedBy) then return end
    local Q=require("ConspiracyFiles/Generated/Questions")
    local question=Q.QUESTIONS[i]
    if not question then return end
    local options=Q.options(question.key,q.offered) or {}
    local labels,current={},1
    for n,o in ipairs(options) do
        labels[n]=o.label
        if q.answers and o.value==q.answers[question.key] then current=n end
    end
    local runtime=ConspiracyFiles.GeneratedRuntime
    self:openPopup(question.text,labels,current,function(n)
        local o=options[n]
        if not o or not runtime or not runtime.setAnswers then return end
        local answers={}
        for _,key in ipairs({"reading","matters","way"}) do answers[key]=q.answers and q.answers[key] or nil end
        if o.value==false then answers[question.key]=nil else answers[question.key]=o.value end
        local ok,why=runtime.setAnswers(q.caseId,answers)
        if not ok then log("answer not saved: "..tostring(why)); return end
        for _,fresh in ipairs(runtime.questions() or {}) do
            if fresh.caseId==q.caseId then q.answers=fresh.answers end
        end
        self.cachedList=nil
    end)
end

function Screen:openRow(index)
    local rows=self:list()
    local row=rows[index]
    if not row then return end
    self.entry=index
    if row.todo and row.index then
        Apps.tickToDo(row.index); self.cachedList=nil
    elseif row.setup=="text" then
        local labels={}
        for i,f in ipairs(S.FONT_SIZES) do labels[i]=f.label end
        self:openPopup("Text size",labels,self.fontSize or S.fontSize or S.FONT_DEFAULT,S.setFont)
    elseif row.setup=="machine" then
        -- S.scale is nil until the player has chosen a size (P4-R94 opens at
        -- the default without writing one), so read the size actually drawn.
        -- Comparing nil crashed the first tap in every new game (owner,
        -- Windows, 2026-09-14).
        local now=self.scale or S.scale or S.fit()
        local labels={}
        for i,v in ipairs(S.SCALES) do labels[i]=S.scaleLabel(v) end
        self:openPopup("Machine size",labels,S.scaleIndex(now) or 2,function(i) S.zoom(S.SCALES[i]) end)
    elseif row.questions then
        -- "What do I make of it?" (P4-R113): the three questions, the first chosen.
        self.record=row; self.record.index=index; self.card=1; self.question=1
    else
        self.record=row; self.record.index=index; self.card=1
    end
end

function Screen:press(id)
    self:touch()
    self.pressedId,self.pressedAt=id,(getTimeInMillis and getTimeInMillis() or 0)
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
    if self.popup then
        local p=self.popup
        local action=S.ACTION[id]
        if action=="UP" or action=="DOWN" then
            p.index=math.max(1,math.min(#p.options,p.index+(action=="UP" and -1 or 1)))
            safe(p.apply,p.index)
        else
            self.popup=nil
        end
        log("knox key "..id)
        return
    end
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
        if self.record and self.record.backTo then self.record=self.record.backTo; self.card=1
        elseif self.record then self.record=nil; self.card=1
        elseif not self.launcher then self.launcher=true end
    elseif action=="UP" then
        -- One LINE inside a record, one entry in a list (P4-R138).
        if self.record and self.record.questions then self.question=math.max(1,(self.question or 1)-1)
        elseif self.record then self.card=math.max(1,(self.card or 1)-1)
        else self.entry=math.max(1,self.entry-1) end
    elseif action=="DOWN" then
        if self.record and self.record.questions then self.question=math.min(3,(self.question or 1)+1)
        elseif self.record then self.card=(self.card or 1)+1
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
    if self.popup then
        local p=self.popup
        self.popup=nil
        if id=="POPUP" and p.options[widget.payload] then safe(p.apply,widget.payload) end
        log("knox tap: "..tostring(id))
        return
    end
    if id=="APP" then
        self.app=widget.payload; self.launcher=false; self.record=nil
        self.entry,self.card,self.cachedList=1,1,nil
    elseif id=="DAY" or id=="WEEKDAY" then
        local program=self:program()
        if program and program.day then
            local _,_,at=self:category(program)
            self.day=widget.payload
            self.record=safe(program.day,at or 1,widget.payload)
            self.card=1
        end
    elseif id=="ENTRY" then
        -- Open the FILES record the day's line names; BACK returns to the day.
        local day=self.record
        local entry=day and day.entries and day.entries[widget.payload]
        if entry and entry.ref then
            for _,row in ipairs(safe(Apps.files.list) or {}) do
                if row.id==entry.ref then
                    row.backTo=day; self.record=row; self.card=1
                    break
                end
            end
        end
    elseif id=="QUESTION" then
        self.question=widget.payload; self:openQuestion(widget.payload)
    elseif id=="ANSWER" then
        self:openQuestion(self.question or 1)
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
    elseif id=="BACK" then
        if self.record and self.record.backTo then self.record=self.record.backTo; self.card=1
        else self.record=nil; self.card=1; self.day=nil end
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

-- The key under a point on the window, or nil. Half-open, exactly as the
-- manifest states it: a pixel on the far edge belongs to whatever is next, not
-- to this key. One test for the press and the release, and the one the
-- Fieldnote check measures at every machine size.
-- The wheel reads like the drag: a notch is a line inside a record, an entry
-- in a list. The machine wakes for it, as it does for a key.
function Screen:onMouseWheel(delta)
    if not self.on then return false end
    self:touch()
    local step=(delta or 0)>0 and 1 or -1
    if self.record and not self.record.questions then self.card=math.max(1,(self.card or 1)+step)
    elseif not self.record then self.entry=math.max(1,(self.entry or 1)+step) end
    return true
end

function Screen:controlAt(x,y)
    for _,b in ipairs(self:buttons()) do
        if x>=b.x and x<b.x+b.w and y>=b.y and y<b.y+b.h then return b end
    end
    return nil
end

function Screen:onMouseDown(x,y)
    self.downAt=getTimeInMillis and getTimeInMillis() or 0
    local g=self:grip()
    if x>=g.x and y>=g.y and x<g.x+g.w and y<g.y+g.h then
        self.resizing={scale=self.scale,dy=0}
        self.down="GRIP"
        return true
    end
    local b=self:controlAt(x,y)
    if b then self.down=b.id; return true end
    local s=self.scale
    local gx,gy=Case.glass.x*s,Case.glass.y*s
    if self.on and x>=gx and y>=gy and x<Case.glass.x*s+Case.glass.w*s and y<Case.glass.y*s+Case.glass.h*s then
        self.down="GLASS"; self.dragging={dy=0,moved=false}; return true
    end
    self.down=nil
    return ISPanel.onMouseDown(self,x,y)
end

-- Dragging the corner. The corner follows the pointer and the size SNAPS to the
-- machine sizes (S.SCALES): the type no longer scales with the machine, so a
-- half step costs the pixel face nothing (P4-R99). So it reads as a window you pull, and it clicks between sizes.
-- The stylus drags the page, as a Palm's did its scrollbar (owner, Windows,
-- 2026-09-18: "hold and drag works too?"). A press on the glass only becomes a
-- drag after a few pixels, so a tap still picks a record; after that every line
-- height of movement is one line of text, and the direction is the paper's -
-- drag up, read down.
S.DRAG_START=4
function Screen:dragGlass(dy)
    if not self.record or not self.on then return false end
    local drag=self.dragging
    if not drag then return false end
    drag.dy=drag.dy+(dy or 0)
    if not drag.moved and math.abs(drag.dy)<S.DRAG_START then return true end
    drag.moved=true
    -- A line of text on the glass, in screen pixels: the face's own line height
    -- times how big the machine is drawn.
    local line=math.max(1,(K.LINE or 8)*(self.scale or S.scale or 1))
    local steps=math.floor(math.abs(drag.dy)/line)
    if steps>0 then
        self.card=math.max(1,(self.card or 1)+(drag.dy<0 and steps or -steps))
        drag.dy=drag.dy-(drag.dy<0 and -steps*line or steps*line)
    end
    return true
end

function Screen:onMouseMove(dx,dy)
    local r=self.resizing
    if self.dragging and self.down=="GLASS" then return self:dragGlass(dy) end
    if r then
        r.dy=r.dy+(dy or 0)
        local want=S.nearestScale((Case.h*r.scale+r.dy)/Case.h)
        if want~=self.scale then S.zoom(want) end
        return true
    end
    return ISPanel.onMouseMove(self,dx,dy)
end

-- Growing the machine means dragging the corner AWAY from it, so the pointer
-- leaves the window on the first pixel and the game reports every later move
-- to onMouseMoveOutside instead. Without this the drag only ever shrank it
-- (owner, Windows, 2026-09-14: "trying to upp the PDA bigger does not work").
function Screen:onMouseMoveOutside(dx,dy)
    if self.resizing then return self:onMouseMove(dx,dy) end
    return ISPanel.onMouseMoveOutside(self,dx,dy)
end

function Screen:onMouseUpOutside(x,y)
    if self.down=="GRIP" then S.savePrefs() end
    self.resizing=nil; self.down=nil; self.dragging=nil
    return ISPanel.onMouseUpOutside(self,x,y)
end

-- Evidence dragged out of an inventory and let go on the machine are noted, all
-- of them (P4-R116). The inventory pane hands its drag to whichever window the
-- mouse comes up over and clears it on its next update, and over a window it
-- drops nothing on the floor (ISInventoryPane:update). A drop wakes the
-- machine, as a key does.
function Screen:dropPapers()
    local drag=ISMouseDrag and ISMouseDrag.dragging
    if type(drag)~="table" or ISMouseDrag.draggingFocus==self then return false end
    local Drop=require("ConspiracyFiles/DropToNote")
    local items=Drop.items(drag)
    if #items==0 then return false end
    self:touch()
    if not self.on then
        self.on=true
        local organiser=ConspiracyFiles.Organiser
        if organiser and organiser.checkPower then safe(organiser.checkPower) end
    end
    local player=getPlayer and getPlayer()
    local inventory=player and safe(function() return player:getInventory() end)
    local result=Drop.note(items,ConspiracyFiles.GeneratedRuntime,inventory)
    self.dropped={at=getTimeInMillis and getTimeInMillis() or 0,text=Drop.footer(result)}
    self.cachedList=nil
    log("organiser drop: "..Drop.describe(result))
    return true
end

function Screen:onMouseUp(x,y)
    local id=self.down
    local dragged=self.dragging and self.dragging.moved==true
    self.down=nil; self.dragging=nil
    if id=="GRIP" then self.resizing=nil; S.savePrefs(); return true end
    -- A drag that moved the page is not a tap: letting go after scrolling must
    -- not also open whatever the stylus happens to be over.
    if id=="GLASS" then if not dragged then self:tap(x,y) end; return true end
    if not id and self:dropPapers() then return true end
    if not id then return ISPanel.onMouseUp(self,x,y) end
    -- A key acts when it is let go over the key it went down on. Sliding off
    -- first cancels it, as a real key does and as the Fieldnote design asks;
    -- it used to act wherever the button came up, even on another key.
    local over=self:controlAt(x,y)
    if not over or over.id~=id then return true end
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
        self.pressedId,self.pressedAt=id,(getTimeInMillis and getTimeInMillis() or 0)
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
    local fx,fy=2,l.h-K.current.line*4
    -- Parked off the case, not merely made transparent. setFrameAlpha(0) and
    -- transparent text still left the box painting a dark slab over the glass,
    -- so the field's own text was drawn dark-on-dark and could not be read
    -- (owner, 2026-09-13: "unreadable"). Keystrokes follow FOCUS, not
    -- position, so a box nobody can see still types.
    local box=ISTextEntryBox:new("",-10000,-10000,(l.w-4)*l.t,K.current.line*l.t)
    box:initialise(); box:instantiate()
    box:setMaxTextLength(200)
    -- No setFrameAlpha: the box builds its frame the first time it is drawn,
    -- so asking for it here threw a NullPointerException into the log on every
    -- note (owner's Windows log, 2026-09-14) - and a box parked this far off
    -- the case never shows a frame anyway.
    safe(function() box.javaObject:setTextRGBA(0,0,0,0) end)
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
    K.text(c,"Write a note:",at.x,at.y-K.current.line,K.DIM)
    K.fill(c,at.x-1,at.y-1,c.w-at.x*2+2,K.current.line+2,K.GLASS)
    K.frame(c,at.x-1,at.y-1,c.w-at.x*2+2,K.current.line+2,K.INK)
    -- The tail of the line, so a long note keeps its caret in view.
    local shown=text
    while K.width(shown)>c.w-at.x*2-6 and #shown>0 do shown=shown:sub(2) end
    K.text(c,shown,at.x+1,at.y,K.INK)
    -- A caret that blinks, because a field with no caret does not look like
    -- one you can type into.
    local now=getTimeInMillis and getTimeInMillis() or 0
    if math.floor(now/500)%2==0 then
        K.fill(c,at.x+1+K.width(shown),at.y,1,K.current.line-1,K.INK)
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
-- Single player only, like the rest of the mod (see Organiser.lua). Guarded
-- here as well as at the item, so no future caller can open a device that has
-- no runtime behind it just by reaching for the screen directly.
S.reflow=reflow
S.topLine=topLine
function S.multiplayer() return (isClient and isClient()) or (isServer and isServer()) end

function S.open()
    if S.multiplayer() then return nil,"multiplayer" end
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
    -- WP6. Opening your notes somewhere means you were thinking about that
    -- place, which is a better signal than standing in it - and it is the one
    -- stamp a debug teleport cannot fake. Whether it counts as a RETURN is
    -- decided by PlaceVisits. The boot screen is not a read, so it is not one.
    local discoveries=ConspiracyFiles.DiscoveryLog
    if not S.booting and discoveries and discoveries.visit then safe(discoveries.visit) end
    log("organiser screen opened")
    return w
end

function S.close() if S.window then S.window:close() end end

-- Wake the machine up when the game starts: off to the side, booting, showing
-- what the mod is actually doing. It does NOT take the survivor's hand for
-- this - a boot screen is the device in your bag, not in your fist.
function S.boot()
    S.booting=true
    local w=S.open()
    S.booting=nil
    if w then w.booting=true end
    return w
end
-- Resizing. S.zoom existed but NOTHING called it - no key, no menu, nothing -
-- so the machine could not be resized at all and HELP had nothing to say about
-- it (owner, 2026-09-13: "help gives us no information on how to resize").
-- Now it is on - and = , and HELP says so.
function S.zoom(scale)
    local at=S.scaleIndex(scale)
    if at then S.scale=S.SCALES[at]
    else S.scale=S.SCALES[(S.scaleIndex(S.scale or S.fit()) or 1)%#S.SCALES+1] end
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
    local now=S.scaleIndex(S.scale or S.fit()) or S.scaleIndex(S.DEFAULT_SCALE)
    local want=math.max(1,math.min(#S.SCALES,now+(by or 1)))
    if want==now then return S.SCALES[now] end
    return S.zoom(S.SCALES[want])
end

-- Choose a text size outright, from SETUP's list.
function S.setFont(index)
    if not S.FONT_SIZES[index] then return S.fontSize end
    S.fontSize=index
    local w=S.window
    if w then w.fontSize=index; w.cachedList=nil end
    S.savePrefs()
    log("text size: "..S.FONT_SIZES[index].id)
    return index
end

return S
