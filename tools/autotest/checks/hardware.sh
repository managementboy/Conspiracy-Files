#!/usr/bin/env bash
# The organiser as 1993 hardware: cells, lamp, auto-off, volatile memory.
#
#   tools/autotest/checks/hardware.sh [--hidden]
#
# PASS needs: the machine switches itself off when left alone and wakes on a
# touch; a low cell says so on every screen; the lamp refuses to run below its
# minimum charge; the lamp drains the cell at the stated rate; a flat cell
# takes the machine's notes and to-dos OFFLINE rather than destroying them,
# says MEMORY OFFLINE while it has no cell, brings everything back on a fresh
# one saying "Restoring from backup", and stops saying it once read; and
# through all of it the discovery ledger - the case - is untouched (P4-R80).
# Owner, 2026-09-13: a dead battery costs access, never data. Exit 0 pass.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "hardware: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }

claim_game || exit 2
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
export CF_EVAL_TIMEOUT=90
wait_true 120 'ConspiracyFiles~=nil and ConspiracyFiles.Organiser~=nil' || abort "the mod never answered"
ev -f "$REPO/tools/autotest/checks/hardware.lua" >/dev/null || abort "could not load the check's Lua"

ev 'return CFHW.setPower(1)' >/dev/null
[ "$(ev 'return CFHW.open()' | f 1)" = true ] || abort "the screen did not open"

# --- auto-off ---------------------------------------------------------------
# Just short of the limit it stays on; past it, it switches itself off.
near="$(ev 'return CFHW.idle(60000)')"
[ "$(f 2 <<<"$near")" = true ] || fail "the machine switched off after only a minute idle: $near"
gone="$(ev 'return CFHW.idle(180000)')"
[ "$(f 2 <<<"$gone")" = false ] || fail "the machine never switched itself off when left alone: $gone"
[ "$(f 3 <<<"$gone")" = false ] || fail "auto-off left the lamp burning: $gone"
say "auto-off: 60s idle on=$(f 2 <<<"$near"), 180s idle on=$(f 2 <<<"$gone")"
ev 'return CFHW.touch()' >/dev/null

# --- waking -----------------------------------------------------------------
# A machine that switched itself off must come back on the first hardware key.
# Before this it ate every key and every tap in silence, which is how the knox
# check found the whole device unresponsive mid-run (2026-09-13).
ev 'return CFHW.setPower(1)' >/dev/null
[ "$(ev 'return CFHW.sleep()' | f 2)" = false ] || fail "could not put the machine to sleep for the wake test"
ev 'return CFHW.leaveLauncher()' >/dev/null
woke="$(ev 'return CFHW.pressKey("MODE")')"
[ "$(f 2 <<<"$woke")" = true ] || fail "a hardware key did not wake a sleeping machine: $woke"
# The waking press must not also navigate: it woke the screen, nothing more.
[ "$(f 3 <<<"$woke")" = "$(f 4 <<<"$woke")" ] || \
    fail "the waking press also acted (launcher $(f 3 <<<"$woke") -> $(f 4 <<<"$woke"))"
# Awake, the same button does act: MODE is MENU, so the launcher opens.
moved="$(ev 'return CFHW.pressKey("MODE")')"
[ "$(f 4 <<<"$moved")" = true ] || fail "MENU did not open the launcher when awake: $moved"
say "wake: asleep -> key -> on=$(f 2 <<<"$woke"), press consumed; MENU works when awake"

# --- size -------------------------------------------------------------------
# The default filled 86% of the screen height on the owner's 4K display, which
# drew a 915x1332 "pocket" organiser (screenshot, 2026-09-13). And nothing
# called S.zoom, so it could not be resized at all.
for h in 1080 1440 1894 2160; do
    fit="$(ev "return CFHW.fitFor($h)")"
    scale="$(f 2 <<<"$fit")"; px="$(f 3 <<<"$fit")"
    say "screen ${h}px -> scale $scale, device ${px}px tall"
    awk -v p="$px" -v h="$h" 'BEGIN{exit !(p <= h*0.62)}' || \
        fail "on a ${h}px screen the device is ${px}px tall - more than 62% of the screen"
