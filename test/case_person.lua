-- The case's person gets a body.
--
-- Owner, 2026-09-10: "please use the name of a nearby zombie or corpse for the
-- evidence... that would make finding that zombie later a part of the mystery",
-- then "lets give a nearby zombie an ID or other document with her full name".
--
-- The obvious reading - read a name off a nearby zombie and write it into the
-- case - cannot work: a case is rebuilt from its seed to survive a reload, so a
-- fact taken from the world would fail validation the moment the player saved.
-- It runs the other way instead. The case keeps its name; a zombie is given it.
package.path = "mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;" .. package.path

local function zombie(x, y, z)
    local md, inv, desc = {}, {}, { forename = nil, surname = nil }
    local z2
    z2 = {
        md = md, items = {}, desc = desc,
        getSquare = function() return { getX = function() return x end,
            getY = function() return y end, getZ = function() return z end } end,
        getModData = function() return md end,
        -- A descriptor with getters as well as setters, and an inventory that
        -- remembers what was put in it. The first version of this fake had
        -- neither, so where() printed a blank name and a death logged
        -- "carrying: nothing" - a fake that proved only itself.
        getDescriptor = function()
            return { setForename = function(_, n) desc.forename = n end,
                     setSurname = function(_, n) desc.surname = n end,
                     getForename = function() return desc.forename end,
                     getSurname = function() return desc.surname end }
        end,
        getInventory = function()
            return {
                AddItem = function(_, fullType)
                    local item = { fullType = fullType, md = {},
                        getModData = function(self) return self.md end,
                        setName = function(self, n) self.name = n end,
                        getDisplayName = function(self) return self.name or self.fullType end,
                        setCustomName = function(self, v) self.custom = v end }
                    z2.items[#z2.items + 1] = item
                    return item
                end,
                getItems = function()
                    return { size = function() return #z2.items end,
                             get = function(_, i) return z2.items[i + 1] end }
                end,
            }
        end,
    }
    return z2
end

local near, far = zombie(100, 100, 0), zombie(400, 400, 0)
local list = { near, far }
getCell = function()
    return { getZombieList = function()
        return { size = function() return #list end, get = function(_, i) return list[i + 1] end }
    end }
end
ConspiracyFiles = ConspiracyFiles or {}
local P = dofile('mod/common/media/lua/client/ConspiracyFiles/CasePerson.lua')

-- Bound to the nearby body, not the one across town.
local bound = assert(P.bind("Marion Ellis", "case-1", 100, 100, 0), "a nearby body must be found")
assert(bound == near, "the far body must not be chosen")
assert(far.md.cfCasePerson == nil, "and must not be touched")

-- The descriptor carries the full name, split as the game stores it. Initials
-- were the point of the owner's request: "M. Ellis" on a corpse and "M. Ellis"
-- on a letter is the same abbreviation twice, not a person.
assert(near.desc.forename == "Marion", near.desc.forename)
assert(near.desc.surname == "Ellis", tostring(near.desc.surname))

-- And an ID card the player can actually read.
assert(#near.items == 1, "the body must carry one ID card")
assert(near.items[1].fullType == "Base.IDcard", near.items[1].fullType)
assert(near.items[1].name == "ID Card: Marion Ellis", near.items[1].name)
assert(near.items[1].custom, "the name must persist")

-- The card must NOT be stamped as generated evidence: it is an ordinary
-- identity document, and IdentityObserver skips anything carrying cfGeneratedId.
-- Skipping it here would lose the whole point - the body is meant to be read.
assert(near.items[1].md.cfGeneratedId == nil, "the ID must be readable as an identity observation")
assert(near.items[1].md.cfCasePerson == "case-1", "and recognisable as this case's binding")

-- One body per case, and never twice. A reload must not bind a second corpse.
assert(near.md.cfCasePerson == "case-1")
local second = P.bind("Marion Ellis", "case-1", 100, 100, 0)
assert(second ~= near, "an already-bound body must not be reused")

-- Nothing within reach is a refusal, not a crash: the case is still valid, it
-- simply has no body yet.
local nobody, why = P.bind("Delia Mercer", "case-2", 9000, 9000, 0)
assert(nobody == nil and type(why) == "string", why)

-- A single name still works; a descriptor stores two halves and one may be
-- absent rather than guessed at.
list = { zombie(100, 100, 0) }
local single = assert(P.bind("Ellis", "case-3", 100, 100, 0))
assert(single.desc.forename == "Ellis" and (single.desc.surname == nil or single.desc.surname == ""))

print("PASS case person: a nearby body takes the case's full name and an ID card, "
    .. "once, readable as an ordinary identity observation")

-- Wired into case creation, and the module reported at game start: a file that
-- silently fails to load looks exactly like a feature that does not work.
local function source(path)
    local f = assert(io.open(path, 'r')); local s = f:read('*a'); f:close(); return s
end
local runtime = source('mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua')
assert(runtime:find('People.bind(person.name,case.caseId', 1, true),
    'a new case must give its person a body')
assert(runtime:find('case.identities and case.identities[1]', 1, true),
    'the name must come from the case, never from the world: a case rebuilds from its seed')
local observer = source('mod/common/media/lua/client/ConspiracyFiles/IdentityObserver.lua')
assert(observer:find('"CasePerson"', 1, true), 'CasePerson must appear in the module self-check')

-- Full names in the generator, which is the half that makes the body findable.
local generator = source('mod/common/media/lua/shared/ConspiracyFiles/Generated/Generator.lua')
-- Matched against the name list itself, not the file: the comment above it
-- quotes the old initials to explain why they went, and a grep for the whole
-- file finds the explanation rather than the code.
local nameList = generator:match('local invented=(%b{})')
assert(nameList, 'the case name list must be findable')
assert(not nameList:find('M%. '), 'initials are not a person: ' .. nameList)
for name in nameList:gmatch('"([^"]+)"') do
    assert(name:find(' '), 'every case name needs a surname: ' .. name)
end
print('PASS case person: wired into case creation, reported at start, and the names are full ones')

-- Finding her again, and learning what the game puts in her pockets when she
-- dies. Owner, 2026-09-11, having killed the wrong zombie: "ahhh wrong one
-- then". Both halves log, so the answer reaches the development machine.
local bodies = { zombie(120, 130, 0) }
list = bodies
local target = assert(P.bind("Ines Kubiak", "case-9", 120, 130, 0))
local where = P.where()
assert(where:find("Ines Kubiak", 1, true), where)
local seen = {}
local oldWrite = print
print = function(s) seen[#seen + 1] = s end
P.onZombieDead(target)
print = oldWrite
local line = table.concat(seen, "\n")
assert(line:find("bound case person died", 1, true), line)
assert(line:find("ID Card: Ines Kubiak", 1, true), "the death log must list what she carried: " .. line)
-- An unbound zombie's death says nothing.
seen = {}
print = function(s) seen[#seen + 1] = s end
P.onZombieDead(zombie(1, 1, 0))
print = oldWrite
assert(#seen == 0, "an unbound zombie's death must not be logged")
print('PASS case person: where() finds her, and her death records what she carried')
