#!/usr/bin/env bash
# Whole-map house numbers in the real game (AD-10, P4-R129).
#
#   tools/autotest/checks/addresses.sh
#
# PASS needs: in a fresh world the shipped address book is ready at game start
# with no case running; nothing is written to the save; every shipped building
# exists in the live world with the same footprint; real addresses resolve for
# named towns; no errors inside the mod. Reports the load time.
# Real display only (software OpenGL distorts timings).
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "addresses: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=()

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
wait_true 60 'ConspiracyFiles.AddressMap~=nil and ConspiracyFiles.AddressMap.ready()' >/dev/null || fail "the address book was not ready within 60 s of game start"
ev -f "$REPO/tools/autotest/checks/addresses.lua" >/dev/null || abort "could not load the check's Lua"

state="$(ev 'return CFAdr.state()')"
[ "$(cut -f1 <<<"$state")" = true ] || fail "not ready: $(cut -f4 <<<"$state")"
[ "$(cut -f3 <<<"$state")" = false ] || fail "an address book was written to the save"
findings+=("load: $(cut -f2 <<<"$state") ms; status: $(cut -f4 <<<"$state")")
cases="$(ev 'local s=ConspiracyFiles.GeneratedRuntime.automaticStatus(); return s and s.count or 0' | cut -f1)"
findings+=("cases at the time of the check: ${cases:-?}")

shipped="$(ev 'return CFAdr.verifyStart()' | cut -f1)"
findings+=("shipped houses: $shipped")
until v="$(ev 'return CFAdr.verifyStep(500)')"; [ "$(cut -f1 <<<"$v")" = true ]; do :; done
[ "$(cut -f3 <<<"$v")" = 0 ] || fail "$(cut -f3 <<<"$v") shipped buildings do not exist in the live world"
[ "$(cut -f4 <<<"$v")" = 0 ] || fail "$(cut -f4 <<<"$v") shipped buildings have a different footprint, e.g. $(cut -f5 <<<"$v")"
findings+=("live world: $(cut -f2 <<<"$v") shipped buildings found, $(cut -f3 <<<"$v") missing, $(cut -f4 <<<"$v") moved")

s="$(ev 'return CFAdr.samples()')"
[ "$(cut -f1 <<<"$s")" -ge 5 ] 2>/dev/null || fail "addresses did not resolve for all five sample towns: $(cut -f2 <<<"$s")"
findings+=("samples: $(cut -f2 <<<"$s")")

errors="$(mod_error_count)"
is_number "$errors" || errors=0
thrown="$(mod_errors | wc -l | tr -d ' ')"
is_number "$thrown" || thrown=0
errors=$((errors + thrown))
[ "$errors" = 0 ] || fail "$errors errors inside the mod"

result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$id-addresses.txt"
{
    echo "Linux addresses check $id: $result"
    source_line
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    echo "errors inside the mod: $errors"
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$out.part"
mv "$out.part" "$out"
say "written: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ]
