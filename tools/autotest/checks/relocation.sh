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
say() { echo "relocation: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }
CHECKS="$REPO/tools/autotest/checks"

claim_game || { say "another run holds the machine - leaving it alone"; exit 2; }

load_lua() {
    ev -f "$CHECKS/core_loop.lua" >/dev/null && ev -f "$CHECKS/placement.lua" >/dev/null \
        && ev -f "$CHECKS/relocation.lua" >/dev/null
}
reloc_log() { # the mod's own relocation trail since the run began
    grep -a "CF-G2-RELOCATE\|relocation:" "${CONSOLE:-$HOME/Zomboid/console.txt}" 2>/dev/null | tail -40
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
reloc_log | sed 's/^/    /' >&2
attempts="$(reloc_log | grep -c "CF-G2-RELOCATE" || true)"
moved="$(reloc_log | grep -c "relocated " || true)"
say "log: $attempts relocation line(s), $moved reported move(s)"

# --- 4. compare record against world, immediately ---------------------------
say "comparing record against world, per clue:"
ids="$(ev 'return CFReloc.captured()')"
mismatch=0
for id in $ids; do
    ev "return CFReloc.teleportTo('$id')" >/dev/null
    wait_true 40 'CFReloc.loaded()=="true"' >/dev/null || { say "  $id: square never loaded - no verdict"; continue; }
    sleep 2
    line="$(ev "return CFReloc.compare('$id')")"
    echo "    $line" >&2
    grep -q "verdict=MISMATCH" <<<"$line" && mismatch=$((mismatch+1))
done

if [ "$attempts" = 0 ] && [ "$moved" = 0 ]; then
    say "RELOCATION NEVER RAN. That is not evidence about placement either way -"
    say "it means the conditions were not met, and the conditions are printed above."
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

mismatch_after=0
for id in $ids; do
    ev "return CFReloc.teleportTo('$id')" >/dev/null
    wait_true 40 'CFReloc.loaded()=="true"' >/dev/null || { say "  $id: square never loaded after reload - no verdict"; continue; }
    sleep 2
    line="$(ev "return CFReloc.compare('$id')")"
    echo "    $line" >&2
    grep -q "verdict=MISMATCH" <<<"$line" && mismatch_after=$((mismatch_after+1))
done

errs="$(mod_error_count 2>/dev/null || echo 0)"
"$PZ" stop >/dev/null 2>&1

say "---"
say "relocation lines: $attempts    reported moves: $moved    clues stale: $stale_count"
say "mismatches before reload: $mismatch    after reload: $mismatch_after    mod errors: $errs"
[ "$errs" = 0 ] || fail "the mod logged $errs error(s)"
for x in "${fails[@]:-}"; do [ -n "$x" ] && say "FAIL: $x"; done

if [ "$mismatch" -gt 0 ] || [ "$mismatch_after" -gt 0 ]; then
    say "A MISMATCH WAS CAPTURED after relocation. The lines above are the evidence."
    say "Whether a refused canonical write caused it is still a HYPOTHESIS - read the"
    say "relocation trail and the mod errors above before concluding anything."
    exit 1
fi
if [ "$attempts" = 0 ] && [ "$moved" = 0 ]; then
    say "INCONCLUSIVE: relocation never ran, so this says nothing about the fault."
    exit 2
fi
say "No mismatch after relocation, in this one save, across $(wc -w <<<"$ids") clue(s)."
say "NOT proof of absence: one save, one case, and only the clues that were stale."
[ "${#fails[@]}" -gt 0 ] && exit 1
exit 0
