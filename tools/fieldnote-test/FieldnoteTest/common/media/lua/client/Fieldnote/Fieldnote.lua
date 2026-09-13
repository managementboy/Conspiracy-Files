-- Entry point for the standalone Fieldnote PDA test mod.
--
-- Opens the device on game start so there is something to look at, and
-- exposes a handful of commands for the debug console / the eval channel.
-- It wires NO game actions to the buttons: the design package is explicit
-- that no dispatch is included, and this mod exists to check the hardware
-- draws right, not to be a PDA. Each press is logged so a tester can see
-- that hit-testing and dispatch work.
require "Fieldnote/Panel"
local S=Fieldnote.Panel

Fieldnote.VERSION="0.1.0-test"

local function log(msg)
    print("[FIELDNOTE] "..tostring(msg))
end

-- Every control routes here. Replace this function to wire real actions.
S.onAction=function(action,id)
    log("press: "..tostring(id).." -> "..tostring(action))
end

function Fieldnote.open(scale) return S.open(scale) end
function Fieldnote.close() return S.close() end
function Fieldnote.toggle() return S.toggle() end
function Fieldnote.zoom(scale) return S.zoom(scale) end
function Fieldnote.wear(on)
    if on~=nil then S.showWear=(on==true) end
    return S.showWear
end

if Events and Events.OnGameStart and not Fieldnote.hooked then
    Fieldnote.hooked=true
    Events.OnGameStart.Add(function()
        local ok,why=pcall(S.open)
        if ok then log("opened at scale "..tostring(S.scale).." version "..Fieldnote.VERSION)
        else log("could not open: "..tostring(why)) end
    end)
end

return Fieldnote
