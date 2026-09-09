-- An identity record must be able to gain its body token later.
--
-- Playtest 2026-09-08 found the outfit lead never reaching the notebook, by two
-- routes. Read an ID before looting the body and the record is written before
-- LocalPersonIntegration stamps the corpse, so it has no token; nothing then
-- updated it, so the outfit paragraph could never attach. Read an ID inside a
-- wallet and the record was classified "container", which discarded the token
-- entirely - even though the wallet carried the body's stamp.
--
-- Both are the same failure: a record with no token can never describe the two
-- disagreeing observations that Phase 1 exists to produce.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local M = require("ConspiracyFiles/IdentityObservations")

local function record(id, token)
    return {
        id = id, fullType = 'Base.IDcard_Male', label = 'ID Card: Reyes Varela',
        source = 'corpse', container = 'corpse',
        x = 10895, y = 10030, z = 0, observedAt = 2.95, token = token,
    }
end

-- Observed before the body was stamped: stored, but with nothing to hang an
-- outfit on.
local first, changed = M.add(M.empty(), record('Base.IDcard_Male:243638380', nil))
assert(first and changed, 'a tokenless observation is still worth storing')
assert(first.records[1].token == nil, 'no token was available yet')

-- Seen again once the body carries its token: the record takes it.
local second, backfilled = M.add(first, record('Base.IDcard_Male:243638380', 'corpse-item:1792113713'))
assert(second, 'backfill must produce a valid state')
assert(backfilled, 'gaining a token is a change, or nothing would ever be saved')
assert(#second.records == 1, 'backfill must not append a second record')
assert(second.records[1].token == 'corpse-item:1792113713', 'the token must be taken')

-- Seen a third time with nothing new: unchanged, and no duplicate.
local third, again = M.add(second, record('Base.IDcard_Male:243638380', 'corpse-item:1792113713'))
assert(third and not again, 'a record that already has its token is finished')
assert(#third.records == 1, 'still one record')

-- A tokenless re-sighting of a record that already has one must not clear it.
local fourth, cleared = M.add(second, record('Base.IDcard_Male:243638380', nil))
assert(fourth and not cleared, 'a later sighting with no token changes nothing')
assert(fourth.records[1].token == 'corpse-item:1792113713', 'an existing token is never lost')

-- Backfill touches only the record it belongs to.
local other = M.add(second, record('Base.IDcard_Male:987256056', nil))
local mixed, changedMixed = M.add(other, record('Base.IDcard_Male:987256056', 'corpse-item:1067933060'))
assert(changedMixed and #mixed.records == 2, 'two distinct records survive')
assert(mixed.records[1].token == 'corpse-item:1792113713', 'the first record is untouched')
assert(mixed.records[2].token == 'corpse-item:1067933060', 'the second gains its own token')

-- The outfit paragraph is the whole point: prove it appears once the token is
-- present, and stays absent while it is not.
local function outfitFor(token)
    if token == 'corpse-item:1792113713' then return 'security guard uniform' end
    return nil
end

local beforeRows = M.rows(first, outfitFor)
assert(not beforeRows[1].detailText:find('The body itself wore', 1, true),
    'no outfit line while the record has no token')

local afterRows = M.rows(second, outfitFor)
assert(afterRows[1].detailText:find('The body itself wore: security guard uniform', 1, true),
    'the outfit line must appear once the token is backfilled')
assert(afterRows[1].detailText:find('two separate observations', 1, true),
    'and it must still refuse to reconcile the two leads')
assert(not afterRows[1].detailText:find('identifies the body', 1, true),
    'a lead is never proof')

print('PASS identity outfit backfill: tokenless record stored, token taken on a later '
    .. 'sighting, no duplicate, existing token never cleared, outfit line follows the token')
