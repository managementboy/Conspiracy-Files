-- Shared engine stub for No Help runtime tests.
-- boot(store, opts) sets up the engine (Events, ModData, game time, player position, etc.)
-- over the given ModData store, loads the GeneratedRuntime module, and returns a test harness.
local function boot(store, opts)
    opts=opts or {}
    local PATH="mod-ofinterest/common/media/lua/client/OIShared/GeneratedRuntime.lua"

    -- Clear all OIShared modules from cache and the global OIShared table.
    -- GeneratedRuntime and ~20 client modules use a load guard: `local R=OIShared.GeneratedRuntime or {}; OIShared.GeneratedRuntime=R; if R.loaded then return R end`.
    -- Without clearing OIShared, subsequent boots get the cached old module and skip their initialization (R.loaded==true early return).
    for key in pairs(package.loaded) do
        if key:find("^OIShared") then package.loaded[key]=nil end
    end
    OIShared={}

    -- Handlers for event fires.
    local handlers={}
    local clock=0
    Events=setmetatable({},{__index=function(t,name)
        local ev={Add=function(fn) handlers[name]=handlers[name] or {}; table.insert(handlers[name],fn) end,
            Remove=function() end}
        rawset(t,name,ev); return ev
    end})

    -- Fire function: advance clock and call all handlers for an event.
    local function fire(name) clock=clock+16; for _,fn in ipairs(handlers[name] or {}) do fn() end end

    -- ModData API backed by the store.
    ModData={getOrCreate=function(tag) store[tag]=store[tag] or {}; return store[tag] end,
        get=function(tag) return store[tag] end}

    -- Engine stubs.
    getDebug=function() return false end
    isClient=function() return false end
    isServer=function() return false end
    getTimeInMillis=function() return clock end

    -- World seed: drawn once per world.
    local rollsState={n=0}
    ZombRand=function(n) rollsState.n=rollsState.n+1; return 777 end

    -- Game time and player state.
    local hours=opts.hours or 5
    getGameTime=function() return {getWorldAgeHours=function() return hours end} end
    local px,py=opts.px or 1000, opts.py or 1000
    local player={getX=function() return px end,getY=function() return py end,getZ=function() return 0 end,
        getSquare=function() return nil end,getInventory=function() return {getItems=function() return nil end} end,
        getModData=function() return {} end}
    getPlayer=function() return player end
    getWorld=function() return nil end
    getCell=function() return nil end

    -- Stubs for modules not under test.
    package.loaded["OIShared/InteractionAPI"]={}
    local probe={}
    function probe.start(radius,seed) probe.seed=seed; probe.started=(probe.started or 0)+1; return true end
    package.loaded["OIShared/T3Nearby"]=probe
    package.loaded["OIShared/ReachabilityAdapter"]={basementSites=function() return {} end}

    local scanned
    package.loaded["OIShared/Generated/Storage"]={MAILBOX="postbox",fixedKind=function() return true end,
        scan=function(result,done,reachable)
            scanned=result
            return function() done(result.catalog,{},result.candidates,{},{}); return true end
        end}

    -- Load manifest and clues.
    local Manifest=require("OIShared/Mystery/Manifest")
    local Inventory=require("oi_inventory")
    Manifest.clues=Inventory.clues

    -- Load the runtime.
    local R=dofile(PATH)

    -- Return harness with accessible state and helpers.
    -- IMPORTANT: R is valid only until the next boot() call; after that, use only harness.R.
    return {
        R=R,
        fire=fire,
        store=store,
        probe=probe,
        handlers=handlers,
        scanned=function() return scanned end,
        setPlayerPos=function(x,y) px,py=x,y end,
        getPlayerPos=function() return px,py end,
        setHours=function(h) hours=h end,
        getHours=function() return hours end,
        setClock=function(c) clock=c end,
        getClock=function() return clock end,
        getRolls=function() return rollsState.n end,
        setRolls=function(r) rollsState.n=r end,
    }
end

return boot
