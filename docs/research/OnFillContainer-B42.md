# `Events.OnFillContainer` does not pass an `ItemContainer` (Build 42.20.4)

**Observed live**, 2026-09-21, on 42.20.4 (`b0bbce05d5`), during the first full
run of `tools/autotest/checks/map_coverage.sh`
(`evidence/linux-autotest/20260921T171400-map-coverage.txt`).

## What was observed

`MapMediaRuntime.offerContainer` is registered on `Events.OnFillContainer` and
calls `container:getParent()` as its first act. Every invocation threw:

```
ERROR: General f:48487> Lua((MOD:Conspiracy-Files: Dead Air)).offerContainer> Exception thrown
java.lang.RuntimeException: attempted index: getParent of non-table:
    zombie.inventory.ItemPickerJava$ItemPickerContainer@6f40df87
```

24 error blocks in one run. The call sits inside a `pcall`, so nothing crashed
— which is why it survived: the run failed only because it asserts zero mod
errors.

## What it means

The third argument of `OnFillContainer` on this build is a
`zombie.inventory.ItemPickerJava$ItemPickerContainer`, **not** an
`ItemContainer`. It has no `getParent`.

Consequence: the native-loot candidate path bailed on its first line for every
container the game has ever filled. The behaviour its own comment describes —
*"Native loot completion contributes candidates to the same diverse scan as
ordinary discovery"* — has never happened. That is a silent feature loss, not
just log noise.

## The Kahlua trap

Kahlua throws on the **index**, not on the call. So the usual guard

```lua
if container.getParent then ... end        -- THROWS
container.getParent and container:getParent()   -- THROWS
```

is itself the error. The only shape that can ask the question is a `pcall`
around a colon call, which AGENTS.md's engine-call-form rule already permits:

```lua
local got,object=pcall(function() return container:getParent() end)
```

That is what `offerContainer` now does; it refuses with a reason and logs once
per class rather than once per container.

## Open, and deliberately not guessed at

**How to reach the real container from an `ItemPickerContainer` is unknown.**
Candidate accessors were probed live but no fill could be triggered in the
session available (loot generates on first room load, and the squares reachable
were already visited), so nothing is recorded here as fact.

Until that is answered, the native-loot path contributes no candidates and the
mod relies on its own scan. AGENTS.md requires a verified Build 42 API
assumption before code depends on one, so no accessor was invented.

**Next step:** trigger `OnFillContainer` in a genuinely fresh cell and dump the
object's usable methods; then decide whether the path can be restored or the
hook should be dropped.

Regression: `test/offer_container_guard.lua`.
