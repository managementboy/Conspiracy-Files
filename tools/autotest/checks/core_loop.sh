#!/usr/bin/env bash
# Core loop check: a whole generated case, found and inspected the way a
# player does it, then what must happen after it completes.
#
#   tools/autotest/checks/core_loop.sh [--hidden]
#
# Covers (docs/management/TEST_CATALOGUE.md): CG-01, CG-06, AS-01, NB-03,
# MM-01 (no pen: pending), the retirement regressions NB-30 and the marker
# worker (no error when the case completes), MM-02 (a pen afterwards still
# marks the retired case), and AS-02 with the 24 h gap removed for pacing.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "core-loop: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }

claim_game || exit 2
start_world "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
ev -f "$REPO/tools/autotest/checks/core_loop.lua" >/dev/null || abort "could not load the check's Lua"
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"

# Wait until every document of the first case is placed.
deadline=$(( $(date +%s) + 180 ))
while :; do
    summary="$(ev 'return CFLoop.summary()')"; n="$(cut -f1 <<<"$summary")"
    [ "${n:-0}" -gt 0 ] && ! grep -qE "[0-9]+:(pending|placing)" <<<"$summary" && break
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never all placed: $summary"
    sleep 1
done
say "case placed: $summary"

rows=(); findings=(); inhand=0; unpromoted=0
for i in $(seq 1 "$n"); do
    # An instalment is brought in by standing at its site (P4-R133). A
    # transport scene waits for a CONFIRMED vanilla vehicle near the site and
    # most saves have none; it is set aside at completion, not found
    # (DR-20260925-SCENE-AT-COMPLETION), so it is counted apart, not failed.
    if ! why="$(settle_doc "$i")"; then
        if [ "$(ev "return CFLoop.intent($i)")" = vehicle ]; then
            unpromoted=$((unpromoted+1))
            findings+=("document $i waits for a confirmed vehicle scene and none is within reach; set aside at completion ($why)")
            continue
        fi
        fail "document $i $why"; continue
    fi
    ev "return CFLoop.approach($i)" >/dev/null; wait_true 10 "CFLoop.loaded($i)" >/dev/null
    found="$(ev "return CFLoop.find($i)")"
    [ "$(cut -f1 <<<"$found")" = true ] || { fail "document $i not found where the runtime says: $(cut -f2 <<<"$found")"; continue; }
    name="$(cut -f2 <<<"$found")"; holder="$(cut -f3 <<<"$found")"; room="$(cut -f4 <<<"$found")"; floor="$(cut -f5 <<<"$found")"
    access=true
    if [[ "$holder" == vehicle* ]]; then
        locked="$(ev 'return CFLoop.vehicleLocked()' | cut -f1)"
        [ "$locked" = true ] && { holder="$holder (locked)"; findings+=("document $i ($name) is in a LOCKED car: a player needs its key or a broken window"); }
        # From outside first, as a player reaches a truck bed or a glove box; get
        # in only when the part is still out of reach (a seat, or a blocked door).
        reached="$(ev 'return CFLoop.reachPart()' | cut -f1)"
        if [ "$reached" = true ] && ! wait_true 12 'CFLoop.partAccess()'; then
            ev 'return CFLoop.forceOpen()' >/dev/null; wait_true 8 'CFLoop.partAccess()' >/dev/null
        fi
        if [ "$reached" != true ] || [ "$(ev 'return CFLoop.partAccess()' | cut -f1)" != true ]; then
            ev 'return CFLoop.enterVehicle()' >/dev/null
            if ! wait_true 30 'CFLoop.inVehicle()'; then
                if [ "$locked" = true ]; then say "could not get into the locked car"
                else fail "document $i ($name, $holder): could not get into the vehicle"; fi
            fi
        fi
        access="$(ev 'return CFLoop.partAccess()' | cut -f1)"
        [ "$access" = true ] || findings+=("document $i ($name): the game would not open its $holder from where the harness stood")
    else
        ev "return CFLoop.goTo($i)" >/dev/null
    fi
    opened=no
    for _ in $(seq 16); do [ "$(ev 'return CFLoop.openContainer()' | cut -f1)" = true ] && { opened=yes; break; }; sleep 0.5; done
    ev 'return CFLoop.take()' >/dev/null
    wait_true 20 'CFLoop.carried()' || { fail "document $i ($name) never reached the inventory"; continue; }
    # A plain item until recognised (P4-R132): Look it over, then Inspect,
    # both timed actions from the real menu (note_carried in lib.sh).
    plain="$name"
    why="$(note_carried)" || { fail "document $i ($name): $why"; [[ "$holder" == vehicle* ]] && ev 'return CFLoop.exitVehicle()' >/dev/null; continue; }
    name="$(ev 'return CFLoop.name()' | cut -f1)"
    [ "$name" != "$plain" ] || findings+=("document $i ($name): its name did not change when it was recognised")
    ev "return CFLoop.remember($i)" >/dev/null
    [[ "$holder" == vehicle* ]] && { ev 'return CFLoop.exitVehicle()' >/dev/null; sleep 3; }
    rows+=("  $i. $name (found as $plain), in $holder, room $room, floor $floor (container icon clicked: $opened)")
    # A clue delivered to the hand (the opening, since 2026-09-23) has no
    # container to show and no square to mark; it is counted apart.
    if [ "$holder" = inventory ]; then inhand=$((inhand+1))
    # A missing icon is a failure only when the game itself allowed the part.
    elif [ "$opened" != yes ] && [ "$access" = true ]; then fail "document $i ($name): the game allowed its $holder but the loot panel never showed it"; fi
    say "document $i: $name"
