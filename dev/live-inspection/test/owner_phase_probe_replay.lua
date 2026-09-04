local mode = arg[1]
local output, now, releaseContent, quitCount = {}, 1000, nil, 0
local realPrint = print
print = function(value) output[#output + 1] = tostring(value) end
local callbacks = { OnGameStart = {}, OnTick = {}, OnRenderTick = {}, OnMainMenuEnter = {} }
Events = callbacks
for name in pairs(callbacks) do callbacks[name].Add = function(fn) callbacks[name][#callbacks[name] + 1] = fn end end
package.preload["CFInspectionProfile"] = function() return { runId="RUN", saveName="SAVE", observerId="OBS", sessionId="SESSION", payloadMode="probe", payloadId="OBS", payloadChecksum="x", expectedGameVersion="42.20", activeModIds={"MOD"}, ownerPhase={enabled=true, timeoutSeconds=1, releasePath="release", nonce="N1"}, sites={{id="S1", role="test", x=1,y=1,x2=2,y2=2,levels={0},entry={x=1,y=1,z=0}}}, limits={streamStableTicks=120,maxSquaresPerTick=80,maxTickMillis=2,exitDelayTicks=3} } end
function getCurrentSaveName() return "SAVE" end; function getGameVersion() return "42.20" end; function getTimestampMs() return now end
function getActivatedMods() return { size=function() return 1 end, contains=function(_, value) return value == "MOD" end } end
function getCore() return { quitToDesktop=function() quitCount = quitCount + 1 end } end
function getFileReader() if not releaseContent then return nil end return { readLine=function() return releaseContent end, close=function() end } end
function getPlayer() return { getX=function() return 1 end, getY=function() return 1 end, getZ=function() return 0 end, teleportTo=function() end, setX=function() end, setY=function() end, setZ=function() end, setForceX=function() end, setForceY=function() end, setGodMod=function() end, setInvisible=function() end, setGhostMode=function() end } end
function getCell() return { getGridSquare=function() return nil end } end
function getWorld()
  local building = { getX=function() return 1 end, getY=function() return 1 end, getX2=function() return 2 end, getY2=function() return 2 end, getID=function() return "B" end, getMinLevel=function() return 0 end, getMaxLevel=function() return 0 end, getRooms=function() return { size=function() return 0 end } end }
  return { getMetaGrid=function() return { getBuildings=function() return { size=function() return 1 end, get=function() return building end } end } end }
end
function getGameTime() return { getTrueMultiplier=function() return 0 end } end; function instanceof() return false end
dofile("probe/common/media/lua/client/ConspiracyFilesLiveInspection.lua")
for _, fn in ipairs(callbacks.OnGameStart) do fn() end; for _, fn in ipairs(callbacks.OnTick) do fn() end
if mode == "hold" then for i=1,3 do for _, fn in ipairs(callbacks.OnTick) do fn() end end; assert(quitCount == 0); realPrint("ASSERT HOLD") else
  if mode == "timeout" then for i=1,61 do for _, fn in ipairs(callbacks.OnTick) do fn() end end; assert(quitCount == 1); realPrint("ASSERT SAFE") else
    if mode == "release" then releaseContent="CF_OWNER_RELEASE|version=1|status=RELEASED|gate=player-ready-modal-check|run_id=RUN|observer_id=OBS|session_id=SESSION|nonce=N1|ready_sequence=2|ready_at_ms=1000|released_at_ms=1000"
    elseif mode == "partial" then releaseContent="CF_OWNER_RELEASE|version=1|status" elseif mode == "foreign" then releaseContent="CF_OWNER_RELEASE|version=1|status=RELEASED|gate=player-ready-modal-check|run_id=OTHER|observer_id=OBS|session_id=SESSION|nonce=N1|ready_sequence=2|ready_at_ms=1000|released_at_ms=1000" elseif mode == "stale" or mode == "restart" then releaseContent="CF_OWNER_RELEASE|version=1|status=RELEASED|gate=player-ready-modal-check|run_id=RUN|observer_id=OBS|session_id=OTHER|nonce=N1|ready_sequence=2|ready_at_ms=1000|released_at_ms=1000" elseif mode == "duplicate" then releaseContent="CF_OWNER_RELEASE|version=1|status=RELEASED|gate=player-ready-modal-check|run_id=RUN|observer_id=OBS|session_id=SESSION|nonce=N1|ready_sequence=2|ready_at_ms=1000|released_at_ms=1000|x=1" elseif mode == "malformed" or mode == "pre-ready" then releaseContent="bad" end
    for _, fn in ipairs(callbacks.OnTick) do fn() end
    if mode == "partial" then releaseContent="CF_OWNER_RELEASE|version=1|status=RELEASED|gate=player-ready-modal-check|run_id=RUN|observer_id=OBS|session_id=SESSION|nonce=N1|ready_sequence=2|ready_at_ms=1000|released_at_ms=1000"; for _, fn in ipairs(callbacks.OnTick) do fn() end end
    local text=table.concat(output,"\n"); if mode == "release" or mode == "partial" then assert(text:find("OWNER_PHASE_RELEASED")); realPrint("ASSERT RELEASED_ONCE") else assert(not text:find("OWNER_PHASE_RELEASED")); realPrint("ASSERT SAFE") end
  end
end
