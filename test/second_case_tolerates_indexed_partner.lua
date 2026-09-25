-- A SECOND CASE MAY NAME A SITE WHOSE CHUNK IS NOT LOADED.
--
-- Core loop 20260924T223914: after the first case completed, no second case
-- came in 150 s with the gap removed - refusal "busy". The opening branch of
-- case preparation (4580e18, 2026-09-23) lets an indexed partner stay an open
-- order; the ordinary branch still asked World.resolve about every target, and
-- an indexed signature for a distant building answers "unloaded" every time.
-- So every second case whose sites were out of sight was refused as busy.
--
-- Read as source: the preparation job needs a live game. What is held is that
-- both branches apply the same rule, in the same words.
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua","rb"))
local s=f:read("*a"); f:close()
local rule='not (target and target.indexed==true) and not World.resolve(target) then'
local first=s:find(rule,1,true)
assert(first,"the indexed-tolerant busy rule is gone")
local second=s:find(rule,first+1,true)
assert(second,"the ordinary (non-opening) branch must apply the same indexed tolerance as the opening branch")
-- And the old, intolerant line must not survive anywhere.
assert(not s:find('if not World.resolve(targets[site.id]) then refuse("busy")',1,true),
    "a branch still refuses an indexed open order as busy")
print("PASS second case: an indexed partner out of sight is an open order, not a busy refusal, in both branches")
