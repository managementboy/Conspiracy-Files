require "ISUI/ISCollapsableWindow"
require "ISUI/ISButton"
require "ISUI/ISScrollingListBox"
require "ISUI/ISRichTextPanel"
require "ISUI/ISScrollBar"

local Projection = require("ConspiracyFiles/NotebookProjection")

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.NotebookUI = ConspiracyFiles.NotebookUI or {}
local UI = ConspiracyFiles.NotebookUI

local function runtime()
    return ConspiracyFiles and ConspiracyFiles.Runtime or nil
end

local function log(kind, message)
    print("[CF-DEAD-AIR]|EVENT|kind=" .. tostring(kind) .. "|message=" .. tostring(message or ""):gsub("|", "/"):gsub("\n", " "))
end

local CFReaderWindow = ISCollapsableWindow:derive("CFReaderWindow")

function CFReaderWindow:createChildren()
    ISCollapsableWindow.createChildren(self)
    self:setResizable(true)
    self.body = ISRichTextPanel:new(14, self:titleBarHeight() + 14, self.width - 28, self.height - self:titleBarHeight() - 62)
    self.body:initialise(); self.body:instantiate()
    self.body.autosetheight = false; self.body.clip = true
    self.body.marginLeft, self.body.marginRight = 14, 14
    self.body.marginTop, self.body.marginBottom = 12, 12
    self.body.backgroundColor = { r = 0.76, g = 0.73, b = 0.63, a = 1 }
    self.body.textR, self.body.textG, self.body.textB = 0.10, 0.10, 0.08
    local context = self.documentContext and "\n\nWHAT THIS IS\n" .. self.documentContext or ""
    self.body:setText(self.documentTitle .. context .. "\n\n" .. self.documentBody)
    self.body:paginate(); self:addChild(self.body)
    self.closeButton = ISButton:new(self.width - 104, self.height - 42, 90, 28, "Close", self, CFReaderWindow.close)
    self.closeButton:initialise(); self.closeButton:instantiate(); self:addChild(self.closeButton)
end

function CFReaderWindow:prerender()
    if self.lastWidth ~= self.width or self.lastHeight ~= self.height then
        self.body:setWidth(self.width - 28); self.body:setHeight(self.height - self:titleBarHeight() - 62)
        self.closeButton:setX(self.width - 104); self.closeButton:setY(self.height - 42)
        self.body:paginate(); self.lastWidth, self.lastHeight = self.width, self.height
    end
    ISCollapsableWindow.prerender(self)
end

function CFReaderWindow:close()
    self:removeFromUIManager()
    if UI.reader == self then UI.reader = nil end
end

function CFReaderWindow:new(x, y, width, height, title, context, body)
    local o = ISCollapsableWindow.new(self, x, y, width, height)
    o:setTitle("Inspect: " .. title)
    o.minimumWidth, o.minimumHeight = 420, 320
    o.documentTitle, o.documentContext, o.documentBody = title, context, body
    return o
end

function UI.openReader(title, body, context)
    if UI.reader then UI.reader:close() end
    local screenW, screenH = getCore():getScreenWidth(), getCore():getScreenHeight()
    local width, height = math.min(700, screenW - 60), math.min(720, screenH - 60)
    UI.reader = CFReaderWindow:new(math.floor((screenW - width) / 2), math.floor((screenH - height) / 2), width, height, title, context, body)
    UI.reader:initialise(); UI.reader:instantiate(); UI.reader:addToUIManager()
end

local CFNotebookWindow = ISCollapsableWindow:derive("CFNotebookWindow")

function CFNotebookWindow:drawRow(y, item)
    if self.selected == item.index then self:drawRect(0, y, self.width, item.height, 0.35, 0.48, 0.43, 0.34) end
    self:drawText("#" .. tostring(item.item.ordinal) .. "  " .. item.item.title, 8, y + 5, 0.94, 0.94, 0.88, 1, UIFont.Small)
    self:drawText(item.item.summary, 8, y + 23, 0.70, 0.74, 0.68, 1, UIFont.Small)
    self:drawRectBorder(0, y, self.width, item.height, 0.45, 0.55, 0.55, 0.50)
    return y + item.height
end

function CFNotebookWindow:showRow(row)
    if not row then return end
    self.currentId = row.id; self.detail:setText(row.detailText); self.detail:paginate()
    if self.compact then self.detailOnly = true; self:applyLayout() end