done

sleep 5
known="$(ev 'return CFLoop.known()' | cut -f1)"
[ "$known" = "$((n-unpromoted))" ] || fail "record knows $known of $n documents ($unpromoted transport scene(s) never promoted)"
# The relay memo's date note (P4-R96), in the real game at last.
notes="$(ev 'return CFLoop.dateNotes()')"
say "date notes: memo found=$(cut -f1 <<<"$notes") records dated in its week=$(cut -f2 <<<"$notes") carrying the note=$(cut -f3 <<<"$notes")"
findings+=("relay memo date notes: memo found=$(cut -f1 <<<"$notes"), dated in its week=$(cut -f2 <<<"$notes"), carrying the note=$(cut -f3 <<<"$notes")")
if [ "$(cut -f1 <<<"$notes")" = true ]; then
    [ "$(cut -f3 <<<"$notes")" = "$(cut -f2 <<<"$notes")" ] || fail "the relay memo was found, but $(cut -f3 <<<"$notes") of $(cut -f2 <<<"$notes") records dated in its week carry the date note"
fi
completed=no; run_log | grep -q "Case complete" && completed=yes
[ "$completed" = yes ] || fail "the case never reported completion"
# A finished case's evidence still says where it was last seen (P4-R104).
seen="0"
for _ in $(seq 1 20); do
    seen="$(ev 'return CFLoop.lastSeen()')"
    [ "$(cut -f1 <<<"$seen")" = "$(cut -f2 <<<"$seen")" ] && break
    sleep 2
done
say "last seen: $(cut -f1 <<<"$seen") of $(cut -f2 <<<"$seen") documents, e.g. '$(cut -f3 <<<"$seen")'"
findings+=("last seen after completion: $(cut -f1 <<<"$seen") of $(cut -f2 <<<"$seen") documents, e.g. '$(cut -f3 <<<"$seen")'; retired cases in the save=$(cut -f4 <<<"$seen"), rows with a stored last seen=$(cut -f5 <<<"$seen")")
findings+=("last-seen log: $(run_log | grep -oE '(Last-seen[^\"]*|lastseen: [^\"]*)' | tail -2 | tr '\n' ' ')")
if [ "$completed" = yes ] && [ "$(cut -f1 <<<"$seen")" != "$(cut -f2 <<<"$seen")" ]; then
    fail "after the case completed, only $(cut -f1 <<<"$seen") of $(cut -f2 <<<"$seen") documents say where they were last seen"
