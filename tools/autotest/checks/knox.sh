#!/usr/bin/env bash
# Knox.OS: the organiser's operating system, driven the way a player drives it.
#
#   tools/autotest/checks/knox.sh [--hidden]
#
# PASS needs: the device opens into FILES with the case's records; the launcher
# shows the programs as an icon grid; a stylus tap opens NAMES and it holds the
# identity looted from a body; DATES groups discoveries by the day they were
# made; a record opens in the survivor's own voice with no second person on it
# (DR-20260925-RECORD-VOICE); THREADS groups the findings by the thread they
# belong to, counts nothing, and a thread can be put down and picked back up
# (DR-20260925-THREADS); REMIND writes a to-do and TO DO shows it; and no
# errors inside the mod. Screenshots of each screen land in dev/eval/linux/runs.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "knox: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
shot() { "$PZ" shot "$RUNS/$(session)-knox-$1.png" >/dev/null 2>&1; }

claim_game || exit 2
start_world "${start_args[@]}" || abort "the game did not reach a playable world"
# A fresh world spends its first half-minute indexing addresses, and a driver
# sent into that gets no slot before the eval channel gives up. Wait for the
# mod to answer, then allow a long load and retry it (knox check, 2026-09-12).
export CF_EVAL_TIMEOUT=90
wait_true 120 'ConspiracyFiles~=nil and ConspiracyFiles.GeneratedRuntime~=nil' || abort "the mod never answered"
for f in core_loop organiser wallet_id; do
    loaded=no
    for _ in 1 2 3; do
        ev -f "$REPO/tools/autotest/checks/$f.lua" >/dev/null && { loaded=yes; break; }
        sleep 5
    done
    [ "$loaded" = yes ] || abort "could not load $f.lua"
done
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"

# A case, found the way a player finds it: one document is enough for FILES.
# How long to allow for the case to place its documents. A fresh world indexes
# addresses first, and on a loaded machine that stretches: observed 43s to
# reach a playable world when the box was idle and 150s+ with a game and a
# desktop already on it, with placement stretching by the same factor. 200s
# was tight enough to abort this check on nothing but load (2026-09-13).
deadline=$(( $(date +%s) + ${CF_PLACE_TIMEOUT:-450} ))
while :; do
    s="$(ev 'return CFLoop.summary()')"; n="$(cut -f1 <<<"$s")"
    [ "${n:-0}" -gt 0 ] && ! grep -qE ":(pending|placing)" <<<"$s" && break
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never placed: $s"
    sleep 3
done
settle_doc 1 >/dev/null || say "document 1 $(settle_doc 1 1)"
ev 'return CFLoop.approach(1)' >/dev/null; wait_true 10 'CFLoop.loaded(1)' >/dev/null
ev 'return CFLoop.find(1)' >/dev/null
ev 'return CFLoop.goTo(1)' >/dev/null
for _ in $(seq 12); do [ "$(ev 'return CFLoop.openContainer()' | cut -f1)" = true ] && break; sleep 0.5; done
ev 'return CFLoop.take()' >/dev/null
wait_true 20 'CFLoop.carried()' || say "the document never reached the inventory"
why="$(note_carried)" || say "the document could not be noted: $why"

# A body with an ID in its wallet, so NAMES has a real person in it. The game
# decides what a corpse carries, so keep rolling bodies until one has a wallet
# rather than assuming the first four do.
wallet=no
for _ in 1 2 3; do
    ev 'return CFWallet.spawnBodies(4)' >/dev/null; sleep 3
    ev 'return CFWallet.openBodies()' >/dev/null; sleep 5
    ev 'return CFWallet.takeWallet()' >/dev/null; sleep 3
    if wait_true 10 'CFWallet.walletCarried()'; then wallet=yes; break; fi
done
if [ "$wallet" = yes ]; then
    ev 'return CFWallet.holdWallet()' >/dev/null; sleep 2
    ev 'return CFWallet.openWallet()' >/dev/null; sleep 4
else
    say "no corpse carried a wallet; NAMES is checked against whatever else was seen"
