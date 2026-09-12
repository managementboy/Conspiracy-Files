-- Drives checks/organiser.sh: the pocket organiser as a real carried object.
CFOrg = CFOrg or {}
local O = ConspiracyFiles.Organiser

function CFOrg.state()
    local item = O.held()
    if not item then return false, "not carried" end
    local power = O.power(item)
    local favourite = false
    pcall(function() favourite = item:isFavorite() end)
    return true, tostring(item:getFullType()), tostring(power), tostring(favourite)
end

function CFOrg.read()
    local ok, why = O.read()
    return ok == true, tostring(why)
end

function CFOrg.uiOpen()
    local ui = ConspiracyFiles.NotebookUI
    return ui ~= nil and ui.notebook ~= nil
end

function CFOrg.closeUI()
    local ui = ConspiracyFiles.NotebookUI
    if ui and ui.notebook then ui.notebook:close() end
    return true
end

-- Run the battery down the way the game would, without waiting for it.
function CFOrg.drain()
    local item = O.held()
    if not item then return false, "not carried" end
    local data = item:getDeviceData()
    if not data then return false, "no device data" end
    data:setPower(0)
    return true, tostring(O.power(item))
end

function CFOrg.charge()
    local item = O.held()
    local data = item and item:getDeviceData()
    if not data then return false end
    data:setPower(1)
    return true
end

-- The way back to reading when the device is gone (P4-R80): the Papers.
function CFOrg.papersHeld()
    local F = ConspiracyFiles.CaseFile
    return F ~= nil and F.held(getPlayer()) ~= nil
end

-- The device's own screen: does it open, does it draw, do the buttons answer?
function CFOrg.openScreen()
    local w = ConspiracyFiles.OrganiserScreen.open()
    return w ~= nil, tostring(w and w.width), tostring(w and w.height)
end

function CFOrg.pressButton(id)
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w then return false, "no screen" end
    w:press(id)
    return true, tostring(w.section), tostring(w.entry), tostring(w.card), tostring(w.index), tostring(w.on)
end

function CFOrg.screenState()
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w then return false, "no screen" end
    return true, tostring(w.section), tostring(w.entry), tostring(w.card), tostring(w.index), tostring(w.on), tostring(w.lamp)
end

function CFOrg.clickButton(id)
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w then return false, "no screen" end
    for _, b in ipairs(w:buttons()) do
        if b.id == id then
            w:onMouseDown(b.x + 1, b.y + 1)
            w:onMouseUp(b.x + 1, b.y + 1)
            return true, id
        end
    end
    return false, "no such button: " .. tostring(id)
end

function CFOrg.closeScreen()
    ConspiracyFiles.OrganiserScreen.close()
    return true
end