fi
# A finished case's evidence shows as Evidence / Old (P4-R118). The item in hand is
# marked at once, the rest by the last-seen scan every ten seconds.
old="0	0	0"
for _ in $(seq 1 15); do
    old="$(ev 'return CFLoop.oldPapers()')"
    [ "$(cut -f1 <<<"$old")" != 0 ] && [ "$(cut -f3 <<<"$old")" = "$(cut -f1 <<<"$old")" ] && break
    sleep 2
done
say "old evidence: $(cut -f1 <<<"$old") carried, $(cut -f2 <<<"$old") retired, $(cut -f3 <<<"$old") shown as Evidence / Old"
findings+=("Evidence / Old after completion: $(cut -f1 <<<"$old") pieces of evidence carried, $(cut -f2 <<<"$old") known as retired evidence, $(cut -f3 <<<"$old") in the Old category")
if [ "$completed" = yes ]; then
    [ "$(cut -f1 <<<"$old")" != 0 ] || fail "no case evidence found in the inventory after completion"
    [ "$(cut -f2 <<<"$old")" = "$(cut -f1 <<<"$old")" ] || fail "only $(cut -f2 <<<"$old") of $(cut -f1 <<<"$old") carried pieces of evidence are known as a finished case's evidence"
    [ "$(cut -f3 <<<"$old")" = "$(cut -f1 <<<"$old")" ] || fail "only $(cut -f3 <<<"$old") of $(cut -f1 <<<"$old") carried pieces of evidence show as Evidence / Old"
fi
# DATES opens a real document the loop found (owner, 2026-09-14).
dt="$(ev 'return CFLoop.datesTap()')"
say "dates tap: $(tr '\t' ' ' <<<"$dt")"
[ "$(cut -f1 <<<"$dt")" = true ] || fail "DATES could not show today's page for a real document: $(cut -f2 <<<"$dt")"
[ "$(cut -f2 <<<"$dt")" = true ] || fail "tapping a real document's DATES entry did not open its record: $dt"
[ "$(cut -f3 <<<"$dt")" = true ] || fail "BACK from a document opened in DATES did not return to the day: $dt"
before_pen="$(ev 'return CFLoop.markers()')"
if [ "$(ev 'return CFLoop.hasPen()')" = true ]; then
    # One of the case's own clues was a pen, so the survivor could already write.
    findings+=("marks before a pen not tested: a case clue was itself a writing tool; marks $(tr '\t' '/' <<<"$before_pen")")
else
    [ "$(cut -f2 <<<"$before_pen")" = "$((n-inhand-unpromoted))" ] || fail "without a pen, expected $((n-inhand-unpromoted)) pending marks ($inhand clue(s) in the hand, $unpromoted scene(s) never promoted): $before_pen"
fi

# A pen after the case retired: the marks must still catch up.
ev 'return CFLoop.givePen()' >/dev/null; sleep 4
after_pen="$(ev 'return CFLoop.markers()')"
[ "$(cut -f1 <<<"$after_pen")" = "$((n-inhand-unpromoted))" ] || fail "with a pen after completion, expected $((n-inhand-unpromoted)) written marks ($inhand in the hand, $unpromoted scene(s) never promoted): $after_pen"
ev 'return CFLoop.showMap()' >/dev/null; sleep 3
"$PZ" shot "$RUNS/$id-map.png" >/dev/null 2>&1
ev 'return CFLoop.hideMap()' >/dev/null
run_log | grep -qE "Map overlay stopped|Worker stopped" && fail "a marker component stopped: $(run_log | grep -oE '(Map overlay|Worker) stopped: .*' | head -1)"

