#!/usr/bin/env bash
# Campaign check: several generated cases played end to end in one save, the
# way a player's week goes, with saves and reloads between them.
#
#   tools/autotest/checks/campaign.sh [--hidden]
#
# Every other check proves one thing on one case. This one plays on and judges
# what only shows across cases and over time:
#   case 1  every clue found, taken and inspected; the case retires; its evidence
#           turn Evidence / Old; the relay memo's date notes; the second thought
#           "What do I make of it?" said once; FILES gains its row. Its questions
#           are answered on the organiser: the other reading, the second person,
#           the records.
#   reload  save, quit, continue: the answers, the record order, the Old
#           evidence comes back, and the save has not grown.
#   case 2  built from those answers: placed within reach and on sites no case
#           used; the second person returns without a second body; the case
#           leans on the duty log; the answers are marked used and can no longer
#           be changed. Played through and NOT answered.
#   case 3  built from nothing (case 1's answers used, case 2's empty): no
#           steer, no "shaped" line. Two clues found, then saved and reloaded.
#   limit   more cases arrive until four are unfinished, the most the save
#           allows; the timer keeps trying; then case 3 is finished and a new
#           case must still come (the preparation flag must not stick).
# Throughout: the record reads case by case, finished evidence stays Old and live
# ones Evidence, NAMES grows, map marks catch up with a pen, the save size is
# recorded per stage, the per-frame cost is sampled, and the mod logs no errors
# in any session. Takes about half an hour. Not in suite.sh.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "campaign: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); stages=(); saves=(); errors_seen=""
CHECKS="$REPO/tools/autotest/checks"
points=(IdentityObserver.afterRender IdentityObserver.tick ClueMarkers.update ClueMarkers.draw
        AutomaticInvestigations.onTick CaseFile.onTick LocalPersonIntegration.tick)

