-- Proves the game loaded the mod's own font into the Cred2 slot.
CFFont = CFFont or {}
function CFFont.probe()
    local tm = getTextManager()
    local height = tm:getFontHeight(UIFont.Cred2)
    local w = tm:MeasureStringX(UIFont.Cred2, "Kubiak")
    local small = tm:getFontHeight(UIFont.Small)
    return tostring(height), tostring(w), tostring(small)
end
-- Draw a line of it on screen so a screenshot can confirm the shapes.
function CFFont.show()
    local ISPanel = ISPanel
    if CFFont.panel then CFFont.panel:removeFromUIManager() end
    local p = ISPanel:new(80, 80, 620, 150)
    p:initialise(); p:instantiate()
    p.backgroundColor = {r=0.72, g=0.77, b=0.63, a=1}
    p.render = function(self)
        self:drawRect(0, 0, self.width, self.height, 1, 0.72, 0.77, 0.63)
        self:drawText("#4 Fancy pen, marked I. Kubiak", 12, 12, 0.17, 0.20, 0.14, 1, UIFont.Cred2)
        self:drawText("a desk, 109 Walker Road", 12, 46, 0.17, 0.20, 0.14, 1, UIFont.Cred2)
        self:drawText("ABCDEFGHIJKLM 0123456789", 12, 80, 0.17, 0.20, 0.14, 1, UIFont.Cred2)
        self:drawText("the same line in the game's own Small font", 12, 114, 0.17, 0.20, 0.14, 1, UIFont.Small)
    end
    p:addToUIManager()
    CFFont.panel = p
    return true
end