fi

ev 'return CFOrg.openScreen()' >/dev/null
wait_true 30 'ConspiracyFiles.OrganiserScreen.window~=nil' || abort "the device never opened"
sleep 1
# The machine boots with the game; step past that before driving it.
# Waking first, before every group below: the device switches itself off after
# three idle minutes and this harness is far slower than a player, so a check
# that did not wake would be testing auto-off by accident (2026-09-13).
ev 'return CFOrg.wake()' >/dev/null
ev 'return CFOrg.tapWidget("START")' >/dev/null; sleep 1
state="$(ev 'return CFOrg.knox()')"
say "opened: $state"
# The machine comes up on its Applications screen now, not inside a program
# (owner, 2026-09-13): the icons are the only thing that says what the
# programs are, so landing anywhere else hides them from a new player.
[ "$(cut -f4 <<<"$state")" = true ] || fail "Knox.OS did not open onto the launcher: $state"
shot launcher-first
ev 'return CFOrg.openProgram("FILES")' >/dev/null; sleep 1
state="$(ev 'return CFOrg.knox()')"
[ "$(cut -f2 <<<"$state")" = FILES ] || fail "tapping the FILES icon did not open it: $state"
[ "$(cut -f3 <<<"$state")" -gt 0 ] 2>/dev/null || fail "FILES is empty"
shot files

# Back to the launcher: a tap on the title bar (Palm's Home), or the MENU key.
ev 'return CFOrg.wake()' >/dev/null
ev 'return CFOrg.tapWidget("SELECT")' >/dev/null; sleep 1
[ "$(ev 'return CFOrg.knox()' | cut -f4)" = true ] || fail "a tap on the title bar did not open the launcher"
shot launcher
say "programs: $(ev 'return CFOrg.programs()' | cut -f2)"

ev 'return CFOrg.wake()' >/dev/null
ev 'return CFOrg.openProgram("NAMES")' >/dev/null; sleep 1
names="$(ev 'return CFOrg.knox()')"
[ "$(cut -f2 <<<"$names")" = NAMES ] || fail "a tap on the NAMES icon did not open it: $names"
# Only a promise we actually set up: if no corpse carried a wallet, the address
# book having nothing in it is the truth, not a fault.
# Whatever else happens, the survivor is in their own address book.
[ "$(cut -f3 <<<"$names")" -gt 0 ] 2>/dev/null || fail "the address book does not even hold the survivor"
if [ "$wallet" = yes ]; then
    [ "$(cut -f3 <<<"$names")" -gt 1 ] 2>/dev/null || fail "a looted ID did not reach the address book"
else
    say "no ID was looted this run; the address book's contents are not asserted"
fi
shot names

ev 'return CFOrg.wake()' >/dev/null
ev 'return CFOrg.tapWidget("SELECT")' >/dev/null; sleep 1
ev 'return CFOrg.openProgram("DATES")' >/dev/null; sleep 1
dates="$(ev 'return CFOrg.knox()')"
[ "$(cut -f2 <<<"$dates")" = DATES ] || fail "a tap on the DATES icon did not open it: $dates"
[ "$(cut -f3 <<<"$dates")" -gt 0 ] 2>/dev/null || fail "the date book has no days in it"
shot dates