done
before="$(ev 'return CFHW.size()' | f 2)"
ev 'return CFHW.step(1)' >/dev/null; up="$(ev 'return CFHW.size()' | f 2)"
ev 'return CFHW.step(-1)' >/dev/null; back="$(ev 'return CFHW.size()' | f 2)"
[ "$back" = "$before" ] || fail "one step up then down did not return to $before (got $back)"
say "zoom: $before -> $up -> $back"
# Stepping past the end must stop, not wrap to the opposite extreme.
ev 'return CFHW.step(-5)' >/dev/null; low="$(ev 'return CFHW.size()' | f 2)"
[ "$low" = 0.5 ] || fail "stepping down repeatedly did not stop at half size (P4-R99): $low"
top="$(ev 'return CFHW.step(5)')"; high="$(ev 'return CFHW.size()' | f 2)"
# Against S.MAX, not a number typed here: the owner's SVG now exports four
# sizes and this assertion said three (2026-09-13).
maxs="$(f 3 <<<"$top")"
[ "$high" = "$maxs" ] || fail "stepping up repeatedly did not stop at S.MAX ($maxs): $high"

# A new game has no saved size (P4-R94); tapping SETUP > Machine then crashed
# on the owner's first try (Windows, 2026-09-14).
fresh="$(ev 'return CFHW.freshMachineTap()')"
[ "$(f 1 <<<"$fresh")" = true ] || fail "SETUP > Machine crashed in a game with no saved size: $fresh"
[ "$(f 3 <<<"$fresh")" = true ] || fail "SETUP > Machine did not open its list in a game with no saved size: $fresh"
[ "$(f 4 <<<"$fresh")" = 2 ] || fail "the Machine list did not mark 1x as the size drawn: $fresh"

# SETUP > Text is a Palm popup list of four sizes (P4-R99); a tap chooses and closes it.
tl="$(ev 'return CFHW.textList()')"
say "text list: sizes=$(f 2 <<<"$tl") line tapped=$(f 3 <<<"$tl") chosen=$(f 4 <<<"$tl") closed=$(f 5 <<<"$tl")"
[ "$(f 2 <<<"$tl")" = 4 ] || fail "there are not four text sizes: $tl"
[ "$(f 3 <<<"$tl")" = true ] || fail "the Text list drew no line to tap: $tl"
[ "$(f 4 <<<"$tl")" = true ] || fail "tapping a line in the Text list did not choose that size: $tl"
[ "$(f 5 <<<"$tl")" = true ] || fail "choosing from the Text list did not close it: $tl"

# Growing drags the corner away from the machine, so the pointer is outside it.
drag="$(ev 'return CFHW.dragOutside()')"
[ "$(f 1 <<<"$drag")" = 1 ] || fail "the drag check did not start at 1x: $drag"
[ "$(f 2 <<<"$drag")" = 2 ] || fail "dragging the corner outward did not make the machine bigger: $drag"
[ "$(f 3 <<<"$drag")" = true ] || fail "releasing the corner outside the machine left it resizing: $drag"
[ "$(f 4 <<<"$drag")" = 2 ] || fail "the size dragged to was not remembered: $drag"

# The launcher's clock shows only while a watch or clock is carried (P4-R85,
# P4-R100): knowing the time costs a watch, and the organiser does not buy it back.
clk="$(ev 'return CFHW.clock()')"
say "clock: without a watch='$(f 2 <<<"$clk")' with a watch='$(f 3 <<<"$clk")'"
[ "$(f 4 <<<"$clk")" = true ] || fail "the clock check could not give the survivor a watch: $clk"
[ "$(f 2 <<<"$clk")" = nil ] || fail "the launcher showed the time with no watch or clock carried: $clk"
grep -qE '^[0-9]{1,2}:[0-9]{2}' <<<"$(f 3 <<<"$clk")" || fail "the launcher showed no time with a watch carried: $clk"
say "zoom clamps: down->$low up->$high"
# The two controls must stay two controls (P4-R89, turned round by P4-R99): the
# machine size changes the window AND how much fits; the text size changes how
# big the type is, and so how much fits, but never the window.
sizes="$(ev 'return CFHW.sizes()')"
if [ "$(f 1 <<<"$sizes")" = true ]; then
    say "two size controls: $(f 2 <<<"$sizes")"
else
    fail "size controls are not independent: $(f 2 <<<"$sizes") [$(f 3 <<<"$sizes")]"