# "What do I make of it?" (P4-R113): answer about the finished case first, so
# the next case is built from the answers.
ans="$(ev 'return CFLoop.answerViaOrganiser()')"
say "answers: $(tr '\t' ' ' <<<"$ans")"
[ "$(cut -f1 <<<"$ans")" = true ] || fail "could not answer about the finished case: $(cut -f2 <<<"$ans")"
# The next case, with the 24 h gap and the wait after a completion removed for test pacing.
# Back to the starting house first: settling instalments left the survivor
# at a site's edge, where the next case found "no-containers" nearby
# (20260925T203425). A player finishing a case is where they finished it.
# Home first: a player finishing a case is where they finished it. Then the
# gap comes off and the poller is ASKED, every ten seconds, rather than
# waited for: it polls every 600 ticks, and the unfocused hidden display runs
# at about a frame a second (20260925T212202).
ev 'return CFLoop.approach(1)' >/dev/null; sleep 3
ev 'return CFLoop.noGap()' >/dev/null
next_case=no
for _ in $(seq 15); do
    ev 'return CFLoop.pollNow()' >/dev/null
    [ "$(ev 'return CFLoop.caseCount()' | cut -f1)" -ge 2 ] 2>/dev/null && { next_case=yes; break; }
    sleep 10
done
[ "$next_case" = yes ] || fail "no second case within 150 s with the gap removed: $(ev 'return CFLoop.deferWhy()')"
# CONTINUITY (DR-20260919-CONTINUITY): the next case follows a FINDING of the
# finished case; the closing answers are not the steering mechanism and wait
# for the case after. Only a finished case that left no thread is followed by
# a steered case. test/steer_precedence.lua pins the same contract offline.
cont="none	false	false	false	none	no second case"
if [ "$next_case" = yes ]; then
    cont="$(ev 'return CFLoop.continuity()')"
    say "continuity: $(tr '\t' ' ' <<<"$cont")"
    mode="$(cut -f1 <<<"$cont")"
    case "$mode" in
        follows)
            [ "$(cut -f3 <<<"$cont")" = true ] || fail "the second case follows a finding of some other case: $(tr '\t' ' ' <<<"$cont")"
            [ "$(cut -f4 <<<"$cont")" = true ] || fail "the answers were used up by a case that followed a thread instead: $(tr '\t' ' ' <<<"$cont")"
            run_log | grep -q "next case follows the finding recorded in" || fail "the runtime never logged that the case follows a finding"
            ;;
        steer)
            steer="$(ev 'return CFLoop.steerCheck()')"
            [ "$(cut -f2 <<<"$steer")" = true ] || fail "the steered second case was not built from the answers: $(tr '\t' ' ' <<<"$steer")"
            [ "$(cut -f1 <<<"$steer")" = true ] || fail "the answers were not marked used by the steered second case: $(tr '\t' ' ' <<<"$steer")"
            run_log | grep -q "Case shaped by the survivor's answers" || fail "the runtime never logged a steered case"
            ;;
        *) fail "the second case carries no continuity at all: $(tr '\t' ' ' <<<"$cont")" ;;
    esac
fi
findings+=("continuity into the second case: $(cut -f1 <<<"$cont") - $(cut -f6 <<<"$cont"); answers still unused for the case after=$(cut -f4 <<<"$cont")")
findings+=("What do I make of it?: answered=$(cut -f1 <<<"$ans") (person $(cut -f3 <<<"$ans")); the answers are not the steering mechanism (DR-20260919-CONTINUITY) and are held for the case after a followed thread")
errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod"
end_world

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-core-loop.txt"
{
    echo "Linux core loop check $id: $verdict"
    source_line
    echo "first case: $n documents, all found, looked over and inspected through the right-click menu:"
    printf '%s\n' "${rows[@]}"
    echo "record entries: $known; case completion reported: $completed"
    echo "map marks without a pen (written/pending/missing): $(tr '\t' '/' <<<"$before_pen")"
    echo "map marks after a pen, case already retired: $(tr '\t' '/' <<<"$after_pen")"
    echo "second case appeared (gap removed): $next_case"
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
    [ -z "$errors" ] || sed 's/^/  /' <<<"$errors" | head -10
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
    echo "screenshot: dev/eval/linux/runs/$id-map.png (not committed)"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
