#!/usr/bin/env bash
# Of Interest phase 7 check: THE VERSION-DRIFT GATE AND THE VEHICLE FALLBACK in the real game. Visible window,
# never --hidden.
#
#   tools/autotest/checks/oi_drift.sh
#
#  1. boots normally: exactly one ev=drift line, level 0 (the live dependency equals the shipped baseline);
#  2. through the eval channel runs the gate on MUTATED COPIES of the live tables (the copy is never installed):
#     unchanged -> 0; five of our ids removed -> 2; a modData key renamed -> 3; the place list reordered -> 3;
#     the live game state (record, tracker, fingerprints, level) is identical afterwards, no new drift line, no error;
#  3. simulates level 2 for real: the adapter treats one scene's note as missing (debug hook), the survivor arrives:
#     the scene is created objects-only (the stand-in), ONE refusal line; a second scene's note is hidden while it
#     waits, the game is saved and reloaded WITHOUT the hook, and that scene arrives with its note forced;
#  4. vehicle fallback: a vehicle-host scene at a site with no fitting vehicle (none is spawned): on arrival it moves
#     once to a building within 60 tiles, the note is forced there, one find, and all of it is stable after save/reload.
# Only ids, codes, counts and levels are printed - never any note text (the owner plays blind).
# Report: docs/management/evidence/linux-autotest/<session>-oi-drift.txt. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
export PZ_NOHELP_ONLY=1 PZ_OI=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "oi-drift: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
notes=(); note() { notes+=("$*"); say "$*"; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
trap '"$PZ" stop >/dev/null 2>&1' EXIT
cnt() { local n; n="$(run_log | grep -c -- "$1")"; echo "${n:-0}"; }
f() { cut -f"$1"; }
HS="$REPO/tools/autotest/checks/oi_scene.lua"
HT="$REPO/tools/autotest/checks/oi_batch.lua"
HD="$REPO/tools/autotest/checks/oi_drift.lua"
loadlua() { ev -f "$HS" >/dev/null && ev -f "$HT" >/dev/null && ev -f "$HD" >/dev/null; }

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
wait_true 60 'OIShared.NoteCatalogue.isActive() and OIShared.NoteForcerGame~=nil and OIShared.GeneratedRuntime~=nil and OIShared.DriftGate.level()~=nil' || fail "catalogue/forcer/runtime/gate not up"
loadlua || abort "could not load the check's Lua"
ev 'return CFBATCH.god()' >/dev/null

# ---- 1. the gate at boot
live="$(ev 'return CFDRIFT.live()')"
note "boot: gate (level, missing, added, restored, poolsMissing, poolsExtra, placesExtra, forcedGone, entries) = $(tr '\t' ' ' <<<"$live")"
[ "$(f 1 <<<"$live")" = 0 ] || fail "boot: drift level $(f 1 <<<"$live"), expected 0"
[ "$(f 9 <<<"$live")" = 493 ] || fail "boot: $(f 9 <<<"$live") entries, expected 493"
[ "$(cnt 'ev=drift')" = 1 ] || fail "boot: $(cnt 'ev=drift') drift lines, expected exactly 1"
[ "$(cnt 'ev=drift.*level=0')" = 1 ] || fail "boot: the drift line does not say level 0"
note "boot drift line: $(run_log | grep 'ev=drift' | head -1 | sed 's/^.*ev=drift //')"

# ---- 2. mutated copies
s0="$(ev 'return CFDRIFT.state()')"
for spec in "none 0" "remove5 2" "key 3" "reorder 3"; do
    set -- $spec
    r="$(ev "return CFDRIFT.mutate('$1')")"
    note "mutated copy '$1': level $(f 1 <<<"$r"), missing $(f 2 <<<"$r"), added $(f 3 <<<"$r"), why $(f 4 <<<"$r")"
    [ "$(f 1 <<<"$r")" = "$2" ] || fail "mutation $1: level $(f 1 <<<"$r"), expected $2"
    [ "$1" != remove5 ] || [ "$(f 2 <<<"$r")" = 5 ] || fail "mutation remove5: missing $(f 2 <<<"$r"), expected 5"
done
s1="$(ev 'return CFDRIFT.state()')"
[ "$s0" = "$s1" ] || fail "the live game state changed under the mutated copies: [$s0] -> [$s1]"
note "live state before/after the mutations identical: $(tr '\t' ' ' <<<"$s1")"
[ "$(cnt 'ev=drift')" = 1 ] || fail "the mutated copies wrote drift lines"
errs="$(mod_errors)"; [ -z "$errs" ] || fail "errors inside the mods after the mutations: $(head -3 <<<"$errs" | tr '\n' ' ')"

# ---- helpers shared by 3 and 4
T0=$(date +%s)
until [ "$(cnt 'ev=stories.*why=done')" -ge 1 ] || [ $(( $(date +%s) - T0 )) -gt 600 ]; do sleep 3; done
[ "$(cnt 'ev=stories.*why=done')" -ge 1 ] || abort "the stories pass never finished"
statusline() { ev 'return CFSCENE.status()'; }
arrive_until_placed() { # arrive_until_placed LABEL
    local label="$1" st side=1 k=0 deadline=$(( $(date +%s) + 300 ))
    while :; do
        ev "return CFSCENE.far($side)" >/dev/null; sleep 8
        st="$(statusline)"; [ "$(f 2 <<<"$st")" = placed ] && return 0
        k=$((k + 1)); [ $((k % 6)) = 0 ] && side=$((-side))
        [ "$(date +%s)" -lt "$deadline" ] || { fail "$label: not created after 300 s (status: $st)"; return 1; }
    done
}
goto_scene() { ev "return CFSCENE.stand(2)" >/dev/null; wait_true 60 'CFSCENE.loaded()' || { fail "the scene's squares did not load"; return 1; }; sleep 2; }
note_shape() { # note_shape LABEL EXPECT(forced|plain) -> checks the scene at the spot
    local label="$1" want="$2" s k
    goto_scene || return
    s="$(ev 'return CFSCENE.shape()')"
    k="$(ev 'return CFSCENE.keys()')"
    if [ "$want" = forced ]; then
        [ "$(f 1 <<<"$s")" = true ] || { fail "$label: no forced note at the spot: $(tr '\t' ' ' <<<"$s")"; return; }
        [ "$(f 16 <<<"$s")" = 1 ] && [ "$(f 8 <<<"$s")" = true ] && [ "$(f 9 <<<"$s")" = true ] && [ "$(f 11 <<<"$s")" = true ] && [ "$(f 12 <<<"$s")" = "$NID" ] && [ "$(f 15 <<<"$s")" = ok ] \
            || fail "$label: forced keys / record / verify wrong ($(tr '\t' ' ' <<<"$s"))"
        [ "$(f 1 <<<"$k")" = 1 ] && [ "$(f 3 <<<"$k")" = 0 ] || fail "$label: forced pieces=$(f 1 <<<"$k"), objects with note keys=$(f 3 <<<"$k")"
        note "$label: note present as piece 1 (file ok, token ok, flag set, record id ok, verify ok), forced pieces=$(f 1 <<<"$k")"
    else
        [ "$(f 1 <<<"$s")" = false ] || fail "$label: a note is present but should be objects-only"
        [ "$(f 1 <<<"$k")" = 0 ] && [ "$(f 3 <<<"$k")" = 0 ] || fail "$label: forced pieces=$(f 1 <<<"$k") (expected 0), note keys on objects=$(f 3 <<<"$k")"
        local want_n="$(f 6 <<<"$s")"; local have="$(( $(f 4 <<<"$s") + $(f 5 <<<"$s") ))"
        note "$label: objects only: forced pieces=$(f 1 <<<"$k"), plain pieces=$(f 2 <<<"$k"), stand-in kept the piece count (holders/inside/loose/want = $(f 3 <<<"$s") $(f 4 <<<"$s") $(f 5 <<<"$s") $(f 6 <<<"$s"))"
    fi
}

# ---- 3. level 2 for real
d0="$(ev 'return CFDRIFT.digest()')"
r="$(ev "return CFBATCH.select('building',2)")"; SIDA="$(f 1 <<<"$r")"; NIDA="$(f 2 <<<"$r")"
r="$(ev "return CFBATCH.select('building',3)")"; SIDB="$(f 1 <<<"$r")"; NIDB="$(f 2 <<<"$r")"
[ "$SIDA" != false ] && [ "$SIDB" != false ] || abort "not enough building scenes"
note "level-2 scenes: A clue $SIDA note $NIDA, B clue $SIDB note $NIDB"
ev "return CFBATCH.select('building',2)" >/dev/null; NID="$NIDA"
[ "$(ev "return CFDRIFT.hide('$NIDA')" | f 1)" = true ] || abort "the debug hook is not available (is the eval session in debug mode?)"
ev "return CFDRIFT.hide('$NIDB')" >/dev/null
arrive_until_placed "A (note hidden)" && note_shape "A (note hidden)" plain
fl="$(run_log | grep 'ev=force' | grep -c "why=not-in-pool.*note=$NIDA")"
note "A: refusal lines for its note: $fl"
[ "$fl" = 1 ] || fail "A: $fl refusal lines for the hidden note, expected 1"
[ "$(ev 'return CFDRIFT.digest()')" = "$d0" ] || fail "the world record's decisions changed during level 2"
# B waits (never visited); save, drop the hook by reloading, arrive at B
"$PZ" stop --save >/dev/null 2>&1 || fail "save and quit failed"
sleep 3
world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
"$PZ" start --continue "$world" >/dev/null 2>&1 || abort "the save did not reload"
wait_true 90 'OIShared.NoteForcerGame~=nil and OIShared.GeneratedRuntime~=nil and OIShared.DriftGate.level()~=nil' || fail "reload: runtime not up"
loadlua || abort "could not reload the check's Lua"
ev 'return CFBATCH.god()' >/dev/null
[ "$(ev 'return CFDRIFT.live()' | f 1)" = 0 ] || fail "reload: drift level is not 0 without the hook"
[ "$(ev 'return CFDRIFT.digest()')" = "$d0" ] || fail "reload: decisions differ"
ev "return CFBATCH.select('building',3)" >/dev/null; NID="$NIDB"
arrive_until_placed "B (after the reload, hook gone)" && note_shape "B (recovered)" forced
ev "return CFBATCH.select('building',2)" >/dev/null; NID="$NIDA"
note_shape "A after the reload (stays objects-only, by design)" plain

# ---- 4. vehicle fallback
moved=0
for nth in 1 2 3; do
    r="$(ev "return CFBATCH.select('vehicle',$nth)")"
    [ "$(f 1 <<<"$r")" != false ] || { note "no vehicle scene number $nth"; break; }
    SID="$(f 1 <<<"$r")"; NID="$(f 2 <<<"$r")"
    ox="$(ev 'return CFSCENE.home.x' | f 1)"; oy="$(ev 'return CFSCENE.home.y' | f 1)"
    note "vehicle scene $nth: clue $SID note $NID centre $ox,$oy; no vehicle is spawned"
    ev "return CFDRIFT.near(20)" >/dev/null
    k=0
    until [ "$(f 2 <<<"$(ev 'return CFDRIFT.where()')")" = 1 ] || [ $k -ge 24 ]; do sleep 5; k=$((k + 1)); done
    w="$(ev 'return CFDRIFT.where()')"
    if [ "$(f 2 <<<"$w")" = 1 ]; then moved=1; break; fi
    note "vehicle scene $nth did not move (status $(f 3 <<<"$w")); a fitting vehicle may stand near it: $(ev 'return CFDRIFT.vehicleNear()' | f 1) within 25 tiles"
done
[ "$moved" = 1 ] || { fail "no vehicle scene moved to a building"; }
if [ "$moved" = 1 ]; then
    nx="$(f 5 <<<"$w")"; ny="$(f 6 <<<"$w")"
    dx=$(( nx > ox ? nx - ox : ox - nx )); dy=$(( ny > oy ? ny - oy : oy - ny )); dist=$(( dx > dy ? dx : dy ))
    note "moved: now host=$(f 8 <<<"$w") building=$(f 7 <<<"$w") at $nx,$ny, $dist tiles from the original centre; site $(f 4 <<<"$w")"
    [ "$(f 8 <<<"$w")" = building ] || fail "moved scene's host is $(f 8 <<<"$w")"
    [ "$dist" -le 66 ] || fail "moved $dist tiles (limit 60 plus building size)"
    [ "$(cnt 'ev=batch.*why=vehicle-fallback ')" = 1 ] || [ "$(cnt 'ev=batch.*why=vehicle-fallback')" -ge 1 ] || fail "no fallback log line"
    [ "$(ev 'return CFDRIFT.dupBuildings()' | f 1)" = 0 ] || fail "a building is held twice"
    ev "return CFDRIFT.follow($nx,$ny)" >/dev/null
    arrive_until_placed "fallback scene" && note_shape "fallback scene" forced
    r0="$(cnt "ev=recognised.*doc=$SID")"
    fd="$(ev "return CFSCENE.find('search')")"; sleep 1; fd2="$(ev "return CFSCENE.find('look')")"; sleep 3
    r1="$(cnt "ev=recognised.*doc=$SID")"
    [ "$(f 2 <<<"$fd")" = true ] && [ "$(f 3 <<<"$fd2")" = true ] && [ "$(f 2 <<<"$fd2")" = false ] && [ $((r1 - r0)) = 1 ] || fail "the find was not recorded exactly once ($((r1 - r0)) events)"
    note "fallback scene: found once ($((r1 - r0)) event)"
    w1="$(ev 'return CFDRIFT.where()' | tr '\t' ' ')"
    "$PZ" stop --save >/dev/null 2>&1 || fail "save and quit failed (2)"
    sleep 3
    "$PZ" start --continue "$world" >/dev/null 2>&1 || abort "the second save did not reload"
    wait_true 90 'OIShared.NoteForcerGame~=nil and OIShared.GeneratedRuntime~=nil and OIShared.DriftGate.level()~=nil' || fail "reload 2: runtime not up"
    loadlua || abort "could not reload the check's Lua (2)"
    ev 'return CFBATCH.god()' >/dev/null
    ev "return CFBATCH.select('vehicle',$nth)" >/dev/null
    CFID="$SID"; ev "CFSCENE.id='$SID'; return true" >/dev/null
    ev "return CFDRIFT.follow($nx,$ny)" >/dev/null
    w2="$(ev 'return CFDRIFT.where()' | tr '\t' ' ')"
    [ "$w1" = "$w2" ] || fail "reload: the scene's place changed: [$w1] -> [$w2]"
    arrive_until_placed "fallback scene after reload" && note_shape "fallback scene after reload" forced
    [ "$(cnt 'ev=batch.*why=vehicle-fallback')" = 0 ] || fail "reload: the fallback ran again"
    [ "$(ev 'return CFDRIFT.dupBuildings()' | f 1)" = 0 ] || fail "reload: a building is held twice"
    note "stable after save and reload: $w2"
fi
"$PZ" shot "$RUNS/$id-oi-drift.png" >/dev/null 2>&1 || true
errs="$(mod_errors)"; [ -z "$errs" ] || fail "errors inside the mods: $(head -3 <<<"$errs" | tr '\n' ' ')"
result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$EVIDENCE/$id-oi-drift.txt"
{ echo "Linux Of Interest drift check $id: $result"; source_line; renderer_line
  for x in "${notes[@]}"; do echo "note: $x"; done; for x in "${fails[@]}"; do echo "FAIL: $x"; done; } > "$out.part"
mv "$out.part" "$out"
say "written: $out"; cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ] && exit 0 || exit 1
