-- The Fieldnote case: the organiser's housing, drawn from the design manifest
-- with native rectangles and the mod's own pixel face. No picture, no SVG, no
-- PNG for the hardware.
--
-- This file used to be a stand-alone window as well, from when the device was
-- a test mod looked at before it replaced anything. It replaced the old case
-- (2026-09-13), and ConspiracyFiles.OrganiserScreen has been the only window
-- since: it draws the case through S.render and takes its keys with its own
-- half-open hit test. The stand-alone window stayed behind for the Fieldnote
-- check alone, so that check proved a window no player ever saw - 1x to 3x
-- only, with its own hit test and its own release rule. It is gone, and the
-- check drives the organiser (2026-09-15).
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
local G=require("Fieldnote/Geometry")
local Font=require("ConspiracyFiles/Generated/OrganiserFont")

Fieldnote=Fieldnote or {}
local S=Fieldnote.Panel or {}
Fieldnote.Panel=S

S.showWear=G.showWear

local function colour(name) return G.palette[name] or G.palette.edge end

-- One glyph picture of the device's own face. The legends are on the plastic,
-- so they take the MACHINE size - unlike the screen's text, which takes the
-- text size the player chose.
--
-- The pictures exist at 1x, 2x and 3x. The machine also comes at half and one
-- and a half size (P4-R99), and the lookup asked for folders 0.5x and 1.5x that
-- were never built, so at those two sizes HOME and BACK were not drawn at all.
-- The picture is now the next size up, drawn at the machine's size:
-- drawTextureScaled takes the size to draw, not the picture's own.
S.GLYPH_SIZES={1,2,3}
function S.glyphFolder(scale)
    for _,size in ipairs(S.GLYPH_SIZES) do
        if size>=scale then return size end
    end
    return S.GLYPH_SIZES[#S.GLYPH_SIZES]
end

local glyphs={}
function S.glyph(code,scale)
    local folder=S.glyphFolder(scale)
    local key=folder.."/"..code
    local hit=glyphs[key]
    if hit~=nil then return hit or nil end
    local ok,texture=pcall(getTexture,"media/ui/CFOrg/"..folder.."x/"..code..".png")
    glyphs[key]=(ok and texture) or false
    return ok and texture or nil
end

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
                local texture=S.glyph(code,s)
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
-- the organiser draws the case into its own window. `held` is the control id
-- currently pressed, or nil.
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

return S