end

function CFNotebookWindow:onRowSelected(row) self:showRow(row) end

function CFNotebookWindow:rows()
    local active = runtime()
    if not active or not active.state then return {} end
    return self.section == "evidence" and Projection.evidence(active.state) or Projection.journal(active.state)
end

function CFNotebookWindow:refresh(preferredId)
    preferredId = preferredId or self.currentId
    self.journalButton:setTitle(self.section == "journal" and "[Journal]" or "Journal")
    self.evidenceButton:setTitle(self.section == "evidence" and "[Evidence]" or "Evidence")
    local rows = self:rows(); self.list:clear(); local selected = nil
    for index, row in ipairs(rows) do
        self.list:addItem(row.title, row)
        if row.id == preferredId then selected = index end
    end
    if #rows == 0 then
        local empty = self.section == "evidence"
            and "Nothing is recorded here yet.\n\nInspect an unusual document or mark an acquired object that seems worth remembering."
            or "Nothing has made it into these notes yet.\n\nThe notebook records encounters; it does not assign objectives."
        self.currentId = nil; self.detail:setText(empty); self.detail:paginate(); return
    end
    self.list.selected = selected or 1; self:showRow(rows[self.list.selected])
end

function CFNotebookWindow:onSection(button)
    self.section = button.internal; self.detailOnly = false; self.currentId = nil
    self:refresh(); self:applyLayout()
end
function CFNotebookWindow:onBack() self.detailOnly = false; self:applyLayout() end

function CFNotebookWindow:createChildren()
    ISCollapsableWindow.createChildren(self); self:setResizable(true)
    local top = self:titleBarHeight() + 12
    self.journalButton = ISButton:new(self.width - 98, top, 94, 36, "Journal", self, CFNotebookWindow.onSection)
    self.journalButton.internal = "journal"; self.journalButton:initialise(); self.journalButton:instantiate(); self:addChild(self.journalButton)
    self.evidenceButton = ISButton:new(self.width - 98, top + 40, 94, 36, "Evidence", self, CFNotebookWindow.onSection)
    self.evidenceButton.internal = "evidence"; self.evidenceButton:initialise(); self.evidenceButton:instantiate(); self:addChild(self.evidenceButton)
    self.closeButton = ISButton:new(self.width - 98, self.height - 48, 94, 32, "Close", self, CFNotebookWindow.close)
    self.closeButton:initialise(); self.closeButton:instantiate(); self:addChild(self.closeButton)
    self.backButton = ISButton:new(12, top, 110, 30, "Back to list", self, CFNotebookWindow.onBack)
    self.backButton:initialise(); self.backButton:instantiate(); self:addChild(self.backButton)
    self.list = ISScrollingListBox:new(12, top, 300, self.height - top - 18)
    self.list:initialise(); self.list:instantiate(); self.list.itemheight = 43
    self.list.doDrawItem = CFNotebookWindow.drawRow
    self.list:setOnMouseDownFunction(self, CFNotebookWindow.onRowSelected)
    self.list.drawBorder = true; self:addChild(self.list)
    self.detail = ISRichTextPanel:new(324, top, self.width - 438, self.height - top - 18)
    self.detail:initialise(); self.detail:instantiate(); self.detail:addScrollBars(false); self.detail.autosetheight = false; self.detail.clip = true
    self.detail.marginLeft, self.detail.marginRight = 16, 16
    self.detail.marginTop, self.detail.marginBottom = 14, 14
    self.detail.backgroundColor = { r = 0.76, g = 0.73, b = 0.63, a = 1 }
    self.detail.textR, self.detail.textG, self.detail.textB = 0.10, 0.10, 0.08
    self:addChild(self.detail); self:refresh(); self:applyLayout()
end

