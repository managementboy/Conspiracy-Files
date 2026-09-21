#!/usr/bin/env bash
# The SHIPPED offline suite: everything that tests code the Workshop build
# actually contains, and nothing else.
#   tools/autotest/unit.sh        exit 0 when everything passes
#
# The engine compile check comes first: PUC Lua accepting a file says nothing
# about whether Kahlua does (see 255d992).
#
# Tests of dev/next-phase are NOT here. They are real tests and they must be
# run - tools/autotest/prototype.sh runs them and reports separately - but an
# unshipped prototype must not be able to make the shipped baseline red.
# The split is tools/autotest/suites.sh's, not a list kept in two places.
# (tools/kahlua/run.sh is for checking engine compatibility of single files,
# not for this suite: most tests use io/loadfile, which the runner lacks.)
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
. tools/autotest/suites.sh
fail=0; n=0; skipped=0
# KAHLUA NEEDS THE GAME. It compiles against projectzomboid.jar, which is
# licensed content and cannot be on a hosted runner, so CI sets
# CF_SKIP_KAHLUA=1. That is NOT a pass and is never printed as one: PUC Lua
# accepting a file says nothing about whether the engine's compiler will
# (255d992). The gate still has to run somewhere before a release -
# tools/autotest/kahlua_gate.sh is that somewhere.
if [ "${CF_SKIP_KAHLUA:-0}" = 1 ]; then
    echo "kahlua parse: NOT EXERCISED - no Project Zomboid on this machine."
    echo "kahlua parse: this is not a pass; run tools/autotest/kahlua_gate.sh where the game is installed."
else
    parse="$(tools/kahlua/run.sh --parse-all 2>&1 | tail -1)"; echo "$parse"
    grep -q ", 0 failed" <<<"$parse" || fail=$((fail + 1))
fi
if ! out="$(timeout 300 lua5.1 test/run.lua 2>&1)"; then echo "$out" | tail -20; fail=$((fail + 1)); fi
echo "specs: $(tail -1 <<<"$out")"
for t in test/*.lua; do
    cf_is_spec_test "$t" && continue
    if cf_is_prototype_test "$t"; then skipped=$((skipped + 1)); continue; fi
    n=$((n + 1))
    if ! out="$(timeout 120 lua5.1 "$t" 2>&1)"; then
        fail=$((fail + 1)); echo "FAIL $t"; echo "$out" | tail -5 | sed 's/^/    /'
    fi
done
if ! out="$(bash tools/autotest/checks/relocation_evidence_test.sh 2>&1)"; then
    fail=$((fail + 1))
fi
echo "$out"
# The packaging tool's own tests. Nothing else ran these before 2026-09-21.
if ! out="$(cd test && timeout 120 python3 -m unittest discover -p '*_test.py' 2>&1)"; then
    fail=$((fail + 1)); echo "FAIL test/*_test.py"; echo "$out" | tail -10 | sed 's/^/    /'
fi
echo "packaging: $(tail -1 <<<"$out")"
echo "shipped standalone: $n run, $fail failed (including specs and packaging)"
echo "prototype tests not run here: $skipped — use tools/autotest/prototype.sh"
[ "$fail" = 0 ]
