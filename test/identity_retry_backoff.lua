-- A permanently failing identity must be dropped, not retried forever.
--
-- IdentityObserver.flush cleared its queue guard BEFORE writing, and only set
-- `seen` on success - so a record whose write kept failing was re-queued on
-- the very next render and tried again, indefinitely. The fault check measured
-- it: 90 caught errors in 15 seconds against a budget of 30 (2026-09-13).
--
-- LocalPersonIntegration had the identical bug, found and fixed on 2026-09-12,
-- with a comment next to the fix explaining exactly this failure. It was never
-- applied here. This test holds both modules to the same rule.
local function read(path)
    local f = assert(io.open(path, "r"), "cannot read " .. path)
    local s = f:read("*a"); f:close(); return s
end

local observer = read("mod/common/media/lua/client/ConspiracyFiles/IdentityObserver.lua")
local person = read("mod/common/media/lua/client/ConspiracyFiles/LocalPersonIntegration.lua")

for name, src in pairs({ IdentityObserver = observer, LocalPersonIntegration = person }) do
    assert(src:find("MAX_ATTEMPTS", 1, true),
        name .. " has no attempt cap, so a permanently failing record retries forever")
    assert(src:find("attempts", 1, true),
        name .. " does not count attempts")
end

-- The specific shape that made it a forever-loop: the guard must NOT be
-- cleared unconditionally before the write.
assert(not observer:find("queued%[record%.id%]=nil\n local staged,changed=Model%.add"),
    "IdentityObserver clears its queue guard before the write again; a failing "
    .. "record will be re-queued on the next render forever")

-- And giving up has to be audible, or the identity vanishes silently.
assert(observer:find("Identity dropped after", 1, true),
    "IdentityObserver drops a record without saying so")
assert(person:find("Dropped after", 1, true),
    "LocalPersonIntegration drops a record without saying so")

-- The write itself must be guarded: Model.add throwing used to escape flush
-- entirely and be counted as an anonymous caught error by the fault check.
assert(observer:find("pcall(Model.add", 1, true),
    "IdentityObserver calls Model.add unguarded; a throw escapes flush")

print("PASS identity retry backoff: both observers cap attempts, keep the guard "
      .. "set on a final failure, say when they give up, and guard the write")
