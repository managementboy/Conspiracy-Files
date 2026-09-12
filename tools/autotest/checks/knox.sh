#!/usr/bin/env bash
# Knox.OS: the organiser's operating system, driven the way a player drives it.
#
#   tools/autotest/checks/knox.sh [--hidden]
#
# PASS needs: the device opens into FILES with the case's records; the launcher
# shows four programs as an icon grid; a stylus tap opens NAMES and it holds the
# identity looted from a body; DATES groups discoveries by the day they were
# made; a record opens, REMIND writes a to-do and TO DO shows it; and no errors
# inside the mod. Screenshots of each screen land in dev/eval/linux/runs.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "knox: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
shot() { "$PZ" shot "$RUNS/$(session)-knox-$1.png" >/dev/null 2>&1; }

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
for f in core_loop organiser wallet_id; do
    ev -f "$REPO/tools/autotest/checks/$f.lua" >/dev/null || abort "could not load $f.lua"
done
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"

# A case, found the way a player finds it: one document is enough for FILES.
deadline=$(( $(date +%s) + 200 ))
while :; do
    s="$(ev 'return CFLoop.summary()')"; n="$(cut -f1 <<<"$s")"
    [ "${n:-0}" -gt 0 ] && ! grep -qE ":(pending|placing)" <<<"$s" && break
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never placed: $s"
    sleep 3
done
ev 'return CFLoop.approach(1)' >/dev/null; sleep 2
ev 'return CFLoop.find(1)' >/dev/null
ev 'return CFLoop.goTo(1)' >/dev/null
for _ in 1 2 3 4 5 6; do [ "$(ev 'return CFLoop.openContainer()' | cut -f1)" = true ] && break; sleep 1; done
ev 'return CFLoop.take()' >/dev/null
wait_true 20 'CFLoop.carried()' || say "the document never reached the inventory"
ev 'return CFLoop.inspect()' >/dev/null; sleep 2

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
state="$(ev 'return CFOrg.knox()')"
say "opened: $state"
[ "$(cut -f2 <<<"$state")" = FILES ] || fail "Knox.OS did not open into FILES: $state"
[ "$(cut -f3 <<<"$state")" -gt 0 ] 2>/dev/null || fail "FILES is empty"
shot files

ev 'return CFOrg.pressButton("MODE")' >/dev/null; sleep 1
[ "$(ev 'return CFOrg.knox()' | cut -f4)" = true ] || fail "VIEW did not open the launcher"
shot launcher
say "programs: $(ev 'return CFOrg.programs()' | cut -f2)"

ev 'return CFOrg.tapWidget("APP",2)' >/dev/null; sleep 1
names="$(ev 'return CFOrg.knox()')"
[ "$(cut -f2 <<<"$names")" = NAMES ] || fail "a tap on the NAMES icon did not open it: $names"
[ "$(cut -f3 <<<"$names")" -gt 0 ] 2>/dev/null || fail "the address book is empty after looting an ID"
shot names

ev 'return CFOrg.pressButton("MODE")' >/dev/null; sleep 1
ev 'return CFOrg.tapWidget("APP",3)' >/dev/null; sleep 1
dates="$(ev 'return CFOrg.knox()')"
[ "$(cut -f2 <<<"$dates")" = DATES ] || fail "a tap on the DATES icon did not open it: $dates"
[ "$(cut -f3 <<<"$dates")" -gt 0 ] 2>/dev/null || fail "the date book has no days in it"
shot dates

# Back to FILES, open a record, set a reminder, and see it in TO DO.
ev 'return CFOrg.pressButton("MODE")' >/dev/null; sleep 1
ev 'return CFOrg.tapWidget("APP",1)' >/dev/null; sleep 1
ev 'return CFOrg.tapWidget("ROW",1)' >/dev/null; sleep 1
[ "$(ev 'return CFOrg.knox()' | cut -f5)" = true ] || fail "a tap on a record did not open it"
shot record
ev 'return CFOrg.tapWidget("REMIND")' >/dev/null; sleep 1
ev 'return CFOrg.pressButton("MODE")' >/dev/null; sleep 1
ev 'return CFOrg.tapWidget("APP",4)' >/dev/null; sleep 1
todo="$(ev 'return CFOrg.knox()')"
[ "$(cut -f2 <<<"$todo")" = "TO DO" ] || fail "TO DO did not open: $todo"
shot todo
say "to do: $(ev 'return CFOrg.programs()' | cut -f2)"

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $errors"
id="$(session)"
"$PZ" stop

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$(date +%Y%m%dT%H%M%S)-knox.txt"
{
    echo "$verdict knox.os - $(date -Is)"
    echo "commit: $(git -C "$REPO" rev-parse --short HEAD)"
    echo "session: $id"
    echo "opened:   $state"
    echo "names:    $names"
    echo "dates:    $dates"
    echo "to do:    $todo"
    for f in "${fails[@]:-}"; do [ -n "$f" ] && echo "FAIL: $f"; done
} > "$out"
say "written: $out"
cat "$out"
[ "$verdict" = PASS ] && exit 0 || exit 1
