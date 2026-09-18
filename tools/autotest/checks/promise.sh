#!/usr/bin/env bash
# The generator's promise, and the poller's own silence (P4-R133,
# docs/design/CASE_PACING.md step 6).
#
#   tools/autotest/checks/promise.sh [--hidden]
#
# The campaign check reaches these states by playing for an hour. This reaches
# them in ten minutes, so the two assertions P4-R133 step 6 added can be run
# often and can be PROVEN to fail (tools/autotest/prove.py):
#
#   (a) EVERY SILENCE HAS A CODE. The poller had five silent returns, and
#       `automaticStatus().why` was nil in exactly the states a long save sits
#       in. Each of `gap` (our own wait between cases), `active-limit` (the
#       most unfinished cases a save allows) and `cap` (the most cases) is
#       provoked here - the last two by lowering the limit to what this world
#       already has, which is a harness knob on a shipped branch - and each
#       must produce a non-nil `why`, a counted or uncounted `ev=defer` line,
#       and no spurious failure from the promise.
#   (b) THE PROMISE. A refusal that means the world could not supply a case
#       (`no-containers`, `no-reach`, `cooldown`) carries the in-game hour a
#       case is promised by. Before that hour, "no case yet" is a finding;
#       past it, it is a failure. The survivor stands still in the building
#       case 1 emptied, which is the state that used to refuse silently for
#       seventeen polls in a row, and the promise must still stand.
#   (c) THE LADDER. Three refusals of one code earn a rung, up to MAX_RUNG. The
#       count must never walk past a threshold while the rung stands still.
#
# Real display, about ten minutes. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "promise: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); note() { findings+=("$*"); say "$*"; }
field() { if [ $# -ge 2 ]; then cut -f"$1" <<<"$2"; else cut -f"$1"; fi; }
CHECKS="$REPO/tools/autotest/checks"

promise() { ev 'return CFCamp.promise()'; }
promise_words() { # the same words the campaign check prints, so two reports compare
    printf 'why=%s n=%s due=%s rung=%s/%s now=%s overdue=%s(%sh) preparing=%s active=%s cases=%s' \
        "$(field 1 "$1")" "$(field 2 "$1")" "$(field 3 "$1")" "$(field 4 "$1")" "$(field 5 "$1")" \
        "$(field 6 "$1")" "$(field 7 "$1")" "$(field 8 "$1")" "$(field 9 "$1")" "$(field 10 "$1")" "$(field 11 "$1")"
}
# THE PROMISE (P4-R133). Identical in wording to campaign.sh's, deliberately:
# this is the same assertion, run cheaply, and prove.py must see the same text.
promise_broken() { # promise_broken LABEL
    local p why; p="$(promise)"; why="$(field 1 "$p")"
    case "$why" in
        no-containers|no-reach|cooldown) ;;
        *) note "$1: nothing was promised worth failing on ($(promise_words "$p"))"; return 1 ;;
    esac
    if [ "$(field 7 "$p")" = true ]; then
        fail "$1: the generator promised a case by $(field 3 "$p") and none came ($(promise_words "$p")); assignments $(ev 'return CFCamp.assignments()')"
        return 0
    fi
    note "$1: no case yet, but the promise still stands ($(promise_words "$p"))"
    return 1
}
ladder_climbed() { # ladder_climbed LABEL
    local l; l="$(ev 'return CFCamp.ladder()')"
    [ "$(field 1 "$l")" = true ] \
        || fail "$1: $(field 4 "$l") refusals of one code earn rung $(field 3 "$l") but the generator stands on $(field 2 "$l") (every $(field 5 "$l") refusals, up to $(field 6 "$l"))"
}
# Wait until the poller (or the generator) reports one of these codes.
wait_code() { # wait_code SECONDS CODE...
    local deadline=$(( $(date +%s) + $1 )); shift
    while [ "$(date +%s)" -lt "$deadline" ]; do
        local why; why="$(promise | field 1)"
        for want in "$@"; do [ "$why" = "$want" ] && return 0; done
        sleep 3
    done
    return 1
}
logged_code() { run_log | grep -c "ev=defer why=$1" || true; }

claim_game || exit 2
start_cold "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
for f in core_loop reload campaign pacing promise; do
    ev -f "$CHECKS/$f.lua" >/dev/null || abort "could not load $f.lua"
done
wait_true 120 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
wait_true 180 'select(1, CFCamp.cases())>=1' || abort "no first case"
# EVERY refusal, not only the counted ones: `gap`, `cooldown` and `busy` are
# written at debug level (they are our own pacing, and at info they would be a
# line every ten seconds), so the log has to be turned up to see them at all.
note "log level set to $(ev 'return ConspiracyFiles.logLevel("d")' | field 1) for this run, so the uncounted refusals reach the console too"
note "limits as shipped: MAX_ACTIVE=$(ev 'return CFProm.limits()' | field 1), MAX_CASES=$(ev 'return CFProm.limits()' | field 2); this world holds $(ev 'return CFProm.limits()' | field 3) unfinished of $(ev 'return CFProm.limits()' | field 4) cases"
note "at the start: $(promise_words "$(promise)")"

# --- (a1) the gap: our own wait between cases -------------------------------
g="$(ev 'return CFProm.gapHours(999, 999)')"
note "the gap between cases set to $(field 1 "$g") in-game hours, so the poll cannot get past it by accident"
if wait_code 150 gap; then
    p="$(promise)"
    note "gap: $(promise_words "$p")"
    w="$(ev 'return CFProm.why()')"
    [ "$(field 1 "$w")" = true ] || fail "the poller waited for the gap and automaticStatus().why was still nil"
    [ "$(field 3 "$p")" != "-" ] || fail "the gap refusal promised no hour (due=$(field 3 "$p"))"
    [ "$(logged_code gap)" -ge 1 ] 2>/dev/null || fail "no ev=defer why=gap line was logged while the gap was 999 hours"
    note "ev=defer why=gap lines in the log: $(logged_code gap)"
    promise_broken "gap" && fail "the gap - our own wait, not the world - was counted as a broken promise"
