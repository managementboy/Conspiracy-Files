#!/usr/bin/env bash
# Is a fresh CORPSE a carrier at all (P4-R134, docs/design/CLUES_ON_THE_MOVE.md)?
#
#   tools/autotest/checks/body_carrier.sh [--hidden]
#
# The design's headline example is "a note in a dead man's jacket at your own
# fence", and the table says a fresh corpse holds a clue in the body's own
# inventory. Three real runs have now found only ZOMBIES usable:
#
#   20260918T001512 and 20260918T002532: "usable carriers within 12 tiles,
#   through the mod's own scan: 2 (zombie@10841,10149 zombie@10843,10149)" -
#   with two corpses lying on the squares beside them, parked by the same call.
#   20260918T041500: the mod's own carrier scan saw 0 usable with five bodies
#   loaded at the site, and every one of 486 filler refusals read
#   `ev=skip why=no-containers`.
#
# So this asks the engine directly, in four minutes: bodies and walkers are
# parked beside the survivor, and for each one the check prints what every
# inventory accessor returns, what class the object is, and what
# Carriers.refusal says. PASS needs at least one corpse the mod would use.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "body_carrier: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); note() { findings+=("$*"); say "$*"; }
field() { if [ $# -ge 2 ]; then cut -f"$1" <<<"$2"; else cut -f"$1"; fi; }
CHECKS="$REPO/tools/autotest/checks"

claim_game || exit 2
start_cold "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
for f in core_loop campaign clue_field carriers instalments; do
    ev -f "$CHECKS/$f.lua" >/dev/null || abort "could not load $f.lua"
done
wait_true 120 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
note "the survivor is kept alive while zombies stand beside them: $(ev 'return CFInst.safe()')"
here="$(ev 'return CFCamp.here()')"
x="$(field 1 "$here")"; y="$(field 2 "$here")"

# Four corpses and two walkers, parked by the harness. The mod never spawns one.
made="$(ev "return CFInst.park([[corpse]], 4, $x + 3, $y + 3, 0)")"
note "corpses parked: $(field 1 "$made") zombies created, $(field 2 "$made") killed where they stood"
walkers="$(ev "return CFInst.park([[zombie]], 2, $x + 6, $y + 3, 0)")"
note "walkers parked: $(field 1 "$walkers")"
sleep 5

p="$(ev "return CFInst.bodyProbe($x, $y, 0, 10)")"
note "within 10 tiles: $(field 1 "$p") dead bodies on squares, $(field 2 "$p") entries in the cell's zombie list ($(field 3 "$p") of them dead), $(field 4 "$p") of all of them usable as a carrier"
note "the bodies, as the engine answers for them: $(field 5 "$p")"
note "the zombie list: $(field 6 "$p")"
s="$(ev "return CFInst.carriersNear($x, $y, 0, 10)")"
note "the mod's own carrier scan over the same ground: $(field 1 "$s") usable ($(field 2 "$s")) $(field 3 "$s")"

corpses_usable="$(grep -o "refusal=none, usable" <<<"$(field 5 "$p")" | grep -c . || true)"
is_number "$corpses_usable" || corpses_usable=0
note "corpses the mod would use: $corpses_usable of $(field 1 "$p")"
if [ "$(field 1 "$p")" = 0 ]; then
    abort "the harness could not park a single body, so nothing was asked"
fi
[ "$corpses_usable" -ge 1 ] 2>/dev/null \
    || fail "not one of $(field 1 "$p") fresh bodies is usable as a carrier, so a clue can never be left in a dead man's jacket - only on a walking zombie ($(field 5 "$p"))"
grep -q "corpse@\|corpse=" <<<"$(field 2 "$s")" \
    || note "the mod's own scan reports no corpse among its usable carriers either ($(field 2 "$s"))"

engine="$(mod_errors | grep -cE "CellLoader|missing tile" || true)"; is_number "$engine" || engine=0
ours="$(mod_errors | grep -vE "CellLoader|missing tile" || true)"
thrown="$(grep -c . <<<"$ours")"; is_number "$thrown" || thrown=0
[ "$thrown" = 0 ] || fail "$thrown errors inside the mod: $(head -3 <<<"$ours")"

"$PZ" shot "$RUNS/$id-body-carrier.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1
verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-body-carrier.txt"
{
    echo "Linux body_carrier check $id: $verdict"
    source_line
    echo "errors inside the mod: $thrown"
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