fi
# And HELP has to say how, which was the actual complaint.
help="$(ev 'return CFHW.helpText()' | f 2)"
# Two size controls now (P4-R89), and HELP has to distinguish them: the old
# assertion matched one phrase about one control.
grep -qiE 'press - and =|press - to make' <<<"$help" || fail "HELP does not explain how to resize the machine"
grep -qi 'drag' <<<"$help" || fail "HELP does not mention dragging the corner"
grep -qi 'text size' <<<"$help" || fail "HELP does not explain the text size"
# Named for what is ON THE PLASTIC. These assertions used to require "MENU"
# and FORBID "ROCKER", both of which were true before P4-R87 changed the keys
# and neither of which is true now: the silkscreen reads HOME and BACK and
# there is a rocker between them.
grep -qi 'HOME' <<<"$help" || fail "HELP does not name the HOME key"
grep -qi 'BACK' <<<"$help" || fail "HELP does not name the BACK key"
grep -qi 'rocker' <<<"$help" || fail "HELP does not mention the rocker"
grep -qi 'blank' <<<"$help" || fail "HELP does not say the two middle keys do nothing"
grep -qiE '\bMENU\b' <<<"$help" && fail "HELP still names a MENU key, which the device does not have"
grep -qiE 'VIEW  the program' <<<"$help" && fail "HELP still describes the old keys"
say "help: documents size and the current buttons"

# --- the lamp ---------------------------------------------------------------
# A healthy cell runs it; a dying one refuses and says so.
ev 'return CFHW.setPower(1)' >/dev/null
lit="$(ev 'return CFHW.holdPower()')"
[ "$(f 2 <<<"$lit")" = true ] || fail "a held POWER did not light the lamp on a full cell: $lit"
ev 'return CFHW.holdPower()' >/dev/null   # off again

ev 'return CFHW.setPower(0.05)' >/dev/null
refused="$(ev 'return CFHW.holdPower()')"
[ "$(f 2 <<<"$refused")" = false ] || fail "the lamp lit on a cell below its minimum: $refused"
[ "$(f 3 <<<"$refused")" = true ] || fail "the refusal was silent: $refused"
[ "$(ev 'return CFHW.foot()' | f 2)" = "LAMP NEEDS MORE CHARGE" ] || \
    fail "the refusal did not reach the screen: $(ev 'return CFHW.foot()' | f 2)"
say "lamp: full=lit, 0.05=refused and reported"

# --- low battery ------------------------------------------------------------
ev 'return CFHW.setPower(0.5)' >/dev/null
[ "$(ev 'return CFHW.low()' | f 1)" = false ] || fail "half a cell reported as low"
[ "$(ev 'return CFHW.foot()' | f 2)" = "HINT" ] || fail "a healthy cell overwrote the command line"
ev 'return CFHW.setPower(0.1)' >/dev/null
[ "$(ev 'return CFHW.low()' | f 1)" = true ] || fail "a tenth of a cell not reported as low"
sleep 3   # let the lamp-refused message age out, so this is the low warning
[ "$(ev 'return CFHW.foot()' | f 2)" = "BATTERY LOW" ] || \
    fail "a low cell says nothing on screen: $(ev 'return CFHW.foot()' | f 2)"
say "low battery: 0.5 quiet, 0.1 warns on every screen"

# --- the drain rate ---------------------------------------------------------
ev 'return CFHW.setPower(1)' >/dev/null
drained="$(ev 'return CFHW.lampFor(2)')"
rate="$(f 2 <<<"$drained")"
awk -v p="$rate" 'BEGIN{exit !(p>0.79 && p<0.81)}' || fail "two hours of lamp did not cost a fifth of the cell: $rate"
say "lamp drain: 2 in-game hours took a full cell to $rate"

# --- volatile memory --------------------------------------------------------
seed="$(ev 'return CFHW.seedMemory()')"
notes="$(f 1 <<<"$seed")"; todos="$(f 2 <<<"$seed")"; ledger="$(f 3 <<<"$seed")"
say "before the cell dies: notes=$notes to-dos=$todos ledger=$ledger"
[ "${notes:-0}" -gt 0 ] || abort "could not seed a note"
[ "${todos:-0}" -gt 0 ] || abort "could not seed a to-do"

