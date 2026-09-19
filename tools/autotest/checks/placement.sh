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

captured=0; inconclusive=0; partial=0; compared_total=0; placed_total=0
for world in $(seq 1 "$WORLDS"); do
    say "world $world of $WORLDS: cold start"
    start_cold || { fail "world $world would not start"; continue; }
    load_lua || { fail "world $world: the check's Lua would not load"; "$PZ" stop >/dev/null 2>&1; continue; }

    if ! counts="$(settle)"; then
        say "world $world: placement never settled ($counts) - stepping over, this is not the fault"
    fi
    say "world $world: placed=$(f 1 <<<"$counts") pending=$(f 2 <<<"$counts") never-placed=$(f 3 <<<"$counts") carrier=$(f 4 <<<"$counts") unknown-history=$(f 5 <<<"$counts")"

    ev 'return CFPlace.resetCoverage()' >/dev/null
    ids="$(ev 'return CFPlace.placedIds()')"
    total=0; for _ in $ids; do total=$((total+1)); done
    if [ "$total" = 0 ]; then
        # NOT a clean world. Nothing was compared, so nothing is known.
        say "world $world: INCONCLUSIVE - no placed clue to check at all"
        inconclusive=$((inconclusive+1))
        "$PZ" stop >/dev/null 2>&1
        continue
    fi

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

    cov="$(ev 'return CFPlace.coverage()')"
    compared="$(f 1 <<<"$cov")"
    say "world $world: coverage - compared=$compared of $total placed (unloaded=$(f 2 <<<"$cov") in-hand=$(f 3 <<<"$cov") skipped=$(f 4 <<<"$cov") missing=$(f 5 <<<"$cov"))"

    if [ -z "$bad" ]; then
        # A CLEAN RESULT MEANS NOTHING WITHOUT A COMPARISON. No ids, or every
        # clue unloaded or skipped, used to end here as "no discrepancy" and
        # exit 0 - a diagnostic clearing a world it never examined.
        if [ "${compared:-0}" -eq 0 ] 2>/dev/null; then
            say "world $world: INCONCLUSIVE - not one container was compared"
            inconclusive=$((inconclusive+1))
        else
            compared_total=$((compared_total + compared))
            placed_total=$((placed_total + total))
            if [ "$compared" -lt "$total" ]; then
                say "world $world: PARTIAL - $compared of $total placed clues compared; the rest gave no verdict"
                partial=$((partial+1))
            else
                say "world $world: no placed clue absent from its own loaded container ($compared of $total compared)"
            fi
        fi
        "$PZ" stop >/dev/null 2>&1
        continue
    fi
    compared_total=$((compared_total + compared))
    placed_total=$((placed_total + total))

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
        changed)  say "world $world: after the reload it is no longer a placed clue ($(sed -n '1p' <<<"$again" | f 2)/$(sed -n '1p' <<<"$again" | f 3)) - the record CHANGED, which is not the mismatch persisting" ;;
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
say "worlds: $WORLDS    compared: $compared_total of $placed_total placed clues"
say "captured: $captured    inconclusive worlds: $inconclusive    partial worlds: $partial    mod errors: $errs"
if [ "${#fails[@]}" -gt 0 ]; then
    for x in "${fails[@]}"; do say "FAIL: $x"; done
fi
if [ "$captured" -gt 0 ]; then
    say "A discrepancy was captured. The dump above is the evidence; nothing is concluded from it here."
    exit 1
fi
if [ "${#fails[@]}" -gt 0 ]; then exit 1; fi
if [ "$compared_total" -eq 0 ]; then
    say "INCONCLUSIVE: not one container was compared in any world. This is NOT a"
    say "clean result - the check examined nothing, and says so rather than passing."
    exit 2
fi
say "No discrepancy in $compared_total compared clue(s) across $WORLDS world(s)."
[ "$partial" -gt 0 ] && say "Coverage was PARTIAL in $partial world(s): some clues gave no verdict."
[ "$inconclusive" -gt 0 ] && say "$inconclusive world(s) were inconclusive and contribute nothing either way."
say "THIS IS NOT PROOF OF ABSENCE: the fault appeared in three of nine overnight"
say "runs, so this much clean evidence is consistent with it still being there."
exit 0
