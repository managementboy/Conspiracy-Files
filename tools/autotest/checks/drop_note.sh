#!/usr/bin/env bash
# Several case clues noted at once by dropping them on the open organiser
# (P4-R116), and the names written on them reaching NAMES.
#
#   tools/autotest/checks/drop_note.sh [--hidden]
#
# PASS needs: a case placed; its clues in furniture taken into the pockets,
# except the last, left lying in its container with the loot panel on it; the
# organiser open; one drop - a stack of the carried clues, the lying clue and
# an ordinary pencil - notes every clue, the carried ones staying carried and
# the lying one staying where it lies, and leaves the pencil alone; the footer
# says NOTED and the count; a second drop of the same evidence records nothing
# and says ALREADY NOTED; every case person named on noted evidence is in NAMES;
# no errors inside the mod. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "drop-note: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=()
f() { cut -f"$1"; }

claim_game || exit 2
start_world "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
ev -f "$REPO/tools/autotest/checks/core_loop.lua" >/dev/null || abort "could not load core_loop.lua"
ev -f "$REPO/tools/autotest/checks/drop_note.lua" >/dev/null || abort "could not load the check's Lua"
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"

deadline=$(( $(date +%s) + 180 ))
while :; do
    summary="$(ev 'return CFLoop.summary()')"; n="$(f 1 <<<"$summary")"
    [ "${n:-0}" -gt 0 ] && ! grep -qE "[0-9]+:(pending|placing)" <<<"$summary" && break
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never all placed: $summary"
    sleep 1
done
say "case placed: $summary"

# Clues in furniture: the core loop reaches cars, this check needs a drawer.
furniture=()
for i in $(seq 1 "$n"); do
    [ "$(ev "return CFDROP.inFurniture($i)" | f 1)" = true ] && furniture+=("$i")
