-- The Fieldnote PDA, drawn from the design manifest with native rectangles and
-- built-in UI text. No textures, no SVG, no PNG: every pixel of hardware is a
-- drawRect and every legend is a drawText, exactly as the design package asks.
--
-- Public surface deliberately mirrors ConspiracyFiles.OrganiserScreen -
-- S.open(), S.close(), S.window, S.metrics() - and every control routes through
-- ONE hook, S.onAction(id). That is what keeps a later swap to a few lines:
-- point the existing screen at this panel's LCD rect and wire onAction to the
-- existing press handler.
--
-- Verified against the installed Build 42.20 Lua/jar, not from memory:
--   ISUIElement:drawRect(x, y, w, h, a, r, g, b)               alpha FIRST
--   ISUIElement:drawTextureScaled(t, x, y, w, h, a, r, g, b)   alpha FIRST
-- The palette is {r,g,b,a} and is reordered per call below; that difference is
-- the whole reason the manifest refuses to fix an argument order.
--
-- THE WORDS ON THE PLASTIC ARE IN THE DEVICE'S OWN TYPEFACE (P4-R90), not the
-- game's UI font. The design package asked for UI Small, and that was the one
-- thing on this device whose size came from the player's own settings rather
-- than from us: on a 3200x1894 machine the labels drew on top of their icons
-- and on the development machine the same code cleared them by 3-4px, because
-- the only machine-dependent input in the whole device was those font metrics.
-- The mod already ships a pixel face at every scale the screen needs, so the
-- legends use it. That makes the placement arithmetic instead of a
-- measurement: the cell is `line` tall with the baseline at `ascent`, so a
-- label sits at (baseline - ascent) and every machine draws it identically.
-- This is also what retires the whole MeasureStringYOffset/YReal baseline
-- problem that cost a day - there is nothing left to measure.
require "ISUI/ISPanel"
local G=require("Fieldnote/Geometry")
local Font=require("ConspiracyFiles/Generated/OrganiserFont")

Fieldnote=Fieldnote or {}
local S=Fieldnote.Panel or {}
Fieldnote.Panel=S

local Panel=ISPanel:derive("FieldnotePanel")
S.Panel=Panel

S.scale=1
S.showWear=G.showWear
S.onAction=function(action,id) end   -- replaced by whoever drives this panel

local function colour(name) return G.palette[name] or G.palette.edge end

-- One glyph picture of the device's own face. The legends are on the plastic,
-- so they take the DEVICE scale - unlike the screen's text, which takes the
-- content scale the player chose.
local glyphs={}
local function glyph(code,scale)
    local key=scale.."/"..code
    local hit=glyphs[key]
    if hit~=nil then return hit or nil end
    local ok,texture=pcall(getTexture,"media/ui/CFOrg/"..scale.."x/"..code..".png")
    glyphs[key]=(ok and texture) or false
    return ok and texture or nil
end

function S.metrics(scale)
    scale=scale or S.scale
    return {scale=scale,w=G.device.w*scale,h=G.device.h*scale,
            lcd={x=G.lcd.x*scale,y=G.lcd.y*scale,w=G.lcd.w*scale,h=G.lcd.h*scale}}
end

function Panel:new(x,y,scale)
    local m=S.metrics(scale)
    local o=ISPanel.new(self,x,y,m.w,m.h)
    o.backgroundColor={r=0,g=0,b=0,a=0}
    o.borderColor={r=0,g=0,b=0,a=0}
    o.scale=m.scale
    o.pressed=nil          -- control id while the pointer is held on it
    o.down=nil             -- control id the press started on
    o.moveWithMouse=true
    return o
end

function Panel:initialise() ISPanel.initialise(self) end

-- The colour a primitive draws in right now: its own, or its pressed colour
-- while its control is held, or the rocker's per-half override.
function S.colourFor(component,primitive,held)
    if held then
        if component.overrides then
            -- Rocker: the half being pressed carries its own override table.
            local state=(held=="rocker_up" and "up") or (held=="rocker_down" and "down") or nil
            local table=state and component.overrides[state]
            local over=table and table[primitive.id]
            if over then return colour(over) end
        elseif primitive.pressed and held==component.id then
            return colour(primitive.pressed)
        end
    end
    return colour(primitive.color)
end

