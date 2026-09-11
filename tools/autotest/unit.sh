#!/usr/bin/env bash
# All plain-Lua unit tests, the way they are meant to run: PUC Lua 5.1.
# test/run.lua runs the *_spec files; every other test/*.lua runs on its own.
# (tools/kahlua/run.sh is for checking engine compatibility of single files,
# not for this suite: most tests use io/loadfile, which the runner lacks.)
#   tools/autotest/unit.sh        exit 0 when everything passes
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
fail=0; n=0
if ! out="$(timeout 300 lua5.1 test/run.lua 2>&1)"; then echo "$out" | tail -20; fail=$((fail + 1)); fi
echo "specs: $(tail -1 <<<"$out")"
for t in test/*.lua; do
    case "$t" in *_spec.lua|test/run.lua) continue ;; esac
    n=$((n + 1))
    if ! out="$(timeout 120 lua5.1 "$t" 2>&1)"; then
        fail=$((fail + 1)); echo "FAIL $t"; echo "$out" | tail -5 | sed 's/^/    /'
    fi
done
echo "standalone: $n run, $fail failed (including specs)"
[ "$fail" = 0 ]
