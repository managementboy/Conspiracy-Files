-- Knox.OS: the widget kit, drawn on a 160 x 160 canvas.
--
-- Small on purpose (docs/design/KNOX_OS.md). Every widget is a rectangle with
-- a hit box and a label, drawn in the device's own face; there is no layout
-- engine, because a 160 x 160 screen does not need one. Shapes follow Palm's
-- own rules (Palm OS Programmer's Companion, User Interface): a command button
-- is a label centred in a ROUNDED rectangle, a push button has SQUARE corners
-- and inverts when selected, a selector trigger is a label in a grey frame
-- that resizes to its text, and scroll arrows live in the right margin.
--
-- Everything here works in NATIVE pixels. The caller passes the panel, the
-- scale and the glass origin; this draws, and returns hit boxes in screen
-- pixels so a stylus tap can be matched to a widget.
local Font=require("ConspiracyFiles/Generated/OrganiserFont")
ConspiracyFiles=ConspiracyFiles or {}
local K=ConspiracyFiles.KnoxUI or {}
ConspiracyFiles.KnoxUI=K

K.INK={0.15,0.17,0.13}
K.DIM={0.38,0.42,0.33}
K.GLASS={0.66,0.70,0.59}
K.LINE=Font.line

-- A drawing context: where the glass is, how big a pixel is, and the list of
-- hit boxes built up as widgets are drawn.
function K.begin(panel,scale,x,y,w,h)
    return {panel=panel,scale=scale,x=x,y=y,w=w,h=h,hits={},cursor=0}
end

local function glyph(code,scale)
    K.cache=K.cache or {}
    local key=scale.."/"..code
    local hit=K.cache[key]
    if hit~=nil then return hit or nil end
    local ok,texture=pcall(getTexture,"media/ui/CFOrg/"..scale.."x/"..code..".png")
    K.cache[key]=(ok and texture) or false
    return ok and texture or nil
end

-- Text in native coordinates. Returns the width drawn, in native pixels.
function K.text(c,value,nx,ny,colour)
    local s=c.scale
    local cursor=c.x+nx*s
    value=tostring(value or "")
    for i=1,#value do
        local code=string.byte(value,i)
        if code>=Font.first and code<=Font.last then
            local width=Font.w[code-Font.first+1]
            local texture=glyph(code,s)
            if texture then
                c.panel:drawTextureScaled(texture,cursor,c.y+ny*s,width*s,Font.line*s,1,colour[1],colour[2],colour[3])
            end
            cursor=cursor+width*s
        end
    end
    return (cursor-c.x)/s-nx
end

function K.width(value) return Font.width(value,1) end

function K.fill(c,nx,ny,nw,nh,colour,alpha)
    c.panel:drawRect(c.x+nx*c.scale,c.y+ny*c.scale,nw*c.scale,nh*c.scale,
        alpha or 1,colour[1],colour[2],colour[3])
end

function K.frame(c,nx,ny,nw,nh,colour)
    c.panel:drawRectBorder(c.x+nx*c.scale,c.y+ny*c.scale,nw*c.scale,nh*c.scale,1,colour[1],colour[2],colour[3])
end

local function hit(c,id,nx,ny,nw,nh,payload)
    c.hits[#c.hits+1]={id=id,payload=payload,
        x=c.x+nx*c.scale,y=c.y+ny*c.scale,w=nw*c.scale,h=nh*c.scale}
end

-- Which widget a tap landed on, in screen pixels.
function K.at(c,x,y)
    for i=#c.hits,1,-1 do
        local h=c.hits[i]
        if x>=h.x and x<=h.x+h.w and y>=h.y and y<=h.y+h.h then return h end
    end
end

-- The title bar: dark band, view name on the left as a selector (it can be
-- changed, and Palm marked that with a trigger), count on the right.
-- `right` is the count. `category`, when a program has one, is the Palm
-- category picker: top-right of the title bar, its own arrow, tapped to cycle.
-- The count moves left of it so the two never overlap.
function K.titleBar(c,title,right,category)
    local line=Font.line
    K.fill(c,0,0,c.w,line,K.INK)
    K.text(c,title,2,0,K.GLASS)
    local w=K.width(title)
    K.text(c," v",2+w,0,K.GLASS)                   -- the selector's arrow
    hit(c,"SELECT",0,0,w+10,line)
    local edge=c.w-2
    if category then
        local text=category.." v"
        local cw=K.width(text)
        K.text(c,text,edge-cw,0,K.GLASS)
        hit(c,"CATEGORY",edge-cw-2,0,cw+4,line)
        edge=edge-cw-6
    end
    if right then K.text(c,right,edge-K.width(right),0,K.GLASS) end
    c.cursor=line+1
    return c.cursor
end

-- A full-width row, inverted when selected, as every Palm list drew them.
function K.row(c,label,ny,selected,id,payload)
    local line=Font.line
    if selected then K.fill(c,0,ny,c.w,line,K.INK) end
    K.text(c,label,2,ny,selected and K.GLASS or K.INK)
    hit(c,id or "ROW",0,ny,c.w-9,line,payload)
    return ny+line
end

-- A label in a rounded rectangle: Palm's command button, for an action.
function K.command(c,label,nx,ny,id)
    local w,h=K.width(label)+8,Font.line+1
    K.frame(c,nx+1,ny,w-2,h,K.INK)
    K.fill(c,nx,ny+1,w,h-2,K.INK,1)
    K.text(c,label,nx+4,ny,K.GLASS)
    hit(c,id or label,nx,ny,w,h)
    return nx+w+4
end

-- A square-cornered button that inverts when chosen: Palm's push button, for
-- a setting rather than an action.
function K.push(c,label,nx,ny,selected,id)
    local w,h=K.width(label)+6,Font.line
    if selected then K.fill(c,nx,ny,w,h,K.INK) end
    K.frame(c,nx,ny,w,h,K.INK)
    K.text(c,label,nx+3,ny,selected and K.GLASS or K.INK)
    hit(c,id or label,nx,ny,w,h)
    return nx+w+3
end

-- A tick box, for a to-do.
function K.check(c,ticked,nx,ny,id,payload)
    local box=Font.line-3
    K.frame(c,nx,ny+1,box,box,K.INK)
    if ticked then K.fill(c,nx+2,ny+3,box-4,box-4,K.INK) end
    hit(c,id or "CHECK",nx,ny,box+2,box+2,payload)
    return nx+box+3
end

-- Scroll arrows in the right margin, only when there is more to see.
function K.arrows(c,ny,height,up,down)
    local x=c.w-7
    if up then K.text(c,"^",x,ny,K.DIM); hit(c,"UP",x-1,ny,8,Font.line) end
    if down then
        local y=ny+height-Font.line
        K.text(c,"v",x,y,K.DIM); hit(c,"DOWN",x-1,y,8,Font.line)
    end
end

-- The command line along the foot, with a rule above it.
function K.foot(c,text)
    local line=Font.line
    local y=c.h-line-1
    K.fill(c,0,y-1,c.w,1,K.DIM)
    K.text(c,text,2,y,K.DIM)
    return y
end

function K.rows(c) return math.floor((c.h-2)/Font.line)-3 end

-- The launcher's own header: the battery at the right and the category beside
-- it - the anatomy of the classic Applications screen (Palm OS UI Guidelines;
-- the launcher put the clock top-left and the category picker top-right).
-- `time` is nil on this machine: the owner ruled the clock out, because the
-- game charges a watch slot for knowing the hour and this must not undercut
-- that. The parameter stays so the header can carry one again if that changes.
function K.status(c,time,category,charge)
    local line=Font.line
    if time then K.text(c,time,2,0,K.INK) end
    -- Battery: a little cell, filled to its charge.
    local bw,bh=14,6
    local bx=c.w-bw-4
    K.frame(c,bx,2,bw,bh,K.INK)
    K.fill(c,c.w-3,4,2,2,K.INK)
    if type(charge)=="number" and charge>0 then
        local fill=math.max(1,math.floor((bw-2)*math.min(charge,1)))
        K.fill(c,bx+1,3,fill,bh-2,K.INK)
    end
    if category then
        local w=K.width(category)+6
        local x=bx-w-6
        K.text(c,category,x,0,K.INK)
        K.text(c," v",x+K.width(category),0,K.INK)
        hit(c,"CATEGORY",x-2,0,w+6,line)
    end
    K.fill(c,0,line,c.w,1,K.INK)
    return line+2
end

-- The grid of applications: three columns, icon over name, as the classic
-- launcher drew them. `icons` is a name -> texture lookup owned by the caller.
K.ICON=22
function K.grid(c,programs,ny,selected,icon,counts)
    local cols=3
    local cell=math.floor(c.w/cols)
    local rowHeight=K.ICON+Font.line+3
    for i,program in ipairs(programs) do
        local col=(i-1)%cols
        local row=math.floor((i-1)/cols)
        local x=col*cell+math.floor((cell-K.ICON)/2)
        local y=ny+row*rowHeight
        local texture=icon and icon(program.icon or string.lower(program.id or ""))
        if texture then
            c.panel:drawTextureScaled(texture,c.x+x*c.scale,c.y+y*c.scale,
                K.ICON*c.scale,K.ICON*c.scale,1,1,1,1)
        else
            K.frame(c,x,y,K.ICON,K.ICON,K.INK)
        end
        local label=program.title
        local lw=K.width(label)
        local lx=col*cell+math.floor((cell-lw)/2)
        if i==selected then
            K.fill(c,lx-2,y+K.ICON+1,lw+4,Font.line,K.INK)
            K.text(c,label,lx,y+K.ICON+1,K.GLASS)
        else
            K.text(c,label,lx,y+K.ICON+1,K.INK)
        end
        hit(c,"APP",col*cell,y,cell,rowHeight,i)
    end
end

return K
