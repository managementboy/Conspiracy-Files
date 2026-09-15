-- Every player-facing feature in this mod must refuse to run in multiplayer.
--
-- The mod sends no commands and transmits no table anywhere: there is no
-- networking in it at all, so multiplayer is out of scope BY DESIGN rather
-- than unfinished. Runtime.initialize sets Runtime.disabled and returns on
-- isClient()/isServer(), and every client feature is meant to guard the same
-- way.
--
-- WHY THIS TEST EXISTS: the organiser did not. It was the only unguarded
-- feature, and nothing caught it because no check ever ran as a client. In
-- multiplayer it would have been issued on OnCreatePlayer, force-equipped on
-- OnGameStart and opened Knox.OS with no runtime behind it, writing notes and
-- to-dos into client-side ModData that nothing reconciles.
--
-- This reads the source rather than running it, because loading a client file
-- needs the game. It is a cheap standing guarantee that the NEXT feature
-- cannot quietly ship unguarded either.
local function read(path)
    local f = assert(io.open(path, "r"), "cannot read " .. path)
    local s = f:read("*a"); f:close(); return s
end

-- A file "guards" if it tests isClient()/isServer() anywhere.
local function guards(src)
    return src:find("isClient", 1, true) ~= nil and src:find("isServer", 1, true) ~= nil
end

local CLIENT = "mod/common/media/lua/client/ConspiracyFiles/"

-- Features that take the player's hand, spawn items, draw on screen or write
-- stores. Anything added here must guard; anything that legitimately cannot
-- reach the player belongs in EXEMPT below with a reason.
local MUST_GUARD = {
    "Organiser.lua",            -- issues the device and equips it
    "OrganiserScreen.lua",      -- draws Knox.OS and writes notes/to-dos
    "AutomaticInvestigations.lua",
    "ClueMarkers.lua",
    "ClueHints.lua",
    "IdentityObserver.lua",
    "T3Nearby.lua",
    "NotebookToolbar.lua",
    "Notebook.lua",
    "AddressMap.lua",
    "GeneratedMenu.lua",
    "GeneratedDiagnostic.lua",
    "LocalPersonIntegration.lua",
    "SessionGuide.lua",
    "DevEval.lua",
    "IdentityProbe.lua",
    "Trial.lua",
    "KnoxApps.lua",
    "GeneratedRuntime.lua",
    "MarkerColourTest.lua",
}

local missing = {}
for _, name in ipairs(MUST_GUARD) do
    local src = read(CLIENT .. name)
    if not guards(src) then missing[#missing + 1] = name end
end
assert(#missing == 0,
    "these features would run in multiplayer with no runtime behind them: "
    .. table.concat(missing, ", "))

-- And the runtime itself must still refuse, or the guards above protect
-- nothing: they all assume the world adapter is the thing that says no.
local runtime = read("mod/common/media/lua/shared/ConspiracyFiles/Runtime.lua")
assert(runtime:find('if multiplayer() then log("DISABLED","multiplayer"); return end', 1, true),
    "Runtime.initialize no longer disables itself in multiplayer")

-- Nothing may start sending traffic without this test being reconsidered:
-- the guards above are only honest while there is genuinely nothing to sync.
local NETWORKING = {"sendClientCommand", "sendServerCommand",
                    "OnClientCommand", "OnServerCommand"}
local found = {}
local lfs_ok = os.execute("test -d " .. CLIENT) == 0 or os.execute("test -d " .. CLIENT) == true
assert(lfs_ok, "client directory not found from the repository root")
local pipe = io.popen("grep -rl '" .. table.concat(NETWORKING, [[\|]]) .. "' mod/ 2>/dev/null")
for line in pipe:lines() do found[#found + 1] = line end
pipe:close()
assert(#found == 0,
    "this mod has started doing networking (" .. table.concat(found, ", ")
    .. "); multiplayer is no longer out of scope and these guards need rethinking")

print("PASS multiplayer guards: " .. #MUST_GUARD ..
      " features refuse to run as client or server, the runtime still disables itself, and nothing sends traffic")
