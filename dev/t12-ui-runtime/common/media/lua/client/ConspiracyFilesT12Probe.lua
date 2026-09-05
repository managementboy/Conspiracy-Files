-- Conspiracy-Files T12: disposable Build 42 ISUI feasibility probe.
-- This is development-only code and is not production Conspiracy-Files UI.

require "ISUI/ISCollapsableWindow"
require "ISUI/ISPanel"
require "ISUI/ISButton"
require "ISUI/ISScrollingListBox"
require "ISUI/ISRichTextPanel"

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.T12Probe = ConspiracyFiles.T12Probe or {}

local T12 = ConspiracyFiles.T12Probe
local PREFIX = "[CF-T12]"
local PROBE_VERSION = "DEV-0.5-document-scrollbar"
local OPTION_KEY = "ConspiracyFiles.T12.Open"
local TOGGLE_BIND = "Conspiracy-Files T12: Toggle Notebook"
local MOD_ID = "ConspiracyFiles_T12_Probe"

local JOURNAL = {
    { title = "Found CSS service ticket", state = "MAJOR", body = "Relay Site 31 appears in an after-hours service ticket. The carrier repeated for thirty-seven seconds every six minutes." },
    { title = "Marked B-37 key", state = "UPDATED", body = "Original context: small key with a red B-37 tag. Later context: Pike's note links the key to Rourke's receiver ring." },
    { title = "Paperwork does not add up", state = "CONTRADICTION", body = "The access procedure says police were warned before the seizure. Pike's shift note says the full memo was not there." },
}

local EVIDENCE = {
    { title = "CSS Field Service Ticket 93-0714", state = "DOCUMENT", body = "CUMBERLAND SIGNAL SERVICES\n\nFIELD SERVICE TICKET\n\nA long synthetic document body exercises independent scrolling. 100% literal percent content must remain safe.\n\n" .. string.rep("Observed line: reserve carrier, no voice, no station ID.\n\n", 18) },
    { title = "B-37 cabinet key", state = "UPDATED", body = "ORIGINAL CONTEXT\nSmall key; red tag B-37.\n\nLATER CONTEXT\nPike's note says the key came from Rourke's receiver ring." },
    { title = "Property Desk Shift Note", state = "DOCUMENT", body = "Pike records that callers could not agree whether H. Vale named a person, an office or an authorization." },
}

local function safe(value)
    return tostring(value or "<nil>"):gsub("|", "/"):gsub("\r", " "):gsub("\n", " ")
end

local function log(kind, fields)
    local parts = { PREFIX, "EVENT", "kind=" .. safe(kind) }
    for i = 1, #(fields or {}) do parts[#parts + 1] = fields[i] end
    print(table.concat(parts, "|"))
end

local function saveFolder()
    local name = getCurrentSaveName and getCurrentSaveName() or ""
    return tostring(name):match("([^\\/]+)$") or ""
end

local function guardedEnvironment()
    if saveFolder() == "" then return false, "no-save" end
    local ok, mods = pcall(getActivatedMods)
    if not ok or mods == nil then return false, "activated-mods" end
    local countOk, count = pcall(function() return mods:size() end)
    local containsOk, contains = pcall(function() return mods:contains(MOD_ID) end)
    if not countOk or count ~= 1 or not containsOk or contains ~= true then return false, "sole-mod" end
    return true, "guarded"
end

local T12HelpWindow = ISCollapsableWindow:derive("T12HelpWindow")

function T12HelpWindow:createChildren()
    ISCollapsableWindow.createChildren(self)
    self:setResizable(false)
    self.text = ISRichTextPanel:new(12, self:titleBarHeight() + 12, self.width - 24, self.height - self:titleBarHeight() - 24)
    self.text:initialise()
    self.text:instantiate()
    self.text.autosetheight = false
    self.text.clip = true
    self.text:setText("ABOUT THESE NOTES\n\nThis is a disposable T12 utility window.\n\nINSPECT\nRead unusual documents through their inventory action.\n\nMARK INTERESTING\nRecord an acquired object because you think it matters.\n\nUse the window X buttons to close. The Toggle Notebook key binding opens or closes the notebook.")
    self.text:paginate()
    self:addChild(self.text)
end

function T12HelpWindow:close()
    log("HELP_CLOSE")
    self:removeFromUIManager()
    T12.helpWindow = nil
end

function T12HelpWindow:new(x, y)
    local o = ISCollapsableWindow.new(self, x, y, 430, 360)
    o:setTitle("T12 Help utility")
    return o
