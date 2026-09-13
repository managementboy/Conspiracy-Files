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
[ "$low" = 1 ] || fail "stepping down repeatedly did not stop at 1: $low"
top="$(ev 'return CFHW.step(5)')"; high="$(ev 'return CFHW.size()' | f 2)"
# Against S.MAX, not a number typed here: the owner's SVG now exports four
# sizes and this assertion said three (2026-09-13).
maxs="$(f 3 <<<"$top")"
[ "$high" = "$maxs" ] || fail "stepping up repeatedly did not stop at S.MAX ($maxs): $high"
say "zoom clamps: down->$low up->$high"
# And HELP has to say how, which was the actual complaint.
help="$(ev 'return CFHW.helpText()' | f 2)"
grep -qi 'press - to make' <<<"$help" || fail "HELP does not explain how to resize"
grep -qi 'MENU' <<<"$help" || fail "HELP does not name the buttons"
grep -qiE 'VIEW  the program|ROCKER' <<<"$help" && fail "HELP still describes the old keys"
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

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $errors"
id="$(session)"
"$PZ" stop

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$(date +%Y%m%dT%H%M%S)-hardware.txt"
{
    echo "$verdict hardware - $(date -Is)"
    echo "commit: $(git -C "$REPO" rev-parse --short HEAD)"
    echo "session: $id"
    echo "auto-off:     60s on=$(f 2 <<<"$near")  180s on=$(f 2 <<<"$gone")"
    echo "lamp drain:   2 in-game hours: 1.0 -> $rate"
    echo "dead cell:    notes $notes->$after_notes  to-dos $todos->$after_todos (offline)"
    echo "fresh cell:   notes $after_notes->$back_notes  to-dos $after_todos->$back_todos (restored)"
    echo "ledger:       $ledger -> $after_ledger -> $back_ledger (must never change)"
    echo "boot offline: $boot_off"
    echo "boot restore: $boot"
    for f in "${fails[@]:-}"; do [ -n "$f" ] && echo "FAIL: $f"; done
} > "$out"
say "written: $out"
echo "Linux hardware check $id: $verdict"
cat "$out"
[ "$verdict" = PASS ] && exit 0 || exit 1
