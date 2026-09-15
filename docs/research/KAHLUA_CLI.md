# Running the engine's own Lua interpreter from the CLI

Verified 2026-09-07 against installed Build 42.20.4.

## Why

PUC Lua 5.1 (`lua5.1.exe`) is **not** the interpreter Project Zomboid runs. The
game embeds **Kahlua**, an incomplete Lua 5.1 written in Java. Code that passes
offline can still fail in game, and until now that only surfaced during play.

## What is available

`projectzomboid.jar` contains the whole Kahlua stack — 115 classes including
`se.krka.kahlua.j2se.J2SEPlatform`, `luaj.compiler.LuaCompiler`,
`vm.KahluaThread` and `integration.expose.LuaJavaClassExposer`.

The jar's classes are **class-file major 69 (Java 25)**, so a JDK 25 or newer is
required; older JDKs cannot read them. The game ships Zulu 25.30 as a *runtime
only* — no `javac`, and source-file mode fails with `Module jdk.compiler not in
boot Layer`. A separate JDK is therefore needed to build anything.

Installed for this: **Azul Zulu JDK 25.0.4.1+1** at `C:\Program Files\Zulu\zulu-25`.

## Usage

    tools/kahlua/run.sh --parse-all          # compile every shipped mod file
    tools/kahlua/run.sh path/to/script.lua   # run one script under Kahlua

`stdlib.lua` is loaded by `J2SEPlatform` relative to the working directory and
ships with the game, not this repo. The wrapper copies the game's copy into the
repo root on first use; it is gitignored as game content and never committed.

## Result: all 59 shipped mod files parse under the engine's compiler

## What bare Kahlua does NOT provide

Measured from a bare `J2SEPlatform` environment:

    ABSENT: package, require, dofile, loadfile, load, loadstring,
            io, debug, xpcall, next
    math:   no random          os: no clock, no exit
    io:     absent entirely

**Important caveat:** this is the *bare platform*. In game, PZ's `LuaManager`
injects its own globals on top — `require` and `print` demonstrably work in
mods, and `print` in the bare platform does not even reach stdout. So this list
is "what Kahlua itself gives you", not "what a mod sees". Treat an entry here as
*suspect and worth verifying*, not as proven unavailable in game.

Audited on the day: **no shipped mod file uses any of these** except `require`,
which PZ supplies.

## What this does and does not catch

Catches: syntax and constructs the engine's compiler rejects; use of standard
library functions Kahlua lacks.

Does **not** catch: the receiver bug fixed in `77d46ef`
(`square.HasStairs()` instead of `square:HasStairs()`). That error comes from
the Java **exposure** layer, not the VM, and our test doubles are plain Lua
tables, which Kahlua treats exactly as PUC Lua does. Catching that class of bug
natively would need a fake `IsoGridSquare` exposed through
`LuaJavaClassExposer`. Until then the strict mocks in `test/reachability_gate.lua`
are what guard it.

## Not yet possible

Running the existing test suite under Kahlua: the tests use `package.path`,
`require`, `dofile`, `loadstring` and `io` as harness plumbing, none of which
bare Kahlua has. That needs a prelude shim providing a `require`/`package`
implementation. Worth doing; not done.