done
[ ${#furniture[@]} -ge 2 ] || abort "needs two clues in furniture, found ${#furniture[@]} of $n"
last="${furniture[${#furniture[@]}-1]}"

carried=0; lying=""
for i in "${furniture[@]}"; do
    ev "return CFLoop.approach($i)" >/dev/null; wait_true 10 "CFLoop.loaded($i)" >/dev/null
    found="$(ev "return CFLoop.find($i)")"
    [ "$(f 1 <<<"$found")" = true ] || { findings+=("document $i not found where the runtime says"); continue; }
    ev "return CFLoop.goTo($i)" >/dev/null
    opened=no
    for _ in $(seq 16); do [ "$(ev 'return CFLoop.openContainer()' | f 1)" = true ] && { opened=yes; break; }; sleep 0.5; done
    if [ "$i" = "$last" ]; then
        [ "$opened" = yes ] || abort "the loot panel never showed the clue to leave lying ($(f 2 <<<"$found"))"
        # A clue lying in its drawer is recognised by searching (P4-R132): Search
        # Mode on, facing it, until the game's own spotting recognises it. A room
        # too dark for spotting falls back to the debug recognition, reported.
        how=search
        for _ in $(seq 30); do
            ev 'return CFLoop.searchOn()' >/dev/null
            [ "$(ev 'return CFLoop.recognised()' | f 1)" = true ] && break
            sleep 0.5
        done
        ev 'return CFLoop.searchOff()' >/dev/null
        if [ "$(ev 'return CFLoop.recognised()' | f 1)" != true ]; then
            how=debug; ev 'return CFLoop.debugRecognise()' >/dev/null
            findings+=("the clue left lying was not spotted in 15 s of Search Mode (dark?); recognised through ClueSearch.debugRecognise")
        fi
        [ "$(ev 'return CFLoop.recognised()' | f 1)" = true ] || abort "the clue to leave lying could not be recognised"
        ev 'return CFDROP.keepLying()' >/dev/null; lying="$(ev 'return CFLoop.name()' | f 1) (found as $(f 2 <<<"$found"), recognised by $how)"
        say "left lying: $lying"
        continue
    fi
    ev 'return CFLoop.take()' >/dev/null
    wait_true 20 'CFLoop.carried()' || { findings+=("document $i never reached the inventory"); continue; }
    # A plain item until recognised (P4-R132): look it over from the real menu.
    r="$(ev 'return CFLoop.lookOver()')"
    [ "$(f 1 <<<"$r")" = true ] || { fail "document $i: $(f 2 <<<"$r")"; continue; }
    wait_true 20 'CFLoop.recognised()' || { fail "document $i not recognised 20 s after Look it over"; continue; }
    ev 'return CFDROP.keepCarried()' >/dev/null; carried=$((carried + 1))
    say "carried: $(ev 'return CFLoop.name()' | f 1) (found as $(f 2 <<<"$found"))"
done
[ "$carried" -ge 1 ] && [ -n "$lying" ] || abort "needs a carried clue and one lying: carried=$carried lying=${lying:-none}"
total=$((carried + 1))

[ "$(ev 'return CFDROP.open()' | f 1)" = true ] || abort "the organiser would not open"
before="$(ev 'return CFDROP.inspectedCount()')"
[ "$(f 1 <<<"$before")" = 0 ] && [ "$(f 2 <<<"$before")" = false ] || fail "clues were noted before the drop: $before"

d="$(ev 'return CFDROP.drop()')"
[ "$(f 1 <<<"$d")" = true ] || fail "drop: $(f 2 <<<"$d")"
after="$(ev 'return CFDROP.inspectedCount()')"
[ "$(f 1 <<<"$after")" = "$carried" ] || fail "dropping $total case clues on the organiser noted $(f 1 <<<"$after") of the $carried carried"
[ "$(f 2 <<<"$after")" = true ] || fail "dropping $total case clues on the organiser did not note the one lying in its container"
[ "$(f 2 <<<"$d")" = "$total" ] || fail "the drop recorded $(f 2 <<<"$d") discoveries, not $total"
[ "$(f 3 <<<"$d")" = "NOTED $total" ] || fail "the footer said '$(f 3 <<<"$d")', not 'NOTED $total'"
say "drop: $total clues, $(f 2 <<<"$d") discoveries, footer '$(f 3 <<<"$d")'"

w="$(ev 'return CFDROP.where()')"
[ "$(f 2 <<<"$w")" = "$carried" ] || fail "carried clues left the pockets: $w"
[ "$(f 3 <<<"$w")" = true ] || fail "the lying clue was moved into the pockets: $w"
[ "$(f 4 <<<"$w")" = false ] || fail "the ordinary pencil was noted"

again="$(ev 'return CFDROP.drop()')"
[ "$(f 2 <<<"$again")" = 0 ] || fail "a second drop recorded $(f 2 <<<"$again") more discoveries"
[ "$(f 3 <<<"$again")" = "ALREADY NOTED" ] || fail "a second drop said '$(f 3 <<<"$again")', not 'ALREADY NOTED'"

sleep 2
nm="$(ev 'return CFDROP.names()')"
if [ "$(f 2 <<<"$nm")" = 0 ]; then
    findings+=("no noted evidence named a case person, so NAMES was not exercised")
else
    [ "$(f 1 <<<"$nm")" = true ] || fail "NAMES is missing a case person named on noted evidence: $(f 4 <<<"$nm") (expected $(f 3 <<<"$nm"))"
fi
say "names from evidence: $(f 3 <<<"$nm")"

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $errors"
end_world

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-drop-note.txt"
{
    echo "Linux drop-to-note check $id: $verdict"
    source_line
    echo "case: $summary"
    echo "carried: $carried, left lying: $lying"
    echo "drop: $d"
    echo "second drop: $again"
    echo "names from evidence: $nm"
    for x in "${findings[@]:-}"; do [ -n "$x" ] && echo "FINDING: $x"; done
    for x in "${fails[@]:-}"; do [ -n "$x" ] && echo "FAIL: $x"; done
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ] && exit 0 || exit 1
