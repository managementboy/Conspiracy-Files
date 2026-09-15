-- A container taken off a body should say so.
--
-- Playtest 2026-09-09: an ID inside a wallet on Ursula Schultz's corpse
-- produced an entry reading "I saw a document labelled ... inside Wallet." The
-- mod had already stamped that wallet with the body's provenance token, bound
-- a case to that corpse and recorded the name against the same token - and
-- then told the player none of it. The owner's words: "connection to the
-- corpse was not established".
--
-- Same failure as losing the outfit lead, one layer up: a fact the mod holds
-- and does not surface. It still refuses to say WHOSE body, because a wallet
-- on a corpse is only a wallet on a corpse.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local M = require("ConspiracyFiles/IdentityObservations")

local function record(source, container, token)
    return {
        id = "Base.IDcard_Female:2021783559", fullType = "Base.IDcard_Female",
        label = "ID Card: Ursula Schultz", source = source, container = container,
        x = 10657, y = 10283, z = 0, observedAt = 5.05, token = token,
    }
end

local function detail(r)
    local root = assert(M.add(M.empty(), r))
    return M.rows(root, function() return nil end)[1].detailText
end

-- A wallet carrying a body's token: the entry says where the wallet came from.
local carried = detail(record("container", "Wallet", "corpse-item:1659515547"))
assert(carried:find("inside Wallet", 1, true), "still names the container")
assert(carried:find("taken off a corpse", 1, true),
    "a container with body provenance must say so")

-- No token: nothing is claimed. A wallet found on a shelf is a wallet on a shelf.
local shelf = detail(record("container", "Wallet", nil))
assert(shelf:find("inside Wallet", 1, true), "still names the container")
assert(not shelf:find("corpse", 1, true),
    "without provenance the entry must not mention a body at all")

-- Loose on the body: unchanged wording, no doubled-up sentence.
local loose = detail(record("corpse", "corpse", "corpse-item:1659515547"))
assert(loose:find("among a corpse's belongings", 1, true), "loose-on-body wording kept")
assert(not loose:find("taken off a corpse", 1, true),
    "an item already described as on the body must not also say the container was")

-- The refusal survives in every case; that is the point of the whole record.
for _, text in ipairs({ carried, shelf, loose }) do
    assert(text:find("does not establish who owned the container or identify the body", 1, true),
        "the refusal to conclude must never be lost")
end

print('PASS container provenance: a wallet taken off a body says so, a wallet '
    .. 'without provenance claims nothing, and the refusal survives both')
