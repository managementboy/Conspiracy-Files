#!/usr/bin/env bash
# State dump comparison: placement counts identical across save/reload.
#
#   tools/autotest/checks/nohelp_dump.sh
#
# PASS needs: two consecutive StateDump.run() calls (before and after
# save/quit/reload) produce identical placement counts across all fields.
# The comparison logic is in a plain-Lua function, unit-tested separately.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
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

# Call dump before save
dump1="$(ev 'NHShared.StateDump.run(); return CFNHDump.lastDump()' | cut -f1)" || fail "first dump failed"
[ -n "$dump1" ] || fail "first dump produced no output"

# Save, quit, and reload
"$PZ" stop --save >/dev/null 2>&1 || fail "save/quit failed"
sleep 2
"$PZ" start --continue "$world" >/dev/null 2>&1 || fail "reload failed"
sleep 5
ev -f "$REPO/tools/autotest/checks/nohelp_dump_harness.lua" >/dev/null || fail "harness reload failed"

# Call dump after reload
dump2="$(ev 'NHShared.StateDump.run(); return CFNHDump.lastDump()' | cut -f1)" || fail "second dump failed"
[ -n "$dump2" ] || fail "second dump produced no output"

# Compare using Lua function via environment variables (avoids quote/escape issues)
same="$(DUMP1="$dump1" DUMP2="$dump2" lua5.1 -e 'package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;"..package.path; require("NHShared/Log"); local C=dofile("tools/autotest/checks/nohelp_dump_harness.lua"); print(C.sameAcrossReload(os.getenv("DUMP1"), os.getenv("DUMP2")))')" || fail "comparison failed"
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
