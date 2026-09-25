# THREADS reads wrong — the problem, and what to build instead

Design note, 2026-09-25. Written because the owner read the THREADS screen the
day it shipped and said: *"that is a bad UI design. Even the palmpilot had
better."* He is right, and the reason is worth writing down rather than just
patching: the screen does not use the two list idioms this device already has.

**Built 2026-09-25** on the owner's go-ahead ("develop ... until it works.
test on linux"). What shipped, and where it departs from the text below, is in
"What was built" at the end. Native evidence: `knox 20260925T143407`, PASS,
screenshots `dev/eval/linux/runs/20260925T143407-knox-threads.png`,
`-thread.png`, `-threads-put-down.png`.

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

### The open problem this creates - measured

The list is about 34 characters wide, and `K.row` draws one line and cuts with
an ellipsis (`K.fit`). The first draft of this note said "our questions run
50-70 characters and most of them open with 'Why was I'". Measured against
every `question=` in the shipped scenarios (2026-09-25, 75 questions):

| | |
|---|---|
| distinct first 31 characters | **74 of 75** |
| begin "Why was I" | **5** (all of them Fitness openings) |
| begin "Why" | 39 |
| length | 36-116 characters, median 60 |

So the collision is not the corpus; it is the five opening questions - which
is worse, not better, because an opening is what every new game shows first,
and a second Fitness thread in the same save collides with it:

```
- Why was I expected at this add...
- Why was I printed on a passeng...
```

That is the same class of illegibility the redesign exists to remove, so it
must not ship that way. Three remedies, none approved, in the order they
should be tried; they are not exclusive.

#### Remedy A - front-load the difference where the words are written

Fix the row at the writing stage, not in the renderer. A thread row is a
**handle**, and the handle's first thirty characters must carry the thing
that tells this thread from its siblings. Two shapes, chosen by what the
thread already carries (PHASE_C_CONTINUITY_CARRIER: the document, the case's
own reference, a routing point, the unsettled question):

```
- Expected at 201 N Carl St - why me?     (address-anchored: the noun leads)
- (the manifest) Why was I printed on it? (document-anchored: a margin word)
```

The full question stays unabridged in the record's WHAT I WANT TO KNOW field;
only the row changes. For the five openings this is a template edit. For the
general case it is a small pure function `Threads.handle(thread)` returning
at most 30 characters, with a **uniqueness check against the sibling rows at
build time** - the load-bearing risk of this remedy is that the distinguishing
token is not unique either (two threads routed to the same street), which only
moves the collision one field over. When the check fails, fall through to
remedy B for those rows.

First step: write `Threads.handle` and a test that runs it over every shipped
question and every pair of openings a save can hold, asserting no two handles
share a 31-character prefix. No UI change until that test is green.

#### Remedy B - a second line that says something *else*

If a thread row is given two lines (threads are few; vertical space is cheap
here in a way it is not in FILES), the second line should not be the wrapped
remainder of the question - that only moves the ellipsis. It should be a
**different fact**, set in the way the Palm Address list set the phone number
beside the name: the place the thread points at, or the document that
started it when there is no place yet.

```
- Why was I expected at this add...
    ~ 201 N Carl St
- Why was I printed on a passeng...
    ~ standby list copy, LD-920
```

The eye separates the two threads on line two before it has finished line
one. Load-bearing risk: a bare address reads as a *confirmed* location, and
the survivor can never be certain - the line needs a lead-marker (`~`, or
the shell's pending glyph) and must never carry a count or a date-as-progress.
Cost is the same contained change to the THREADS list draw the first draft
proposed, calling `K.fit` twice; the record view's wrapping helper already
exists.

#### Remedy C - make the rows differ before the words do

Cheapest, weakest, and worth having anyway: a single dot under the thread
the survivor opened last, like the worn corner of a page. The shell already
remembers per-program state while the machine is on (`Screen:category`), so
this needs no save state. It does not solve a collision; it tells the
survivor which of two look-alike rows they were just reading.

### Putting down, read as the survivor's own words

The attacker's reading of the first draft: "put down" is a database boolean
flipped, and a reload renders it identically as a toggle - the one place the
diary illusion breaks. Remedy, with **no new save state**: the flag stays a
flag, but the record derives its prose from it at draw time.

- `STATE` reads "I am still following this one." or "I have put this down."
- A put-down thread's findings list ends with one more numbered line, the
  survivor's closing note: *"Put this down. I could not get further, and I
  have stopped looking - for now."* Picking it up removes the line; nothing
  is written.
- The closing line comes from a small pool of variants chosen by a seed
  derived from the thread id, so the same thread always shows the same words
  across reloads and two threads do not show the same sentence. **Variety is
  load-bearing, not polish**: one fixed sentence re-exposes the toggle as
  plainly as a checkbox.
- Never "solved", never "closed", never a total - unchanged.

### Things not taken, and why

- **"(2)" or an evidence number on a colliding row** - reads as counting
  (DR-20260920-NO-CONCLUSION), and a number that is not a discovery ordinal
  means nothing on this device.
- **Cap Following at one thread** - removes the second thread the design
  promises.
- **Marquee scroll, blinking, peel-a-word on the ellipsis** - the shell has
  no hold gesture, and motion on a 1993 organiser reads as a fault.
- **A free-text diary log instead of rows** - illegibility as a register is
  what the owner rejected on day one.
- **Auto-folding the oldest thread into Put down when a new one opens** -
  putting down is the survivor's act, not the device's.

### A question to keep open

Palm's To Do never labelled an item with the goal; it labelled it with the
next action. A thread row could be the thread's **next place to stand**
("-> 201 N Carl St, the shed") with the question inside, and THREADS becomes a
route - which is what a survivor consults a device for. Not proposed; recorded
so it is not lost.

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
| `Threads.handle` | remedy A: a <=30 character row handle with a sibling-uniqueness check, plus the test over every shipped question (see "measured") |
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

## What was built (2026-09-25)

- §1-4 as written: `Following / Put down / All` in the picker (`Threads.CATEGORIES`),
  one row per thread, tapping opens the thread as a record with `STATE` as its
  field and the findings as entries that open their FILES record and come
  BACK; `Things I have not placed` is one row. No shell change was needed.
- Remedy A, the row handle: `Threads.handle` front-loads a question that would
  not fit when its frame is one whose remainder still reads as a sentence
  ("Why was I ...", "Why did I ...", "Why is there ..."); other questions stay
  as written and truncate. `Threads.handles` leads a still-colliding row with
  the place its first finding was found. The test sweeps every shipped
  question: 73 distinct on the row, the one authored pair that reads alike is
  named so a new collision fails.
- Putting down reads as the survivor's words: `STATE` sentence and a closing
  entry chosen by the thread's key from four sentences, never stored.
- Not built: remedy B (second line) - not needed once A held; remedy C (the
  dot); the `WHAT I WANT TO KNOW` field from the mockup, because the record's
  title already carries the full question and the shell's field label column
  is seven characters wide.
- Departures worth knowing: the closing entry is **unnumbered** - the numbers
  on entries are FILES discovery ordinals, and the survivor's note is not a
  finding. `Following` shows the unplaced things as well as the live threads:
  both are what the survivor is carrying.
