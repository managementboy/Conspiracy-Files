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
local BASE=require("ConspiracyFiles/Generated/OrganiserFont")
-- The face the current drawing pass uses (P4-R99): the 16 pt face at 1x-3x, or
-- its 24 pt cut for the size between Small and Medium. One screen draws at a
-- time, so it is simply the face the pass began with (K.begin).
local Font=BASE
ConspiracyFiles=ConspiracyFiles or {}
local K=ConspiracyFiles.KnoxUI or {}
ConspiracyFiles.KnoxUI=K

K.INK={0.15,0.17,0.13}
K.DIM={0.38,0.42,0.33}
K.GLASS={0.66,0.70,0.59}
K.LINE=Font.line

-- A drawing context: where the glass is, how big a pixel is, and the list of
-- hit boxes built up as widgets are drawn.
function K.begin(panel,scale,x,y,w,h,face)
    Font=face or BASE
    K.current=Font
    return {panel=panel,scale=scale,x=x,y=y,w=w,h=h,hits={},cursor=0,font=Font}
end
K.current=BASE

-- One glyph picture, cached per scale and then per character code.
--
-- It used to build a string key - scale.."/"..code - for every character of
-- every line of every frame. A full screen of text is ~640 glyphs, so that was
-- ~640 string allocations and ~640 hash lookups per frame, thrown away
-- immediately, purely to find something already in memory. Two integer-keyed
-- array lookups do the same job and allocate nothing.
--
-- `false` still marks a glyph the game does not have, so a missing texture is
-- looked up once rather than on every frame forever.
K.cache=K.cache or {}
-- Keyed by face, then scale, then code: tables as keys, so nothing is built
-- per glyph. A face's pictures live under its own folder (b1x/ for 24 pt).
local function glyph(code,scale)
    local byFace=K.cache[Font]
    if not byFace then byFace={}; K.cache[Font]=byFace end
    local byScale=byFace[scale]
    if not byScale then byScale={}; byFace[scale]=byScale end
    local hit=byScale[code]
    if hit~=nil then return hit or nil end
    local ok,texture=pcall(getTexture,"media/ui/CFOrg/"..(Font.folder or "")..scale.."x/"..code..".png")
    byScale[code]=(ok and texture) or false
    return ok and texture or nil
end

