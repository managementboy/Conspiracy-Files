#!/usr/bin/env bash
# STALE-CLUE RELOCATION, UNDER A CONTROLLED CLOCK, IN ONE REAL SAVE.
#
#   tools/autotest/checks/relocation.sh
#
# The placement diagnostic found no immediate mismatch in three fresh worlds and
# said why that was weak: it verifies one case immediately after placement, so
# relocation never runs. The reported fault came from long runs where it did.
# This creates those conditions on purpose, once, in one save:
#
#   1. capture the original targets and tokens of every UNFOUND placed clue,
#      and where each item actually is, before anything moves;
#   2. advance the clock past RELOCATE_AFTER_HOURS and report whether
#      relocation's other conditions are now satisfied, per clue;
#   3. let the scheduler run, then confirm from the record AND the log whether
#      relocation was attempted, whether the item physically moved, and what the
#      canonical write did;
#   4. compare the recorded targets with the actual item locations immediately
#      afterwards;
#   5. save, reload, and repeat those comparisons.
#
# THE CLOCK: Build 42.20 has no setWorldAgeHours - probed, absent. World age is
# derived from nights survived, and setNightsSurvived moves it (measured: +4
# nights = +96.00 hours exactly). That is a REAL game-state change; it is made
# deliberately and reported, not hidden.
#
# THE REFUSED-CANONICAL-WRITE EXPLANATION IS A HYPOTHESIS and stays one unless
# this sequence demonstrates it. The check reports what the record and the log
# say and draws no conclusion.
#
# Real display only. About six minutes.
# Exit 0 no mismatch after relocation, 1 a mismatch captured, 2 could not run
# (including: relocation never ran, which proves nothing either way).
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
. "$(dirname "${BASH_SOURCE[0]}")/relocation_evidence.sh"
say() { echo "relocation: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }
CHECKS="$REPO/tools/autotest/checks"

claim_game || { say "another run holds the machine - leaving it alone"; exit 2; }

load_lua() {
    ev -f "$CHECKS/core_loop.lua" >/dev/null && ev -f "$CHECKS/placement.lua" >/dev/null \
        && ev -f "$CHECKS/relocation.lua" >/dev/null
}
CONSOLE_PATH="${CONSOLE:-$HOME/Zomboid/console.txt}"
reloc_log_since_mark() { # authoritative: all relocation records after the pre-scheduler checkpoint
    [ -r "$CONSOLE_PATH" ] || return 0
    tail -c "+$((reloc_log_mark + 1))" "$CONSOLE_PATH" 2>/dev/null | grep -a "CF-G2-RELOCATE\|relocation:" || true
}
reloc_log_display() { # display is deliberately bounded; verdict evidence is not
    reloc_log_since_mark | tail -40
}

start_cold || { say "the world would not start"; exit 2; }
load_lua || { say "the check's Lua would not load"; "$PZ" stop >/dev/null 2>&1; exit 2; }

# Wait for a case and for its clues to reach containers.
deadline=$(( $(date +%s) + 300 ))
while :; do
    c="$(ev 'return CFPlace.clues()')"
    [ "$(f 1 <<<"$c")" -gt 0 ] 2>/dev/null && [ "$(f 2 <<<"$c")" = 0 ] && break
    [ "$(date +%s)" -lt "$deadline" ] || break
    sleep 3
done
say "clues: placed=$(f 1 <<<"$c") pending=$(f 2 <<<"$c") never-placed=$(f 3 <<<"$c")"

# --- 1. the baseline, before anything moves ---------------------------------
base="$(ev 'return CFReloc.capture()')"
if [ "$base" = "none" ]; then
    say "no unfound placed clue to relocate - nothing to test"
    "$PZ" stop >/dev/null 2>&1; exit 2
fi
say "baseline (id, token, target, placedHours, relocations, in-its-container):"
echo "$base" | sed 's/^/    /' >&2
blob="$(ev 'return CFReloc.exportBaseline()')"

say "clock before: $(ev 'return CFReloc.clock()')"
say "conditions before advancing:"
ev 'return CFReloc.conditions()' | sed 's/^/    /' >&2

# --- 2. advance the clock ---------------------------------------------------
# Start the evidence window BEFORE advancing: scheduler ticks may happen
# between the advance evaluation and the following conditions evaluation.
reloc_log_mark=0
[ -r "$CONSOLE_PATH" ] && reloc_log_mark="$(wc -c < "$CONSOLE_PATH")"
adv="$(ev 'return CFReloc.advance(96)')"
say "advance: before=$(f 1 <<<"$adv") after=$(f 2 <<<"$adv") requested=$(f 3 <<<"$adv")h nights=+$(f 4 <<<"$adv") enough=$(f 5 <<<"$adv")"
[ "$(f 5 <<<"$adv")" = true ] || { fail "the clock did not advance far enough"; }
say "conditions after advancing:"
conds="$(ev 'return CFReloc.conditions()')"
echo "$conds" | sed 's/^/    /' >&2
stale_count="$(grep -c "stale=true" <<<"$conds" || true)"
say "clues now stale: $stale_count"

# --- 3. let the scheduler run, then look for evidence relocation happened ---
# The relocation job is enqueued every 120 ticks; give it real seconds and stand
# somewhere the destination can load.
say "letting the scheduler run"
for _ in $(seq 24); do sleep 5; done

say "relocation trail from the mod's own log:"
reloc_log_display | sed 's/^/    /' >&2
# A REFUSAL IS NOT A RELOCATION. `attempts` counted every CF-G2-RELOCATE line -
# including "no unvisited candidate", "no loaded container at destination",
# "guard refused" and "destination changed" - so a run where nothing moved could
# still report relocation as having happened and exit 0 saying "no mismatch
# after relocation". Only a reported MOVE counts as the experiment occurring.
reloc_records="$(reloc_log_since_mark)"
lines="$(grep -c "CF-G2-RELOCATE" <<<"$reloc_records" || true)"
moved_ids="$(relocation_evidence_moved_ids <<<"$reloc_records")"
moved="$(grep -c . <<<"$moved_ids" || true)"
refusals="$(grep -cE "leaving in place|guard refused|marked unknown" <<<"$reloc_records" || true)"
say "log: $lines relocation line(s) - $moved MOVE(s), $refusals refusal(s)"
if [ "$refusals" -gt 0 ]; then
    say "refusal reasons seen:"
    grep -E "leaving in place|guard refused|marked unknown" <<<"$reloc_records" \
        | sed 's/.*CF-G2-RELOCATE\] /    /' | sort | uniq -c | sed 's/^/    /' >&2
fi

# --- 4. compare record against world, immediately ---------------------------
say "comparing record against world, per clue:"
ids="$(ev 'return CFReloc.captured()')"
relocation_evidence_reset
for id in $ids; do relocation_evidence_baseline "$id"; done
for id in $moved_ids; do relocation_evidence_moved "$id"; done
mismatch=0; compared=0; noverdict=0
for id in $ids; do
    ev "return CFReloc.teleportTo('$id')" >/dev/null
    wait_true 40 'CFReloc.loaded()=="true"' >/dev/null \
        || { say "  $id: square never loaded - NO VERDICT"; noverdict=$((noverdict+1)); continue; }
    sleep 2
    line="$(ev "return CFReloc.compare('$id')")"
    echo "    $line" >&2
    # Only these two are real comparisons. unloaded, read-error, in-hand and
    # skipped are NOT, and used to leave the success condition untouched - so a
    # run that compared nothing could still pass.
    verdict="$(relocation_evidence_verdict "$line")"
    if [ "$verdict" = DISCREPANCY ]; then
        mismatch=$((mismatch+1)); compared=$((compared+1))
    elif [ "$verdict" = none ]; then
        compared=$((compared+1))
    else
        noverdict=$((noverdict+1))
    fi
    relocation_evidence_comparison before "$id" "$line"
done
say "before reload: $compared real comparison(s), $mismatch mismatch(es), $noverdict without a verdict"

if [ "$moved" = 0 ]; then
    say "NOTHING WAS RELOCATED. That is not evidence about placement either way -"
    say "the conditions and every refusal reason are printed above."
fi

# --- 5. save, reload, and repeat --------------------------------------------
say "saving and reloading, then repeating the comparisons"
"$PZ" stop --save >/dev/null 2>&1 || { fail "could not save"; exit 1; }
"$PZ" start --continue >/dev/null 2>&1 || { fail "could not reload"; exit 1; }
load_lua || { fail "the check's Lua would not load after the reload"; exit 1; }
sleep 5
kept="$(ev "return CFReloc.importBaseline([==[$blob]==])")"
say "baseline restored after reload: $kept clue(s)"
say "clock after reload: $(ev 'return CFReloc.clock()')"

mismatch_after=0; compared_after=0; noverdict_after=0
for id in $ids; do
    ev "return CFReloc.teleportTo('$id')" >/dev/null
    wait_true 40 'CFReloc.loaded()=="true"' >/dev/null \
        || { say "  $id: square never loaded after reload - NO VERDICT"; noverdict_after=$((noverdict_after+1)); continue; }
    sleep 2
    line="$(ev "return CFReloc.compare('$id')")"
    echo "    $line" >&2
    verdict="$(relocation_evidence_verdict "$line")"
    if [ "$verdict" = DISCREPANCY ]; then
        mismatch_after=$((mismatch_after+1)); compared_after=$((compared_after+1))
    elif [ "$verdict" = none ]; then
        compared_after=$((compared_after+1))
    else
        noverdict_after=$((noverdict_after+1))
    fi
    relocation_evidence_comparison after "$id" "$line"
done
say "after reload: $compared_after real comparison(s), $mismatch_after mismatch(es), $noverdict_after without a verdict"

errs="$(mod_error_count 2>/dev/null || echo 0)"
"$PZ" stop >/dev/null 2>&1

say "---"
say "relocation log lines: $lines    MOVES: $moved    refusals: $refusals    clues stale: $stale_count"
say "before reload: compared=$compared mismatches=$mismatch no-verdict=$noverdict"
say "after reload:  compared=$compared_after mismatches=$mismatch_after no-verdict=$noverdict_after"
say "mod errors: $errs"
[ "$errs" = 0 ] || fail "the mod logged $errs error(s)"
for x in "${fails[@]:-}"; do [ -n "$x" ] && say "FAIL: $x"; done

if [ "$mismatch" -gt 0 ] || [ "$mismatch_after" -gt 0 ]; then
    say "A MISMATCH WAS CAPTURED. The lines above are the evidence."
    say "Whether a refused canonical write caused it remains a HYPOTHESIS - read the"
    say "relocation trail and the mod errors before concluding anything."
    exit 1
fi
if [ "${#fails[@]}" -gt 0 ]; then exit 1; fi
# THREE SEPARATE WAYS THIS RUN CAN FAIL TO BE AN EXPERIMENT AT ALL.
if ! relocation_evidence_complete; then
    say "INCONCLUSIVE: complete evidence is required for every moved clue:"
    for issue in "${RELOC_EVIDENCE_ISSUES[@]}"; do say "  $issue"; done
    exit 2
fi
say "Relocation ran ($moved move(s)) and no mismatch was found:"
say "  $compared clue(s) compared before the reload, $compared_after after."
[ "$noverdict" -gt 0 ] || [ "$noverdict_after" -gt 0 ] && \
    say "  PARTIAL: $noverdict before and $noverdict_after after gave no verdict."
say "NOT proof of absence: one save, one case, and only the clues that went stale."
exit 0