end

local T12NotebookWindow = ISCollapsableWindow:derive("T12NotebookWindow")

-- ISRichTextPanel scrolls correctly in Build 42, but its inherited native
-- scrollbar did not paint when embedded in this resizable window.  Keep the
-- text panel as the scroll authority and expose its position through a
-- separate sibling control.  This avoids relying on undocumented child
-- painting behavior while retaining the engine's clamping and wheel support.
local T12DocumentScrollBar = ISPanel:derive("T12DocumentScrollBar")

function T12DocumentScrollBar:metrics()
    local visible = math.max(1, self.target:getScrollAreaHeight())
    local total = math.max(visible, self.target:getScrollHeight())
    local maximum = math.max(0, total - visible)
    local offset = math.max(0, math.min(maximum, -self.target:getYScroll()))
    local trackTop = 18
    local trackHeight = math.max(1, self.height - 36)
    local thumbHeight = trackHeight
    local thumbY = trackTop
    if maximum > 0 then
        thumbHeight = math.max(24, math.floor(trackHeight * visible / total))
        thumbHeight = math.min(trackHeight, thumbHeight)
        thumbY = trackTop + math.floor((trackHeight - thumbHeight) * offset / maximum)
    end
    return maximum, offset, trackTop, trackHeight, thumbY, thumbHeight
end

function T12DocumentScrollBar:prerender()
    local maximum, _, trackTop, trackHeight, thumbY, thumbHeight = self:metrics()
    self:drawRect(0, 0, self.width, self.height, 1, 0.02, 0.02, 0.02)
    self:drawRectBorder(0, 0, self.width, self.height, 1, 0.55, 0.55, 0.55)
    self:drawRect(4, trackTop, self.width - 8, trackHeight, 1, 0.12, 0.12, 0.12)
    self:drawRect(4, 4, self.width - 8, 10, 1, 0.72, 0.72, 0.72)
    self:drawRect(4, self.height - 14, self.width - 8, 10, 1, 0.72, 0.72, 0.72)
    local tone = maximum > 0 and (self.dragging and 1 or 0.88) or 0.42
    self:drawRect(3, thumbY, self.width - 6, thumbHeight, 1, tone, tone, tone)
    self:drawRectBorder(3, thumbY, self.width - 6, thumbHeight, 1, 0.25, 0.25, 0.25)
end

function T12DocumentScrollBar:onMouseDown(_, y)
    local maximum, offset, _, trackHeight, thumbY, thumbHeight = self:metrics()
    if maximum <= 0 then return true end
    if y >= thumbY and y <= thumbY + thumbHeight then
        self.dragging = true
        self.dragOffset = 0
        self.dragStartOffset = offset
        self.dragTravel = math.max(1, trackHeight - thumbHeight)
        self:setCapture(true)
    elseif y < thumbY then
        self.target:setYScroll(self.target:getYScroll() + self.target:getScrollAreaHeight() * 0.9)
    else
        self.target:setYScroll(self.target:getYScroll() - self.target:getScrollAreaHeight() * 0.9)
    end
    return true
end

function T12DocumentScrollBar:onMouseMove(_, dy)
    if not self.dragging then return end
    local maximum = select(1, self:metrics())
    self.dragOffset = self.dragOffset + dy
    local offset = self.dragStartOffset + self.dragOffset * maximum / self.dragTravel
    self.target:setYScroll(-offset)
end

function T12DocumentScrollBar:onMouseMoveOutside(dx, dy)
    self:onMouseMove(dx, dy)
end

function T12DocumentScrollBar:onMouseUp()
    if not self.dragging then return false end
    self.dragging = false
    self:setCapture(false)
    return true
end

function T12DocumentScrollBar:onMouseUpOutside()
    self.dragging = false
    self:setCapture(false)
end

function T12DocumentScrollBar:onMouseWheel(del)
    return self.target:onMouseWheel(del)
end

function T12DocumentScrollBar:new(target)
    local o = ISPanel.new(self, 0, 0, 18, 100)
    o.target = target
    o.dragging = false
    o.background = false
    o.border = false
    return o
end

