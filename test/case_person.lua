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
-- PZ Kahlua cannot be relied on for `next` (test/g2_smoke.lua); the first
-- re-bind sweep used it and broke every generated-case test that loads this.
next = nil

-- `female` and `outfit` are what a reload keeps of a zombie: the population
-- record stores a persistent outfit id (which encodes the sex) and nothing else.
local function zombie(x, y, z, female, outfit)
    local md, desc = {}, { forename = nil, surname = nil }
    local z2
    z2 = {
        md = md, items = {}, desc = desc, x = x, y = y, z = z,
        getSquare = function() return { getX = function() return z2.x end,
            getY = function() return z2.y end, getZ = function() return z2.z end } end,
        getModData = function() return md end,
        isFemale = function() return female end,
        getPersistentOutfitID = function() return outfit end,
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
-- World ModData as the game keeps it: one table per tag, saved with the world.
local db = {}
ModData = { get = function(k) return db[k] end,
    getOrCreate = function(k) db[k] = db[k] or {}; return db[k] end }
getPlayer = function() return nil end
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
-- Stricter since P4-R103: the case's record, not the zombie's mark, refuses
-- the second bind, because after a reload no zombie carries the mark any more.
local second, refused = P.bind("Marion Ellis", "case-1", 100, 100, 0)
assert(second == nil and refused == "case already has a person", tostring(refused))

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
local nameList = generator:match('G%.INVENTED_NAMES=(%b{})')
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

-- Her body, and what it carries. Owner, Windows, 2026-09-14: the game empties a
-- zombie's pockets as it dies (before OnZombieDead), so the card given above
-- never reached the body; and the body's own loot - rolled the first time it
-- is opened, from the renamed descriptor - put the case's name on two of the
-- game's own ID cards. The body copies the zombie's ModData, and
-- OnDeadBodySpawn fires once that copy and the searched flag are both set.
local function deadBody(md, items)
    local explored = false
    local c = {
        setExplored = function(_, v) explored = v end,
        AddItem = function(_, fullType)
            local item = { fullType = fullType, md = {},
                getModData = function(self) return self.md end,
                setName = function(self, n) self.name = n end,
                getDisplayName = function(self) return self.name or self.fullType end,
                setCustomName = function(self, v) self.custom = v end }
            items[#items + 1] = item
            return item
        end,
        getItems = function()
            return { size = function() return #items end, get = function(_, i) return items[i + 1] end }
        end,
    }
    local copy = {}
    for k, v in pairs(md) do copy[k] = v end
    return { getModData = function() return copy end, getContainer = function() return c end,
             explored = function() return explored end, items = items }
end

list = { zombie(10, 10, 0) }
local dying = assert(P.bind("Roy Hale", "case-11", 10, 10, 0))
-- As the game does it: the pockets emptied, then a body made from the zombie.
local body = deadBody(dying.md, {})
P.onDeadBodySpawn(body)
assert(body.explored(), "the body must be marked searched, or the game rolls its own ID cards in her name")
assert(#body.items == 1, "the body must carry exactly one card, got " .. #body.items)
assert(body.items[1].name == "ID Card: Roy Hale", tostring(body.items[1].name))
assert(body.items[1].md.cfCasePerson == "case-11", "and it must be this case's card")
P.onDeadBodySpawn(body)
assert(#body.items == 1, "a second spawn event must not add a second card")
-- Any other body is left exactly as the game makes it.
local stranger = deadBody({}, {})
P.onDeadBodySpawn(stranger)
assert(not stranger.explored() and #stranger.items == 0, "an unbound body must be left as the game made it")
print("PASS case person: her body is marked searched and carries exactly one card, with her name")

-- Name and body match. Owner saw a man's name on a zombie in women's clothes.
local function logged(fn)
    local seen, old = {}, print
    print = function(s) seen[#seen + 1] = tostring(s) end
    local ok, a, b = pcall(fn)
    print = old
    assert(ok, a)
    return table.concat(seen, "\n"), a, b
end
local man, woman = zombie(301, 300, 0, false, 5), zombie(305, 300, 0, true, 6)
list = { man, woman }
local _, delia = logged(function() return P.bind("Delia Mercer", "case-sex", 300, 300, 0) end)
assert(delia == woman, "a woman's name must go to the nearest woman, not the nearer man")
assert(man.md.cfCasePerson == nil and #man.items == 0)
list = { zombie(301, 300, 0, false, 5) }
local text, joanne = logged(function() return P.bind("Joanne Voss", "case-fallback", 300, 300, 0) end)
assert(joanne == list[1], "with no woman in reach the nearest body still takes the name")
assert(text:find("no zombie of the name's sex", 1, true), "and the log says the sex could not be matched: " .. text)
-- Every invented name has a sex; the table covers exactly the generator's list.
local listed = 0
for name in nameList:gmatch('"([^"]+)"') do
    listed = listed + 1
    assert(P.SEX[name] == "f" or P.SEX[name] == "m", "no sex for " .. name)
end
local known = 0
for _ in pairs(P.SEX) do known = known + 1 end
assert(known == listed, "P.SEX must cover exactly the invented names")
print("PASS case person: the name goes to a body of the same sex, the nearest of any only when none is in reach")

-- The record: written on bind, and it alone refuses a second person.
local function record(caseId)
    local store = db["ConspiracyFiles.CasePeople"]
    return store and store.canonical and store.canonical.records[caseId]
end
local r = assert(record("case-sex"), "bind must write the case's record")
assert(r.name == "Delia Mercer" and r.x == 305 and r.y == 300 and r.z == 0, "where she is")
assert(r.outfit == 6 and r.female == true and r.dead == false, "what she wore, her sex, alive")
list = { zombie(300, 300, 0, true, 6) }
local again, why2 = P.bind("Delia Mercer", "case-sex", 300, 300, 0)
assert(again == nil and why2 == "case already has a person", tostring(why2))
assert(list[1].md.cfCasePerson == nil, "and no second body is touched")
print("PASS case person: a record is written on bind and a second bind for the case is refused")

-- A save and reload. The game rebuilds every zombie from a position and an
-- outfit id: new objects, empty ModData, fresh descriptor, empty pockets.
local adele = zombie(200, 200, 0, true, 77)
list = { adele }
assert(P.bind("Adele Prosser", "case-reload", 200, 200, 0) == adele)
-- She walks; the record follows while she is loaded.
adele.x = 205
P.rebind(10000)
assert(record("case-reload").x == 205, "her last-seen position must be refreshed")
assert(adele.md.cfCasePerson == "case-reload" and #adele.items == 1, "a loaded carrier is left alone")
-- Reload. The old object, if the pool reuses it, comes back wiped.
for k in pairs(adele.md) do adele.md[k] = nil end
adele.items = {}; adele.desc.forename = nil; adele.desc.surname = nil
adele.x, adele.y = 900, 900
local stranger = zombie(205, 201, 0, true, 12)   -- nearer, her sex, other clothes
local her = zombie(207, 200, 0, true, 77)        -- her outfit
local bloke = zombie(205, 200, 0, false, 3)      -- nearest of all, wrong sex
list = { adele, stranger, bloke, her }
local rebound = logged(function() P.rebind(20000) end)
assert(her.md.cfCasePerson == "case-reload" and her.md.cfCasePersonName == "Adele Prosser",
    "the zombie in her outfit must be dressed as her again")
assert(her.desc.forename == "Adele" and her.desc.surname == "Prosser")
assert(#her.items == 1 and her.items[1].name == "ID Card: Adele Prosser"
    and her.items[1].md.cfCasePerson == "case-reload", "with exactly one card")
assert(stranger.md.cfCasePerson == nil and bloke.md.cfCasePerson == nil and adele.md.cfCasePerson == nil)
assert(rebound:find("re-bound Adele Prosser", 1, true), "one log line per re-bind: " .. rebound)
local function carriers()
    local n = 0
    for _, zz in ipairs(list) do if zz.md.cfCasePerson == "case-reload" then n = n + 1 end end
    return n
end
P.rebind(30000); P.rebind(40000)
assert(carriers() == 1 and #her.items == 1, "sweeping again must not dress a second body or add a card")
-- Without her outfit nearby, her sex wins over mere nearness.
her.md.cfCasePerson, her.md.cfCasePersonName = nil, nil; her.items = {}
local other = zombie(206, 200, 0, true, 40)
list = { bloke, other }
P.rebind(50000); P.rebind(60000)
assert(other.md.cfCasePerson == "case-reload" and bloke.md.cfCasePerson == nil,
    "a woman in other clothes before the nearer man")
assert(record("case-reload").outfit == 40, "the next load must look for the outfit this zombie wears")
print("PASS case person: after a reload the zombie in her outfit is dressed as her again, once, with one card")

-- Dead is final: her body carries her, and no zombie is dressed as her again.
P.onZombieDead(other)
assert(record("case-reload").dead == true, "death must be recorded")
local fresh = zombie(206, 200, 0, true, 40)
list = { fresh }
P.rebind(70000); P.rebind(80000)
assert(fresh.md.cfCasePerson == nil and #fresh.items == 0, "no zombie may be dressed as someone dead")
-- The body event alone is enough, whichever the game fires.
list = { zombie(50, 50, 0, false, 9) }
local ward = assert(P.bind("Warren Nagy", "case-body", 50, 50, 0))
P.onDeadBodySpawn(deadBody(ward.md, {}))
assert(record("case-body").dead == true, "a body spawn must record the death too")
print("PASS case person: after death no zombie is re-bound")

-- A damaged store is a refusal, never a crash, and is never overwritten.
local saved = db["ConspiracyFiles.CasePeople"]
db["ConspiracyFiles.CasePeople"] = { canonical = { schema = 1, records = { x = { name = 3 } } } }
list = { zombie(10, 10, 0) }
local none, bad = P.bind("Roy Hale", "case-bad", 10, 10, 0)
assert(none == nil and type(bad) == "string", "an invalid store must refuse the bind")
assert(P.step(1) == "idle" and db["ConspiracyFiles.CasePeople"].canonical.records.x.name == 3)
db["ConspiracyFiles.CasePeople"] = saved
print("PASS case person: an invalid store refuses and is left untouched")
