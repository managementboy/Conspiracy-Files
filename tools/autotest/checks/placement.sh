#!/usr/bin/env bash
# THE PLACEMENT MISMATCH, on its own. A clue the record calls `placed` that is
# not in the container the record names: seen in three of nine overnight runs,
# never reproduced, never explained.
#
#   tools/autotest/checks/placement.sh [--worlds N]
#
# One thing, short, and it captures rather than concludes. For each world:
#   1. a cold start, one case, wait until every clue is placed;
#   2. stand beside each placed clue in turn so its containers load;
#   3. ask whether the container really holds it - and at the FIRST clue that
#      says no, dump everything in ONE evaluation, before any tick can relocate,
#      retry or drop it;
#   4. then save, reload, and ask about that exact clue again, so the shell can
#      say whether the discrepancy persists or was a loading artefact.
#
# THREE FAILURES ARE KEPT APART and never totalled together (P4-R141):
#   placed-absent  the fault under investigation;
#   never-placed   deferred or dropped - never in the world, and the record says
#                  so honestly (P4-R133);
#   carrier-gone   the clue WAS out there and its container walked away.
#
# A clue in the survivor's own bags is not a discrepancy: it was picked up. That
# false alarm is the one this check is most likely to produce, so it is excluded
# explicitly rather than filtered afterwards.
#
# Real display only. About four minutes a world.
# Exit 0 no discrepancy observed (NOT proof of absence), 1 one captured,
# 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "placement: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }
CHECKS="$REPO/tools/autotest/checks"

WORLDS=3
[ "${1:-}" = "--worlds" ] && { WORLDS="${2:-3}"; shift 2; }

# NOT abort(): abort stops the game, and on a lock failure the game running is
# SOMEONE ELSE'S RUN. Stopping it would destroy the very thing the lock protects.
claim_game || { say "another run holds the machine - leaving it alone"; exit 2; }

load_lua() {
    ev -f "$CHECKS/core_loop.lua" >/dev/null && ev -f "$CHECKS/placement.lua" >/dev/null
}

# Wait until every clue of the case has a container, or the deadline passes. A
# clue that never gets one is `never-placed` and is NOT what this check hunts,
# so it is reported and stepped over rather than failing the run.
settle() {
    local deadline=$(( $(date +%s) + 300 )) c
    while :; do
        c="$(ev 'return CFPlace.clues()')"
        [ "$(f 2 <<<"$c")" = 0 ] 2>/dev/null && [ "$(f 1 <<<"$c")" -gt 0 ] 2>/dev/null && { echo "$c"; return 0; }
        [ "$(date +%s)" -lt "$deadline" ] || { echo "$c"; return 1; }
        sleep 3
    done
}

captured=0
for world in $(seq 1 "$WORLDS"); do
    say "world $world of $WORLDS: cold start"
    start_cold || { fail "world $world would not start"; continue; }
    load_lua || { fail "world $world: the check's Lua would not load"; "$PZ" stop >/dev/null 2>&1; continue; }

    if ! counts="$(settle)"; then
        say "world $world: placement never settled ($counts) - stepping over, this is not the fault"
    fi
    say "world $world: placed=$(f 1 <<<"$counts") pending=$(f 2 <<<"$counts") never-placed=$(f 3 <<<"$counts") carrier=$(f 4 <<<"$counts") unknown-history=$(f 5 <<<"$counts")"

    ids="$(ev 'return CFPlace.placedIds()')"
    [ -n "$ids" ] || { say "world $world: no placed clue to check"; "$PZ" stop >/dev/null 2>&1; continue; }

    # Stand beside each clue, wait for ITS square, and verify only THAT clue.
    # verify() takes the id for exactly this reason: every other clue sits in an
    # unloaded cell at that moment and would resolve to nothing, so a
    # walk-them-all verify would have produced a confident dump about a clue
    # nobody had gone to look at.
    result=""; bad=""
    for id in $ids; do
        ev "return CFPlace.teleportTo('$id')" >/dev/null
        wait_true 40 'CFPlace.loaded()=="true"' >/dev/null \
            || { say "  $id: the survivor's square never loaded"; continue; }
        sleep 2
        r="$(ev "return CFPlace.verify('$id')")"
        case "$(sed -n '1p' <<<"$r" | f 1)" in
            none)     say "  $id: in its container" ;;
            unloaded) say "  $id: its target square is not loaded - no verdict" ;;
            in-hand)  say "  $id: the survivor is carrying it - not a fault" ;;
            skipped)  say "  $id: not a placed clue ($(sed -n '1p' <<<"$r" | f 2))" ;;
        esac
        if [ "$(sed -n '1p' <<<"$r" | f 1)" = "DISCREPANCY" ]; then result="$r"; bad="$id"; break; fi
    done

    if [ -z "$bad" ]; then
        say "world $world: no placed clue absent from its own loaded container"
        "$PZ" stop >/dev/null 2>&1
        continue
    fi

    captured=$((captured + 1))
    say "world $world: CAPTURED a discrepancy on $bad"
    echo "$result" | sed 's/^/    /' >&2

    # Does it survive a real save and reload? Every outcome is its own verdict.
    # The first version called a retired case, a clue in the bag and an unloaded
    # square all "STILL absent", which would have reported the fault persisting
    # in three situations where it had not.
    say "world $world: saving and reloading to test persistence of $bad"
    if ! "$PZ" stop --save >/dev/null 2>&1; then fail "could not save world $world"; continue; fi
    if ! "$PZ" start --continue >/dev/null 2>&1; then fail "could not reload world $world"; continue; fi
    load_lua || { fail "the check's Lua would not load after the reload"; continue; }
    sleep 5
    ev "return CFPlace.teleportTo('$bad')" >/dev/null
    wait_true 40 'CFPlace.loaded()=="true"' >/dev/null || say "  the square did not load after the reload"
    sleep 2
    again="$(ev "return CFPlace.recheck('$bad')")"
    case "$(sed -n '1p' <<<"$again" | f 1)" in
        holds)    say "world $world: after the reload the container HOLDS it - the discrepancy did not persist" ;;
        absent)   say "world $world: after the reload it is STILL absent - the discrepancy PERSISTS" ;;
        in-hand)  say "world $world: after the reload the survivor is carrying it - not the fault" ;;
        unloaded) say "world $world: after the reload its square is not loaded - NO verdict on persistence" ;;
        retired)  say "world $world: after the reload the case has retired - no verdict, and not the fault" ;;
        gone)     say "world $world: after the reload there is no assignment for it - no verdict" ;;
        *)        say "world $world: unrecognised recheck result" ;;
    esac
    echo "$again" | sed 's/^/    /' >&2
    "$PZ" stop >/dev/null 2>&1
done

errs="$(mod_error_count 2>/dev/null || echo 0)"
[ "$errs" = 0 ] || fail "the mod logged $errs error(s)"

say "---"
say "worlds: $WORLDS    discrepancies captured: $captured    mod errors: $errs"
if [ "${#fails[@]}" -gt 0 ]; then
    for x in "${fails[@]}"; do say "FAIL: $x"; done
fi
if [ "$captured" -gt 0 ]; then
    say "A discrepancy was captured. The dump above is the evidence; nothing is concluded from it here."
    exit 1
fi
say "No discrepancy observed in $WORLDS world(s). THIS IS NOT PROOF OF ABSENCE:"
say "the fault appeared in three of nine overnight runs, so a handful of clean"
say "worlds is consistent with it still being there."
[ "${#fails[@]}" -gt 0 ] && exit 1
exit 0
