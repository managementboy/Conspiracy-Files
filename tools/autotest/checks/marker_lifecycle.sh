#!/usr/bin/env bash
# THE INVESTIGATE AREA MARKER'S LIFE, in a real game.
#
#   tools/autotest/checks/marker_lifecycle.sh [--hidden]
#
# Three questions, and only a running game can answer them:
#   1. the marker is there while Investigate Area is on and the clue unfound;
#   2. RECOGNISING the clue does not take it away - naming the evidence must
#      not erase its locator, because the player may still have to search the
#      room to find the thing (e35ad6d);
#   3. INSPECTING it does take it away, and toggling the mode off and on while
#      the clue is still unresolved brings it back.
#
# Offline, test/clue_search_rules covers the rule. This covers the game.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
# One function, so editing this file mid-run cannot kill the run. See
# campaign.sh for what that cost twice.
cf_main() {
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "marker: $*" >&2; }
fails=(); notrun=(); rows=()
fail() { fails+=("$*"); say "FAIL: $*"; }
skip() { notrun+=("$*"); say "NOT EXERCISED: $*"; }
field() { if [ $# -ge 2 ]; then cut -f"$1" <<<"$2"; else cut -f"$1"; fi; }

claim_game || exit 2
start_world "${start_args[@]}" || { say "world did not start"; exit 2; }
first="$(session)"
ev -f "$REPO/tools/autotest/checks/core_loop.lua" >/dev/null || { say "core_loop fixture"; exit 2; }
ev -f "$REPO/tools/autotest/checks/clue_search.lua" >/dev/null || { say "clue_search fixture"; exit 2; }
ev -f "$REPO/tools/autotest/checks/marker_lifecycle.lua" >/dev/null || { say "marker fixture"; exit 2; }

[ "$(ev 'return CFMark.noLinger()')" = true ] \
    || fail "ClueSearchRules.LINGER_MS is back: a recognised clue's marker would be dropped on a timer again"

wait_true 600 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || { say "no case"; exit 2; }
wait_true 900 'CFClue.clues()~="" ' >/dev/null 2>&1 || true
if [ "$(ev 'return CFClue.pick(1)' | field 1)" != true ]; then
    skip "no placed clue could be picked, so no marker can be observed"
else
    ev 'return CFClue.approach()' >/dev/null
    wait_true 120 'CFClue.loaded()' >/dev/null || true
    ev 'return CFClue.setFocus("Clues")' >/dev/null
    ev 'return CFClue.searchOn()' >/dev/null
    sleep 3

    # 1. present while the mode is on and the clue unfound
    a="$(ev 'return CFMark.hasIcon()')"; w="$(ev 'return CFMark.wants()')"
    rows+=("with Investigate Area on, before recognition: icon=$(field 1 "$a") rule=$(field 1 "$w") status=$(field 2 "$w") recognised=$(field 3 "$w") resolved=$(field 4 "$w")")
    [ "$(field 1 "$a")" = true ] || fail "no marker while Investigate Area is on and the clue is unfound (rule says $(field 1 "$w"))"

    # 2. recognition must NOT remove it
    if wait_true 90 'CFClue.recognised()' >/dev/null; then
        sleep 10   # longer than the old 8 s linger, which is the point
        b="$(ev 'return CFMark.hasIcon()')"; w2="$(ev 'return CFMark.wants()')"
        rows+=("ten seconds after recognition: icon=$(field 1 "$b") rule=$(field 1 "$w2") recognised=$(field 3 "$w2") resolved=$(field 4 "$w2")")
        [ "$(field 1 "$b")" = true ] \
            || fail "the marker vanished after recognition; naming the evidence must not erase its locator (rule says $(field 1 "$w2"), resolved=$(field 4 "$w2"))"
    else
        skip "the game never spotted the clue, so recognition-keeps-the-marker was not exercised"
    fi

    # 3a. toggling the mode off and on brings it back while still unresolved
    ev 'return CFClue.searchOff()' >/dev/null; sleep 2
    off="$(ev 'return CFMark.hasIcon()')"
    rows+=("with Investigate Area off: icon=$(field 1 "$off")")
    [ "$(field 1 "$off")" = false ] || fail "the marker is still there with Investigate Area off"
    ev 'return CFClue.searchOn()' >/dev/null; sleep 3
    back="$(ev 'return CFMark.hasIcon()')"; w3="$(ev 'return CFMark.wants()')"
    rows+=("after toggling back on, still unresolved: icon=$(field 1 "$back") rule=$(field 1 "$w3") resolved=$(field 4 "$w3")")
    if [ "$(field 4 "$w3")" = true ]; then
        skip "the clue was already resolved by the time the mode was toggled, so reappear-while-unresolved was not exercised"
    else
        [ "$(field 1 "$back")" = true ] || fail "the marker did not come back after toggling Investigate Area on while the clue is still unresolved"
    fi

    # 3b. inspecting it does remove it
    if out="$(note_carried 2>/dev/null)" || inspect_doc 1 >/dev/null 2>&1; then
        sleep 4
        c="$(ev 'return CFMark.hasIcon()')"; w4="$(ev 'return CFMark.wants()')"
        rows+=("after inspection: icon=$(field 1 "$c") rule=$(field 1 "$w4") resolved=$(field 4 "$w4")")
        if [ "$(field 4 "$w4")" = true ]; then
            [ "$(field 1 "$c")" = false ] || fail "the marker survived inspection; a resolved clue must lose its locator"
        else
            skip "inspection did not resolve the clue in the runtime's own row, so marker-removal-on-inspection was not exercised"
        fi
    else
        skip "the clue could not be inspected, so marker-removal-on-inspection was not exercised"
    fi
fi

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod"
"$PZ" stop >/dev/null 2>&1
verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$first-marker-lifecycle.txt"
{
    echo "Linux Investigate Area marker lifecycle: $verdict"
    source_line
    echo "outcome: ${#fails[@]} failure(s), ${#notrun[@]} stage(s) not exercised"
    printf '  %s\n' "${rows[@]}"
    for f in "${notrun[@]}"; do echo "NOT EXERCISED: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
}
cf_main "$@"
