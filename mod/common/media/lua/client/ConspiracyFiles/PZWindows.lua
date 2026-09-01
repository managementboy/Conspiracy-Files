require "ISUI/ISCollapsableWindow"
require "ISUI/ISRichTextPanel"
require "ISUI/ISTabPanel"

local WindowGeometry = require("ConspiracyFiles.WindowGeometry")

local PZWindows = {}

local function escape(value)
    value = tostring(value or "")
    value = string.gsub(value, "<", "&lt;")
    return string.gsub(value, ">", "&gt;")
end

local function richText(title, description, body)
    local result = "<H1> " .. escape(title) .. " <LINE> <TEXT>"
    if description and description ~= "" then result = result .. " " .. escape(description) .. " <BR>" end
    return result .. " " .. escape(body or "")
end

local function journalText(rows)
    if #rows == 0 then return "<H2> No entries yet <LINE> <TEXT> The pages are blank. Survival has been noisy enough without invented answers." end
    local parts = { "<H2> Chronology <LINE> <TEXT>" }
    for _, row in ipairs(rows) do
        local marker = row.major and "[!] " or ""
        parts[#parts + 1] = marker .. tostring(row.ordinal) .. ". " .. escape(row.text) .. " <BR>"
    end
    return table.concat(parts, " ")
end

local function evidenceText(rows)
    if #rows == 0 then return "<H2> Evidence <LINE> <TEXT> Nothing recorded yet. Suspicion is not evidence until I choose to keep it." end
    local parts = { "<H2> Evidence <LINE> <TEXT>" }
    for _, row in ipairs(rows) do
        local marker = row.playerMarkedInteresting and "[marked] " or ""
        parts[#parts + 1] = marker .. tostring(row.discoveryOrdinal) .. ". " .. escape(row.title)
            .. " <LINE> " .. escape(row.contextText) .. " <BR>"
    end
    return table.concat(parts, " ")
end

local function helpText(help)
    local parts = { "<H2> " .. escape(help.title) .. " <LINE> <TEXT>" }
    for _, paragraph in ipairs(help.paragraphs) do parts[#parts + 1] = escape(paragraph) .. " <BR>" end
    return table.concat(parts, " ")
end

local function configureRichPanel(panel)
    panel:initialise()
    panel.autosetheight = false
    panel.clip = true
    panel.marginLeft = 18
    panel.marginRight = 18
    panel.marginTop = 14
    panel.marginBottom = 14
    panel:addScrollBars()
end

local ReaderWindow = ISCollapsableWindow:derive("ConspiracyFilesReaderWindow")

function ReaderWindow:createChildren()
    ISCollapsableWindow.createChildren(self)
    self.textPanel = ISRichTextPanel:new(8, self:titleBarHeight() + 8,
        self:getWidth() - 16, self:getHeight() - self:titleBarHeight() - 16)
    configureRichPanel(self.textPanel)
    self:addChild(self.textPanel)
    self:layoutContent()
end

function ReaderWindow:layoutContent()
    if not self.textPanel then return end
    local top = self:titleBarHeight() + 8
    self.textPanel:setX(8)
    self.textPanel:setY(top)
    self.textPanel:setWidth(math.max(200, self:getWidth() - 16))
    self.textPanel:setHeight(math.max(180, self:getHeight() - top - 8))
    self.textPanel.textDirty = true
end

function ReaderWindow:prerender()
    if self._layoutWidth ~= self:getWidth() or self._layoutHeight ~= self:getHeight() then
        self._layoutWidth, self._layoutHeight = self:getWidth(), self:getHeight()
        self:layoutContent()
    end
    ISCollapsableWindow.prerender(self)
end

function ReaderWindow:setProjection(projection)
    self:setTitle(projection.title)
    self.textPanel:setText(richText(projection.title, projection.description, projection.body))
    self.textPanel:paginate()
    self.textPanel:setYScroll(0)
end

function ReaderWindow:new(geometry)
    local value = ISCollapsableWindow:new(geometry.x, geometry.y, geometry.width, geometry.height)
    setmetatable(value, self)
    self.__index = self
    value:setResizable(true)
    value.pin = true
    return value
end

local NotebookWindow = ISCollapsableWindow:derive("ConspiracyFilesNotebookWindow")

function NotebookWindow:createChildren()
    ISCollapsableWindow.createChildren(self)
    local top = self:titleBarHeight() + 6
    self.tabs = ISTabPanel:new(8, top, self:getWidth() - 16, self:getHeight() - top - 8)
    self.tabs:initialise()
    self.tabs.equalTabWidth = true
    self:addChild(self.tabs)

    self.journalPanel = ISRichTextPanel:new(0, 0, self.tabs:getWidth(), self.tabs:getHeight() - self.tabs.tabHeight)
    self.evidencePanel = ISRichTextPanel:new(0, 0, self.tabs:getWidth(), self.tabs:getHeight() - self.tabs.tabHeight)
    self.helpPanel = ISRichTextPanel:new(0, 0, self.tabs:getWidth(), self.tabs:getHeight() - self.tabs.tabHeight)
    for _, panel in ipairs({ self.journalPanel, self.evidencePanel, self.helpPanel }) do configureRichPanel(panel) end
    self.tabs:addView("Journal", self.journalPanel)
    self.tabs:addView("Evidence", self.evidencePanel)
    self.tabs:addView("Help", self.helpPanel)
    self:layoutContent()
end

function NotebookWindow:layoutContent()
    if not self.tabs then return end
    local top = self:titleBarHeight() + 6
    self.tabs:setX(8)
    self.tabs:setY(top)
    self.tabs:setWidth(math.max(300, self:getWidth() - 16))
    self.tabs:setHeight(math.max(220, self:getHeight() - top - 8))
    local viewHeight = math.max(180, self.tabs:getHeight() - self.tabs.tabHeight)
    for _, panel in ipairs({ self.journalPanel, self.evidencePanel, self.helpPanel }) do
        panel:setWidth(self.tabs:getWidth())
        panel:setHeight(viewHeight)
        panel.textDirty = true
    end
end

function NotebookWindow:prerender()
    if self._layoutWidth ~= self:getWidth() or self._layoutHeight ~= self:getHeight() then
        self._layoutWidth, self._layoutHeight = self:getWidth(), self:getHeight()
        self:layoutContent()
    end
    ISCollapsableWindow.prerender(self)
end

function NotebookWindow:setProjection(projection)
    self:setTitle(projection.title .. " — survivor notebook")
    self.journalPanel:setText(journalText(projection.journal))
    self.evidencePanel:setText(evidenceText(projection.evidence))
    self.helpPanel:setText(helpText(projection.help))
    for _, panel in ipairs({ self.journalPanel, self.evidencePanel, self.helpPanel }) do
        panel:paginate()
        panel:setYScroll(0)
    end
end

function NotebookWindow:new(geometry)
    local value = ISCollapsableWindow:new(geometry.x, geometry.y, geometry.width, geometry.height)
    setmetatable(value, self)
    self.__index = self
    value:setResizable(true)
    value.pin = true
    return value
end

local function fitToCurrentScreen(window, kind)
    local screenWidth, screenHeight = getCore():getScreenWidth(), getCore():getScreenHeight()
    local preferred = WindowGeometry.centered(screenWidth, screenHeight, kind)
    if window:getWidth() > screenWidth - 16 or window:getHeight() > screenHeight - 16 then
        window:setWidth(preferred.width)
        window:setHeight(preferred.height)
    end
    window:setX(math.max(0, math.min(window:getX(), screenWidth - window:getWidth())))
    window:setY(math.max(0, math.min(window:getY(), screenHeight - window:getHeight())))
end

local function show(window, kind)
    fitToCurrentScreen(window, kind)
    window:setVisible(true)
    if not window._cfAddedToUIManager then
        window:addToUIManager()
        window._cfAddedToUIManager = true
    end
    window:bringToTop()
end

function PZWindows.new()
    local api = { reader = nil, notebook = nil }

    function api.openReader(projection)
        if not api.reader then
            api.reader = ReaderWindow:new(WindowGeometry.centered(getCore():getScreenWidth(), getCore():getScreenHeight(), "reader"))
            api.reader:initialise()
            api.reader:instantiate()
        end
        api.reader:setProjection(projection)
        show(api.reader, "reader")
    end

    function api.openNotebook(projection)
        if not api.notebook then
            api.notebook = NotebookWindow:new(WindowGeometry.centered(getCore():getScreenWidth(), getCore():getScreenHeight(), "notebook"))
            api.notebook:initialise()
            api.notebook:instantiate()
        end
        api.notebook:setProjection(projection)
        show(api.notebook, "notebook")
    end

    return api
end

return PZWindows