ev 'return CFHW.setPower(0)' >/dev/null
[ "$(ev 'return CFHW.suspend()' | f 1)" = true ] || fail "a flat cell did not take the machine's memory offline"
after="$(ev 'return CFHW.counts()')"
after_notes="$(f 1 <<<"$after")"; after_todos="$(f 2 <<<"$after")"; after_ledger="$(f 3 <<<"$after")"
say "while the cell is dead: notes=$after_notes to-dos=$after_todos ledger=$after_ledger"
# Offline means unreadable, which is the whole cost.
[ "$after_notes" = 0 ] || fail "notes were still readable on a dead cell: $after_notes"
[ "$after_todos" = 0 ] || fail "to-dos were still readable on a dead cell: $after_todos"
# The line that must never be crossed.
[ "$after_ledger" = "$ledger" ] || fail "THE CASE WAS DAMAGED: ledger $ledger -> $after_ledger (P4-R80)"

# The boot screen while it has no cell.
boot_off="$(ev 'return CFHW.boot()' | f 2)"
grep -q "MEMORY OFFLINE" <<<"$boot_off" || fail "a dead machine did not say its memory was offline: $boot_off"
grep -qE "Memory \.+ [0-9]+K free" <<<"$boot_off" || fail "no memory self-test on the boot screen: $boot_off"

# --- a fresh cell restores everything ---------------------------------------
# Owner, 2026-09-13: we never lose data, only temporary access. Losing it for
# good is the future hard mode and needs the PC sync to exist first.
ev 'return CFHW.setPower(1)' >/dev/null
restored="$(ev 'return CFHW.restore()')"
[ "$(f 1 <<<"$restored")" = true ] || fail "a fresh cell did not restore the memory: $restored"
[ "$(f 2 <<<"$restored")" = false ] || fail "the machine still thinks its memory is offline: $restored"
back="$(ev 'return CFHW.counts()')"
back_notes="$(f 1 <<<"$back")"; back_todos="$(f 2 <<<"$back")"; back_ledger="$(f 3 <<<"$back")"
say "after a fresh cell:    notes=$back_notes to-dos=$back_todos ledger=$back_ledger"
[ "$back_notes" = "$notes" ] || fail "notes did not come back: $notes -> $back_notes"
[ "$back_todos" = "$todos" ] || fail "to-dos did not come back: $todos -> $back_todos"
[ "$back_ledger" = "$ledger" ] || fail "the case changed across the swap: $ledger -> $back_ledger"

# And the boot screen says so, once.
boot="$(ev 'return CFHW.boot()' | f 2)"
grep -q "Restoring from backup" <<<"$boot" || fail "the boot screen did not report the restore: $boot"
say "boot after restore: $boot"
[ "$(ev 'return CFHW.dismissBoot()' | f 2)" = false ] || fail "the restore notice never cleared once read"
boot2="$(ev 'return CFHW.boot()' | f 2)"
grep -q "Restoring from backup" <<<"$boot2" && fail "the restore notice came back after it was read: $boot2"

# --- the research survives a crash -------------------------------------------
# Owner, 2026-09-13: "game crashed. all lost in the files" ... "make sure we
# dont loose the game reseach we are working on".
for r in journal-a journal-b journal-c; do ev "return CFHW.recordDiscovery('$r')" >/dev/null; done
before="$(ev 'return CFHW.ledgerCount()' | f 2)"
jn="$(ev 'return CFHW.journalCount()' | f 2)"
say "recorded: ledger=$before journal=$jn"
[ "${before:-0}" -ge 3 ] || fail "could not record three discoveries: $before"
[ "${jn:-0}" -ge 3 ] || fail "the journal did not receive them: $jn"
refs_before="$(ev 'return CFHW.refs()' | f 2)"

# Destroy the saved copy, which is what an unclean shutdown does to it.
ev 'return CFHW.wipeLedger()' >/dev/null
lost="$(ev 'return CFHW.ledgerCount()' | f 2)"
[ "$lost" = 0 ] || fail "the wipe did not simulate a crash: $lost"
say "after the crash: ledger=$lost"