else
    fail "the poller never reported why=gap with a 999 hour gap between cases ($(promise_words "$(promise)"))"
fi

# --- (a2) the active limit, the state a long save sits in --------------------
s="$(ev 'return CFProm.squeezeActive()')"
note "MAX_ACTIVE lowered from $(field 2 "$s") to $(field 3 "$s"), which is what this world already has unfinished"
ev 'return CFProm.gapHours(0, 0)' >/dev/null
if wait_code 150 active-limit; then
    p="$(promise)"; w="$(ev 'return CFProm.why()')"
    note "active-limit: $(promise_words "$p")"
    [ "$(field 1 "$w")" = true ] || fail "the poller refused at the active limit and automaticStatus().why was still nil"
    [ "$(field 4 "$w")" = "$(ev 'return CFProm.limits()' | field 3)/$(ev 'return CFProm.limits()' | field 1)" ] \
        || note "active reads $(field 4 "$w") at the moment of asking"
    [ "$(logged_code active-limit)" -ge 1 ] 2>/dev/null || fail "no ev=defer why=active-limit line was logged at the active limit"
    note "ev=defer why=active-limit lines in the log: $(logged_code active-limit)"
    promise_broken "active-limit" && fail "the active limit was counted as a broken promise"
    ladder_climbed "active-limit"
else
    fail "the poller never reported why=active-limit with MAX_ACTIVE at $(field 3 "$s") ($(promise_words "$(promise)"))"
fi

# --- (a3) the cap on cases in one save --------------------------------------
c="$(ev 'return CFProm.squeezeCap()')"
note "MAX_CASES lowered from $(field 2 "$c") to $(field 3 "$c"), which is what this save already holds"
if wait_code 120 cap; then
    note "cap: $(promise_words "$(promise)")"
    [ "$(ev 'return CFProm.why()' | field 1)" = true ] || fail "the poller refused at the cap and automaticStatus().why was still nil"
    [ "$(logged_code cap)" -ge 1 ] 2>/dev/null || fail "no ev=defer why=cap line was logged at the cap"
    promise_broken "cap" && fail "the cap was counted as a broken promise"
else
    note "the poller did not report why=cap within 150 s ($(promise_words "$(promise)")); the limit before it was still standing"
fi
r="$(ev 'return CFProm.restore()')"
note "limits restored: MAX_ACTIVE=$(field 2 "$r"), MAX_CASES=$(field 3 "$r")"

# --- (b) and (c): the promise and the ladder, where the world refuses --------
# The survivor stays in the building case 1 emptied and time runs fast: that is
# the state that used to refuse seventeen times in a row without explanation,
# and the state the ladder was built for. A counted refusal needs a quarter of
# an in-game hour between it and the last one, so time is what this stage
# spends rather than tiles.
ev 'return CFPace.speed(4)' >/dev/null
note "time set to the fastest speed at in-game hour $(ev 'return CFPace.hours()' | field 1), the survivor standing where case 1 was played"
if wait_code 240 no-containers no-reach cooldown; then
    note "the world refused: $(promise_words "$(promise)")"
    deadline=$(( $(date +%s) + 240 ))
    until [ "$(promise | field 2)" -ge 3 ] 2>/dev/null; do
        [ "$(date +%s)" -lt "$deadline" ] || break
        sleep 5
    done
    p="$(promise)"
    note "after waiting for the count to climb: $(promise_words "$p")"
    if [ "$(field 2 "$p")" -ge 3 ] 2>/dev/null; then
        ladder_climbed "the ladder"
        note "the ladder: $(field 2 "$p") refusals of one code, rung $(field 4 "$p") of $(field 5 "$p")"
    else
        note "only $(field 2 "$p") counted refusal(s) in four minutes of fast time, so the ladder's threshold was not reached; the assertion is vacuous in this run"
        ladder_climbed "the ladder"
    fi
    promise_broken "the promise" || true
else
    note "the world supplied cases instead of refusing in four minutes ($(promise_words "$(promise)")), so neither the promise nor the ladder was exercised"
fi
ev 'return CFPace.speed(1)' >/dev/null
note "at the end: $(promise_words "$(promise)"); cases $(ev 'return CFCamp.cases()' | tr '\t' ' ')"

# The engine's own cell-loader complaints about base-game tiles are not ours
# (carriers.sh, 20260918T001512).
engine="$(mod_errors | grep -cE "CellLoader|missing tile" || true)"; is_number "$engine" || engine=0
ours="$(mod_errors | grep -vE "CellLoader|missing tile" || true)"
thrown="$(grep -c . <<<"$ours")"; is_number "$thrown" || thrown=0
[ "$engine" = 0 ] || note "$engine error(s) from the game's own cell loader, not from the mod"
[ "$thrown" = 0 ] || fail "$thrown errors inside the mod: $(head -3 <<<"$ours")"

"$PZ" shot "$RUNS/$id-promise.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1
verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-promise.txt"
{
    echo "Linux promise check $id: $verdict"
    source_line
    echo "refusals logged, by code:"
    run_log | grep -o 'ev=defer why=[^ ]* n=[0-9]* rung=[0-9]*' | sort | uniq -c | sed 's/^/  /' || echo "  none"
    echo "errors inside the mod: $thrown"
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