load_lua() {
    ev -f "$CHECKS/core_loop.lua" >/dev/null && ev -f "$CHECKS/reload.lua" >/dev/null \
        && ev -f "$CHECKS/perf.lua" >/dev/null && ev -f "$CHECKS/campaign.lua" >/dev/null
}
field() { if [ $# -ge 2 ]; then cut -f"$1" <<<"$2"; else cut -f"$1"; fi; }   # field N TEXT, or ... | field N
wrap_perf() { for p in "${points[@]}"; do ev "return CFPerf.wrap('$p')" >/dev/null; done; }
perf_note() { findings+=("frame cost during $1: $(ev 'return CFPerf.report()' | tr '\t' ' ' | cut -c1-400)"); }
bytes() { ev 'return CFReload.bytes()' | cut -f1; }
said() { run_log | grep -c "said '$1'" || true; }
logged() { run_log | grep -c "$1" || true; }
# The second thought waits in the voice queue behind "That's all of it", so it
# is counted once it has had time to be said, then checked for exactly one.
# A reload must not grow the save by more than the few words the last-seen scan
# may rewrite; the per-root sizes before and after say which root changed.
reload_growth() { # reload_growth LABEL BYTES_BEFORE PARTS_BEFORE
    local now parts; now="$(bytes)"; parts="$(ev 'return CFReload.bytes()' | cut -f2)"
    findings+=("$1 save size: $2 -> $now bytes; before [$3]; after [$parts]")
    [ "$now" -le $(( $2 + 2000 )) ] 2>/dev/null || fail "$1: the save grew by more than 2 kB on a reload ($2 -> $now)"
}
thought_once() { # thought_once LABEL COUNT_BEFORE
    local n=0
    for _ in $(seq 60); do n=$(( $(said 'What do I make of it?') - $2 )); [ "$n" -ge 1 ] && break; sleep 1; done
    sleep 3; n=$(( $(said 'What do I make of it?') - $2 ))
    [ "$n" = 1 ] || fail "$1: the second thought \"What do I make of it?\" was said $n times, not once"
}
cases() { ev 'return CFCamp.cases()'; }
stage() { # stage LABEL: one row of the stage table, and the checks every stage makes
    local s q c o b
    s="$(ev 'return CFCamp.surfaces()')"; q="$(cases)"
    c="$(ev 'return CFCamp.categories()')"; o="$(ev 'return CFCamp.order()')"; b="$(bytes)"
    stages+=("$(printf '%-22s cases %s (%s finished) | record %s | FILES questions %s | NAMES %s | PLACES %s | Old %s/%s wrong | Evidence %s/%s wrong | order %s | save %s B' \
        "$1" "$(field 1 "$q")" "$(field 2 "$q")" "$(field 5 "$s")" "$(field 1 "$s")" "$(field 3 "$s")" "$(field 4 "$s")" \
        "$(field 1 "$c")" "$(field 2 "$c")" "$(field 3 "$c")" "$(field 4 "$c")" "$(field 2 "$o")" "$b")")
    saves+=("$1 $b")
    say "${stages[-1]}"
    [ "$(field 1 "$o")" = true ] || fail "$1: the record does not read case by case: $(field 2 "$o")"
    [ "$(field 4 "$c")" = 0 ] || fail "$1: $(field 4 "$c") carried items of a live case are not Evidence"
    [ "$b" -le 500000 ] 2>/dev/null || fail "$1: the save measured $b bytes, over the 500 kB budget"
    QROWS="$(field 1 "$s")"; NAMES_NOW="$(field 3 "$s")"; PLACES_NOW="$(field 4 "$s")"
}
old_settled() { # every carried piece of a finished case is Old (the scan marks them within ~10 s)
    local c
    for _ in $(seq 20); do
        c="$(ev 'return CFCamp.categories()')"
        [ "$(field 1 "$c")" -gt 0 ] 2>/dev/null && [ "$(field 2 "$c")" = 0 ] && return 0
        sleep 2
    done
    fail "$1: finished evidence not all Evidence / Old ($(tr '\t' ' ' <<<"$c"): ok, wrong, live ok, live wrong)"
}
play_case() { # play_case CASEID [LIMIT]: find, take and inspect its next clues; sets CASE_LEFT and PLAYED
    local cid="$1" limit="${2:-99}" r n waiting deadline out tries=0
    deadline=$(( $(date +%s) + 240 ))
    while :; do
        r="$(ev "return CFCamp.useCase([[$cid]])")"; n="$(field 1 "$r")"; waiting="$(field 3 "$r")"
        [ "${n:-0}" -gt 0 ] 2>/dev/null && [ "$waiting" = 0 ] && break
        [ "$(date +%s)" -lt "$deadline" ] || { fail "case ${cid#generated:}: clues never all placed ($(tr '\t' ' ' <<<"$r"))"; CASE_LEFT=0; PLAYED=0; return 1; }
        sleep 2
    done
    CASE_LEFT="$n"; PLAYED=0
    while [ "$PLAYED" -lt "$limit" ] && [ "$tries" -lt "$n" ]; do
        tries=$((tries + 1))
        [ "$(field 1 "$(ev "return CFCamp.useCase([[$cid]])")")" -gt 0 ] 2>/dev/null || break
        local where; where="$(ev 'return CFCamp.describeFirst()' | tr '\t' ' ')"
        if out="$(inspect_doc 1)"; then
            PLAYED=$((PLAYED + 1)); say "case ${cid#generated:}: clue $PLAYED of $n: $out"
        else
            fail "case ${cid#generated:}: $out; $where (skipped $(ev 'return CFCamp.skipFirst()'))"
        fi
    done
}
wait_finished() { for _ in $(seq 60); do [ "$(field 2 "$(cases)")" -ge "$1" ] 2>/dev/null && return 0; sleep 1; done; return 1; }
wait_case_count() { # wait_case_count COUNT SECONDS
    local end=$(( $(date +%s) + $2 ))
    while [ "$(date +%s)" -lt "$end" ]; do
        [ "$(field 1 "$(cases)")" -ge "$1" ] 2>/dev/null && return 0
        sleep 3
    done
    return 1
}
placed_well() { # placed_well LABEL CASEID X Y HOURS
    local p; p="$(ev "return CFCamp.placement([[$2]], $3, $4, $5)")"
    findings+=("$1 placement: $(field 3 "$p")")
    [ "$(field 1 "$p")" = true ] || fail "$1: a site is outside the reach of where the survivor stood ($(field 3 "$p"))"
    [ "$(field 2 "$p")" = true ] || fail "$1: a site an earlier case already used was used again ($(field 3 "$p"))"
}
reload_world() { # reload_world LABEL: save, quit, continue, reload the Lua
    errors_seen+="$(mod_errors)"
    "$PZ" stop --save >/dev/null 2>&1
    "$PZ" start --continue "$world" "${start_args[@]}" >/dev/null 2>&1 || abort "$1: the saved game did not load"
    load_lua || abort "$1: could not load the check's Lua after the reload"
    wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || fail "$1: the campaign did not resume"
    sleep 8
    wrap_perf
}

# ---------------------------------------------------------------------------
claim_game || exit 2
# P4-R126: the relay memo's date note is only tested when case 1 has a document
# dated inside the memo's week, which about a third of cases do. Fresh worlds are
# started, at most eight, until one does.
worlds=0
while :; do
    worlds=$((worlds + 1))
    start_cold "${start_args[@]}" || abort "the game did not reach a playable world"
    load_lua || abort "could not load the check's Lua"
    wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
    wait_case_count 1 120 || abort "no first case"
    case1="$(ev 'return CFCamp.newestLive()' | field 1)"
    week="$(ev "return CFCamp.memoWeek([[$case1]])")"
    if [ "$(field 1 "$week")" = true ] && [ "$(field 2 "$week")" -gt 0 ] 2>/dev/null; then break; fi
    if [ "$worlds" -ge 8 ]; then findings+=("no case 1 in $worlds fresh worlds had a document in the relay memo's week"); break; fi
    say "world $worlds: case 1 has no document in the memo's week; starting a fresh world"
    "$PZ" stop >/dev/null 2>&1
done
findings+=("fresh worlds started for a case 1 with a document in the memo's week: $worlds (memo=$(field 1 "$week"), dated documents=$(field 2 "$week"))")
first="$(session)"; world="$(cat "$REPO/dev/eval/linux/world")"
wrap_perf
ev 'return CFLoop.givePen()' >/dev/null

# --- case 1 -----------------------------------------------------------------
say "case 1: $case1"
stage "start"
names_start="$NAMES_NOW"
thought0="$(said 'What do I make of it?')"
play_case "$case1"
[ "$PLAYED" = "$CASE_LEFT" ] || fail "case 1: only $PLAYED of $CASE_LEFT clues could be played"
wait_finished 1 || fail "case 1 did not finish after its clues were inspected"
thought_once "case 1" "$thought0"
notes="$(ev 'return CFLoop.dateNotes()')"
findings+=("case 1 relay memo: found=$(field 1 "$notes"), dated in its week=$(field 2 "$notes"), carrying the date note=$(field 3 "$notes")")
[ "$(field 1 "$notes")" = true ] || fail "case 1: the relay memo is not among the evidence found"
[ "$(field 2 "$notes")" = "$(field 3 "$notes")" ] || fail "case 1: $(field 2 "$notes") records dated in the memo's week, but $(field 3 "$notes") carry the date note"
if [ "$(field 2 "$notes")" -gt 0 ] 2>/dev/null; then
    findings+=("the date note was exercised: $(field 3 "$notes") of $(field 2 "$notes") records dated in the memo's week carry it")
else
    findings+=("the date note was not exercised: case 1 had no document in the memo's week")
fi
old_settled "case 1 finished"
stage "case 1 finished"
[ "$QROWS" = 1 ] || fail "case 1 finished: FILES shows $QROWS question rows, not 1"

asked="$(ev "return CFCamp.answersOf([[$case1]])")"
[ "$(field 1 "$asked")" = true ] || fail "case 1 finished without questions"
answered="$(ev "return CFCamp.answer([[$case1]], 2, 2, 2)")"
[ "$(field 1 "$answered")" = true ] || fail "case 1: could not answer on the organiser: $(field 2 "$answered")"
answers="$(ev "return CFCamp.answersOf([[$case1]])")"
[ "$(field 2 "$answers")/$(field 3 "$answers")/$(field 4 "$answers")" = "two/person2/records" ] \
    || fail "case 1: the organiser saved $(field 2 "$answers")/$(field 3 "$answers")/$(field 4 "$answers"), not two/person2/records"
person2="$(field 7 "$answers")"
findings+=("case 1 note on the organiser: $(field 2 "$answered")")
record="$(ev 'return CFReload.record()')"; bytes_before="$(bytes)"; parts_before="$(ev 'return CFReload.bytes()' | cut -f2)"
perf_note "case 1"

# --- reload 1 ---------------------------------------------------------------
reload_world "reload 1"
[ "$(ev "return CFCamp.answersOf([[$case1]])")" = "$answers" ] || fail "reload 1: the answers changed: $(ev "return CFCamp.answersOf([[$case1]])" | tr '\t' ' ')"
[ "$(ev 'return CFReload.record()')" = "$record" ] || fail "reload 1: the record changed"
old_settled "after reload 1"
stage "after reload 1"
reload_growth "reload 1" "$bytes_before" "$parts_before"

# --- case 2: built from the answers ------------------------------------------
ev 'return CFCamp.gap(false)' >/dev/null
here="$(ev 'return CFCamp.here()')"
wait_case_count 2 240 || fail "no second case within four minutes of the gap being removed"
case2="$(ev 'return CFCamp.newestLive()' | field 1)"
ev 'return CFCamp.gap(true)' >/dev/null   # no further case while this one is played
say "case 2: $case2"
placed_well "case 2" "$case2" "$(field 1 "$here")" "$(field 2 "$here")" "$(field 3 "$here")"
steer2="$(ev "return CFCamp.steerOf([[$case2]])")"
[ "$(field 1 "$steer2")" = "$case1" ] || fail "case 2 was not built from case 1's answers (steer from: $(field 1 "$steer2"))"
[ "$(field 2 "$steer2")/$(field 3 "$steer2")" = "two/records" ] || fail "case 2's steer is $(field 2 "$steer2")/$(field 3 "$steer2"), not two/records"
[ "$(field 5 "$steer2")" = "$person2" ] || fail "case 2's first person is $(field 5 "$steer2"), not the returning $person2"
[ "$(field 6 "$steer2")" = true ] || fail "case 2: the returning person could be given a second body"
grep -q "Duty log / " <<<"$(field 7 "$steer2")" || fail "case 2 does not include the duty log the other reading leans on"
[ "$(logged "Case shaped by the survivor's answers")" = 1 ] || fail "case 2: the steered case was not logged exactly once"
findings+=("case 2 clues: $(field 7 "$steer2")")
[ "$(ev "return CFCamp.answersOf([[$case1]])" | field 5)" = "$case2" ] || fail "case 1's answers are not marked used by case 2"
[ "$(ev "return CFCamp.tryChange([[$case1]])" | field 1)" = false ] || fail "case 1's answers could still be changed after shaping case 2"
thought0="$(said 'What do I make of it?')"
play_case "$case2"
[ "$PLAYED" = "$CASE_LEFT" ] || fail "case 2: only $PLAYED of $CASE_LEFT clues could be played"
wait_finished 2 || fail "case 2 did not finish"
thought_once "case 2" "$thought0"
here="$(ev 'return CFCamp.here()')"
old_settled "case 2 finished"
stage "case 2 finished"
[ "$QROWS" = 2 ] || fail "case 2 finished: FILES shows $QROWS question rows, not 2"
perf_note "case 2"

# --- case 3: built from nothing ---------------------------------------------
ev 'return CFCamp.gap(false)' >/dev/null
wait_case_count 3 240 || fail "no third case within four minutes"
case3="$(ev 'return CFCamp.newestLive()' | field 1)"
ev 'return CFCamp.gap(true)' >/dev/null
say "case 3: $case3"
placed_well "case 3" "$case3" "$(field 1 "$here")" "$(field 2 "$here")" "$(field 3 "$here")"
[ "$(ev "return CFCamp.steerOf([[$case3]])" | field 1)" = unsteered ] || fail "case 3 should be unsteered (case 1's answers used, case 2's empty)"
[ "$(logged "Case shaped by the survivor's answers")" = 1 ] || fail "case 3 was logged as shaped by answers"
play_case "$case3" 2
[ "$PLAYED" = 2 ] || fail "case 3: only $PLAYED of 2 clues could be played"
stage "case 3, two clues"
record="$(ev 'return CFReload.record()')"; bytes_before="$(bytes)"; parts_before="$(ev 'return CFReload.bytes()' | cut -f2)"
perf_note "case 3"

# --- reload 2 ---------------------------------------------------------------
reload_world "reload 2"
[ "$(ev 'return CFReload.record()')" = "$record" ] || fail "reload 2: the record changed"
s3="$(ev "return CFCamp.steerOf([[$case3]])" | field 1)"   # "none" once case 3 has finished (a two-clue case can)
[ "$s3" = unsteered ] || [ "$s3" = none ] || fail "reload 2: case 3 gained a steer ($s3)"
[ "$(ev "return CFCamp.answersOf([[$case1]])" | field 5)" = "$case2" ] || fail "reload 2: case 1's answers lost their used mark"
old_settled "after reload 2"
stage "after reload 2"
reload_growth "reload 2" "$bytes_before" "$parts_before"
[ "$NAMES_NOW" -gt "$names_start" ] 2>/dev/null || fail "NAMES never grew across three cases ($names_start -> $NAMES_NOW)"
marks="$(ev 'return CFLoop.markers()')"
findings+=("map marks after reload 2 (written/pending/missing): $(tr '\t' '/' <<<"$marks")")
[ "$(field 2 "$marks")" = 0 ] || fail "reload 2: $(field 2 "$marks") map marks still pending with a pen in the pocket"

# --- the active limit ----------------------------------------------------------
ev 'return CFCamp.gap(false)' >/dev/null
q="$(cases)"; target=$(( $(field 2 "$q") + 4 ))
# A new case takes minutes to prepare (a nearby scan), so the limit gets time.
wait_case_count "$target" 1200 || findings+=("the fourth unfinished case did not arrive within twenty minutes: $(cases | tr '\t' ' ')")
q="$(cases)"; live=$(( $(field 1 "$q") - $(field 2 "$q") ))
stage "at the limit"
[ "$live" -le 4 ] || fail "$live unfinished cases at once; the save allows four"
sleep 90
prep="$(ev 'return CFCamp.preparing()')"
[ "$live" -lt 4 ] || [ "$(field 1 "$(cases)")" = "$(field 1 "$q")" ] || fail "a case was created while four were unfinished"
findings+=("after 90 s with $live unfinished: preparing=$(field 1 "$prep"), cases $(cases | tr '\t' ' ')")
finished_before="$(field 2 "$(cases)")"; count_before="$(field 1 "$(cases)")"
oldest="$(ev 'return CFCamp.oldestLive()' | field 1)"
play_case "$oldest"
wait_finished $((finished_before + 1)) || fail "the oldest unfinished case ${oldest#generated:} did not finish"
if wait_case_count $((count_before + 1)) 900; then
    findings+=("a new case came after a case was finished at the limit: $(cases | tr '\t' ' ')")
else
    fail "after a case was finished at the limit, no new case came within fifteen minutes (preparing=$(ev 'return CFCamp.preparing()' | field 1))"
fi
stage "after the limit"
perf_note "the limit"

errors_seen+="$(mod_errors)"
[ -z "$errors_seen" ] || fail "errors inside the mod"
"$PZ" shot "$RUNS/$first-campaign.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$first-campaign.txt"
{
    echo "Linux campaign check $first: $verdict"
    source_line
    echo "cases: 1 $case1, 2 ${case2:-none}, 3 ${case3:-none}; at the end $(cases | tr '\t' ' ')"
    echo "stages:"
    printf '  %s\n' "${stages[@]}"
    echo "case 1 answers on the organiser: $(tr '\t' ' ' <<<"$answers")"
    echo "case 2 steer: $(cut -f1-6 <<<"${steer2:-}" | tr '\t' ' ')"
    echo "errors inside the mod, all sessions: $(grep -c . <<<"$errors_seen")"
    [ -z "$errors_seen" ] || sed 's/^/  /' <<<"$errors_seen" | head -10
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
    echo "screenshot: dev/eval/linux/runs/$first-campaign.png (not committed)"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
