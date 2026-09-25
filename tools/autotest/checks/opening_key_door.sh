#!/usr/bin/env bash
# Does using the opening key on a door it fits record a finding?
#
#   tools/autotest/checks/opening_key_door.sh
#
# Reconciles the 2026-09-23 Linux report (two keys opened none of the tested
# doors, every door reporting keyId -1) with the 2026-09-24 Windows playtest
# (the key opened the current house, nothing recorded). Those are different
# questions - an id comparison and a door interaction - so this asks both and
# prints them side by side.
#
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
cf_main() {
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "keydoor: $*" >&2; }
fails=(); notrun=(); rows=()
fail() { fails+=("$*"); say "FAIL: $*"; }
skip() { notrun+=("$*"); say "NOT EXERCISED: $*"; }
f() { cut -f"$1"; }

claim_game || exit 2
cf_pin_source
start_world || { say "world did not start"; exit 2; }
id="$(session)"
ev -f "$REPO/tools/autotest/checks/core_loop.lua" >/dev/null || { say "core_loop did not load"; exit 2; }
ev -f "$REPO/tools/autotest/checks/profession_openings.lua" >/dev/null || { say "profession fixtures did not load"; exit 2; }
ev -f "$REPO/tools/autotest/checks/fitness_world_opening.lua" >/dev/null || { say "fitness fixtures did not load"; exit 2; }
ev -f "$REPO/tools/autotest/checks/opening_key_door.lua" >/dev/null || { say "check fixtures did not load"; exit 2; }

became="$(ev 'return CFProf.become([[fitnessinstructor]])')"
[ "$(f 1 <<<"$became")" = true ] || { say "could not become a fitness instructor"; exit 2; }

budget="${CF_FIRST_CASE_WAIT:-2400}"; deadline=$(( $(date +%s) + budget )); ready=0
while [ "$(date +%s)" -lt "$deadline" ]; do
    [ "$(ev 'return CFFit.opening()' | f 1)" != "no-case" ] && { ready=1; break; }
    sleep 10
done
[ "$ready" = 1 ] || { skip "the first case never arrived: $(ev 'return CFFit.why()')"; }

if [ "$ready" = 1 ]; then
    census="$(ev 'return CFKeyDoor.census()')"
    rows+=("id comparison (what the Linux check measured): $(tr '\t' ' ' <<<"$census")")
    say "${rows[-1]}"

    before="$(ev 'return CFKeyDoor.rows()')"
    used="$(ev 'return CFKeyDoor.useKeyOnDoor()')"
    rows+=("interaction queued: $(tr '\t' ' ' <<<"$used")")
    say "${rows[-1]}"
    sleep 6
    opened="$(ev 'return CFKeyDoor.doorOpen()')"
    after="$(ev 'return CFKeyDoor.rows()')"
    rows+=("door opened: $opened; key-door observations before=$before after=$after")
    say "${rows[-1]}"
    # The survivor's word, read NOW: the reload below starts a new game
    # session and the console with it, so a grep afterwards is blind
    # (20260925T080855). A line fired within the hold of the opening line
    # queues behind it and is said a few seconds later (PlayerVoice.speak).
    spoken=no
    for _ in $(seq 30); do
        run_log | grep -q "said .The lock turned" && { spoken=yes; break; }
        sleep 1
    done
    voice_note="$(run_log | grep -o "msg=\"[a-z]* .The lock turned[^\"]*" | tail -1)"

    # Reload, because the requirement is that it stays visible.
    world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
    "$PZ" stop --save >/dev/null 2>&1
    if "$PZ" start --continue "$world" >/dev/null 2>&1 \
        && ev -f "$REPO/tools/autotest/checks/opening_key_door.lua" >/dev/null; then
        reloaded="$(ev 'return CFKeyDoor.rows()')"
        rows+=("after reload: $reloaded key-door observation(s)")
        say "${rows[-1]}"
        [ "${reloaded:-0}" = "${after:-0}" ] || fail "the observation did not survive a reload ($after -> $reloaded)"
    else
        skip "the saved game did not reload"
    fi

    text="$(ev 'return CFKeyDoor.rowText()')"
    rows+=("record: $text")
    if [ "${after:-0}" -gt "${before:-0}" ] 2>/dev/null; then
        grep -qi "cut for this door\|fits" <<<"$text" || fail "the record does not state that the key fits"
        for claim in "belonged to" "my house" "the owner" "lived here"; do
            grep -qi "$claim" <<<"$text" && fail "the record infers ownership: $claim"
        done
        # The row's place and the survivor's word (owner, Windows 2026-09-25:
        # FOUND read "I didn't note where I was"; nothing was said).
        place="$(ev 'return CFKeyDoor.filesPlace()')"
        rows+=("FILES place: $(f 1 <<<"$place"); FOUND line: $(f 2 <<<"$place")")
        say "${rows[-1]}"
        [ -n "$(f 1 <<<"$place")" ] && [ "$(f 1 <<<"$place")" != nil ] || fail "the key-door row has no place in FILES"
        grep -q "I found it at" <<<"$(f 2 <<<"$place")" || fail "FOUND does not name where the lock turned: $(f 2 <<<"$place")"
        if [ "$spoken" = yes ]; then rows+=("voice: the survivor said the lock turned")
        else fail "nothing was said when the lock turned in 30 s: ${voice_note:-no voice line at all}"; fi
    elif [ "$opened" = "true" ]; then
        fail "the door opened and nothing was recorded"
    else
        skip "the door did not open, so recording was not exercised"
    fi
fi

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod"
"$PZ" stop >/dev/null 2>&1
verdict=PASS
[ "$ready" = 1 ] || verdict="COULD NOT RUN"
[ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-opening-key-door.txt"
{
    echo "Linux opening key door check $id: $verdict"
    source_line
    printf '  %s\n' "${rows[@]}"
    echo
    for x in "${notrun[@]}"; do echo "NOT EXERCISED: $x"; done
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
    [ -z "$errors" ] || sed 's/^/  /' <<<"$errors" | head -10
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
case "$verdict" in PASS) exit 0 ;; FAIL) exit 1 ;; *) exit 2 ;; esac
}
cf_main "$@"
