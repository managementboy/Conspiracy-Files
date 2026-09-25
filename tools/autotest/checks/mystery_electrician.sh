#!/usr/bin/env bash
# THE FIRST MYSTERY WRITTEN DIRECTLY IN THE VOCABULARY, PROVEN LIVE.
#
#   tools/autotest/checks/mystery_electrician.sh
#
# docs/design/ENGINE_REDESIGN_ITERATIONS_2026-09-25.md, build plan step 4.
# The electrician's "unsigned repair": two findings placed and recognised
# by picking them up, a GATE that is a real skill threshold (mechanically
# nothing like the legacy engine's door-key comparison), CLOSE reporting
# "completed" only once the GATE's own finding is known. Runs entirely
# through MysteryRuntime.lua, a separate module from the legacy generator -
# this check never touches GeneratedRuntime, Session or the scheduler.
#
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
cf_main() {
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "mystery-electrician: $*" >&2; }
fails=(); rows=()
fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }

claim_game || exit 2
cf_pin_source
start_world || { say "world did not start"; exit 2; }
id="$(session)"
ev -f "$REPO/tools/autotest/checks/mystery_electrician.lua" >/dev/null || { say "fixtures did not load"; exit 2; }

# 1. ATTACH: a valid, linted mystery attaches to the save.
attach="$(ev 'return CFMyst.attach()')"
rows+=("attach: $(tr '\t' ' ' <<<"$attach")")
say "${rows[-1]}"
[ "$(f 1 <<<"$attach")" = true ] || { say "the mystery would not attach: $attach"; exit 2; }

status0="$(ev 'return CFMyst.status()')"
rows+=("status before anything is known: $status0")
say "${rows[-1]}"
[ "$status0" = carried ] || fail "an unattempted mystery must report carried, not $status0"

# 2. PLACE: real findings, in real containers, near the survivor.
place="$(ev 'return CFMyst.place()')"
rows+=("place: $(tr '\t' ' ' <<<"$place")")
say "${rows[-1]}"
[ "$(f 1 <<<"$place")" = true ] && [ "$(f 2 <<<"$place")" -ge 1 ] 2>/dev/null \
    || fail "no findings were placed near the survivor: $place"

# 3. RECOGNISE: picking the marked items up records them known.
collected="$(ev 'return CFMyst.collect()')"
rows+=("collected: $collected marked item(s)")
say "${rows[-1]}"
sleep 1
ev 'return CFMyst.poll()' >/dev/null
record1="$(ev 'return CFMyst.record()')"
rows+=("record after collecting: $record1")
say "${rows[-1]}"
[ -n "$record1" ] || fail "nothing is visible on the record after collecting the findings"

status1="$(ev 'return CFMyst.status()')"
rows+=("status after collecting, before the gate: $status1")
say "${rows[-1]}"
[ "$status1" = carried ] || fail "the mystery must still be carried before its gate is satisfied, not $status1"

# 4. THE GATE: a real, provable skill threshold, mechanically distinct from
#    the legacy engine's door-key comparison.
setskill="$(ev "return CFMyst.setSkill(${CF_MYSTERY_SKILL:-2})")"
rows+=("skill set: $(tr '\t' ' ' <<<"$setskill")")
say "${rows[-1]}"
ev 'return CFMyst.poll()' >/dev/null
status2="$(ev 'return CFMyst.status()')"
rows+=("status after the gate: $status2")
say "${rows[-1]}"
[ "$status2" = completed ] || fail "the mystery must complete once its gate is satisfied, got $status2"

record2="$(ev 'return CFMyst.record()')"
rows+=("record after the gate: $record2")
say "${rows[-1]}"
grep -qi "trade electrician" <<<"$record2" || fail "the panel's own reveal never reached the record: $record2"

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $errors"
end_world

verdict=PASS
[ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-mystery-electrician.txt"
{
    echo "Linux mystery (electrician, unsigned repair) $id: $verdict"
    source_line
    printf '  %s\n' "${rows[@]}"
    echo
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
}
cf_main "$@"