local function drawPrimitive(target,s,held,component,p)
    local ox,oy=component.x,component.y
    local c=S.colourFor(component,p,held)
    if p.kind=="rect" then
        -- drawRect(x, y, w, h, ALPHA, r, g, b)
        target:drawRect((ox+p.x)*s,(oy+p.y)*s,p.w*s,p.h*s,c[4],c[1],c[2],c[3])
    elseif p.kind=="text" then
        local width=Font.width(p.text,s)
        local x=(ox+p.x)*s
        if p.align=="center" then x=x-width/2
        elseif p.align=="right" then x=x-width end
        -- Nearest integer pixel, as the design resolves alignment.
        x=math.floor(x+0.5)
        -- The cell top that puts this face's baseline where the design asks.
        -- Measured, not assumed: every capital in this face inks rows 2..8 of
        -- an 11px cell, so the baseline is row 9 - which is `ascent`.
        local y=(oy+p.baseline-Font.ascent)*s
        for i=1,#p.text do
            local code=string.byte(p.text,i)
            if code>=Font.first and code<=Font.last then
                local w=Font.w[code-Font.first+1]
                local texture=glyph(code,s)
                if texture then
                    -- drawTextureScaled(t, x, y, w, h, ALPHA, r, g, b)
                    target:drawTextureScaled(texture,x,y,w*s,Font.line*s,c[4],c[1],c[2],c[3])
                end
                x=x+w*s
            end
        end
    end
end

-- Draw the whole device into any panel. This is deliberately NOT a method:
-- the PDA draws the case into its own window, and it must not have to own a
-- second panel to do it. `held` is the control id currently pressed, or nil.
function S.render(target,scale,held,showWear)
    if showWear==nil then showWear=S.showWear end
    for _,component in ipairs(G.components) do
        if not (component.optional and not showWear) then
            for _,p in ipairs(component.primitives) do
                drawPrimitive(target,scale,held,component,p)
            end
        end
    end
end

function Panel:prerender()
    S.render(self,self.scale,self.pressed,S.showWear)
end

-- Half-open hit test, device-local, exactly as the manifest states it:
-- x <= px < x+w and y <= py < y+h. The rocker's divider row is inactive by
-- construction because neither half's box covers it.
function Panel:controlAt(x,y)
    local s=self.scale
    local px,py=x/s,y/s
    for _,ctl in ipairs(G.controls) do
        if px>=ctl.x and px<ctl.x+ctl.w and py>=ctl.y and py<ctl.y+ctl.h then
            return ctl
        end
    end
    return nil
end

function Panel:onMouseDown(x,y)
    local ctl=self:controlAt(x,y)
    if ctl then
        self.down=ctl.id
        self.pressed=ctl.id
        return true
    end
    return ISPanel.onMouseDown(self,x,y)
end

function Panel:onMouseUp(x,y)
    local started=self.down
    self.down=nil
    self.pressed=nil
    if not started then return ISPanel.onMouseUp(self,x,y) end
    -- Dispatch only on a release over the same control the press began on:
    -- a drag off the key cancels it, as a physical key would.
    local ctl=self:controlAt(x,y)
    if ctl and ctl.id==started then
        pcall(S.onAction,ctl.action,ctl.id)
    end
    return true
end

function Panel:onMouseUpOutside(x,y)
    self.down=nil; self.pressed=nil
    return ISPanel.onMouseUpOutside(self,x,y)
end

function Panel:close()
    self:removeFromUIManager()
    S.window=nil
end

-- Screen-space LCD rectangle: where a content renderer would draw. Kept
-- separate from the hardware, as the design requires - the LCD stays empty
-- here and nothing hardware ever enters it.
function Panel:lcdRect()
    local s=self.scale
    return {x=self:getX()+G.lcd.x*s,y=self:getY()+G.lcd.y*s,w=G.lcd.w*s,h=G.lcd.h*s}
end

function S.fit()
    local h=getCore and getCore():getScreenHeight() or 720
    local want=math.floor(h*0.5/G.device.h)
    if want<1 then want=1 elseif want>3 then want=3 end
    return want
end

function S.open(scale)
    if S.window then S.window:bringToTop(); return S.window end
    scale=scale or S.scale or S.fit()
    S.scale=scale
    local m=S.metrics(scale)
    local sw=getCore and getCore():getScreenWidth() or 1280
    local sh=getCore and getCore():getScreenHeight() or 720
    local w=Panel:new(math.floor((sw-m.w)/2),math.floor((sh-m.h)/2),scale)
    w:initialise(); w:instantiate(); w:addToUIManager()
    S.window=w
    return w
end

function S.close() if S.window then S.window:close() end end
function S.toggle() if S.window then S.close() else S.open() end end

function S.zoom(scale)
    if type(scale)=="number" and scale>=1 and scale<=3 then S.scale=math.floor(scale)
    else S.scale=((S.scale or S.fit())%3)+1 end
    if S.window then S.close(); S.open(S.scale) end
    return S.scale
end

return S
