# Notebook UI and interaction polish — proposals, 2026-09-07

From observing live play today, not from theory. Ranked by value per unit of
risk. Nothing here changes what is recorded, only how it reads and behaves.

## 1. Drop the "Inspected " prefix from journal titles — do first

`Window` builds journal titles as `"Inspected "..r.title`. Every single row
carries it, so it distinguishes nothing, and it costs ten characters in a list
column that is only 35% of the window. It is the direct cause of the truncation
in the owner's screenshots: `#1 Inspected Dispatch copy / ...`.

The summary line beneath already says `Inspected`, twice over in the evidence
view (`Dispatch document - Inspected - Discovery 1`).

Removing the prefix recovers roughly a third of the visible title. One line,
no behaviour change, immediately more readable.

## 2. Tooltips carrying the full row text

Truncation is unavoidable in a narrow column; losing the information is not.
`ISButton` supports `self.tooltip`, and `ISComboBox` sets `item.tooltip` on
list items, so the pattern exists - confirm `ISScrollingListBox` honours it
before relying on it.

Show the untruncated title and summary. Cheap, and it makes the narrow column
acceptable rather than merely tolerable.

## 3. A real affordance for the selected section

The active section is currently shown by wrapping its label in brackets:
`[Journal]` versus `Evidence`. That is easy to miss at a glance.

`ISButton:setBorderRGBA` and `setTextureRGBA` are vanilla. Give the active
section a distinct border or background so the current view is obvious without
reading.

## 4. Mark entries added since the notebook was last opened

The journal reached nine entries in a single short session and will hold far
more across several cases. Nothing distinguishes what is new.

The discovery ledger already assigns every entry a stable, increasing sequence
number. Store the highest sequence seen when the notebook closes, and mark
rows above it. That is a few lines, needs no new state beyond one number, and
uses ordering machinery that already exists.

## 5. Trim the summary line

`Receiving receipt - Inspected - Discovery 4` states three things, one of which
is redundant with the title and one with the entry number. `Receiving receipt -
Discovery 4` says as much in less space, which matters in a narrow column.

## 6. A filter box

Ten entries is already a scroll. A campaign of several cases will be far worse.
A plain substring filter over title and summary would keep the list usable, and
must filter the *view* only - never the ledger, and never renumber anything.

## 7. Show which case an entry belongs to

With several cases running, entries interleave chronologically, which is
correct and deliberate. But nothing says which investigation a row belongs to.

A short case marker in the summary would orient the reader. It must not group
or reorder: chronological order across sources is the feature that was built
and verified today.

## 8. Help the player discover the Inspect action

Reading evidence requires a right-click context action, which a new player has
no reason to guess. Proximity hints cover *finding* a clue but say nothing
about what to do once it is in hand.

A one-off line in the survivor's voice the first time an uninspected evidence
item enters the inventory would close the gap, reusing the PlayerVoice channel
that already exists and is proven visible.

## Deliberately not proposed

- Reordering, grouping or renumbering the journal. Chronological order across
  evidence, identities and connections is the thing this whole session existed
  to build.
- Anything that hides an entry by default. The notebook is a record; a filter
  is a lens, not a redaction.
