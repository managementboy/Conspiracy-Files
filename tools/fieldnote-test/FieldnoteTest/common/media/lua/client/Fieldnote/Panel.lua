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
--   ISUIElement:drawRect(x, y, w, h, a, r, g, b)      alpha FIRST
--   ISUIElement:drawText(str, x, y, r, g, b, a, font) alpha LAST
--   zombie.ui.TextManager: MeasureStringX(UIFont, String), getFontHeight(UIFont)
--   UIFont.Small / UIFont.Medium exist.
-- The palette is {r,g,b,a} and is reordered per call below; that difference is
-- the whole reason the manifest refuses to fix an argument order.
--
-- THE ONE THING THAT NEEDED EYES: drawText anchors by the TOP of the glyph
-- box, and the design gives BASELINES. PZ exposes no ascent directly, but
-- AngelCodeFont.getHeight(str, real, offset) exposes the two halves of it:
-- MeasureStringYOffset = rows above the ink, MeasureStringYReal = ink rows.
-- Their sum is the ink bottom - the baseline of a caps label. Verified from
-- the bytecode, after getFontHeight and MeasureStringY both overshot.
require "ISUI/ISPanel"
local G=require("Fieldnote/Geometry")

Fieldnote=Fieldnote or {}
local S=Fieldnote.Panel or {}
Fieldnote.Panel=S

local Panel=ISPanel:derive("FieldnotePanel")
S.Panel=Panel

S.scale=1
S.showWear=G.showWear
S.onAction=function(id) end   -- replaced by whoever wires the buttons

local FONTS={["UI Small"]=UIFont.Small,["UI Medium"]=UIFont.Medium}

local function colour(name) return G.palette[name] or G.palette.edge end

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
function Panel:colourFor(component,primitive)
    local held=self.pressed
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

function Panel:drawPrimitive(component,p)
    local s=self.scale
    local ox,oy=component.x,component.y
    local c=self:colourFor(component,p)
    if p.kind=="rect" then
        -- drawRect(x, y, w, h, ALPHA, r, g, b)
        self:drawRect((ox+p.x)*s,(oy+p.y)*s,p.w*s,p.h*s,c[4],c[1],c[2],c[3])
    elseif p.kind=="text" then
        local font=FONTS[p.font] or UIFont.Small
        local tm=getTextManager()
        local width=tm:MeasureStringX(font,p.text)
        -- The ascent: the distance from drawText's y to the BOTTOM of this
        -- string's ink, which for a descender-free caps label is its baseline.
        -- Read out of AngelCodeFont.getHeight(str, real, offset) itself
        -- (javap, 2026-09-13): it tracks the highest ink row (min yoffset) and
        -- the lowest (max height+yoffset); `offset` returns the former and
        -- `real` their difference. Ink bottom is therefore offset + real.
        -- getFontHeight is the line height and MeasureStringY the full box -
        -- both overshot and put every label on top of its icon.
        local height=tm:MeasureStringYOffset(font,p.text)+tm:MeasureStringYReal(font,p.text)
        local x=(ox+p.x)*s
        if p.align=="center" then x=x-width/2
        elseif p.align=="right" then x=x-width end
        -- Nearest integer pixel, as the design resolves alignment.
        x=math.floor(x+0.5)
        -- Top-anchored text placed so its glyphs sit on the given baseline.
        local y=(oy+p.baseline)*s-height
        -- drawText(str, x, y, r, g, b, ALPHA, font)
        self:drawText(p.text,x,y,c[1],c[2],c[3],c[4],font)
    end
end

function Panel:prerender()
    for _,component in ipairs(G.components) do
        if not (component.optional and not S.showWear) then
            for _,p in ipairs(component.primitives) do
                self:drawPrimitive(component,p)
            end
        end
    end
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