# The keys read HOME and BACK with the rocker between them (P4-R87). HOME - the
# MODE key, still the MENU action inside OrganiserScreen - goes to the
# Applications screen from anywhere.
ev 'return CFOrg.wake()' >/dev/null
ev 'return CFOrg.openProgram("FILES")' >/dev/null; sleep 1
ev 'return CFOrg.pressButton("MODE")' >/dev/null; sleep 1
menu_key="$(ev 'return CFOrg.knox()')"
[ "$(cut -f4 <<<"$menu_key")" = true ] || fail "the HOME key did not open the launcher: $menu_key"
# BACK stops at the launcher rather than falling off the top.
ev 'return CFOrg.pressButton("INDEX")' >/dev/null; sleep 1
[ "$(ev 'return CFOrg.knox()' | cut -f4)" = true ] || fail "BACK went somewhere past the launcher"
ev 'return CFOrg.openProgram("FILES")' >/dev/null; sleep 1
ev 'return CFOrg.wake()' >/dev/null
ev 'return CFOrg.tapWidget("ROW",1)' >/dev/null; sleep 1
[ "$(ev 'return CFOrg.knox()' | cut -f5)" = true ] || fail "a tap on a record did not open it"
shot record
# THE RECORD IS THE SURVIVOR WRITING (DR-20260925-RECORD-VOICE). The owner read
# "WHAT YOU FOUND" off this very screen on 2026-09-25. The offline suite holds
# the heading set, but only the game proves the heading the projection wrote is
# the heading the device draws, so this reads the open record's own text back.
record_text="$(ev 'return CFOrg.recordText()')"
record_detail="$(cut -f3 <<<"$record_text")"
say "record: $(cut -f2 <<<"$record_text")"
case "$record_detail" in
    *"WHAT YOU FOUND"*|*"WHAT IT MIGHT MEAN"*|*"MAP NOTE"*|*"DATE NOTE"*)
        fail "the record still speaks as a narrator: $record_detail" ;;
esac
if grep -qiE '\<(you|your)\>' <<<"$record_detail"; then
    fail "the record addresses the player: $record_detail"
fi
if grep -qE '(WHAT I THINK I FOUND|WHAT I THINK IT MEANS|WHAT I NOTICE ABOUT THE DATE|WHAT I MARKED ON MY MAP)' <<<"$record_detail"; then
    say "headings: the survivor's own"
else
    say "headings: this record carries none of ours (an object's record runs on in plain sentences)"
fi
# Scrolling, which nothing has ever proved: page down with the rocker, then
# with the arrow in the right margin, and see the card number move.
before_card="$(ev 'return CFOrg.card and CFOrg.card() or "?"')"
ev 'return CFOrg.pressButton("NEXT")' >/dev/null; sleep 1
after_key="$(ev 'return CFOrg.card and CFOrg.card() or "?"')"
ev 'return CFOrg.tapWidget("DOWN")' >/dev/null; sleep 1
after_tap="$(ev 'return CFOrg.card and CFOrg.card() or "?"')"
say "cards: $before_card -> $after_key (rocker) -> $after_tap (arrow)"
ev 'return CFOrg.wake()' >/dev/null
ev 'return CFOrg.tapWidget("REMIND")' >/dev/null; sleep 1
ev 'return CFOrg.wake()' >/dev/null
# Back to the launcher FIRST. openProgram taps an icon in the launcher's hit
# list, so it can only work while the launcher is on screen - every other call
# site in this file taps the title bar before it, and this one did not.
#
# It used to be pressButton("INDEX"), when INDEX was LIST and opened the
# selected record. 822cfd0 made INDEX into BACK after the owner's play session
# and rewrote this step as openProgram, without adding the launcher tap the
# other sites have. REMIND clears you back to the FILES LIST, not the
# launcher, so the call has been unable to succeed since. It went unnoticed
# because software rendering was failing this check wholesale at the time: on
# 2026-09-12 every assertion in it failed, and a real narrow bug sat behind
# the broad flake until the renderer was fixed (2026-09-13).
# THREADS (DR-20260925-THREADS, redesign note 2026-09-25): one row per thread
# under a category picker (Following / Put down / All); tapping a row opens
# the thread as a record whose entries are its findings, each opening its
# FILES record and coming BACK. Owner, on the first screen: "that is a bad UI
# design. Even the palmpilot had better." - so what is held here is the shape
# as much as the words.
ev 'return CFOrg.wake()' >/dev/null
ev 'return CFOrg.tapWidget("SELECT")' >/dev/null; sleep 1
[ "$(ev 'return CFOrg.knox()' | cut -f4)" = true ] || fail "could not get back to the launcher for THREADS"
ev 'return CFOrg.openProgram("THREADS")' >/dev/null; sleep 1
threads="$(ev 'return CFOrg.knox()')"
[ "$(cut -f2 <<<"$threads")" = THREADS ] || fail "a tap on the THREADS icon did not open it: $threads"
[ "$(cut -f3 <<<"$threads")" -gt 0 ] 2>/dev/null || fail "THREADS is empty with a case in play: $threads"
thread_rows="$(ev 'return CFOrg.rows()' | cut -f2)"
category="$(ev 'return CFOrg.category()' | cut -f2)"
say "threads ($category): $thread_rows"
shot threads
[ "$category" = Following ] || fail "THREADS does not open on Following: $category"
# It groups; it does not score (DR-20260920-NO-CONCLUSION), it speaks as the
# survivor, and no two rows read the same - the fault that started the redesign.
if grep -qiE '\<(case|cases|investigation|solved|closed|complete|finished)\>' <<<"$thread_rows"; then
    fail "THREADS speaks as an investigator: $thread_rows"
