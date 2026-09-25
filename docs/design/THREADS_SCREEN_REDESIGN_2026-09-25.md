# THREADS reads wrong — the problem, and what to build instead

Design note, 2026-09-25. Written because the owner read the THREADS screen the
day it shipped and said: *"that is a bad UI design. Even the palmpilot had
better."* He is right, and the reason is worth writing down rather than just
patching: the screen does not use the two list idioms this device already has.

Nothing here is built. The owner has approved the row label (below) and is
holding the rest.

## What is on the glass now

```
THREADS v                                                1 of 6
STILL FOLLOWING
- Equipment induction house key / …
  1. Equipment induction house key …
ON THEIR OWN
- A key I carry opens a door here
  2. A key I carry opens a door here
```

Three different kinds of thing — a section, a thread, a finding — in one flat
list, told apart by two spaces and a dash.

## The three faults

**1. A single-finding thread prints its name twice.** A thread is labelled by
the finding that started it, so while it holds only that finding, the heading
and the row beneath it are the same words. Both truncate, so they are the same
words twice with the same ellipsis. Every game opens in this state, which is
the worst possible case to meet first.

**2. The loose bucket has a heading it should never have had.** `ON THEIR OWN`
is already the heading for findings belonging to no thread. `A.threads.list`
then emits a thread-style `- …` row for that bucket as well, named after its
first finding. Rows 2 and 3 of that section are the same sentence. This one is
a plain bug, not a design question.

**3. The layout is invented.** This is the root cause and the only one worth a
redesign. FILES and NAMES are flat lists with a category picker in the title
bar. DATES is master → detail, where a day's lines open the record they name.
THREADS is neither. It is the only program on the device that builds a
hierarchy out of indentation, and indentation is the weakest signal the Palm
list ever had — which is exactly the owner's point.

## What the device already provides

Both idioms exist, are generic, and are used by other programs. This is the
strongest argument that THREADS is the outlier rather than the pioneer.

| machinery | where it lives | who already uses it |
|---|---|---|
| category picker in the title bar, cycled by tapping it, remembered per program while the machine is on | `Screen:category`, `Screen:cycleCategory`, `K.titleBar`'s `category` argument | NAMES (`A.NAME_FILTERS`); DATES repurposes it to step the month |
| a record whose `entries` draw as tappable rows under its fields, each opening the FILES record it names, with BACK returning to the parent | the record branch of `Screen:render`, the `ENTRY` handler, `row.backTo` | DATES — a day lists what was found on it (owner, Windows, 2026-09-14) |

The `ENTRY` handler reads `self.record`, resolves `entry.ref` against
`Apps.files.list` and sets `backTo` on the row it opens. None of that is
DATES-specific. **A thread record with `entries` works with no shell change at
all.**

## The redesign

### 1. The sections become the category picker

`Following` / `Put down` / `All`, top right, where NAMES puts its four. Palm's
To Do application worked this way; sections printed into the list did not.
`A.threads` gains a `filters` function and `list` takes the chosen category.
Two rows of screen space come back, and a thread the survivor has put down goes
out of the way without disappearing — which is what putting something down
should feel like.

### 2. One row per thread, and no child rows in the list

This alone removes faults 1 and 2. A thread's findings are not siblings of the
thread; they are its contents, and they belong in the thread, not beside it.

### 3. Tapping a thread opens the thread

Built exactly as a DATES day is built: fields, a rule, then the findings as
tappable rows, then the footer.

```
  list                                  the thread
┌──────────────────────────────┐   ┌──────────────────────────────────────┐
│ THREADS v         Following  │   │ Why was I expected at this address?  │
│──────────────────────────────│   │ WHAT I WANT  Why was I expected at   │
│ - Why was I expected at this │   │   TO KNOW    this address?           │
│   address?                   │   │ STATE        I am still following    │
│ - Why was I printed on a     │   │              this one.               │
│   passenger manifest?        │   │ ──────────────────────────────────── │
│ - Things I have not placed   │   │  1. Equipment induction house key …  │
│                              │   │  2. Standby list copy / LD-920       │
│                              │   │ ──────────────────────────────────── │
│ HOME: programs   tap: open   │   │ [BACK]  [PUT DOWN]                   │
└──────────────────────────────┘   └──────────────────────────────────────┘
```

Tapping a finding opens its FILES record; BACK returns to the thread, then to
the list. The `PUT DOWN` / `PICK UP` command is already written and stays where
it is.

### 4. Findings in no thread become one row

`Things I have not placed`, opening the same way, with no PUT DOWN because
there is no thread to put down. The echo in fault 2 cannot recur: there is no
longer a header and a row saying the same sentence.

## The row label — decided by the owner, 2026-09-25

A thread's row carries **its open question**, not the finding that started it.
The survivor's own words, and it says why the thread matters rather than what
the paperwork happens to be called. A retired thread keeps no case envelope and
so no question; that one falls back to its first finding's title.

### The open problem this creates

The list is about 34 characters wide, and `K.row` draws one line and cuts with
an ellipsis (`K.fit`). Our questions run 50–70 characters and most of them open
with "Why was I", so two threads truncate to nearly the same row:

```
- Why was I expected at this add…
- Why was I printed on a passeng…
```

That is the same class of illegibility the redesign exists to remove, so it
must not ship that way.

**Proposed remedy: wrap a thread row onto two lines, in THREADS only.** Threads
are few — one or two live at a time — so vertical space is cheap here in a way
it is not in FILES, where a row per finding must stay a row per finding. The
wrapping helper already exists in the record view. It is a contained change to
the list draw for a program that asks for it, not new machinery and not a
change to any other program.

Not yet approved.

## What this does not change

- **DR-20260920-NO-CONCLUSION.** No count appears anywhere, before or after.
  `Following` and `Put down` are categories, not a score, and `1 of 6` is the
  shell's scroll position — the same widget FILES and NAMES carry.
- **"Put down" never reads as solved.** Unchanged wording, unchanged rule.
- **FILES keeps its order and its numbers.** Findings arrive numbered by
  discovery and keep both inside the thread. THREADS remains a second view,
  exactly as PLACES is.
- **The save.** No new state. `ConspiracyFiles.Threads` still holds a thread id
  and a flag.
- **The central question is never announced.**

## Cost

| | |
|---|---|
| `A.threads` | rewritten, ~80 lines: `filters`, one row per thread, a thread record with `entries` |
| `Threads.build` | returns threads with a state, not pre-built sections |
| `OrganiserScreen` | **no change**, unless the two-line row is approved |
| `test/threads_group_what_i_carry.lua` | reworked for the new shape, plus a new assertion that no row duplicates the row beneath it — the fault that started this |
| `tools/autotest/checks/knox.sh` | THREADS stage drives the category picker and the thread detail instead of reading section headings |
| verification | offline suite, then one `knox.sh` run on the real display |

No content, no new save state, no shell changes unless the two-line row is
taken.

## Related

- `DR-20260925-THREADS` in DECISIONS.md — the word, the grouping, the rules.
- `DR-20260920-NO-CONCLUSION` — why nothing here counts.
- `docs/design/PHASE_C_CONTINUITY_CARRIER.md` — where a thread comes from.
- `docs/design/KNOX_OS.md` — the device the screen has to belong to.