function T12NotebookWindow:drawRow(y, item)
    if self.selected == item.index then
        self:drawRect(0, y, self.width, item.height, 0.30, 0.55, 0.50, 0.35)
    end
    self:drawText(item.item.state, 8, y + 4, 0.75, 0.75, 0.68, 1, UIFont.Small)
    self:drawText(item.item.title, 8, y + 20, 0.95, 0.95, 0.90, 1, UIFont.Small)
    self:drawRectBorder(0, y, self.width, item.height, 0.45, 0.55, 0.55, 0.50)
    return y + item.height
end

function T12NotebookWindow:onRowSelected(row)
    self.selectedRow = row
    self.detail:setText(row.state .. "\n\n" .. row.title .. "\n\n" .. row.body)
    self.detail:paginate()
    if self.compact then self.detailOnly = true end
    self:applyLayout("row-selected")
    log("ROW_SELECTED", { "section=" .. self.section, "title=" .. safe(row.title), "compact=" .. tostring(self.compact) })
end

function T12NotebookWindow:populate(section)
    self.section = section
    self.list:clear()
    local source = section == "journal" and JOURNAL or EVIDENCE
    for i = 1, #source do self.list:addItem(source[i].title, source[i]) end
    self.list.selected = 1
    self:onRowSelected(source[1])
end

function T12NotebookWindow:onSection(button)
    self.detailOnly = false
    self:populate(button.internal)
end

function T12NotebookWindow:onBack()
    self.detailOnly = false
    self:applyLayout("back")
end

function T12NotebookWindow:onHelp()
    if T12.helpWindow then
        T12.helpWindow:bringToTop()
        return
    end
    local x = math.max(0, self.x + 40)
    local y = math.max(0, self.y + 40)
    T12.helpWindow = T12HelpWindow:new(x, y)
    T12.helpWindow:initialise()
    T12.helpWindow:instantiate()
    T12.helpWindow:addToUIManager()
    log("HELP_OPEN")
end

function T12NotebookWindow:onContrast(button)
    self.highContrast = not self.highContrast
    button:setTitle(self.highContrast and "Normal contrast" or "High contrast")
    if self.highContrast then
        self.backgroundColor = { r = 0.04, g = 0.04, b = 0.04, a = 0.98 }
        -- ISRichTextPanel applies parsed line colours during render, so use a
        -- dark surface here; the panel's reliable default light text remains
        -- readable even when the content contains headings or colour tags.
        self.detail.backgroundColor = { r = 0.02, g = 0.02, b = 0.02, a = 1 }
        self.detail.textR, self.detail.textG, self.detail.textB = 1, 1, 1
    else
        self.backgroundColor = { r = 0.08, g = 0.10, b = 0.09, a = 0.96 }
        self.detail.backgroundColor = { r = 0.76, g = 0.73, b = 0.63, a = 1 }
        self.detail.textR, self.detail.textG, self.detail.textB = 0.12, 0.12, 0.10
    end
    log("CONTRAST", { "high=" .. tostring(self.highContrast) })
end

function T12NotebookWindow:createChildren()
    ISCollapsableWindow.createChildren(self)
    self:setResizable(true)
    self.pin = true

    self.helpButton = ISButton:new(self.width - 260, 2, 70, self:titleBarHeight() - 4, "Help", self, T12NotebookWindow.onHelp)
    self.helpButton:initialise()
    self.helpButton:instantiate()
    self:addChild(self.helpButton)

    self.contrastButton = ISButton:new(self.width - 185, 2, 130, self:titleBarHeight() - 4, "High contrast", self, T12NotebookWindow.onContrast)
    self.contrastButton:initialise()
    self.contrastButton:instantiate()
    self:addChild(self.contrastButton)

    self.list = ISScrollingListBox:new(12, self:titleBarHeight() + 12, 320, self.height - self:titleBarHeight() - 36)
    self.list:initialise()
    self.list:instantiate()
    self.list.itemheight = 44
    self.list.doDrawItem = T12NotebookWindow.drawRow
    self.list:setOnMouseDownFunction(self, T12NotebookWindow.onRowSelected)
    self.list.drawBorder = true
    self:addChild(self.list)

    self.detail = ISRichTextPanel:new(344, self:titleBarHeight() + 12, self.width - 444, self.height - self:titleBarHeight() - 36)
    self.detail:initialise()
    self.detail:instantiate()
    self.detail.autosetheight = false
    self.detail.clip = true
    self.detail.marginLeft = 18
    self.detail.marginRight = 18
    self.detail.marginTop = 16
    self.detail.marginBottom = 16
    self.detail.backgroundColor = { r = 0.76, g = 0.73, b = 0.63, a = 1 }
    self.detail.textR, self.detail.textG, self.detail.textB = 0.12, 0.12, 0.10
    self:addChild(self.detail)

    self.detailScrollBar = T12DocumentScrollBar:new(self.detail)
    self.detailScrollBar:initialise()
    self.detailScrollBar:instantiate()
    self:addChild(self.detailScrollBar)

    self.journalButton = ISButton:new(self.width - 92, self:titleBarHeight() + 22, 88, 42, "Journal", self, T12NotebookWindow.onSection)
    self.journalButton.internal = "journal"
    self.journalButton:initialise()
    self.journalButton:instantiate()
    self:addChild(self.journalButton)

    self.evidenceButton = ISButton:new(self.width - 92, self:titleBarHeight() + 68, 88, 42, "Evidence", self, T12NotebookWindow.onSection)
    self.evidenceButton.internal = "evidence"
    self.evidenceButton:initialise()
    self.evidenceButton:instantiate()
    self:addChild(self.evidenceButton)

    self.backButton = ISButton:new(12, self:titleBarHeight() + 12, 110, 32, "Back to list", self, T12NotebookWindow.onBack)
    self.backButton:initialise()
    self.backButton:instantiate()
    self:addChild(self.backButton)

    self.resizeWidget.resizeFunction = T12NotebookWindow.applyPreferredLayout
    self.resizeWidget2.resizeFunction = T12NotebookWindow.applyPreferredLayout
    self:populate("journal")
    self:applyLayout("create")
