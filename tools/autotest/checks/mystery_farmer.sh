#!/usr/bin/env bash
# THE SECOND HAND-AUTHORED MYSTERY, PROVEN LIVE.
#
#   tools/autotest/checks/mystery_farmer.sh
#
# Phase E of the active goal. The farmer's "recalled delivery": a heard
# PRIMARY finding recognised through MysteryRuntime.hear() (never a debug
# ledger flip - the attacker frame's Phase E finding that flipping ledger
# state directly "certifies a UI/state change rather than a real
# mystery"), an "answer" GATE proven to refuse firing until its own
# precondition finding is genuinely known even when the survivor's answer
# is given FIRST, and CLOSE reporting "carried" throughout - the first
# native proof of that ending shape against a real authored mystery.
#
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
cf_main() {
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "mystery-farmer: $*" >&2; }
fails=(); rows=()
fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }

claim_game || exit 2
cf_pin_source
start_world || { say "world did not start"; exit 2; }
id="$(session)"
ev -f "$REPO/tools/autotest/checks/mystery_farmer.lua" >/dev/null || { say "fixtures did not load"; exit 2; }

# 1. ATTACH: a valid, linted mystery attaches to the save.
attach="$(ev 'return CFMyst.attach()')"
rows+=("attach: $(tr '\t' ' ' <<<"$attach")")
say "${rows[-1]}"
[ "$(f 1 <<<"$attach")" = true ] || { say "the mystery would not attach: $attach"; exit 2; }

status0="$(ev 'return CFMyst.status()')"
rows+=("status before anything is known: $status0")
say "${rows[-1]}"
[ "$status0" = carried ] || fail "an unattempted close=nil mystery must report carried, not $status0"

# 2. PLACE + RECOGNISE the site finding, same channel mystery_electrician
#    already proved.
place="$(ev 'return CFMyst.place()')"
rows+=("place: $(tr '\t' ' ' <<<"$place")")
say "${rows[-1]}"
[ "$(f 1 <<<"$place")" = true ] && [ "$(f 2 <<<"$place")" -ge 1 ] 2>/dev/null \
    || fail "the slip was never placed near the survivor: $place"

collected="$(ev 'return CFMyst.collect()')"
rows+=("collected: $collected marked item(s)")
say "${rows[-1]}"
ev 'return CFMyst.poll()' >/dev/null
record1="$(ev 'return CFMyst.record()')"
rows+=("record after collecting the slip: $record1")
say "${rows[-1]}"
grep -qi "one date never filled in" <<<"$record1" || fail "the slip's own reveal never reached the record: $record1"
grep -qi "own reading" <<<"$record1" && fail "the answer's reveal appeared before the rumour was ever heard: $record1"

# 3. THE ATTACK, PROVEN CLOSED: give the answer BEFORE the rumour is ever
#    heard. The attacker frame's finding is that this must commit nothing
#    real - the GATE must still refuse to fire.
giveanswer="$(ev 'return CFMyst.giveAnswer("reading")')"
rows+=("answer given before the rumour was heard: $giveanswer")
say "${rows[-1]}"
ev 'return CFMyst.poll()' >/dev/null
record2="$(ev 'return CFMyst.record()')"
rows+=("record after answering with no precondition met: $record2")
say "${rows[-1]}"
grep -qi "own reading" <<<"$record2" && fail "the answer GATE fired with its precondition finding never known - it certified nothing real"

status1="$(ev 'return CFMyst.status()')"
rows+=("status after the premature answer: $status1")
say "${rows[-1]}"
[ "$status1" = carried ] || fail "status must stay carried, not $status1"

# 4. NOW hear the rumour for real, through the runtime's own second-channel
#    primitive - not a ledger flip.
hear="$(ev 'return CFMyst.hear("rumour")')"
rows+=("hear(rumour): $(tr '\t' ' ' <<<"$hear")")
say "${rows[-1]}"
[ "$(f 1 <<<"$hear")" = true ] || fail "the rumour could not be heard: $hear"
ev 'return CFMyst.poll()' >/dev/null

record3="$(ev 'return CFMyst.record()')"
rows+=("record after the rumour is heard: $record3")
say "${rows[-1]}"
grep -qi "same week" <<<"$record3" || fail "the redHerring link's own reveal never reached the record: $record3"
grep -qi "own reading" <<<"$record3" || fail "the answer already given should fire now that its precondition is finally known: $record3"

status2="$(ev 'return CFMyst.status()')"
rows+=("status once every finding is known: $status2")
say "${rows[-1]}"
[ "$status2" = carried ] || fail "a close=nil mystery must report carried no matter what becomes known, not $status2"

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $errors"
end_world

verdict=PASS
[ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-mystery-farmer.txt"
{
    echo "Linux mystery (farmer, recalled delivery) $id: $verdict"
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