function CFNotebookWindow:applyLayout()
    local gap, controlsWidth = 12, 102
    local top, bottom = self:titleBarHeight() + gap, self:resizeWidgetHeight() + gap
    local contentWidth, contentHeight = self.width - controlsWidth - gap * 2, self.height - top - bottom
    self.compact = contentWidth < 620
    self.journalButton:setX(self.width - 98); self.journalButton:setY(top)
    self.evidenceButton:setX(self.width - 98); self.evidenceButton:setY(top + 40)
    self.closeButton:setX(self.width - 98); self.closeButton:setY(self.height - bottom - 32)
    if self.compact then
        self.backButton:setVisible(self.detailOnly)
        self.list:setVisible(not self.detailOnly); self.detail:setVisible(self.detailOnly)
        self.list:setX(gap); self.list:setY(top); self.list:setWidth(contentWidth); self.list:setHeight(contentHeight)
        self.detail:setX(gap); self.detail:setY(top + 38); self.detail:setWidth(contentWidth); self.detail:setHeight(contentHeight - 38)
    else
        self.backButton:setVisible(false); self.list:setVisible(true); self.detail:setVisible(true)
        local listWidth = math.floor(contentWidth * 0.36)
        self.list:setX(gap); self.list:setY(top); self.list:setWidth(listWidth); self.list:setHeight(contentHeight)
        self.detail:setX(gap + listWidth + gap); self.detail:setY(top)
        self.detail:setWidth(contentWidth - listWidth - gap); self.detail:setHeight(contentHeight)
    end
    self.detail:paginate()
    if self.detail.vscroll then self.detail.vscroll:updatePos() end
end

function CFNotebookWindow:prerender()
    if self.lastWidth ~= self.width or self.lastHeight ~= self.height then
        self:setWidth(math.max(self.minimumWidth, self.width)); self:setHeight(math.max(self.minimumHeight, self.height))
        self:applyLayout(); self.lastWidth, self.lastHeight = self.width, self.height
    end
    ISCollapsableWindow.prerender(self)
end

function CFNotebookWindow:close()
    if UI.reader then UI.reader:close() end
    self:removeFromUIManager(); if UI.notebook == self then UI.notebook = nil end
end

function CFNotebookWindow:new(x, y, width, height)
    local o = ISCollapsableWindow.new(self, x, y, width, height)
    o:setTitle("Survivor's Notebook - Dead Air")
    o.minimumWidth, o.minimumHeight = 500, 400
    o.section, o.detailOnly = "journal", false
    return o
end

function UI.open(section, preferredId)
    local ok, err = pcall(function()
        local active = runtime()
        if not active or not active.state or active.disabled then return end
        if UI.notebook then
            if section then UI.notebook.section = section end
            UI.notebook:refresh(preferredId); UI.notebook:bringToTop(); return
        end
        local screenW, screenH = getCore():getScreenWidth(), getCore():getScreenHeight()
        local width = math.min(math.max(760, math.floor(screenW * 0.70)), screenW - 40)
        local height = math.min(math.max(520, math.floor(screenH * 0.65)), screenH - 40)
        UI.notebook = CFNotebookWindow:new(math.floor((screenW - width) / 2), math.floor((screenH - height) / 2), width, height)
        if section then UI.notebook.section = section end
        UI.notebook:initialise(); UI.notebook:instantiate(); UI.notebook:addToUIManager()
        if preferredId then UI.notebook:refresh(preferredId) end
    end)
    if not ok then log("ERROR", "boundary=notebook-open error=" .. tostring(err)) end
end

function UI.refresh(section, preferredId)
    if not UI.notebook then return end
    local ok, err = pcall(function()
        if section then UI.notebook.section = section end
        UI.notebook:refresh(preferredId)
    end)
    if not ok then log("ERROR", "boundary=notebook-refresh error=" .. tostring(err)) end
end

local NOTEBOOK_BIND = "Conspiracy-Files: Toggle Survivor Notebook"
if keyBinding then
    local present = false
    for _, binding in ipairs(keyBinding) do if binding.value == NOTEBOOK_BIND then present = true; break end end
    if not present then table.insert(keyBinding, { value = NOTEBOOK_BIND, key = Keyboard.KEY_NONE }) end
end

function UI.toggle()
    if UI.notebook then UI.notebook:close() else UI.open() end
end

if Events and Events.OnKeyPressed then
    -- Build 42 may evaluate this file more than once.  Keep one handler;
    -- some event implementations do not expose Remove during a reload.
    if not UI.keyHandler then
        UI.keyHandler = function(key)
            if getCore():getKey(NOTEBOOK_BIND) == key then UI.toggle() end
        end
        Events.OnKeyPressed.Add(UI.keyHandler)
    end
end

return UI
