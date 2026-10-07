#!/usr/bin/env bash
# Of Interest phase 2 check: the notes catalogue in the real game (visible window, never --hidden).
#
#   tools/autotest/checks/oi_catalogue.sh
#
# Boots Of Interest + the dependency + ZombieBuddy TWICE (new world each time) and reads the
# catalogue through the eval channel. PASS needs, on both boots:
#   entries 500, stories 23, places 13, dropped 0, unknown 0, placemismatch 0, state active;
#   exactly one "ev=catalogue" log line; no error inside the mods;
# and the two fingerprints (static and dynamic) identical across the boots.
# Only counts and fingerprints come back - never any note text or id.
# Report: docs/management/evidence/linux-autotest/<session>-oi-catalogue.txt. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
export PZ_NOHELP_ONLY=1 PZ_OI=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "oi-catalogue: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
notes=()
claim_game || exit 2
fps=()
for boot in 1 2; do
    start_cold || { say "boot $boot did not reach a playable world"; "$PZ" stop; exit 2; }
    wait_true 60 'OIShared.NoteCatalogue.isActive()' || fail "boot $boot: catalogue not active"
    r="$(ev 'local C=OIShared.NoteCatalogue; local n=C.counts(); local s,d=C.fingerprint(); return C.isActive(),n.entries,n.stories,n.places,n.themes,n.dropped,n.unknown,n.placemismatch,n.duplicates,n.pools,s,d,C.current().lang')"
    IFS=$'\t' read -r act ent sto pla the dro unk mis dup poo fs fd lang <<<"$r"
    [ "$act" = true ] && [ "$ent" = 500 ] && [ "$sto" = 23 ] && [ "$pla" = 13 ] && [ "$dro" = 0 ] && [ "$unk" = 0 ] && [ "$mis" = 0 ] \
        || fail "boot $boot counts: active=$act entries=$ent stories=$sto places=$pla dropped=$dro unknown=$unk placemismatch=$mis"
    lines="$(run_log | grep -c "ev=catalogue")"
    [ "$lines" = 1 ] || fail "boot $boot: $lines catalogue log lines (want 1)"
    errs="$(mod_errors)"; [ -z "$errs" ] || fail "boot $boot: errors inside the mods: $(head -3 <<<"$errs" | tr '\n' ' ')"
    notes+=("boot $boot: active=$act pools=$poo entries=$ent stories=$sto places=$pla themes=$the dropped=$dro unknown=$unk placemismatch=$mis dups=$dup lang=$lang fp-static=$fs fp-dynamic=$fd log-lines=$lines")
    fps+=("$fs/$fd")
    "$PZ" stop >/dev/null 2>&1
done
[ "${fps[0]}" = "${fps[1]}" ] && [ -n "${fps[0]}" ] || fail "fingerprints differ across boots: ${fps[0]} vs ${fps[1]}"
result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
id="$(session)"; out="$REPO/docs/management/evidence/linux-autotest/$id-oi-catalogue.txt"
{ echo "Linux Of Interest catalogue check $id: $result"; source_line; renderer_line
  for n in "${notes[@]}"; do echo "$n"; done; for f in "${fails[@]}"; do echo "FAIL: $f"; done; } > "$out.part"
mv "$out.part" "$out"; cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ]
