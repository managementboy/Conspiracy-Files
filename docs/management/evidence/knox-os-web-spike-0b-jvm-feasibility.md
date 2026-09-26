# Step 0b findings: JVM-in-browser feasibility spike, resolved

docs/design/KNOX_OS_WEB_PDA_PLAN_2026-09-26.md §2.1 and §7 step 0b: *"try
loading `ISPanel`'s compiled class alone into CheerpJ or TeaVM and see how
deep the real dependency graph goes before concluding whether this is
buildable at all."*

**Verdict: does not hold up. The fallback (§2.2 trace-replay + §2.3
hardening) is now the committed path, not a contingency.**

## What was actually checked

`OrganiserScreen.lua` derives from the base game's `ISPanel.lua`
(`mod.../ISPanel:derive(...)`) — itself shipped Lua, not Java. But every
positioning/sizing/drawing/hit-test method on it (`setX`, `getWidth`,
`isMouseOver`, `drawRectStatic`, ...) dispatches to `self.javaObject`, a
real instance of the compiled Java class `zombie.ui.UIElement`, extracted
from `projectzomboid.jar` and inspected with `javap -v -p` against its
constant pool (real bytecode, not a guess):

**`zombie/ui/UIElement.class`** references, one hop away:
- `org/lwjgl/opengl/GL11` — raw native OpenGL, directly.
- `zombie/core/SpriteRenderer`, `zombie/IndieGL`,
  `zombie/core/textures/Texture` — PZ's own native-adjacent renderer.
- `zombie/iso/IsoObject`, `zombie/iso/objects/IsoWorldInventoryObject` — the
  world/entity graph, with no UI-specific reason to be present.
- `se/krka/kahlua/vm/KahluaTable`, `se/krka/kahlua/integration/LuaCaller`,
  `se/krka/kahlua/vm/KahluaUtil` — the *specific* Kahlua VM's own Java-side
  bridge classes, wired in at the bytecode level, not called reflectively.
- `zombie/input/Mouse` — native input polling.

**`zombie/ui/UIManager.class`** (the class that dispatches mouse/keyboard
events to every `UIElement`, including the one behind `OrganiserScreen`)
goes further, not less: `zombie/iso/IsoWorld`, `zombie/iso/IsoCamera`,
`zombie/iso/IsoObjectPicker`, `zombie/characters/IsoPlayer`,
`org/lwjglx/input/Keyboard`, and `se/krka/kahlua/vm/KahluaThread`/`Coroutine`
directly.

## Why this settles it

"Just the UI classes" was never on the table — `UIElement` and `UIManager`
are entangled with raw OpenGL, PZ's native renderer, the live world/entity
graph, and the exact Kahlua bridge, all at the first hop, with no seam a
browser JVM runtime (CheerpJ/TeaVM) could cut cleanly. Getting this to run
in a browser JVM would mean also reimplementing LWJGL-over-WebGL, PZ's
native `SpriteRenderer`/`IndieGL`, and enough of the iso world/entity system
to satisfy classes that have no UI purpose at all — which is a much larger
rebuild than the hand-written Canvas2D shim this spike was meant to replace,
not a smaller one.

## What this means for the plan

§2.1's parallel research spike is resolved negative. The committed path is:

- `KnoxUI.lua`'s draw calls get a hand-written Canvas2D shim (as originally
  planned before this pass), but it does **not** get to claim "verbatim"
  fidelity on its own — §2.2 (trace-replay against real captured
  `drawRect`/`drawTextureScaled`/`getTexture` call arguments and real
  texture-atlas bytes) and §2.3 (hash-locking, dual-run test diffing against
  the real PZ Lua runtime) are what make that claim honest instead of
  asserted.
- `OrganiserScreen.lua`'s mouse-handling gets a hand-written browser
  click/keydown layer for the same reason — its real hit-test/dispatch logic
  is inseparable from `UIManager`'s world-camera/object-picker coupling.
- This is not a retreat from "test the game, not rebuild the PDA" — it's the
  evidence that answers exactly how much of the PDA's *rendering pipeline*
  is genuinely inseparable from the running game, and confirms the
  trace-replay oracle (§2.2) is doing real work, not decoration.