end

function T12NotebookWindow:applyPreferredLayout(width, height)
    self:setWidth(math.max(520, width or self.width))
    self:setHeight(math.max(420, height or self.height))
    self:applyLayout("resize-widget")
end

function T12NotebookWindow:applyLayout(reason)
    local tabWidth, gap, scrollWidth = 96, 12, 18
    local top = self:titleBarHeight() + gap
    local bottom = self:resizeWidgetHeight() + gap
    local contentWidth = self.width - tabWidth - gap * 2
    local contentHeight = self.height - top - bottom
    local compact = contentWidth < 640
    if compact ~= self.compact then
        self.compact = compact
        log("BREAKPOINT", { "compact=" .. tostring(compact), "width=" .. tostring(self.width), "reason=" .. safe(reason) })
    end

    self.helpButton:setX(self.width - 260)
    self.contrastButton:setX(self.width - 185)
    self.journalButton:setX(self.width - tabWidth)
    self.evidenceButton:setX(self.width - tabWidth)

    if compact then
        self.backButton:setVisible(self.detailOnly)
        self.list:setVisible(not self.detailOnly)
        self.detail:setVisible(self.detailOnly)
        self.list:setX(gap)
        self.list:setY(top)
        self.list:setWidth(contentWidth)
        self.list:setHeight(contentHeight)
        self.detail:setX(gap)
        self.detail:setY(top + (self.detailOnly and 40 or 0))
        self.detail:setWidth(contentWidth - scrollWidth)
        self.detail:setHeight(contentHeight - (self.detailOnly and 40 or 0))
        self.detailScrollBar:setX(self.detail:getX() + self.detail:getWidth())
        self.detailScrollBar:setY(self.detail:getY())
        self.detailScrollBar:setHeight(self.detail:getHeight())
    else
        self.backButton:setVisible(false)
        self.list:setVisible(true)
        self.detail:setVisible(true)
        local listWidth = math.floor(contentWidth * 0.36)
        self.list:setX(gap)
        self.list:setY(top)
        self.list:setWidth(listWidth)
        self.list:setHeight(contentHeight)
        self.detail:setX(gap + listWidth + gap)
        self.detail:setY(top)
        self.detail:setWidth(contentWidth - listWidth - gap - scrollWidth)
        self.detail:setHeight(contentHeight)
        self.detailScrollBar:setX(self.detail:getX() + self.detail:getWidth())
        self.detailScrollBar:setY(self.detail:getY())
        self.detailScrollBar:setHeight(self.detail:getHeight())
    end
    self.detail:paginate()
    -- Keep the control visible for short and long entries.  A full-height dim
    -- thumb means "everything fits"; a shorter bright thumb means overflow.
    -- This also makes the attended probe self-diagnosing instead of silently
    -- hiding the control when engine metrics are unexpected.
    self.detailScrollBar:setVisible(self.detail:getIsVisible())
    local maximum, offset = self.detailScrollBar:metrics()
    local scrollSignature = tostring(math.floor(offset)) .. "/" .. tostring(math.floor(maximum))
    if scrollSignature ~= self.scrollSignature then
        self.scrollSignature = scrollSignature
        log("DOCUMENT_SCROLL", { "position=" .. scrollSignature, "visible=" .. tostring(math.floor(self.detail:getScrollAreaHeight())), "total=" .. tostring(math.floor(self.detail:getScrollHeight())) })
    end
