local UI=require("ConspiracyFiles/Notebook")
local State=require("ConspiracyFiles/ThreadState")
local Content=require("ConspiracyFiles/Content")
ConspiracyFiles=ConspiracyFiles or {}
local Probe={VERSION=UI.VERSION}
function Probe.prepare()
    if not (isDebugEnabled and isDebugEnabled()) or (isClient and isClient()) or (isServer and isServer()) then return false end
    assert(not ConspiracyFiles.T11Mode,"T11 and T12 must not be enabled together")
    local state=assert(State.new())
    for _,id in ipairs(Content.thread.documentAssetIds) do
        assert(state.discover(id,"Synthetic T12 fixture; not a live discovery",Content.assets[id].placementLocationId))
    end
    for i=1,80 do
        assert(state.markInteresting("t12-synthetic-"..i,{subjectLabel="Synthetic long label "..i.." / large-font wrapping and reading test",contextText=string.rep("Synthetic readability sample; this is not story content. ",16)}))
    end
    UI.probeState=state
    print("[CF-T12]|READY|version="..Probe.VERSION.."|synthetic=true|worldWrites=false|ui="..UI.VERSION)
    return true
end
function Probe.open() if Probe.prepare() then UI.open("evidence") end end
-- The owner invokes open manually in the ordinary debug console. No injected
-- input, automatic menu activation, or fabricated visual-verdict markers.
ConspiracyFiles.T12Probe=Probe
return Probe
