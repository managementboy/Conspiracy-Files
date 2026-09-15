# Twenty premises

Drafted 2026-09-09. **The owner kept all twenty**, and they are now the
generator's premise pool: `mod/common/media/lua/shared/ConspiracyFiles/Generated/Premises.lua`.

The prose they generate ships without a separate approval step (P4-R97,
2026-09-14); the owner reviews it in play.

Each premise supplies three organisations and three anchor documents (claim,
response, review - the last of which it may mark optional) in the shape the generator already used. It does **not**
supply the case reference: the links between documents already carry the
connection and the notebook sorts on them, so a reference that encoded the
premise would only announce which story the player had drawn before they had
read a word of it.
The premise is the seed's **first** draw, so it is the most significant thing a
seed decides: what the case is about, before who is in it or how it resolves.
Every premise reads two ways - the records agree, or they do not - and each of
the twenty is reachable and readable both ways, which the test suite checks.

## The shape is not fixed

Owner, 2026-09-10: *"are we still building the mysteries with a set amount of
clues?"*

The count always varied - three to seven documents, evenly. The **skeleton**
did not: every case was a claim, a response, and a review of the pair.

Thirteen of the twenty premises now mark their review optional, because their
claim and response already hold the whole disagreement. Those cases may end on
the contradiction itself, which reads differently - it stops where the
paperwork stops, with nobody having reacted at all. Measured across 600 cases:
191 ended on the contradiction, 409 kept a review, and the smallest case is now
two documents.

The other seven keep their review always, because the point of those cases *is*
what the office did next - the unsigned explanation, the recovered copies, the
initials written out in full and then crossed through.

## What makes one of these work

Every premise below has **two honest readings** - one dull, one not - and the
mod must never pick between them. That is the whole product. A premise that can
only be read one way is a plot, and a plot in a survival sandbox is somebody
else's mod.

Each also has to survive being **paperwork found in a drawer**. No scene can be
witnessed; everything reaches the player as an object in a container, which
means the interesting thing must be something a person would write down and
someone else would keep.

They use names the game supplies - McCoy Logging, MassGenFac, Fossoil, Gas2Go,
Spiffo's, Jay's, Seahorse, the Rosewood prison, the base in the southwest woods
- because a real employer is worth more than an invented one.

Structure per case stays claim / response / review. What changes is what is
being claimed.

## Dates: a calendar per case

Owner decision P4-R108, 2026-09-15. Every case used to be dated July 2-6
1993, so every paper sat inside the relay memo's week (30 June - 8 July) and
its DATE NOTE was true of everything. Now each case draws a calendar from its
seed alone (`Generator.calendar`, never the world clock, so a case still
rebuilds byte for byte):

- the claim falls between 1 May and 28 June 1993;
- the response follows it by one to nine days, the review follows the
  response by one to nine days, and nothing is dated after 8 July (the
  outbreak begins after);
- two cases in five put the response and review inside the memo's week, the
  rest end by 29 June. Measured over 400 seeds: 160 calendars reach the week,
  134 cases (34%) carry a dated paper inside it, 266 carry none.

