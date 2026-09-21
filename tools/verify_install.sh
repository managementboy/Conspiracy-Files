#!/usr/bin/env bash
# Verify the shipped mod is self-contained and matches the local install.
#
# GeneratedRuntime requires ConspiracyFiles/T3Nearby. For a long time that file
# existed only in the deployed copy, never in the repo, so a clean install from
# source produced a mod that could not generate a single case and failed in a
# way that looked like a runtime bug. This catches that class of mistake.
set -uo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
. "$REPO/tools/env.sh"
INSTALL="$CF_INSTALL"
status=0

echo "== every require() resolves inside the shipped tree =="
missing=0
while read -r module; do
    found=
    for base in shared client; do
        # A package may be a single file OR a directory with init.lua, which is
        # how require("ConspiracyFiles") resolves. Only knowing about the first
        # shape made this report the package's own entry point as missing.
        for candidate in "mod/common/media/lua/$base/${module}.lua" \
                         "mod/common/media/lua/$base/${module}/init.lua"; do
            [ -f "$REPO/$candidate" ] && found=1
        done
    done
    if [ -z "$found" ]; then
        echo "  MISSING: $module (required but not shipped)"
        missing=$((missing + 1)); status=1
    fi
# Drop whole-line comments before looking for requires. init.lua's own header
# says require("ConspiracyFiles") in prose, and that was reported as a missing
# module - a tool defect that looked exactly like the real one this check is
# for. The filter is on a leading --, not on any dash anywhere in the line,
# which would have silently skipped real requires.
done < <(grep -rh --include=*.lua -E 'require\("ConspiracyFiles[^"]*"\)' "$REPO/mod" \
         | grep -vE '^[[:space:]]*--' \
         | grep -oE 'require\("(ConspiracyFiles[^"]*)"\)' \
         | sed -E 's/require\("//; s/"\)//' | sort -u)
[ "$missing" -eq 0 ] && echo "  all shipped requires resolve"

if [ -d "$INSTALL/common" ]; then
    echo "== repo vs install =="
    if diff -rq "$REPO/mod/common" "$INSTALL/common" > /tmp/cf_install_diff 2>&1; then
        echo "  identical"
    else
        sed 's/^/  /' /tmp/cf_install_diff; status=1
    fi
else
    echo "== repo vs install == (not installed at $INSTALL, skipped)"
fi
exit $status
