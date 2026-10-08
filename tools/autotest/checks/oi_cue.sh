#!/usr/bin/env bash
# Of Interest check: the "you are close to a clue" cue (bubble "Hm?" and a spoken line) in the real game.
# Visible window, never --hidden.
#
#   tools/autotest/checks/oi_cue.sh
#
# Boots Of Interest + the dependency + ZombieBuddy, decides ONE note scene (as oi_scene.sh does), lets the
# engine place it, then asserts:
#   - the scene is a live clue for the cue (Search Mode's liveClues has exactly one row for it, not recognised);
#   - the survivor walking up to it makes the cue fire: the cue counter rises, the last cue is this scene,
#     and the log carries a 'cue said' line (bubble sent, spoken line sent);
#   - the cue stays quiet for the same spot while the survivor remains near it (once per approach/place);
#   - after walking away and back (re-armed) with a fresh save-state, it can fire again.
# Only ids and counts are printed - never any note text, name or place (the owner plays blind).
# Report: docs/management/evidence/linux-autotest/<session>-oi-cue.txt. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
export PZ_NOHELP_ONLY=1 PZ_OI=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "oi-cue: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
notes=(); note() { notes+=("$*"); say "$*"; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
trap '"$PZ" stop >/dev/null 2>&1' EXIT
cnt() { local n; n="$(run_log | grep -c -- "$1")"; echo "${n:-0}"; }
f() { cut -f"$1"; }
H="$REPO/tools/autotest/checks/oi_scene.lua"
H2="$REPO/tools/autotest/checks/oi_cue.lua"

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
wait_true 60 'OIShared.NoteCatalogue.isActive() and OIShared.NoteForcerGame~=nil and OIShared.GeneratedRuntime~=nil and OIShared.ClueCue~=nil' || fail "catalogue/forcer/runtime/cue not active"
ev -f "$H" >/dev/null && ev -f "$H2" >/dev/null || abort "could not load the check's Lua"

r="$(ev 'return CFSCENE.decide()')"
[ "$(f 1 <<<"$r")" = true ] || abort "the scene was not decided: $r"
SID="$(f 2 <<<"$r")"
note "scene decided: clue $SID"

statusline() { ev 'return CFSCENE.status()'; }
deadline=$(( $(date +%s) + 420 )); k=0; side=1
while :; do
    said_before="$(f 1 <<<"$(ev 'return CFCUE.state()')")"
ev "return CFSCENE.far($side)" >/dev/null
    sleep 8
    st="$(statusline)"
    [ "$(f 2 <<<"$st")" = placed ] && break
    k=$((k + 1)); [ $((k % 8)) = 0 ] && side=$((-side))
    [ "$(date +%s)" -lt "$deadline" ] || abort "the scene was not placed after 420 s (status: $st)"
done
note "placed; recognised=$(f 6 <<<"$st")"
[ "$(f 6 <<<"$st")" = false ] || fail "the clue is already recognised before the walk"

# The cue must know the scene as a clue (this is the question: do Of Interest placements reach the cue?)
rows="$(ev 'return CFSCENE.liveRows()')"
note "live clue rows for the scene (what the cue iterates): $rows"
[ "$rows" = 1 ] || fail "the cue sees $rows clue rows for the scene, expected 1"

# ---- arm the cue (aimed at this scene only, no cooldown, fresh memory), THEN walk up
ev 'return CFSCENE.cueSetup()' >/dev/null
l0="$(cnt 'cue said')"
ev 'return CFSCENE.stand(2)' >/dev/null
wait_true 40 'CFSCENE.loaded()' || fail "the scene's squares did not load"
deadline=$(( $(date +%s) + 90 )); cs=""
while [ "$(date +%s)" -lt "$deadline" ]; do
    cs="$(ev 'return CFCUE.state()')"
    [ "$(f 1 <<<"$cs")" -ge 1 ] 2>/dev/null && break
    sleep 2
done
# 1 said, 2 suppressed, 3 last is this scene, 4 bubble line length, 5 spoken line length, 6 bubble line is a cue word
note "cue (said, suppressed, last was this scene, bubble length, spoken length): $(tr '\t' ' ' <<<"$cs")"
[ "$(f 1 <<<"$cs")" -ge 1 ] 2>/dev/null && [ "$(f 3 <<<"$cs")" = true ] || fail "the cue did not fire when the survivor walked up to the clue"
sleep 3
l1="$(cnt 'cue said')"
note "cue lines in the log for this walk: $((l1 - l0))"
[ $((l1 - l0)) -ge 1 ] || fail "no 'cue said' line in the log"
line="$(run_log | grep 'cue said' | tail -1 | sed 's/^.*ev=hint //')"
note "log line (shape only): $(sed -E 's/"[^"]*"/"..."/g; s/ at [^=]*doc=/ at - doc=/' <<<"$line")"
grep -q 'bubble=true' <<<"$line" || fail "the cue line does not say the bubble was sent"

# ---- stays quiet for the same spot while the survivor stays near
said1="$(f 1 <<<"$(ev 'return CFCUE.state()')")"
sleep 12
said2="$(f 1 <<<"$(ev 'return CFCUE.state()')")"
note "cue count staying near the clue for 12 s: $said1 -> $said2"
[ "$said1" = "$said2" ] || fail "the cue repeated for the same spot while the survivor stayed near"

# ---- walk away and come back: the first-cue teaching line is spent, so now the short cue and a spoken line
ev "return CFSCENE.far($(f 1 <<<"$(ev 'return CFSCENE.side()')"))" >/dev/null
sleep 4
ev 'return CFSCENE.cueSetup()' >/dev/null
ev 'return CFSCENE.stand(2)' >/dev/null
wait_true 40 'CFSCENE.loaded()' || fail "the scene's squares did not load the second time"
deadline=$(( $(date +%s) + 90 )); cs2=""
while [ "$(date +%s)" -lt "$deadline" ]; do
    cs2="$(ev 'return CFCUE.state()')"
    [ "$(f 1 <<<"$cs2")" -gt "$said_before" ] 2>/dev/null && break
    sleep 2
done
note "second approach (said, suppressed, last was this scene, bubble length, spoken length): $(tr '\t' ' ' <<<"$cs2")"
[ "$(f 1 <<<"$cs2")" -gt "$said_before" ] 2>/dev/null && [ "$(f 3 <<<"$cs2")" = true ] || fail "the cue did not fire on the second approach"
[ "$(f 5 <<<"$cs2")" -gt 0 ] 2>/dev/null || fail "the second cue had no spoken line"

shotp="$RUNS/$id-oi-cue.png"; "$PZ" shot "$shotp" >/dev/null 2>&1 || true

# ---- every cue so far was for this scene only; the log has no cue failure
[ "$(cnt 'cue failed')" = 0 ] || fail "the cue reported a failure"
errs="$(mod_errors)"; [ -z "$errs" ] || fail "errors inside the mods: $(head -3 <<<"$errs" | tr '\n' ' ')"
result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$EVIDENCE/$id-oi-cue.txt"
{ echo "Linux Of Interest cue check $id: $result"; source_line; renderer_line
  for x in "${notes[@]}"; do echo "note: $x"; done; for x in "${fails[@]}"; do echo "FAIL: $x"; done; } > "$out.part"
mv "$out.part" "$out"
say "written: $out"; cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ] && exit 0 || exit 1