fi
grep -qE 'STILL FOLLOWING|ON THEIR OWN|^- | \| - ' <<<"$thread_rows" && fail "THREADS still prints sections or dashed headings into the list: $thread_rows"
prev=""
while IFS= read -r r; do
    [ -n "$prev" ] && [ "$r" = "$prev" ] && fail "two THREADS rows read the same: $r"
    grep -qE '[0-9]' <<<"$r" && ! grep -qE '^[0-9]+\. ' <<<"$r" && grep -qE ' [0-9]+ (of|open|left)' <<<"$r" && fail "a THREADS row counts something: $r"
    prev="$r"
done < <(tr '|' '\n' <<<"$thread_rows" | sed 's/^ *//; s/ *$//')
# The picker cycles Following -> Put down -> All and back.
ev 'return CFOrg.wake()' >/dev/null
ev 'return CFOrg.tapWidget("CATEGORY")' >/dev/null; sleep 1
[ "$(ev 'return CFOrg.category()' | cut -f2)" = "Put down" ] || fail "the picker did not move to Put down: $(ev 'return CFOrg.category()' | cut -f2)"
ev 'return CFOrg.tapWidget("CATEGORY")' >/dev/null; sleep 1
[ "$(ev 'return CFOrg.category()' | cut -f2)" = All ] || fail "the picker did not move to All"
ev 'return CFOrg.tapWidget("CATEGORY")' >/dev/null; sleep 1
[ "$(ev 'return CFOrg.category()' | cut -f2)" = Following ] || fail "the picker did not come back to Following"
# Open a thread: a record with the state as a field and the findings as entries.
before_down="$(ev 'return CFOrg.threadsPutDown()' | cut -f2)"
opened=no
for i in $(seq 1 "$(ev 'return CFOrg.knox()' | cut -f3)"); do
    ev 'return CFOrg.wake()' >/dev/null
    ev "return CFOrg.tapWidget(\"ROW\",$i)" >/dev/null; sleep 1
    t="$(ev 'return CFOrg.recordText()' | cut -f5)"
    if [ "$t" != nil ] && [ "$t" != false ]; then opened=yes; break; fi
    ev 'return CFOrg.tapWidget("BACK")' >/dev/null; sleep 1
