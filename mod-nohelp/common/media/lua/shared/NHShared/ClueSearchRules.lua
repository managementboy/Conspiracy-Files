-- Clues are found by searching (P4-R132, docs/design/SEARCH_TO_FIND.md).
--
-- The rules only, with no game in them, so they can be tested in plain Lua:
-- the Search Focus entry, what the focus does to spotting, and when a clue has
-- an icon. ClueSearch (client) is the part that talks to the game's foraging.
local S={}

-- The category name is also the translation key suffix the Investigate Area
-- window looks for: IGUI_SearchMode_Categories_Clues.
S.CATEGORY="Clues"

-- A clue gets an icon once the survivor is this close with Search Mode on, and
-- loses it past REMOVE_RADIUS. The gap keeps an icon from flickering in and
-- out at the edge. The game's own spotting never reaches past its vision cap
-- (15 tiles), so nothing further needs an icon.
S.ADD_RADIUS=16
S.REMOVE_RADIUS=24

-- With "Clues" chosen as the focus: the spot timer fills twice as fast and the
-- spot is seen from half as far again. No focus (or another one) is the
-- game's own spotting, unchanged.
S.FOCUS_SPOT_RATE=2.0
S.FOCUS_REACH=1.5

-- How far a clue may move before its icon is picked up and put down again
-- (P4-R134). A clue on a zombie moves every few seconds, and re-adding the icon
-- restarts the game's spot timer: at zero tolerance a wandering carrier could
-- never be spotted at all. Two tiles is close enough that the pin is still on
-- the thing the survivor is looking at, and a driven car or a zombie that has
-- really gone somewhere is far past it.
S.MOVE_TILES=2

-- Development knob for checks only: multiplies the spot timer. Never set by
-- the mod itself.
S.debugSpotScale=1

-- The Search Focus entry. Modelled on the game's own "Tracks" category, which
-- also has no foraging items and rolls zero in every zone: a category with no
-- items and zero rolls cannot make the forage system spawn anything, and the
-- focus-conversion chances are zero so choosing it never turns a forage find
-- into something else.
function S.catDef(zoneNames)
    local zones={}
    for _,name in ipairs(zoneNames or {}) do zones[name]=0 end
    return {
        name=S.CATEGORY,
        typeCategory="Other",
        identifyCategoryPerk="PlantScavenging",
        identifyCategoryLevel=0,
        categoryHidden=false,
        validFloors={"ANY"},
        zones=zones,
        spriteAffinities={},
        chanceToMoveIcon=0.0,
        chanceToCreateIcon=0.0,
        focusChanceMin=0.0,
        focusChanceMax=0.0,
    }
end

-- Every zone name the forage system could ask a category about: the default
-- category's, the defined zones', and any a known category already lists. A
-- missing zone would be read as nil and multiplied.
function S.zoneNames(forage)
    local seen,out={},{}
    local function add(name) if type(name)=="string" and not seen[name] then seen[name]=true; out[#out+1]=name end end
    local defaults=forage and forage.defaultDefinitions and forage.defaultDefinitions.defaultCatDef
    for name in pairs(defaults and defaults.zones or {}) do add(name) end
    for _,def in pairs(forage and forage.zoneDefinitions or {}) do add(def.name) end
    for name in pairs(forage and forage.zoneDefs or {}) do add(name) end
    for _,def in pairs(forage and forage.categoryDefinitions or {}) do
        for name in pairs(def.zones or {}) do add(name) end
    end
    table.sort(out)
    return out
end

-- Register the category. Before the forage system initialises (the normal
-- case: mod Lua loads before the map zones), the definition joins the game's
-- own list and is imported with every other category. If the system is
-- already up, it is added directly. Returns how, or nil and why.
function S.register(forage)
    if type(forage)~="table" then return nil,"no forage system" end
    local def=S.catDef(S.zoneNames(forage))
    if forage.isInitialised then
        if forage.catDefs and forage.catDefs[S.CATEGORY] then return "present" end
        if type(forage.addCatDef)~="function" then return nil,"no addCatDef" end
        forage.addCatDef(def,false)
        return "added"
    end
    if type(forage.categoryDefinitions)~="table" then return nil,"no category list" end
    forage.categoryDefinitions[S.CATEGORY]=def
    return "listed"
end

function S.focused(category) return category==S.CATEGORY end
function S.spotRate(category)
    return (S.focused(category) and S.FOCUS_SPOT_RATE or 1)*(S.debugSpotScale or 1)
end
function S.reach(category,distance,cap)
    local r=distance*(S.focused(category) and S.FOCUS_REACH or 1)
    if cap and r>cap then r=cap end
    return r
end

local function distance2D(ax,ay,bx,by) local dx,dy=ax-bx,ay-by; return math.sqrt(dx*dx+dy*dy) end

-- A clue as ClueSearch sees it: {id,x,y,z,status,recognised,resolved}. It wants
-- an icon while Investigate Area is on, it is still at its placement and has
-- not been inspected/noted. Recognition names the evidence but must not erase
-- its locator: the player may need to search the room again to find it.
function S.wantsIcon(clue,px,py,searchMode)
    if not searchMode or type(clue)~="table" then return false end
    if clue.status~="placed" or clue.resolved then return false end
    return distance2D(px,py,clue.x,clue.y)<=S.ADD_RADIUS
end

-- An existing icon is dropped when Search Mode is off, its clue is gone from
-- the record, the clue was inspected/noted, the survivor has walked away, or
-- the clue has moved away from the icon's square: a car with a clue in it has
-- been driven (stage 2), or the zombie carrying one has walked on (P4-R134).
-- `iconX`/`iconY` are the icon's square, when known; the icon comes back on the
-- clue's new square on the next pass.
function S.dropIcon(clue,px,py,searchMode,spottedAt,now,iconX,iconY)
    if not searchMode or type(clue)~="table" then return true end
    if clue.status~="placed" or clue.resolved then return true end
    if distance2D(px,py,clue.x,clue.y)>S.REMOVE_RADIUS then return true end
    if iconX and iconY and distance2D(iconX,iconY,clue.x,clue.y)>S.MOVE_TILES then return true end
    return false
end

-- Which icons to add and which to drop, given the clues, the icons already up
-- (id -> {spottedAt=ms or nil, x=, y=}) and the survivor. Pure; the caller acts.
function S.plan(clues,icons,px,py,searchMode,now)
    local byId={}
    for _,clue in ipairs(clues or {}) do byId[clue.id]=clue end
    local add,drop={},{}
    for id,state in pairs(icons or {}) do
        if S.dropIcon(byId[id],px,py,searchMode,state and state.spottedAt,now,state and state.x,state and state.y) then drop[#drop+1]=id end
    end
    for _,clue in ipairs(clues or {}) do
        if not (icons and icons[clue.id]) and S.wantsIcon(clue,px,py,searchMode) then add[#add+1]=clue.id end
    end
    table.sort(add); table.sort(drop)
    return add,drop
end

return S