-- Text in native coordinates, CLIPPED TO THE GLASS. Returns the width drawn,
-- in native pixels.
--
-- The clip is not a nicety. Nothing clips a mod's drawing to its own panel, so
-- this loop used to draw every character it was given, walking the cursor
-- straight off the right-hand edge of the LCD and painting the remainder over
-- the device's moulded housing. Two things wrong with that at once: the player
-- can write a two-hundred-character note (the field's own limit), so it is
-- reachable rather than theoretical; and every glyph past the edge still cost
-- a Lua-to-Java call for something nobody could see.
--
-- MEASURED, 2026-09-13, on a NOTES list of forty-one notes: 1224 texture
-- calls per frame and 5.98 ms of a 16.6 ms frame spent on screen content,
-- because sixteen visible rows were each drawing seventy-two characters into a
-- thirty-eight character line. The rows were already culled vertically; it was
-- only ever the horizontal edge that leaked.
function K.text(c,value,nx,ny,colour)
    local s=c.scale
    local cursor=c.x+nx*s
    local edge=c.x+c.w*s
    value=tostring(value or "")
    for i=1,#value do
        local code=string.byte(value,i)
        if code>=Font.first and code<=Font.last then
            local width=Font.w[code-Font.first+1]
            if cursor+width*s>edge then
                -- Past the glass. Nothing after this can be visible either,
                -- because the cursor only moves right.
                return (cursor-c.x)/s-nx
            end
            local texture=glyph(code,s)
            if texture then
                c.panel:drawTextureScaled(texture,cursor,c.y+ny*s,width*s,Font.line*s,1,colour[1],colour[2],colour[3])
            end
            cursor=cursor+width*s
        end
    end
    return (cursor-c.x)/s-nx
end

-- As much of `value` as fits in `width` native pixels, with an ellipsis when
-- something had to go. A hard clip alone stops the bleed but cuts a word
-- mid-letter and says nothing about it; a row that has been shortened should
-- look shortened, which is what the record view already did for its own lines.
function K.fit(value,width)
    value=tostring(value or "")
    if Font.width(value,1)<=width then return value end
    local dots=Font.width("...",1)
    local room=width-dots
    if room<=0 then return "" end
    local total,cut=0,0
    for i=1,#value do
        local code=string.byte(value,i)
        local w=(code>=Font.first and code<=Font.last) and Font.w[code-Font.first+1] or 0
        if total+w>room then break end
        total=total+w; cut=i
    end
    return value:sub(1,cut).."..."
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
    -- Shortened with an ellipsis rather than sheared off at the glass: the
    -- row starts at x=2 and the scroll arrows own the last nine pixels.
    K.text(c,K.fit(label,c.w-11),2,ny,selected and K.GLASS or K.INK)
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
-- A Palm scroll bar down the right edge of whatever scrolls (owner, Windows,
-- 2026-09-14: "scrollbars not visible?" - a lone "v" in the corner was all that
-- said a record went on). Arrows at both ends, dim when there is nothing more
-- that way; a track; and a thumb as long as the share of the text on screen,
-- sitting where the screen is. Drawn only when there is more than fits.
-- Tapping above the thumb steps up and below it steps down, as the rocker does.
-- `top` is the first line shown, `room` how many fit, `total` how many exist.
-- A Palm popup list (owner, 2026-09-14, with a photo of one): a bordered box
-- over the screen with a title, the current choice inverted, and a tap on a
-- line to choose it. A tap anywhere else leaves the setting as it was, so the
-- catcher is registered first and the lines, drawn after it, win the tap.
-- A choice longer than the box WRAPS onto more lines rather than being cut
-- (owner, 2026-09-15, P4-R122: "the wording can be as long as necessary"), and
-- a tap anywhere on its lines chooses it.
function K.wrap(value,width)
    local out,line={}, ""
    for word in tostring(value or ""):gmatch("%S+") do
        local candidate=line=="" and word or (line.." "..word)
        if line=="" or K.width(candidate)<=width then line=candidate
        else out[#out+1]=line; line=word end
    end
    if line~="" then out[#out+1]=line end
    if #out==0 then out[1]="" end
    return out
end

function K.popup(c,title,labels,selected)
    local line=Font.line
    hit(c,"POPUP_CLOSE",0,0,c.w,c.h)
    local w=K.width(title)+12
    for _,label in ipairs(labels) do w=math.max(w,K.width(label)+12) end
    w=math.min(w,c.w-4)
    local wrapped,count={},0
    for i,label in ipairs(labels) do wrapped[i]=K.wrap(label,w-6); count=count+#wrapped[i] end
    local h=line*(count+1)+4
    local x=math.floor((c.w-w)/2)
    local y=math.max(line+2,math.floor((c.h-h)/2))
    K.fill(c,x,y,w,h,K.GLASS)
    K.frame(c,x,y,w,h,K.INK)
    K.text(c,K.fit(title,w-6),x+3,y+1,K.DIM)
    K.fill(c,x+1,y+line+1,w-2,1,K.INK)
    local ly=y+2+line
    for i,lines in ipairs(wrapped) do
        local tall=line*#lines
        if i==selected then K.fill(c,x+1,ly,w-2,tall,K.INK) end
        for j,text in ipairs(lines) do
            K.text(c,K.fit(text,w-6),x+3,ly+(j-1)*line,i==selected and K.GLASS or K.INK)
        end
        hit(c,"POPUP",x,ly,w,tall,i)
        ly=ly+tall
    end
    return x,y,w,h
end

function K.scrollbar(c,ny,height,top,room,total)
    if type(total)~="number" or total<=room then return end
    local w=5
    local x=c.w-w-1
    local upInk=top>1 and K.INK or K.DIM
    local downInk=top+room-1<total and K.INK or K.DIM
    K.fill(c,x+2,ny,1,1,upInk); K.fill(c,x+1,ny+1,3,1,upInk); K.fill(c,x,ny+2,5,1,upInk)
    local by=ny+height-3
    K.fill(c,x,by,5,1,downInk); K.fill(c,x+1,by+1,3,1,downInk); K.fill(c,x+2,by+2,1,1,downInk)
    local trackY,trackH=ny+4,height-8
    if trackH<3 then
        local half=math.floor(height/2)
        hit(c,"UP",x-2,ny,w+3,half); hit(c,"DOWN",x-2,ny+half,w+3,height-half)
        return
    end
    K.fill(c,x+2,trackY,1,trackH,K.DIM)
    local thumbH=math.max(3,math.floor(trackH*room/total))
    local share=math.min(1,math.max(0,(top-1)/math.max(1,total-room)))
    local thumbY=trackY+math.floor((trackH-thumbH)*share)
    K.fill(c,x+1,thumbY,3,thumbH,K.INK)
    hit(c,"UP",x-2,ny,w+3,thumbY-ny)
    hit(c,"DOWN",x-2,thumbY+thumbH,w+3,ny+height-thumbY-thumbH)
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

-- The Date Book's day view header (owner, 2026-09-14, with a photo of the
-- real one): the date on the left and the week it falls in across the right,
-- the open day inverted and a tick under any other day with something on it.
-- `week` is seven cells, Sunday first, each nil (a day of another month) or
-- {day=n,marked=bool}. The date shortens rather than running under the week.
function K.dayHeader(c,label,shorter,week,selected)
    local line=Font.line
    K.fill(c,0,0,c.w,line,K.INK)
    local HEAD={"S","M","T","W","T","F","S"}
    local cw=K.width("W")+3
    local left=c.w-1-cw*7
    if K.width(label)>left-4 then label=shorter or label end
    K.text(c,K.fit(label,left-4),2,0,K.GLASS)
    for i=1,7 do
        local cell=week and week[i]
        if cell then
            local x=left+(i-1)*cw
            local tx=x+math.floor((cw-K.width(HEAD[i]))/2)
            if cell.day==selected then
                K.fill(c,x,1,cw-1,line-1,K.GLASS)
                K.text(c,HEAD[i],tx,0,K.INK)
            else
                K.text(c,HEAD[i],tx,0,K.GLASS)
                if cell.marked then K.fill(c,x+math.floor(cw/2)-1,line-2,2,1,K.GLASS) end
            end
            hit(c,"WEEKDAY",x,0,cw,line,cell.day)
        end
    end
    c.cursor=line+1
    return c.cursor
end

-- One line of the day view: the hour at the left, a rule, and what was found
-- in that hour on the rule. A second find in the same hour passes hour=nil and
-- is drawn without repeating the time, as the Date Book did. A solid rule, not
-- the Date Book's dots: every dot would be a draw call of its own.
function K.hourLine(c,ny,hour,text,id,payload)
    local line=Font.line
    local lx=K.width("00:00")+4
    if hour then
        local label=string.format("%d:00",hour)
        K.text(c,label,lx-4-K.width(label),ny,K.DIM)
    end
    K.fill(c,lx,ny+line-1,c.w-lx-8,1,K.DIM)
    if text and text~="" then
        K.text(c,K.fit(text,c.w-lx-10),lx,ny,K.INK)
        if id then hit(c,id,0,ny,c.w-8,line,payload) end
    end
    return ny+line
end

-- The grid of applications: three columns, icon over name, as the classic
-- launcher drew them. `icons` is a name -> texture lookup owned by the caller.
K.ICON=22
-- The month, as the Date Book drew one: a grid of the days, and a mark on the
-- days that have something. Palm did not merely dot a busy day - the marks sat
-- at the top, middle or bottom of the cell for morning, afternoon or night, so
-- the shape of the month told you WHEN at a glance. That is free here, because
-- every discovery already carries an hour.
--
-- `days` is a map: day number -> {morning=bool,afternoon=bool,night=bool}.
-- `first` is the weekday the 1st falls on, 1 = Sunday, as the Date Book began
-- its weeks.
function K.month(c,ny,length,first,days,today,selected)
    local line=Font.line
    local cw=math.floor(c.w/7)
    local left=math.floor((c.w-cw*7)/2)
    local HEAD={"S","M","T","W","T","F","S"}
    for i=1,7 do
        local x=left+(i-1)*cw
        K.text(c,HEAD[i],x+math.floor((cw-K.width(HEAD[i]))/2),ny,K.DIM)
    end
    local top=ny+line
    local ch=line+6
    local rows=math.ceil((length+first-1)/7)
    for d=1,length do
        local cell=d+first-2
        local col,row=cell%7,math.floor(cell/7)
        local x,y=left+col*cw,top+row*ch
        if d==selected then K.fill(c,x,y,cw-1,ch-1,K.INK) end
        local ink=(d==selected) and K.GLASS or K.INK
        local label=tostring(d)
        K.text(c,label,x+2,y,ink)
        if d==today and d~=selected then K.frame(c,x,y,cw-1,ch-1,K.INK) end
        -- The marks: a square each, high for morning, middle for afternoon,
        -- low for night. Right-hand side, so the day number stays readable.
        local mark=days and days[d]
        if mark then
            local mx=x+cw-4
            if mark.morning then K.fill(c,mx,y+1,2,2,ink) end
            if mark.afternoon then K.fill(c,mx,y+math.floor(ch/2)-1,2,2,ink) end
            if mark.night then K.fill(c,mx,y+ch-4,2,2,ink) end
        end
        hit(c,"DAY",x,y,cw-1,ch-1,d)
    end
    return top+rows*ch
end

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
