#!/usr/bin/env bash
# luacheck, failing on ERRORS only.
#
#   tools/ci/lint.sh
#
# An error is a file luacheck could not even parse - a genuine defect, and
# there are none. A warning is a style or scope note, and there are about
# 2,400 of them across a codebase that grew up around a different convention.
# Failing the build on those would mean either a permanently red job or a
# mass rewrite bolted onto an unrelated change; neither is honest. The count is
# printed every run so it can be driven down deliberately.
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
out="$(luacheck mod test tools --codes --no-color 2>&1)"
total="$(grep -m1 '^Total:' <<<"$out")"
errors="$(sed -n 's/.*\/ *\([0-9]*\) error.*/\1/p' <<<"$total")"
echo "$total"
if [ "${errors:-1}" != 0 ]; then
    grep -E '\(E[0-9]+\)' <<<"$out" | sed 's/^/  /'
    echo "lint: $errors luacheck error(s)"
    exit 1
fi
echo "lint: 0 errors"
