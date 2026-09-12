# What the notebook is meant to look like

Owner intent, recorded 2026-09-09. Not a work item - UI is not the current
focus - but written down so the next person to touch it starts from the idea
rather than guessing.

## The buttons on the right are tabs

Journal, Evidence, Help, Contrast and Close are meant to read as the **index
tabs of a real notebook** - the card dividers that stick out of the edge so you
can thumb straight to a section. They are not a toolbar.

That single fact changes how they should look:

- a tab is part of the book, not a control floating beside it;
- the selected tab reads as the page you are on, not as a pressed button;
- they belong to the object, so they should share its paper, not the game's
  interface chrome.

## What this rules out

An earlier attempt (DEV-0.8.19, reverted) restyled the page as a dark
monospace case file with amber headings, taken from a reference the owner
shared. It was the wrong reading: the reference showed a *quality* of design,
not a request for that specific look. The notebook is a physical object a
survivor carries, and it should read as one.

## Current state

`DEV-0.8.26` made the selected tab visible, which it previously was not: the
highlight existed, was applied correctly, and was indistinguishable on screen.
The owner could not tell from his own screenshot which tab he was on. That is
fixed as a usability matter, not as styling - it does not attempt the tab look
described above.

## If this is picked up

Do not start from a mockup. Start from the object: a notebook a person carries,
with dividers you can see the edges of. Check every change against a screenshot
at the size a player actually sees, because the last two attempts both looked
correct in the code and wrong or invisible on screen.
