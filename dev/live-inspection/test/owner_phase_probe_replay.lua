local mode = arg[1]
local output, now, releaseContent, quitCount = {}, 1000, nil, 0
-- Build 42 resolves getFileReader paths beneath the PZ user-file sandbox.
-- Keep this executable fake on that same relative-path contract.
local pzUserRoot = ".cf-owner-phase-pz-user"
local pzLuaRoot = pzUserRoot .. "/Lua"
local releasePath = "CF_LiveInspectionMailboxes/RUN/owner-release"
local realPrint = print
print = function(value) output[#output + 1] = tostring(value) end
local callbacks = { OnGameStart = {}, OnTick = {}, OnRenderTick = {}, OnMainMenuEnter = {} }
Events = callbacks
for name in pairs(callbacks) do callbacks[name].Add = function(fn) callbacks[name][#callbacks[name] + 1] = fn end end
package.preload["CFInspectionProfile"] = function() return { runId="RUN", saveName="SAVE", observerId="OBS", sessionId="SESSION", payloadMode="probe", payloadId="OBS", payloadChecksum="x", expectedGameVersion="42.20", activeModIds={"MOD"}, ownerPhase={enabled=true, timeoutSeconds=1, releasePath=releasePath, nonce="N1"}, sites={{id="S1", role="test", x=1,y=1,x2=2,y2=2,levels={0},entry={x=1,y=1,z=0}}}, limits={streamStableTicks=120,maxSquaresPerTick=80,maxTickMillis=2,exitDelayTicks=3} } end
function getCurrentSaveName() return "SAVE" end; function getGameVersion() return "42.20" end; function getTimestampMs() return now end
function getActivatedMods() return { size=function() return 1 end, contains=function(_, value) return value == "MOD" end } end
function getCore() return { quitToDesktop=function() quitCount = quitCount + 1 end } end
local readerCalls, readerErrors = 0, 0
function getFileReader(path, create) readerCalls = readerCalls + 1; if path:sub(1, 1) == "/" then readerErrors = readerErrors + 1; error("absolute path is outside the PZ user-file sandbox") end; if create then readerErrors = readerErrors + 1; error("createFileExclusively must not be requested") end; if mode == "missing-error" then readerErrors = readerErrors + 1; error("java.io.IOException: No such file or directory") end; if mode == "read-error" then return { readLine=function() error("read failure") end, close=function() end } end; local file = io.open(pzLuaRoot .. "/" .. path, "r"); if not file then return nil end; return { readLine=function() return file:read("*l") end, close=function() file:close() end } end
function getPlayer() return { getX=function() return 1 end, getY=function() return 1 end, getZ=function() return 0 end, teleportTo=function() end, setX=function() end, setY=function() end, setZ=function() end, setForceX=function() end, setForceY=function() end, setGodMod=function() end, setInvisible=function() end, setGhostMode=function() end } end
function getCell() return { getGridSquare=function() return nil end } end
function getWorld()
  local building = { getX=function() return 1 end, getY=function() return 1 end, getX2=function() return 2 end, getY2=function() return 2 end, getID=function() return "B" end, getMinLevel=function() return 0 end, getMaxLevel=function() return 0 end, getRooms=function() return { size=function() return 0 end } end }
  return { getMetaGrid=function() return { getBuildings=function() return { size=function() return 1 end, get=function() return building end } end } end }
end
function getGameTime() return { getTrueMultiplier=function() return 0 end } end; function instanceof() return false end
local function publish(value, atomic)
  local base = mode == "root-invisible" and pzUserRoot or pzLuaRoot
  os.execute("mkdir -p " .. base .. "/CF_LiveInspectionMailboxes/RUN")
  local target = base .. "/" .. releasePath
  local path = atomic and target .. ".tmp" or target
  local file = assert(io.open(path, "w")); file:write(value); file:flush(); file:close()
  if atomic then assert(os.rename(path, target)) end
end
local validRelease = "CF_OWNER_RELEASE|version=1|status=RELEASED|gate=player-ready-modal-check|run_id=RUN|observer_id=OBS|session_id=SESSION|nonce=N1|ready_sequence=3|ready_at_ms=1001|released_at_ms=1002"
local preReadyRelease = "CF_OWNER_RELEASE|version=1|status=RELEASED|gate=player-ready-modal-check|run_id=RUN|observer_id=OBS|session_id=SESSION|nonce=N1|ready_sequence=3|ready_at_ms=1001|released_at_ms=1001"
os.execute("rm -rf " .. pzUserRoot)
if mode == "pre-ready" then publish(preReadyRelease, true) end
ConspiracyFiles = { T10Probe = { ownerPhaseReadiness=function() return true end, ownerPhaseSafety=function() return true end, ownerPhaseHandlerLease=function() return mode ~= "lease-stale" end } }
dofile("probe/common/media/lua/client/ConspiracyFilesLiveInspection.lua")
for _, fn in ipairs(callbacks.OnGameStart) do fn() end; for _, fn in ipairs(callbacks.OnTick) do fn() end
if mode == "hold" then for i=1,3 do for _, fn in ipairs(callbacks.OnTick) do fn() end end; assert(quitCount == 0); realPrint("ASSERT HOLD") else
  if mode == "timeout" then for i=1,61 do for _, fn in ipairs(callbacks.OnTick) do fn() end end; assert(quitCount == 1); realPrint("ASSERT SAFE") else
    if mode == "release" or mode == "lease-stale" then releaseContent=validRelease
    elseif mode == "future" then releaseContent="CF_OWNER_RELEASE|version=1|status=RELEASED|gate=player-ready-modal-check|run_id=RUN|observer_id=OBS|session_id=SESSION|nonce=N1|ready_sequence=3|ready_at_ms=1000|released_at_ms=1002"
    elseif mode == "partial" then releaseContent="CF_OWNER_RELEASE|version=1|status" elseif mode == "foreign" then releaseContent="CF_OWNER_RELEASE|version=1|status=RELEASED|gate=player-ready-modal-check|run_id=OTHER|observer_id=OBS|session_id=SESSION|nonce=N1|ready_sequence=2|ready_at_ms=1000|released_at_ms=1000" elseif mode == "stale" or mode == "restart" then releaseContent="CF_OWNER_RELEASE|version=1|status=RELEASED|gate=player-ready-modal-check|run_id=RUN|observer_id=OBS|session_id=OTHER|nonce=N1|ready_sequence=2|ready_at_ms=1000|released_at_ms=1000" elseif mode == "duplicate" then releaseContent="CF_OWNER_RELEASE|version=1|status=RELEASED|gate=player-ready-modal-check|run_id=RUN|observer_id=OBS|session_id=SESSION|nonce=N1|ready_sequence=2|ready_at_ms=1000|released_at_ms=1000|x=1" elseif mode == "malformed" or mode == "pre-ready" then releaseContent="bad" end
    if mode ~= "pre-ready" and releaseContent then publish(releaseContent, mode ~= "partial") end
    now = 1001
    local pollTicks = (mode == "missing-error" or mode == "read-error") and 45 or 2
    for i=1,pollTicks do if i == 2 then now = 1002 end; for _, fn in ipairs(callbacks.OnTick) do fn() end end
    if mode == "partial" then releaseContent=validRelease; publish(releaseContent, true); for i=1,15 do for _, fn in ipairs(callbacks.OnTick) do fn() end end end
    local text=table.concat(output,"\n"); if mode == "release" or mode == "partial" then assert(text:find("OWNER_PHASE_RELEASED")); realPrint("ASSERT RELEASED_ONCE") else assert(not text:find("OWNER_PHASE_RELEASED")); if mode == "lease-stale" then assert(text:find("OWNER_RELEASE_WAITING")) end; if mode == "missing-error" or mode == "read-error" then assert(select(2, text:gsub("OWNER_RELEASE_READ_ERROR", "")) == 1); assert(readerCalls < 10) end; realPrint("ASSERT SAFE") end
  end
end
