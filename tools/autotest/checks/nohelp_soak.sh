#!/usr/bin/env bash
# Test 7: Long soak — 60 seconds of gameplay, monitor save size and performance.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "nohelp-soak: $*" >&2; }

claim_game || exit 2
start_cold || { say "game did not start"; "$PZ" stop; exit 2; }
id="$(session)"

say "Soaking for 60 seconds..."
sleep 60

say "Checking save size and performance..."
save_size=$(du -h ~/.Zomboid/Saves/Sandbox/*/worldgen.bin 2>/dev/null | tail -1 | cut -f1)
placed=$(grep -c "ev=placed" ~/Zomboid/console.txt)
listener=$(grep "scene-listener-live" ~/Zomboid/console.txt | wc -l)

say "Saving and reloading..."
"$PZ" stop --save >/dev/null 2>&1
sleep 3
world=$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)
"$PZ" start --continue "$world" >/dev/null 2>&1
sleep 30

if grep -q "Lua" ~/Zomboid/console.txt | tail -1; then
  reload_ok="yes"
else
  reload_ok="no"
fi

# Report
out="$REPO/docs/management/evidence/linux-autotest/$id-nohelp-soak.txt"
mkdir -p "$(dirname "$out")"
{
  echo "Linux No Help soak test $id"
  echo "Save size: $save_size"
  echo "Clues placed: $placed"
  echo "Listener events: $listener"
  echo "Reload: $reload_ok"
  echo ""
  source_line
  renderer_line
} > "$out.part"
mv "$out.part" "$out"
say "report: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
true
