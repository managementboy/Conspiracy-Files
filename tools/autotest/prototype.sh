#!/usr/bin/env bash
# The PROTOTYPE offline suite: tests of dev/next-phase, which is not shipped.
#   tools/autotest/prototype.sh   exit 0 when everything passes
#
# These run and they are reported. They are not skipped and not ignored - a
# failure here is a real failure of unshipped integration work, and it says
# nothing about the released mod. Keep the two results in separate sentences.
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
. tools/autotest/suites.sh
fail=0; n=0
for t in test/*.lua; do
    cf_is_spec_test "$t" && continue
    cf_is_prototype_test "$t" || continue
    n=$((n + 1))
    if ! out="$(timeout 120 lua5.1 "$t" 2>&1)"; then
        fail=$((fail + 1)); echo "FAIL $t"; echo "$out" | tail -5 | sed 's/^/    /'
    else
        echo "PASS $t"
    fi
done
echo "prototype: $n run, $fail failed"
[ "$fail" = 0 ]
