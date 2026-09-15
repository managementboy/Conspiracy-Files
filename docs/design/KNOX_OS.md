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

1. **A stylus needs a hand.** *(Replaced by P4-R105, 2026-09-14: the organiser
   reads in either hand; held in the off hand it stays open beside a one-handed
   weapon, and a two-handed weapon puts it away. The original wording follows.)*
   The device is read in the MAIN hand, not the off
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
that is not one long list. A 1993 organiser is that shape. The Address Book
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

## The machine is the reader; the world keeps the record

Owner, 2026-09-12, and this is the decision that makes death bearable:

> our survivor can keep saving his evidence into the evidence photobook we have
> on us and can be reread into the PDA when we find it again (or another one?)
> ... it makes continuity after death and new character very easy: we find the
> pda and we know about all misteries.

Three things follow, and all three are now built:

1. **Any organiser reads the case.** Not just the one issued at spawn. The
   marked one is preferred when both are carried, but a machine out of a desk
   drawer is as good a reader as your own.
2. **Organisers exist in the world.** Rare, in office desks, electronics shops,
   police and medical offices, so finding one is a real event
   (`media/lua/server/ConspiracyFiles_Organisers.lua`).
3. **The record was never in the character.** It lives in the save's world
   data, which is why a new survivor who picks up a machine knows every case
   the last one worked. Your own is usually on your own corpse, exactly where
   you left it.

The evidence album keeps the physical documents and the organiser reads them; losing
either costs convenience, never the case. The organiser is marked favourite so
a new player does not throw it away in their first panic.

## The radio bones stay, on purpose

The organiser is declared as a radio so the game handles its battery, its
on/off state and its saving. The vanilla radio panel is hidden for it, because
a frequency dial on a pocket organiser is silly — but the item type stays.

Owner, 2026-09-12: "it opens the door to having the pda sync with PCs or being
connected to things making many options possible in later versions of our mod."

So this is a standing instruction as much as a note: **do not change the item
away from a radio to tidy it up.** Underneath that plain grey case there is a
receiver, and it makes the following possible without re-founding anything:

- A frequency that carries Dead Air itself, which is the mod's own name.
- A machine that syncs with something else — a desktop in an office, another
  organiser found on a body, a base station — because two radios can already
  hear each other in this game.
- Anything the broadcast system does later: a scheduled transmission, a
  number station, a dead man's message repeating on a loop.

Hiding a panel is reversible. Removing the radio is not.

## The hardware is a Lectromax

Owner, 2026-09-12: "Lectromax is the name of most appliances in the game. our
PDA should be part of that lore."

Lectromax Manufacturing is the game's own appliance maker — its job ads are all
over Knox County and its products are named in the same shape ("Lectromax
Franklin Valuline"). So the machine is a **Lectromax Dataline 160**, the 160
being its screen, and it sits on a shelf beside the game's own microwaves and
radios rather than arriving from nowhere.

Only the software is ours: **Knox.OS**, by Knox Systems. The boot screen says
both, because that is where a machine tells you who made it.

## Not yet: the PC sync, and the hard mode that needs it

A 1993 organiser was half a machine. The other half sat on a desk, and the
cradle between them is what made losing the pocket half survivable: you synced,
and your memos were on both. That is a real thing this mod does not have yet,
and two features are waiting behind it.

**The sync itself.** A desktop machine somewhere in Knox County - an office, a
newsroom, a police station - that the organiser can be docked to. Docking
copies the record both ways. It gives the survivor a reason to go back to a
building they have already looted, and it gives the case a second home that is
not in their pocket.

**Hard mode: a flat cell really does lose your data.** This is exactly what
P4-R86 turned off, and the reason it was turned off is that a battery dying is
not a choice the player made. Once there is a cradle, it becomes one: you did
not sync, and that is on you. The code is already shaped for it -
`Organiser.suspendMemory` moves the stores aside instead of clearing them, so
hard mode is that function clearing them and nothing else changing.

Until the sync exists, a dead battery costs access and nothing more.