back="$(ev 'return CFHW.replay()')"
restored="$(f 2 <<<"$back")"; now="$(f 3 <<<"$back")"
say "after replay:    restored=$restored ledger=$now"
[ "${now:-0}" -ge "${before:-1}" ] || fail "the journal did not bring the research back: $before -> $now"
refs_after="$(ev 'return CFHW.refs()' | f 2)"
[ "$refs_after" = "$refs_before" ] || fail "the restored ledger differs: '$refs_before' -> '$refs_after'"

# Replaying twice must not duplicate anything.
ev 'return CFHW.replay()' >/dev/null
again="$(ev 'return CFHW.ledgerCount()' | f 2)"
[ "$again" = "$now" ] || fail "a second replay duplicated entries: $now -> $again"
say "replay is idempotent: $now -> $again"

# --- pulling the cell out ----------------------------------------------------
ev 'return CFHW.fitCell()' >/dev/null
ev 'return CFHW.touch()' >/dev/null
[ "$(ev 'return CFHW.pumpScreen()' | f 2)" = true ] || fail "the screen was not on with a good cell"
[ "$(ev 'return CFHW.removeCell()' | f 2)" = false ] || fail "hasCell still true with no battery fitted"
off="$(ev 'return CFHW.pumpScreen()' | f 2)"
[ "$off" = false ] || fail "the screen stayed lit with the cell removed: on=$off"
say "cell removed: screen on=$off"
ev 'return CFHW.fitCell()' >/dev/null
ev 'return CFHW.touch()' >/dev/null

# --- the address book's categories -------------------------------------------
# Palm put them top-right of the title bar, tapped to cycle (owner chose
# All / Named / Unnamed / Linked, 2026-09-13).
ev 'return CFHW.openNames()' >/dev/null
seen=""
for i in 1 2 3 4 5; do
    c="$(ev 'return CFHW.category()')"
    seen="$seen $(f 2 <<<"$c")($(f 3 <<<"$c"))"
    ev 'return CFHW.cycleCategory()' >/dev/null
done
say "categories:$seen"
grep -q 'All' <<<"$seen" || fail "no All category: $seen"
grep -q 'Named' <<<"$seen" || fail "no Named category: $seen"
grep -q 'Unnamed' <<<"$seen" || fail "no Unnamed category: $seen"
grep -q 'Linked' <<<"$seen" || fail "no Linked category: $seen"
# Five steps through four categories must return to the first.
first="$(awk '{print $1}' <<<"$seen")"; fifth="$(awk '{print $5}' <<<"$seen")"
[ "$first" = "$fifth" ] || fail "the picker did not cycle back round: $first vs $fifth"
# The survivor's own card is a name they know: under Named, never under Unnamed.
ev 'return CFHW.openNames()' >/dev/null
named=""; unnamed=""
for i in 1 2 3 4; do
    c="$(ev 'return CFHW.category()')"
    [ "$(f 2 <<<"$c")" = Named ] && named="$(f 3 <<<"$c")"
    [ "$(f 2 <<<"$c")" = Unnamed ] && unnamed="$(f 3 <<<"$c")"
    ev 'return CFHW.cycleCategory()' >/dev/null
done
say "own card: Named=$named Unnamed=$unnamed"
[ "${named:-0}" -ge 1 ] || fail "the survivor is not in Named: $named"
[ "${unnamed:-0}" = 0 ] || fail "the survivor leaked into Unnamed: $unnamed"

# --- the date book is a calendar ---------------------------------------------
# Owner, 2026-09-13: "this should look like a calendar app, not a list of files
# sorted by date."
d="$(ev 'return CFHW.openDates()')"
[ "$(f 1 <<<"$d")" = true ] || fail "DATES did not open as a calendar: $d"
[ "$(f 2 <<<"$d")" = DATES ] || fail "wrong program: $d"
say "month: $(f 3 <<<"$d") length=$(f 4 <<<"$d") firstWeekday=$(f 5 <<<"$d") today=$(f 6 <<<"$d")"
len="$(f 4 <<<"$d")"; fw="$(f 5 <<<"$d")"
[ "${len:-0}" -ge 28 ] && [ "${len:-0}" -le 31 ] || fail "impossible month length: $len"
[ "${fw:-0}" -ge 1 ] && [ "${fw:-0}" -le 7 ] || fail "impossible first weekday: $fw"
months="$(ev 'return CFHW.everyMonth()')"
[ "$(f 1 <<<"$months")" = true ] || fail "a month failed to draw: $months"
say "months drawn: $(f 2 <<<"$months")"
# A day with nothing on it must say so, not break.
empty="$(ev 'return CFHW.tapDay(28)')"
[ "$(f 1 <<<"$empty")" = true ] || fail "tapping a day failed: $empty"
say "day 28: $(f 2 <<<"$empty") -> $(f 3 <<<"$empty")"

