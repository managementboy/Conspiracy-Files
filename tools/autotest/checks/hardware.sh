#!/usr/bin/env bash
# The organiser as 1993 hardware: cells, lamp, auto-off, volatile memory.
#
#   tools/autotest/checks/hardware.sh [--hidden]
#
# PASS needs: the machine switches itself off when left alone and wakes on a
# touch; a low cell says so on every screen; the lamp refuses to run below its
# minimum charge; the lamp drains the cell at the stated rate; a flat cell
# clears the machine's own notes and to-dos, says MEMORY LOST on the next boot
# and stops saying it once read; and through all of it the discovery ledger -
# the case - is untouched (P4-R80). Exit 0 pass, 1 fail, 2 could not run.
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
woke="$(ev 'return CFHW.pressKey("NEXT")')"
[ "$(f 2 <<<"$woke")" = true ] || fail "a hardware key did not wake a sleeping machine: $woke"
# The waking press must not also navigate: it woke the screen, nothing more.
[ "$(f 3 <<<"$woke")" = "$(f 4 <<<"$woke")" ] || \
    fail "the waking press also changed program ($(f 3 <<<"$woke") -> $(f 4 <<<"$woke"))"
# Awake, the same key does navigate.
moved="$(ev 'return CFHW.pressKey("NEXT")')"
[ "$(f 3 <<<"$moved")" != "$(f 4 <<<"$moved")" ] || \
    say "the second press did not change program (it may already have been there)"
say "wake: asleep -> key -> on=$(f 2 <<<"$woke"), press consumed"

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
[ "$(ev 'return CFHW.loseMemory()' | f 1)" = true ] || fail "a flat cell did not clear the machine's memory"
after="$(ev 'return CFHW.counts()')"
after_notes="$(f 1 <<<"$after")"; after_todos="$(f 2 <<<"$after")"; after_ledger="$(f 3 <<<"$after")"
say "after the cell dies:  notes=$after_notes to-dos=$after_todos ledger=$after_ledger"
[ "$after_notes" = 0 ] || fail "notes survived a flat cell: $after_notes"
[ "$after_todos" = 0 ] || fail "to-dos survived a flat cell: $after_todos"
# The line that must never be crossed.
[ "$after_ledger" = "$ledger" ] || fail "THE CASE WAS DAMAGED: ledger $ledger -> $after_ledger (P4-R80)"

# The next boot says so, and stops saying so once read.
boot="$(ev 'return CFHW.boot()' | f 2)"
grep -q "MEMORY LOST" <<<"$boot" || fail "the boot screen did not report the loss: $boot"
grep -qE "Memory \.+ [0-9]+K free" <<<"$boot" || fail "no memory self-test on the boot screen: $boot"
say "boot after loss: $boot"
ev 'return CFHW.setPower(1)' >/dev/null
[ "$(ev 'return CFHW.dismissBoot()' | f 2)" = false ] || fail "the loss notice never cleared once read"
boot2="$(ev 'return CFHW.boot()' | f 2)"
grep -q "MEMORY LOST" <<<"$boot2" && fail "the loss notice came back after it was read: $boot2"

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
    echo "volatile:     notes $notes->$after_notes  to-dos $todos->$after_todos"
    echo "ledger:       $ledger -> $after_ledger (must not change)"
    echo "boot notice:  $boot"
    for f in "${fails[@]:-}"; do [ -n "$f" ] && echo "FAIL: $f"; done
} > "$out"
say "written: $out"
echo "Linux hardware check $id: $verdict"
cat "$out"
[ "$verdict" = PASS ] && exit 0 || exit 1
