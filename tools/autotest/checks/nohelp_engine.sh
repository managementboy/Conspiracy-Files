#!/usr/bin/env bash
# Simplified No Help engine check: verify clues are placed and persistent.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "nohelp-engine: $*" >&2; }
pass() { echo "✓ $*"; }
fail() { echo "✗ $*" >&2; }
fails=()

claim_game || exit 2
start_cold || { say "game did not start"; "$PZ" stop; exit 2; }
id="$(session)"
world=$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)

say "Phase 1: Launch and soak for clue placement..."
sleep 30

# Count placed clues in the log
placed=$(grep -c "ev=placed" ~/Zomboid/console.txt)
if [ "$placed" -gt 10 ]; then
  pass "Engine: $placed clues placed in log"
else
  fail "Engine: only $placed placed events (need >10)"
  fails+=("placement")
fi

# Check for errors in No Help
errors=$(grep "ERROR.*MOD:Conspiracy" ~/Zomboid/console.txt | wc -l)
if [ "$errors" -eq 0 ]; then
  pass "Engine: no errors in No Help"
else
  fail "Engine: $errors errors in No Help"
  fails+=("errors")
fi

# Scene listener
listener=$(grep -c "scene-listener-live" ~/Zomboid/console.txt)
if [ "$listener" -gt 0 ]; then
  pass "Engine: scene listener active"
else
  fail "Engine: scene listener not logging"
  fails+=("listener")
fi

say "Phase 2: Save and reload..."
"$PZ" stop --save >/dev/null 2>&1 || { fail "save failed"; fails+=("save"); }
sleep 3
"$PZ" start --continue "$world" >/dev/null 2>&1 || { fail "reload failed"; fails+=("reload"); }
sleep 30

# Check seed persists
old_seed=$(grep "seed=" ~/Zomboid/console.txt | head -1 | sed 's/.*seed=//;s/ .*//')
new_seed=$(grep "seed=" ~/Zomboid/console.txt | tail -1 | sed 's/.*seed=//;s/ .*//')
if [ "$old_seed" = "$new_seed" ] && [ -n "$old_seed" ]; then
  pass "Engine: world seed persisted ($old_seed)"
else
  fail "Engine: seed mismatch or missing"
  fails+=("seed")
fi

# Report
out="$REPO/docs/management/evidence/linux-autotest/$id-nohelp-engine.txt"
mkdir -p "$(dirname "$out")"
{
  echo "Linux No Help engine check $id: $([ ${#fails[@]} -eq 0 ] && echo "PASS" || echo "FAIL (${fails[*]})")"
  source_line
  renderer_line
  echo "Placed clues: $placed"
  echo "No Help errors: $errors"
  echo "Listener active: $([ "$listener" -gt 0 ] && echo yes || echo no)"
  echo "Seed persistent: $old_seed"
} > "$out.part"
mv "$out.part" "$out"
say "report: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
[ ${#fails[@]} -eq 0 ]
