# Knox.OS

Owner, 2026-09-12, reversing his own ruling of three hours earlier:

> yes, lets revert my first decision back when I was 3 hours younger: we now
> have a stylus and can click on the screen. it requires the device to be held
> in the main hand (making it also dangerous to read, and therefore part of the
> PZ philosophy) ... it means each file is a real file in our knox.os (the name
> of our fake operating system)

The organiser stops being a reader and becomes a **machine with programs on
it**. This is the design for that. It is not built yet beyond the framework
slice named at the end.

## The two rules that make it a game, not a menu

1. **A stylus needs a hand.** The device is read in the MAIN hand, not the off
   hand. You cannot hold a shotgun and your notes at once. Opening it puts it
   in your hand through the game's own equip action, and being attacked while
   reading costs you what being attacked while holding a book costs you.
2. **The glass is now live.** Tapping is how Knox.OS is driven, exactly as a
   Palm was driven. The hardware keys stay, because a rocker beats a stylus
   when something is coming: page with the keys, aim with the stylus.

Everything below follows from those two.

## The canvas

160 x 160 native pixels, scaled up by whole numbers. That is the whole
computer. Every program lives inside it, and the guidelines that shipped with
the real device apply as written: go to the edge, one or two pixel margins, the
frequent command is a button and not a menu, scroll arrows in the right margin.

**A widget kit, small on purpose.** Knox.OS needs exactly these, and nothing
more until a program needs one:

| Widget | Shape (Palm's own rules) | Used by |
|---|---|---|
| Title bar | dark band, view name left, count or category right | every program |
| Command button | label centred in a **rounded** rectangle | Done, New, Delete |
| Push button | label in a **square** rectangle, selected state inverted | filters, tabs |
| Selector trigger | label in a grey frame that resizes to its text | the category picker |
| List row | full width, inverted when selected | every program |
| Scroll arrows | right margin, only when there is more | every program |
| Checkbox | a small square, ticked | to-dos |

Every widget is a rectangle with a hit box and a label. The toolkit is one
file: a list of widgets, a hit test, and a draw. No layout engine.

## The programs

Each is a view over data the mod ALREADY keeps. None of them invent knowledge,
and none of them state what the player has not earned. That rule does not
change because the screen got smarter.

- **Files** — the evidence, as now. Every document is a file with a record
  number. This is the program the device opens into.
- **Address Book** — every identity the player has seen: names off IDs,
  wallets, business cards, with where each was found and which key, if any,
  opened which door. The data is already in `IdentityObservations`,
  `PersonNameObservations` and `ObservedKeyLeads`; this is their proper home,
  and it is far better than a journal page.
- **Date Book** — the calendar. Every discovery already carries the world hour
  it was made at (`DiscoveryLedger`), so a day view can show what was found on
  July 3, and a month view can show which days were busy. A survivor building
  a timeline out of their own movements is the whole fiction in one screen.
- **To Do** — leads the player writes for themselves: a door that needs a key,
  an address to go back to. Ticked off by hand. This is the one program that
  takes input, and it is the reason the stylus matters.
- **Memo** — the survivor's own notes, unfiled.

**The launcher.** Palm's Applications button; here, the VIEW key. It shows the
programs as a list with their record counts. Knox.OS boots into Files.

## Why the data suits it

The mod has spent months building exactly what a PIM needs: records with dates,
names, places and cross-references. What has been missing is a shape for them
that is not one long notebook. A 1993 organiser is that shape. The Address Book
and the Date Book are not new features so much as the right windows onto
observations the player has already earned.

## Order of work

1. **The hand.** Reading requires the main hand, through the game's own equip
   action, with the danger that implies. (First slice.)
2. **The stylus.** Taps on the glass: list rows, scroll arrows, the title bar's
   selector. The keys keep working. (First slice.)
3. **The widget kit**, as the table above, in one file with a hit test.
4. **The launcher**, and Files re-drawn as a Knox.OS program rather than the
   only screen.
5. **Address Book**, because its data exists and its absence is felt most.
6. **Date Book**, day view first; the month grid only if the day view lands.
7. **To Do**, with the first real text input on the device.

## The risks, stated once

- **Scope.** This is a second mod inside the mod. Each program is small only
  because the data is already there; the moment one needs new data, it stops
  being small.
- **Input.** Text entry on a 160 x 160 screen with the game's UI toolkit is the
  hardest thing on this list. To Do may have to borrow the game's own text box
  rather than draw one, and that will look wrong. Decide before building it.
- **The hand.** A device that occupies your weapon hand will annoy a player who
  only wants to check a name. That annoyance is the point, but it must be
  possible to close fast: one key, always, no confirmation.
- **The old window.** Once Knox.OS has the programs, the desk window is a
  second reading surface with different words, and P4-R79 says there is one.
  It should become a developer tool or go.