Premise text never splices a day into a month. The placeholders are whole
phrases: `{DATE1}` claim, `{DATE2}` response, `{DATE3}` review ("June 14,
1993"), `{DATE0}` the day before the claim, `{DATE1CAPS}`/`{DATE2CAPS}` in
capitals, `{DAYS12}` the claim-to-response gap ("four days"), `{PRIORMONTH}`
the month before the claim's, `{SINCE11}` eleven months before it. A relative
phrase - "the day before", "for four days", "four months" - is rendered from
the same numbers as the dates it relates, or declared in the premise's
`asserts` so the test can check it. A paper that says "the day before" is only
ever printed where that is true.

## Both branches, both meanings

Owner decision P4-R107, 2026-09-15: fix every story defect and test for them.
The audit found a dozen responses whose only WHAT IT MIGHT MEAN said "one of
them is wrong" or "backdated" beside a line saying the records matched. So:

- **every response carries `meaningAgree`**, read where the case corroborates;
  `meaning` is read where it disputes. Premises.lua refuses to load without it.
  A review carries one wherever its meaning only fits one branch. Both keep
  two honest readings.
- `found` text is read in both branches, so it describes the paper, never
  which way the paper goes (no "same smudge" on a list that may differ).
- A premise whose disputing response is dated before its claim (the
  resignation, the payment) says so with `asserts.precedes`, and the order
  each line states is true by construction.

## Before a premise is added

`test/premise_consistency.lua` must pass. It renders every premise both ways
on three hundred calendars plus the edge cases, and generates cases until
every premise x outline x review present/absent has occurred, and fails on:
dates out of order or outside 30 April - 8 July 1993; a "N days", "the day
before" or "N months" phrase that does not match its asserted dates; "for
weeks" or "each week" in a case that lasts days; a meaning with a
disagreement marker where the records agree, or an agreement marker where
they do not; two papers in a case with one title; one person placed at both
sites on the same date; a placeholder left in the text; and a relay-memo week
rate outside 15-55%.

---

## People who stopped being where they should be

**1. The transfer that nobody arranged.**
A shift supervisor is moved to another site mid-week. The receiving site has no
record of asking for anyone, and their copy of the roster has his name written
in a different hand.
*Dull:* a clerk fixed a rota by phone and filed it badly.

**2. Signed for by someone who was not there.**
A delivery signed by a named employee on a day another record places them two
towns away at a funeral.
*Dull:* a colleague signed on their behalf, as colleagues do.

**3. The employee with two start dates.**
Payroll has him starting in March. His own union card says November. The
difference is eight months of somewhere else.
*Dull:* a rehire after a gap, recorded carelessly.

**4. The last week of a job.**
A resignation letter dated after the final payslip, in handwriting that does
not match the signature on file.
*Dull:* she wrote it late and someone chased her for it.

---

## Places that do not agree about themselves

**5. The address that receives but never sends.**
A house on a quiet street takes delivery of equipment for eleven months and
never returns a single item. Its own utility record shows nobody living there.
*Dull:* a landlord using an empty rental for storage.

**6. Two buildings, one inventory.**
A stock list for a warehouse matches, item for item, a list from a building
four miles away - down to a damaged crate number.
*Dull:* a template copied and never updated.

**7. The room that is not on the plan.**
A maintenance callout gives a room number the building's own floor plan does
not contain. The work was signed off.
*Dull:* an old numbering scheme nobody redrew.

**8. The lease that outlived the tenant.**
Rent paid quarterly on a unit whose keys were returned two years ago, by a
company whose letterhead changed name twice in between.
*Dull:* a standing order nobody cancelled.

---

## Things that moved strangely

**9. The load that got lighter.**
A haulage manifest out of McCoy Logging lists a weight on departure and a
lower one on arrival, with no unloading stop between.
*Dull:* two scales, calibrated differently.

**10. Fuel for a vehicle that was off the road.**
Fossoil account statements show a truck fuelled weekly through a month its own
maintenance log has it stripped for parts.
*Dull:* the card was used for another vehicle.

**11. The equipment that came back cleaner.**
A hire return note remarks the items were returned in better condition than
they went out, initialled twice.
*Dull:* somebody was being kind about wear.

**12. Two crates, one number.**
Consecutive receipts at MassGenFac carry the same crate reference eight days
apart, both signed, neither cancelled.
*Dull:* a reused number on a reprinted book.

---

## Dates that will not line up

**13. Paid before it was ordered.**
A payment raised the day before the requisition it settles, authorised by
someone who signed nothing else that month.
*Dull:* a backdated invoice, which happens everywhere.

**14. The overtime nobody worked.**
A timesheet showing a night shift at a site the gate log has locked and empty.
*Dull:* a supervisor being generous with hours.

**15. A closure announced twice.**
A local notice says a facility closed in May. An internal memo refers to it
operating in July, in the present tense.
*Dull:* a template letter reused without editing.

**16. The medical appointment that came first.**
A clinic follow-up note dated before the appointment it follows up, for a
patient whose file has no first visit.
*Dull:* two clerks, one calendar, a slip of the pen.

---

## Absences

**17. The file that was signed out and never returned.**
A records log at the Rosewood courthouse shows a folder taken by initials that
appear nowhere else in the book.
*Dull:* somebody borrowed a file and left.

**18. The page that is missing.**
A bound duty ledger with one page cut out close to the spine, either side
referring to something on it.
*Dull:* a spoiled page removed and rewritten.

**19. The photograph with no caption.**
A workplace photo where every face is named on the back except one, and the
count of names is one short of the count of people.
*Dull:* nobody knew the temp's surname.

**20. The number that was withdrawn.**
A phone extension listed in one directory and blank in the next, for a
department that appears in neither.
*Dull:* a reorganisation, badly documented.

---

## Notes on the set

The strongest are the ones a player can **check** - where a second
document could confirm or contradict, and the game world contains the place
involved. 2, 5, 9, 10, 13 and 14 all have that quality.

The weakest are those that resolve into a single fact with nothing to compare
it against: 11 and 19 are atmosphere more than investigation. They are in the
pool because the owner kept the set whole; if play shows they land flat, they
are two entries to remove from one table, not a rewrite.

None of them mentions the outbreak, the military, or anything scientific. That
is deliberate. A player who finds three pieces of ordinary 1993 paperwork that
do not agree, in a county where something is plainly wrong, will draw a line
between them without help - and a line they drew themselves is worth more than
one the mod asserted.
