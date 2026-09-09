-- What belongs in a vehicle, and what has no business being there.
--
-- Owner, 2026-09-09: "there are also different types of cars. again misplaced
-- objects are a mystery. what are 50 mannequin doing in a truck."
--
-- This is RoomAffinity's argument applied to vehicles, and it rests on
-- something the game states itself. Nearly half of the vehicle scripts carry
-- `zombieType`, naming the kind of person found dead at that wheel:
-- AmbulanceDriver, Police, Postal, Fireman, PrisonGuard, Farmer, Ranger. That
-- is the game's own opinion about what a vehicle was for, so "this cargo has
-- nothing to do with this vehicle" is derived rather than invented.
--
-- What is NOT derived is which item categories suit which trade. That is
-- judgement, it lives here in the rules layer rather than in the catalogue,
-- and it is deliberately thin: a handful of trades where the answer is
-- obvious, and silence everywhere else. Silence matters - see `avoids`.
--
-- Pure domain: zero PZ runtime dependencies, plain Lua 5.1.
local Vehicles=require("ConspiracyFiles/Generated/VehicleCatalogue")
local M={}

-- driver kind -> item categories that belong with that trade.
local trade={
    AmbulanceDriver={FirstAid=true,Bandage=true},
    Police={Security=true,ProtectiveGear=true},
    PrisonGuard={Security=true,ProtectiveGear=true},
    Fireman={ProtectiveGear=true,Tool=true},
    FiremanFullSuit={ProtectiveGear=true,Tool=true},
    Farmer={Gardening=true,AnimalPart=true,Container=true},
    Ranger={Camping=true,Gardening=true,Tool=true},
    Postal={Literature=true,Container=true,Junk=true},
}

-- The game's own way of saying "this one has no identity", exactly as the
-- outfit lead treats Generic03 on a corpse. A generic driver tells us nothing,
-- so nothing may be concluded from what is in their van.
local function anonymous(kind)
    return string.sub(kind,1,7)=="Generic"
end

-- The categories that suit a vehicle, or nil when the game names no driver, or
-- names only anonymous ones, or names a driver whose trade we have no opinion
-- about. nil means "no opinion", and every caller must treat it as such.
function M.categoriesFor(vehicleId)
    local vehicle=Vehicles.get(vehicleId)
    if not vehicle then return nil end
    local set,any=nil,false
    for _,kind in ipairs(vehicle.drivers) do
        if not anonymous(kind) and trade[kind] then
            set=set or {}
            for category in pairs(trade[kind]) do set[category]=true; any=true end
        end
    end
    if not any then return nil end
    return set
end

-- True when the vehicle has a trade and this category is part of it.
function M.fits(vehicleId,category)
    local set=M.categoriesFor(vehicleId)
    if not set or type(category)~="string" then return false end
    return set[category]==true
end

-- True when the vehicle has a trade and this category is NOT part of it.
--
-- Deliberately not the negation of `fits`, for the same reason RoomAffinity
-- draws that distinction: a saloon car with no declared driver has no business
-- being called the wrong place for anything. Fifty mannequins are a question
-- in a POSTAL van, whose purpose the game states, and merely furniture in an
-- anonymous one.
function M.avoids(vehicleId,category)
    local set=M.categoriesFor(vehicleId)
    if not set or type(category)~="string" then return false end
    return set[category]~=true
end

-- Vehicles the game gives an opinion about, ordered. Everything else is a car.
function M.withTrade()
    local out={}
    for _,vehicle in ipairs(Vehicles.vehicles) do
        if M.categoriesFor(vehicle.id) then out[#out+1]=vehicle.id end
    end
    return out
end

-- The trades this module has an opinion about, ordered. Kept small on purpose;
-- adding one is a content decision, not a bug fix.
function M.trades()
    local out={}
    for kind in pairs(trade) do out[#out+1]=kind end
    table.sort(out)
    return out
end

return M
