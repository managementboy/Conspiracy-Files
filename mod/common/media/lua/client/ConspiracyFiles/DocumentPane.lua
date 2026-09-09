require "ISUI/ISPanel"
require "ISUI/ISRichTextPanel"
ConspiracyFiles=ConspiracyFiles or {}
local DocumentPane=ISPanel:derive("CFDocumentPane")
local Scroll=ISPanel:derive("CFDocumentScroll")
function Scroll:metrics()
    local visible=math.max(1,self.target:getScrollAreaHeight())
    local total=math.max(visible,self.target:getScrollHeight())
    local maximum=total-visible
    local offset=math.max(0,math.min(maximum,-self.target:getYScroll()))
    local thumb=math.min(self.height,math.max(24,self.height*visible/total))
    local travel=math.max(0,self.height-thumb)
    return maximum,offset,thumb,travel,maximum>0 and travel*offset/maximum or 0
end
function Scroll:prerender()
    local maximum,_,thumb,_,top=self:metrics()
    self:drawRect(0,0,self.width,self.height,1,0.06,0.07,0.06)
    self:drawRectBorder(0,0,self.width,self.height,1,0.70,0.70,0.65)
    local color=maximum>0 and 0.85 or 0.40
    self:drawRect(3,top,self.width-6,thumb,1,color,color,color)
end
function Scroll:onMouseDown(_,y)
    local maximum,offset,thumb,travel,top=self:metrics()
    if maximum<=0 then return true end
    if y>=top and y<=top+thumb then
        self.dragging=true; self.delta=0; self.startOffset=offset; self.travel=math.max(1,travel); self:setCapture(true)
    else self.target:setYScroll(-(offset+(y<top and -1 or 1)*self.target:getScrollAreaHeight()*0.9)) end
    return true
end
function Scroll:onMouseMove(_,dy)
    if not self.dragging then return end
    self.delta=self.delta+dy
    local maximum=self:metrics()
    self.target:setYScroll(-math.max(0,math.min(maximum,self.startOffset+self.delta*maximum/self.travel)))
end
function Scroll:onMouseMoveOutside(dx,dy) self:onMouseMove(dx,dy) end
function Scroll:onMouseUp() self.dragging=false; self:setCapture(false); return true end
function Scroll:onMouseUpOutside() return self:onMouseUp() end
function Scroll:onMouseWheel(delta) return self.target:onMouseWheel(delta) end
function Scroll:new(target)
    local o=ISPanel.new(self,0,0,22,100); o.target=target; o.background=false; o.border=false; return o
end
function DocumentPane:createChildren()
    self.body=ISRichTextPanel:new(0,0,self.width-24,self.height)
    self.body:initialise(); self.body:instantiate(); self.body.autosetheight=false; self.body.clip=true
    self.body.marginLeft,self.body.marginRight=14,14; self.body.marginTop,self.body.marginBottom=12,12
    self:addChild(self.body)
    self.scroll=Scroll:new(self.body); self.scroll:initialise(); self.scroll:instantiate(); self:addChild(self.scroll)
    self:layout()
end
function DocumentPane:layout()
    if not self.body then return end
    self.body:setWidth(math.max(30,self.width-24)); self.body:setHeight(self.height)
    self.scroll:setX(self.width-22); self.scroll:setHeight(self.height)
    self.body:paginate()
end
function DocumentPane:setDocument(text,contrast)
    self.plainText=tostring(text or "")
    self.contrast=contrast
    self.body.backgroundColor=contrast and {r=0.02,g=0.02,b=0.02,a=1} or {r=0.84,g=0.81,b=0.71,a=1}
    -- paginate() resets rgbCurrent to white; textR/G/B does not control parsed
    -- line colours. An explicit initial RGB tag fixes the installed renderer.
    local ink=contrast and "<RGB:1,1,1> " or "<RGB:0.10,0.10,0.08> "
    self.body:setText(ink..self.plainText:gsub("<","&lt;"):gsub(">","&gt;")); self.body:paginate(); self.body:setYScroll(0)
end
function DocumentPane:page(direction) self.body:setYScroll(self.body:getYScroll()-direction*self.body:getScrollAreaHeight()*0.9) end
function DocumentPane:prerender()
    if self.lastW~=self.width or self.lastH~=self.height then self:layout(); self.lastW,self.lastH=self.width,self.height end
    ISPanel.prerender(self)
end
function DocumentPane:new(x,y,width,height)
    local o=ISPanel.new(self,x,y,width,height); o.background=false; o.border=false; return o
end
ConspiracyFiles.DocumentPane=DocumentPane
return DocumentPane