end

function T12NotebookWindow:prerender()
    local signature = tostring(getCore():getScreenWidth()) .. "x" .. tostring(getCore():getScreenHeight()) .. ":font=" .. tostring(getCore():getOptionFontSizeReal())
    if signature ~= self.environmentSignature then
        self.environmentSignature = signature
        self:applyLayout("environment-change")
        log("ENVIRONMENT", { "signature=" .. signature })
    elseif self.lastWidth ~= self.width or self.lastHeight ~= self.height then
        self:applyLayout("size-change")
    end
    self.lastWidth, self.lastHeight = self.width, self.height
    ISCollapsableWindow.prerender(self)
end

function T12NotebookWindow:close()
    if T12.helpWindow then T12.helpWindow:close() end
    log("NOTEBOOK_CLOSE", { "x=" .. tostring(self.x), "y=" .. tostring(self.y), "width=" .. tostring(self.width), "height=" .. tostring(self.height) })
    self:removeFromUIManager()
    T12.notebook = nil
end

function T12NotebookWindow:new(x, y, width, height)
    local o = ISCollapsableWindow.new(self, x, y, width, height)
    o:setTitle("T12 Survivor's Notebook [" .. PROBE_VERSION .. "]")
    o.minimumWidth = 520
    o.minimumHeight = 420
    o.compact = false
    o.detailOnly = false
    o.section = "journal"
    o.highContrast = false
    return o
end

local function openProbe()
    local allowed, reason = guardedEnvironment()
    if not allowed then
        log("GUARD_REJECT", { "reason=" .. reason, "save=" .. safe(saveFolder()) })
        return
    end
    if T12.notebook then
        T12.notebook:bringToTop()
        return
    end
    local screenW, screenH = getCore():getScreenWidth(), getCore():getScreenHeight()
    local width = math.max(760, math.floor(screenW * 0.70))
    local height = math.max(520, math.floor(screenH * 0.65))
    width = math.min(width, screenW - 40)
    height = math.min(height, screenH - 40)
    T12.notebook = T12NotebookWindow:new(math.floor((screenW - width) / 2), math.floor((screenH - height) / 2), width, height)
    T12.notebook:initialise()
    T12.notebook:instantiate()
    T12.notebook:addToUIManager()
    log("NOTEBOOK_OPEN", { "probe=" .. PROBE_VERSION, "build=" .. safe(getGameVersion and getGameVersion() or "unknown"), "width=" .. tostring(width), "height=" .. tostring(height) })
end

local function onContextMenu(_, context)
    local allowed = guardedEnvironment()
    if not allowed then return end
    for i = 1, #(context.options or {}) do
        if context.options[i].cfT12ActionKey == OPTION_KEY then return end
    end
    local option = context:addOption("T12: Open UI capability probe", nil, openProbe)
    option.cfT12ActionKey = OPTION_KEY
end

local function toggleProbe()
    if T12.notebook then T12.notebook:close() else openProbe() end
end

local function register()
    -- Build 42 can load this file more than once.  Do not call Remove here:
    -- some event implementations expose Add only, and a second dofile would
    -- otherwise turn a harmless reload into "Object tried to call nil".
    if not T12.contextHandler then
        T12.contextHandler = onContextMenu
        Events.OnFillInventoryObjectContextMenu.Add(T12.contextHandler)
    end
end

T12.open = openProbe
T12.toggle = toggleProbe
T12.guardedEnvironment = guardedEnvironment
T12.register = register

if keyBinding then
    local present = false
    for _, binding in ipairs(keyBinding) do if binding.value == TOGGLE_BIND then present = true; break end end
    if not present then table.insert(keyBinding, { value = TOGGLE_BIND, key = Keyboard.KEY_NONE }) end
end
if Events and Events.OnKeyPressed then
    if not T12.keyHandler then
        T12.keyHandler = function(key)
            if getCore():getKey(TOGGLE_BIND) == key then toggleProbe() end
        end
        Events.OnKeyPressed.Add(T12.keyHandler)
    end
end

register()
