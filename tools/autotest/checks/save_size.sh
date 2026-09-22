#!/usr/bin/env bash
# THE COMBINED SAVE, MEASURED IN THE GAME rather than estimated.
#
#   tools/autotest/checks/save_size.sh [WORLD]
#
# Loads a world that already exists and asks the mod what every SaveBudget
# root costs, plus what the save weighs on disk. It does not play anything:
# the point is to measure state that a long run has already built.
#
# Why it exists: test/map_feature_budget estimates a combined fixture at
# 959,031 bytes, but it measures three roots - generated, discoveries,
# mapMedia - and covers the other eleven with a flat 73,000 allowance. An
# estimate of eleven roots is not a measurement of them, and the campaign
# gate's own figures showed MapMedia at 349 bytes because that run reads no
# maps.
#
# What this can and cannot establish is printed in the report, because the
# maximum legal state needs sixteen cases AND all 125 map trails in one save,
# and no single existing world has both.
set -uo pipefail
cf_main() {
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "save-size: $*" >&2; }
claim_game || exit 2
cf_pin_source
# NAME THE WORLD, or measure whatever ran last - which is how the first run
# of this check measured a pair_in_play world with one case and zero map
# trails and called it a combined measurement. The default is kept for
# convenience but the report always prints what the world actually held.
world="${1:-$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)}"
[ -n "$world" ] || { say "no world to measure; pass one or run a check first"; exit 2; }
say "loading $world"
"$PZ" start --continue "$world" >/dev/null 2>&1 || { say "the saved game did not load"; exit 2; }
first="$(session)"
ev -f "$REPO/tools/autotest/checks/core_loop.lua" >/dev/null || { say "core_loop fixture"; exit 2; }
ev -f "$REPO/tools/autotest/checks/reload.lua"    >/dev/null || { say "reload fixture"; exit 2; }
ev -f "$REPO/tools/autotest/checks/campaign.lua"  >/dev/null 2>&1 || true

bytes="$(ev 'return CFReload.bytes()')"
total="$(cut -f1 <<<"$bytes")"; parts="$(cut -f2 <<<"$bytes")"
cases="$(ev 'return CFCamp.cases()' 2>/dev/null | head -1 | tr '\t' ' ')"
trails="$(ev 'local n=0;local w=ModData.get("ConspiracyFiles.MapMedia");local r=w and w.canonical;for _ in pairs(r and r.trails or {}) do n=n+1 end;return n' 2>/dev/null)"
# ZOMBOID_HOME comes from env.sh, which lib.sh does not source; use the same
# path pz.sh does. The first version read an unset variable and reported the
# on-disk size as "unknown" without saying why.
ZHOME="${PZ_ZOMBOID:-$HOME/Zomboid}"
disk="$(du -sb "$ZHOME/Saves"/*/"$world" 2>/dev/null | cut -f1 | head -1)"
errors="$(mod_errors)"
"$PZ" stop >/dev/null 2>&1

limit=1000000
report="$EVIDENCE/$first-save-size.txt"
{
    echo "Linux combined save measurement"
    source_line
    echo "world: $world"
    echo
    echo "MEASURED, in the game, across every root SaveBudget budgets:"
    echo "  total estimated bytes : ${total:-unknown}"
    echo "  on disk               : ${disk:-unknown} bytes"
    echo "  per root              : ${parts:-none}"
    echo
    echo "WHAT THIS STATE CONTAINS"
    echo "  generated cases : ${cases:-unread}"
    echo "  map trails      : ${trails:-unread} of 125"
    echo
    echo "WHAT IT IS NOT"
    echo "  Not the maximum legal state. That needs sixteen cases AND all 125"
    echo "  map trails in one save; this world has whichever of the two its own"
    echo "  run produced. A number below the budget here does NOT establish that"
    echo "  the maximum fits."
    echo
    if [ -n "$total" ] && [ "$total" -gt 0 ] 2>/dev/null; then
        echo "  against the ${limit}-byte development allowance: $(( total * 100 / limit ))%"
    fi
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
}
cf_main "$@"
