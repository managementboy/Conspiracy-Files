#!/usr/bin/env bash
# Verify the shipped mod is self-contained and matches the local install.
#
# GeneratedRuntime requires ConspiracyFiles/T3Nearby. For a long time that file
# existed only in the deployed copy, never in the repo, so a clean install from
# source produced a mod that could not generate a single case and failed in a
# way that looked like a runtime bug. This catches that class of mistake.
set -uo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALL="${CF_INSTALL:-/c/Users/elkin.fricke/Zomboid/mods/ConspiracyFiles}"
status=0

echo "== every require() resolves inside the shipped tree =="
missing=0
while read -r module; do
    rel="mod/common/media/lua/shared/${module}.lua"
    rel2="mod/common/media/lua/client/${module}.lua"
    if [ ! -f "$REPO/$rel" ] && [ ! -f "$REPO/$rel2" ]; then
        echo "  MISSING: $module (required but not shipped)"
        missing=$((missing + 1)); status=1
    fi
done < <(grep -rhoE 'require\("(ConspiracyFiles[^"]*)"\)' "$REPO/mod" --include=*.lua \
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