# --- evidence files itself away ----------------------------------------------
# Owner, 2026-09-13: emptying a drawer into your pockets to read it "makes the
# game unplayable". Documents go into the Papers - but only while the organiser
# is closed, because things moving under you while you read is not help.
ev 'return CFHW.plantDoc()' >/dev/null
before="$(ev 'return CFHW.pocketCount()')"
say "planted: loose=$(f 2 <<<"$before") filed=$(f 3 <<<"$before") papers=$(f 4 <<<"$before")"
[ "$(f 4 <<<"$before")" = true ] || abort "no papers carried; cannot test filing"
[ "$(f 2 <<<"$before")" -ge 1 ] || fail "the planted document is not in the pocket"
# Organiser OPEN: nothing may move.
ev 'return CFHW.setScreen(true)' >/dev/null
[ "$(ev 'return CFHW.file()' | f 2)" = 0 ] || fail "documents were filed while the organiser was open"
held="$(ev 'return CFHW.pocketCount()')"
[ "$(f 2 <<<"$held")" = "$(f 2 <<<"$before")" ] || fail "the pocket changed while reading"
say "while reading: nothing moved"
# Organiser CLOSED: it files.
ev 'return CFHW.setScreen(false)' >/dev/null
moved="$(ev 'return CFHW.file()' | f 2)"
after="$(ev 'return CFHW.pocketCount()')"
say "after filing: moved=$moved loose=$(f 2 <<<"$after") filed=$(f 3 <<<"$after")"
# NOT asserted on `moved`: the game's own tick files on its own schedule and
# will often have done the work before this call, reporting 0 with the job
# already done. The counts are the truth (2026-09-13).
[ "$(f 3 <<<"$after")" -ge 1 ] || fail "nothing was filed with the organiser closed"
[ "$(f 2 <<<"$after")" -lt "$(f 2 <<<"$before")" ] || fail "the pocket did not empty: $(f 2 <<<"$before") -> $(f 2 <<<"$after")"
ev 'return CFHW.setScreen(true)' >/dev/null

# --- no plumbing on screen ---------------------------------------------------
me="$(ev 'return CFHW.meCard()')"
[ "$(f 1 <<<"$me")" = true ] || fail "the survivor has no card in NAMES: $me"
card="$(f 2 <<<"$me")"
say "own card: $card"
# A translation key is upper-case words joined by underscores. None may reach
# the screen: getText returns the key itself when it cannot find it, so a wrong
# key looks exactly like this and nothing errors.
grep -qE '[A-Z]{2,}_[A-Za-z_]+' <<<"$card" && \
    fail "a raw translation key reached the survivor's card: $card"
grep -q 'This is me' <<<"$card" || fail "the survivor's card lost its own text: $card"

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $errors"
id="$(session)"
"$PZ" stop

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$(date +%Y%m%dT%H%M%S)-hardware.txt"
{
    echo "$verdict hardware - $(date -Is)"
    echo "commit: $(git -C "$REPO" rev-parse --short HEAD)"
    renderer_line
    echo "session: $id"
    echo "auto-off:     60s on=$(f 2 <<<"$near")  180s on=$(f 2 <<<"$gone")"
    echo "lamp drain:   2 in-game hours: 1.0 -> $rate"
    echo "dead cell:    notes $notes->$after_notes  to-dos $todos->$after_todos (offline)"
    echo "fresh cell:   notes $after_notes->$back_notes  to-dos $after_todos->$back_todos (restored)"
    echo "ledger:       $ledger -> $after_ledger -> $back_ledger (must never change)"
    echo "boot offline: $boot_off"
    echo "boot restore: $boot"
    for f in "${fails[@]:-}"; do [ -n "$f" ] && echo "FAIL: $f"; done
} > "$out.part"; mv "$out.part" "$out"
say "written: $out"
echo "Linux hardware check $id: $verdict"
cat "$out"
[ "$verdict" = PASS ] && exit 0 || exit 1
