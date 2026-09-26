# EvidenceRows.lua FILES-row baseline, captured before any schema inversion

docs/design/MODULE_SEPARATION_2026-09-26.md section 3 step 4.

## Why this exists

Stage 4's dependency inversion (module C stops requiring `Generated/*`
modules directly, gets a generic document from module B instead) still
has 4 real requires left in `EvidenceRows.lua` (`PlaceNames`, `RelayMemo`,
`SuccessiveCases`, `EvidenceKinds`) — the ones that build every real
FILES row's title/fields/body/kind. A third ADHD re-evaluation before
this step began converged hard on one risk: `EvidenceRows.lua`'s
row-building loop carries state **across** rows (a `memoFound`-shaped
flag threaded through the whole build, not per row) and concatenates
`detail` text from several sources in a fixed order. Wrapping its
*output* in a schema is safe; restructuring *how it builds that output*
while doing so is exactly how a rare, silent regression ships
undetected. Every frame's sharpest idea was the same: capture the real
screen's current output from a populated save before touching it.

## What was tried, and what actually worked

A fresh boot-check save has zero real evidence — checked directly
(`EvidenceRows.list("files")` returned `0` rows) — so there is nothing to
diff against on the standard autotest path. Four of this machine's own
aged save folders under `~/Zomboid/Saves/Sandbox/` (the largest by disk
size, on the assumption bigger saves had more real play) were loaded
with `tools/autotest/pz.sh start --continue <world>` and checked the
same way. Three came back empty; one
(`10007581323681056303`) had exactly one real FILES row.

## The captured baseline

From that save, `require("ConspiracyFiles/EvidenceRows").list("files")[1]`,
dumped field by field via `pz.sh eval`:

```
id=generated:1102509779:document-1
ordinal=1
title=Passenger manifest stub / PS-847
cfCarrier=Note
cfCase=PS-847
summary=403 Main St - Discovery 1 - Case PS-847
detailText=WHAT I THINK I FOUND
A torn manifest stub with my name beside a route from the collection point.

McCoy Logging Co. PASSENGER MANIFEST
Exercise reference PS-847 / printed June 25, 1993
Passenger: Lavonne Edwards
Collection: 403 Main St
Vehicle: borrowed unit 14
Manifest and enquiry file: 102 Salt St
The word EXERCISE is missing from this retained strip.

WHAT I THINK IT MEANS
This stub puts me on a passenger route from 403 Main St. The reference calls it an exercise, but the part of the form that might have explained that has been torn away.

WHAT I MARKED ON MY MAP
I did not note where I found this, so there is no mark on my map.

FOUND
I found a note at 403 Main St.
place=403 Main St
```

This is real, not synthetic: the exact fixed-order concatenation
(`WHAT I THINK I FOUND` / `WHAT I THINK IT MEANS` / `WHAT I MARKED ON MY
MAP` / `FOUND`) the attacker frame's own review warned about is visible
directly in `detailText` above, from a real save, not guessed at.

## What this does and doesn't prove

**Proves**: one concrete, real row's exact shape, reusable as a
byte-for-byte regression check the moment any translation code touches
this file's output.

**Does not prove**: coverage of the rarer cases the attacker frame named
specifically — a row where `ClueMarkers`, a connection, and
`RelayMemo.inWeek` all fire at once; a `kind` value `EvidenceKinds.lua`
doesn't recognise; a legacy kind string from before a past rename. One
row from one save is a start, not the exhaustive corpus a real inversion
needs.

## The deeper finding: this isn't a call-site redirect like the other straddlers

Stage 3's straddlers (`GeneratedMenu.lua`, `ClueActions.lua`,
`Organiser.lua`, `CaseFile.lua`) all reached into another module through
the **shared global table** (`ConspiracyFiles.X`) — fixable by pointing
that one reach at `EngineAPI.lua`/`PDAAPI.lua` instead, because the
module boundary being crossed lived at the global-table layer.

`EvidenceRows.lua`'s coupling to `Generated/*` is different: it's a
plain `require()` at the **file** level, and `KnoxApps.lua` (module C)
`require()`s `EvidenceRows.lua` directly at ITS file level too. Aliasing
`EvidenceRows` onto `CFEngine`'s namespace would change nothing real —
`KnoxApps.lua` would still directly `require("ConspiracyFiles/
EvidenceRows")`, which still transitively requires the 4 `Generated/*`
files regardless of what table points at it. The only way to actually
invert this dependency is the schema/`publish()` design section 2.3
already called for: `EvidenceRows.lua`'s row-building logic needs to run
on module B's side of the boundary (its ownership reassigned from C to
B, since building rows from `Generated/*` content is content-assembly,
not PDA rendering), with C receiving only the already-built, generic
document — never `EvidenceRows.lua` itself, never a `Generated/*` file,
transitively or otherwise.

That's real design and implementation work beyond a redirect, not yet
done. This baseline is what the next increment verifies against.