done
if [ "$opened" = yes ]; then
    shot thread
    rec="$(ev 'return CFOrg.recordText()')"
    say "thread: $(cut -f2 <<<"$rec") [$(cut -f4 <<<"$rec")]"
    grep -q "STATE: " <<<"$(cut -f4 <<<"$rec")" || fail "the thread record has no STATE field: $(cut -f4 <<<"$rec")"
    ent="$(ev 'return CFOrg.entries()')"
    say "findings in the thread: $(cut -f2 <<<"$ent")"
    [ "$(cut -f3 <<<"$ent")" -ge 1 ] 2>/dev/null || fail "the thread lists no findings as entries: $ent"
    # An entry opens the FILES record it names, and BACK returns to the thread.
    ev 'return CFOrg.wake()' >/dev/null
    ev 'return CFOrg.tapWidget("ENTRY",1)' >/dev/null; sleep 1
    finding="$(ev 'return CFOrg.recordText()')"
    [ "$(cut -f5 <<<"$finding")" = nil ] || fail "tapping a finding did not leave the thread: $(cut -f2 <<<"$finding")"
    grep -qF "$(cut -f2 <<<"$finding")" <<<"$(cut -f2 <<<"$ent")" || fail "the record opened is not the entry tapped: $(cut -f2 <<<"$finding")"
    ev 'return CFOrg.tapWidget("BACK")' >/dev/null; sleep 1
    t="$(ev 'return CFOrg.recordText()' | cut -f5)"
    [ "$t" != nil ] && [ "$t" != false ] || fail "BACK from a finding did not return to its thread"
    # Put it down: the record keeps it, the row moves under Put down and its
    # record ends with the survivor's own closing note; then pick it back up.
    ev 'return CFOrg.wake()' >/dev/null
    ev 'return CFOrg.tapWidget("SETASIDE")' >/dev/null; sleep 1
    after_down="$(ev 'return CFOrg.threadsPutDown()' | cut -f2)"
    [ "${after_down:-0}" -gt "${before_down:-0}" ] 2>/dev/null \
        || fail "PUT DOWN did not reach the record: $before_down -> $after_down"
    ev 'return CFOrg.tapWidget("CATEGORY")' >/dev/null; sleep 1
    [ "$(ev 'return CFOrg.category()' | cut -f2)" = "Put down" ] || fail "could not switch to Put down"
    [ "$(ev 'return CFOrg.knox()' | cut -f3)" -ge 1 ] 2>/dev/null || fail "the thread put down is not listed under Put down"
    shot threads-put-down
    ev 'return CFOrg.tapWidget("ROW",1)' >/dev/null; sleep 1
    ent="$(ev 'return CFOrg.entries()')"
    grep -qE "Put this down|Leaving this here|Set this aside|Stopped carrying" <<<"$(cut -f2 <<<"$ent")" \
        || fail "a thread put down does not end with the survivor's closing note: $(cut -f2 <<<"$ent")"
    grep -qiE 'solved|closed|finished|complete' <<<"$(ev 'return CFOrg.recordText()' | cut -f4)" && fail "put down reads as a verdict"
    ev 'return CFOrg.wake()' >/dev/null
    ev 'return CFOrg.tapWidget("SETASIDE")' >/dev/null; sleep 1
    back_up="$(ev 'return CFOrg.threadsPutDown()' | cut -f2)"
    [ "${back_up:-1}" -eq "${before_down:-0}" ] 2>/dev/null \
        || fail "a thread put down could not be picked back up: $back_up"
else
    fail "no thread on the screen could be opened: $thread_rows"
fi

todo_open="$(ev 'return CFOrg.tapWidget("SELECT")')"; sleep 1
[ "$(ev 'return CFOrg.knox()' | cut -f4)" = true ] || fail "could not get back to the launcher for TO DO: $todo_open"
ev 'return CFOrg.openProgram("TO DO")' >/dev/null; sleep 1
todo="$(ev 'return CFOrg.knox()')"
[ "$(cut -f2 <<<"$todo")" = "TO DO" ] || fail "TO DO did not open: $todo"
shot todo
say "to do: $(ev 'return CFOrg.programs()' | cut -f2)"

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $errors"
id="$(session)"
end_world

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$(date +%Y%m%dT%H%M%S)-knox.txt"
{
    echo "$verdict knox.os - $(date -Is)"
    echo "commit: $(git -C "$REPO" rev-parse --short HEAD)"
    renderer_line
    echo "session: $id"
    echo "opened:   $state"
    echo "names:    $names"
    echo "dates:    $dates"
    echo "threads:  $threads"
    echo "  rows:   $thread_rows"
    echo "record:   $record_detail"
    echo "to do:    $todo"
    for f in "${fails[@]:-}"; do [ -n "$f" ] && echo "FAIL: $f"; done
} > "$out.part"; mv "$out.part" "$out"
say "written: $out"
echo "Linux Knox.OS check $id: $verdict"
cat "$out"
[ "$verdict" = PASS ] && exit 0 || exit 1
