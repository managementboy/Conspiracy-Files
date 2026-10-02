#!/usr/bin/env bash
# State dump comparison: placement counts identical across save/reload.
#
#   tools/autotest/checks/nohelp_dump.sh
#
# PASS needs: two consecutive StateDump.run() calls (before and after
# save/quit/reload) produce identical placement counts across all fields.
# The comparison logic is in a plain-Lua function, unit-tested separately.
# The first dump waits until the case is decided and the counts hold still
# (a too-early dump caused the 2026-09-29 false FAIL). Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
export PZ_NOHELP_ONLY=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "nohelp-dump: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
[ -n "$world" ] || abort "world not recorded by pz.sh start"

# Load the dump harness
ev -f "$REPO/tools/autotest/checks/nohelp_dump_harness.lua" >/dev/null || abort "could not load dump harness"

# Wait for world to warm up (placement subsystem active)
wait_true 60 'NHShared.StateDump~=nil' >/dev/null || fail "StateDump not loaded within 60s"

# A dump is only worth comparing once the case is decided and clues are assigned
# (the first run of this check compared a dump taken before any clue existed
# with one taken after, and "failed" for that reason alone). Wait until the
# placement counts are ready AND the same on two reads 5 s apart.
lua_c() { lua5.1 -e 'package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;"..package.path; require("NHShared/Log"); local C=dofile("tools/autotest/checks/nohelp_dump_harness.lua"); '"$1"; }
settled_dump() { # settled_dump SECONDS -> prints the dump line, or fails
    local deadline=$(( $(date +%s) + $1 )) prev="" cur="" ok
    while [ "$(date +%s)" -lt "$deadline" ]; do
        cur="$(ev 'CFNHDump.reset(); NHShared.StateDump.run(); return CFNHDump.lastDump()' | cut -f1)"
        ok="$(DUMP="$cur" lua_c 'print(C.ready(os.getenv("DUMP")))')"
        if [ "$ok" = true ] && [ -n "$prev" ] \
           && [ "$(DUMP1="$prev" DUMP2="$cur" lua_c 'print(C.sameAcrossReload(os.getenv("DUMP1"), os.getenv("DUMP2")))')" = true ]; then
            echo "$cur"; return 0
        fi
        [ "$ok" = true ] && prev="$cur" || prev=""
        sleep 5
    done
    return 1
}
dump1="$(settled_dump 240)" || fail "no settled first dump within 240s (case never decided or counts kept moving)"

# Save, quit, and reload
"$PZ" stop --save >/dev/null 2>&1 || fail "save/quit failed"
sleep 2
"$PZ" start --continue "$world" >/dev/null 2>&1 || fail "reload failed"
wait_true 90 'NHShared.StateDump~=nil' >/dev/null || fail "reload did not reach the world"
ev -f "$REPO/tools/autotest/checks/nohelp_dump_harness.lua" >/dev/null || fail "harness reload failed"

# Dump after reload, once settled the same way
dump2="$(settled_dump 240)" || fail "no settled second dump within 240s after reload"
[ -n "$dump2" ] || fail "second dump produced no output"

# Compare using Lua function via environment variables (avoids quote/escape issues)
same="$(DUMP1="$dump1" DUMP2="$dump2" lua_c 'print(C.sameAcrossReload(os.getenv("DUMP1"), os.getenv("DUMP2")))')" || fail "comparison failed"
[ "$same" = "true" ] || fail "placement counts differ"

result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$id-nohelp-dump.txt"
{
    echo "Linux nohelp-dump check $id: $result"
    source_line
    [ "$result" = PASS ] || { echo "DUMP1: $dump1"; echo "DUMP2: $dump2"; }
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$out.part"
mv "$out.part" "$out"
say "written: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ]
