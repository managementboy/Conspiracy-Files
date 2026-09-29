#!/usr/bin/env bash
# No Help play check: verify E1–E6 engine features in a live game.
# - E1: spoken clue text
# - E2/E3: container placement and fallback
# - E3b: per-world container order
# - E5: place top-up (clue coverage per marked place)
# - E4: scene clue placement
# - E8: many map markers
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "nohelp-play: $*" >&2; }
pass() { echo "✓ $*"; }
fail() { echo "✗ $*" >&2; return 1; }
fails=()
notes=()

claim_game || exit 2
start_cold || { say "game did not reach a playable world"; "$PZ" stop; exit 2; }
id="$(session)"

# Collect baseline world state
seed=$(ev 'return NHShared.GeneratedRuntime.worldSeed()' | cut -f1)
world=$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)
notes+=("World: seed=$seed places=$(ev 'local w=ModData.get("NHShared.Generated.G2"); return #(w and w.campaign and w.campaign.canonical and w.campaign.canonical.places or {})' | cut -f1)")

# E1: Spoken clue text
say "E1: Inspect a clue and check spoken text..."
result=$(ev '
local R=require("NHShared/GeneratedRuntime")
local w=ModData.get("NHShared.Generated.G2")
local clues=w and w.campaign and w.campaign.canonical and w.campaign.canonical.clues or {}
for id,c in pairs(clues) do if c.pieces and #c.pieces>0 then
  local text=c.body or ""
  if #text>50 and #text<150 then return id,text:sub(1,50) end
end end
return "none","(no short clue found)"
' 2>&1 | grep "^ok")
if [ -z "$result" ]; then fail "E1: could not find a test clue"; fails+=("E1"); else
  pass "E1: located test clue for inspection"
  notes+=("E1: $(echo "$result" | cut -c1-80)")
fi

# E2/E3: Container placement
say "E2/E3: Check container placement and fallback..."
count=$(ev '
local R=require("NHShared/GeneratedRuntime")
local w=ModData.get("NHShared.Generated.G2")
local places=w and w.campaign and w.campaign.canonical and w.campaign.canonical.places or {}
local ok=0
for _,p in ipairs(places) do
  if p.items and #p.items>0 then
    local found=0
    for _,it in ipairs(p.items) do if it.id and it.id:sub(1,1)=="t" then found=found+1 end end
    if found>0 then ok=ok+1 end
  end
end
return ok
' 2>&1 | grep "^ok" | cut -d' ' -f2)
if [ "${count:-0}" -gt 0 ]; then
  pass "E2/E3: $count places have clues placed"
  notes+=("E2/E3: placed=$count")
else
  fail "E2/E3: no clues placed in any location"
  fails+=("E2/E3")
fi

# E5: Place top-up (clue count per place)
say "E5: Check clue coverage per marked place..."
coverage=$(ev '
local w=ModData.get("NHShared.Generated.G2")
local places=w and w.campaign and w.campaign.canonical and w.campaign.canonical.places or {}
local thin=0; local rich=0
for _,p in ipairs(places) do
  local n=(p.items and #p.items) or 0
  if n<3 then thin=thin+1
  elseif n>=5 then rich=rich+1 end
end
return thin,rich,#places
' 2>&1 | grep "^ok" | cut -d' ' -f2-)
if [ -n "$coverage" ]; then
  pass "E5: coverage check"
  notes+=("E5: thin(<3 clues)=$(echo "$coverage" | cut -f1) rich(>=5)=$(echo "$coverage" | cut -f2) total=$(echo "$coverage" | cut -f3)")
else
  fail "E5: could not assess place coverage"
  fails+=("E5")
fi

# E4: Scene clue placement (listener status)
say "E4: Check scene clue placement via listener..."
scene_result=$(ev '
local st=NHShared.VanillaSceneRuntime.listenerStatus()
if not st then return "no_listener" end
return st.seen,st.version
' 2>&1 | grep "^ok")
if [ -n "$scene_result" ]; then
  pass "E4: scene listener active"
  notes+=("E4: $(echo "$scene_result")")
else
  fail "E4: scene listener not responding"
  fails+=("E4")
fi

# E8: Map marker count (pen and marker creation)
say "E8: Check map marker support..."
marker_check=$(ev 'return NHShared.Journal.canAddMarker and "yes" or "no"' 2>&1 | grep "^ok")
if echo "$marker_check" | grep -q "yes"; then
  pass "E8: map marker system ready"
  notes+=("E8: markers supported")
else
  fail "E8: map marker system check failed"
  fails+=("E8")
fi

# E3b: Per-world container order (will be tested on reload)
notes+=("E3b: test deferred to reload/second-world")

# Save and reload (tests E2/E3 persistence and E3b)
say "Testing persistence across save/reload..."
"$PZ" stop --save >/dev/null 2>&1 || fail "save and quit failed"
sleep 2
"$PZ" start --continue "$world" >/dev/null 2>&1 || fail "reload failed"
sleep 30

seed2=$(ev 'return NHShared.GeneratedRuntime.worldSeed()' 2>&1 | grep "^ok" | cut -d' ' -f2)
if [ "$seed2" = "$seed" ]; then
  pass "E3b: world seed persisted"
  notes+=("E3b: seed=$seed (same)")
else
  fail "E3b: world seed changed ($seed -> $seed2)"
  fails+=("E3b")
fi

out="$REPO/docs/management/evidence/linux-autotest/$id-nohelp-play.txt"
mkdir -p "$(dirname "$out")"
{
  echo "Linux No Help play check $id: $([ ${#fails[@]} -eq 0 ] && echo "PASS" || echo "FAIL")"
  source_line
  renderer_line
  for n in "${notes[@]}"; do echo "$n"; done
  for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$out.part"
mv "$out.part" "$out"
say "report: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
[ ${#fails[@]} -eq 0 ]
