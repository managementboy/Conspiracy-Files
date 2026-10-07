#!/usr/bin/env bash
# Of Interest phase 4 check: ONE note scene (a forced note + ordinary objects, one clue) in the real game.
# Visible window, never --hidden.
#
#   tools/autotest/checks/oi_scene.sh
#
# Boots Of Interest + the dependency + ZombieBuddy, decides the test scene (Generated/Scenes row 1) on a box
# around the survivor's start, lets the engine place it, then asserts:
#   - the holder (or loose set) exists with the note inside as a forced item: exactly one forced piece, the
#     other pieces plain objects without note keys, holder = the pick rule's, id/token/flag/record all agree;
#   - the close cue fires near it, Search Mode has ONE live row (one icon) for the scene;
#   - the tracker sweep puts a cleared flag back;
#   - after the clock moves, RELOCATION moves the whole scene and the new note piece has the SAME id under the
#     SAME token (record kept, replacement counted), flag kept, verify clean;
#   - SAVE + RELOAD keep everything and verify is clean, the start sweep repaired nothing;
#   - the find (Search Mode, then Look it over) records ONE find, the nudge is spoken ONCE.
# Only ids, codes, counts and LENGTHS are printed - never any note text (the owner plays blind).
# Report: docs/management/evidence/linux-autotest/<session>-oi-scene.txt. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
export PZ_NOHELP_ONLY=1 PZ_OI=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "oi-scene: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
notes=(); note() { notes+=("$*"); say "$*"; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
trap '"$PZ" stop >/dev/null 2>&1' EXIT
cnt() { local n; n="$(run_log | grep -c -- "$1")"; echo "${n:-0}"; }
f() { cut -f"$1"; }
H="$REPO/tools/autotest/checks/oi_scene.lua"

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
wait_true 60 'OIShared.NoteCatalogue.isActive() and OIShared.NoteForcerGame~=nil and OIShared.GeneratedRuntime~=nil' || fail "catalogue/forcer/runtime not active"
ev -f "$H" >/dev/null || abort "could not load the check's Lua"

r="$(ev 'return CFSCENE.decide()')"
[ "$(f 1 <<<"$r")" = true ] || abort "the scene was not decided: $r"
SID="$(f 2 <<<"$r")"; NID="$(f 3 <<<"$r")"
note "scene decided: clue $SID, note id $NID"

# ---- placement: the survivor stands 30 tiles east of the box until the engine has placed the scene
statusline() { ev 'return CFSCENE.status()'; }
deadline=$(( $(date +%s) + 420 )); k=0; side=1
while :; do
    ev "return CFSCENE.far($side)" >/dev/null
    sleep 8
    st="$(statusline)"
    [ "$(f 2 <<<"$st")" = placed ] && break
    k=$((k + 1)); [ $((k % 8)) = 0 ] && side=$((-side))
    [ "$(date +%s)" -lt "$deadline" ] || abort "the scene was not placed after 420 s (status: $st)"
done
note "placed at x,y,z = $(f 3 <<<"$st"),$(f 4 <<<"$st"),$(f 5 <<<"$st"); recognised=$(f 6 <<<"$st")"
[ "$(cnt "ev=case.*area-decided-note-scene")" -ge 1 ] || note "(decided line not seen in the log)"

# ---- go there and read the real container
goto_scene() { # goto_scene [dx]
    ev "return CFSCENE.stand(${1:-2})" >/dev/null
    wait_true 40 'CFSCENE.loaded()' || { fail "the scene's squares did not load"; return 1; }
    sleep 2
}
check_shape() { # check_shape LABEL
    local label="$1" s
    goto_scene 2 || return
    s="$(ev 'return CFSCENE.shape()')"
    if [ "$(f 1 <<<"$s")" != true ]; then fail "$label: shape unreadable: $(tr '\t' ' ' <<<"$s")"; return; fi
    # 2 holders,3 inside,4 loose,5 want,6 holder type,7 pick ok,8 id ok,9 token ok,10 baked,11 flag,12 record id,13 re,14 fix,15 verify,16 piece no,17 text file,18 type
    local holders inside loose want
    holders="$(f 2 <<<"$s")"; inside="$(f 3 <<<"$s")"; loose="$(f 4 <<<"$s")"; want="$(f 5 <<<"$s")"
    note "$label: holders=$holders inside=$inside loose=$loose want=$want holder=$(f 6 <<<"$s") pickRule=$(f 7 <<<"$s") note piece=$(f 16 <<<"$s") item=$(f 18 <<<"$s") file=$(f 17 <<<"$s") re=$(f 13 <<<"$s") fix=$(f 14 <<<"$s") verify=$(f 15 <<<"$s")"
    if [ "$holders" = 1 ]; then
        [ "$inside" = "$want" ] && [ "$loose" = 0 ] || fail "$label: pieces inside=$inside loose=$loose, expected $want inside"
        [ "$(f 7 <<<"$s")" = true ] || fail "$label: the holder is not the one the pick rule makes"
    else
        [ "$holders" = 0 ] && [ "$loose" = "$want" ] || fail "$label: neither one holder with all pieces nor a loose set ($holders/$loose/$want)"
        note "$label: no holder fitted: the pieces lie loose in one spot, as No Help sets do"
    fi
    [ "$(f 16 <<<"$s")" = 1 ] || fail "$label: the note is not piece 1 (piece=$(f 16 <<<"$s"))"
    [ "$(f 8 <<<"$s")" = true ] && [ "$(f 9 <<<"$s")" = true ] && [ "$(f 10 <<<"$s")" = true ] || fail "$label: forced keys wrong (id/token/baked = $(f 8 <<<"$s")/$(f 9 <<<"$s")/$(f 10 <<<"$s"))"
    [ "$(f 11 <<<"$s")" = true ] || fail "$label: the dependency's used-flag is not set"
    [ "$(f 12 <<<"$s")" = "$NID" ] || fail "$label: the record names another id"
    [ "$(f 15 <<<"$s")" = ok ] || fail "$label: verify says $(f 15 <<<"$s")"
    [ "$(f 18 <<<"$s")" = Base.Note ] || fail "$label: the note piece is not a Base.Note"
    local k; k="$(ev 'return CFSCENE.keys()')"
    [ "$(f 1 <<<"$k")" = 1 ] && [ "$(f 3 <<<"$k")" = 0 ] || fail "$label: forced pieces=$(f 1 <<<"$k"), objects with note keys=$(f 3 <<<"$k")"
    note "$label: forced pieces=$(f 1 <<<"$k"), plain object pieces=$(f 2 <<<"$k"), objects carrying note keys=$(f 3 <<<"$k")"
    SHAPE="$s"
}
check_shape "placed"; s1="$SHAPE"
TYPE1="$(f 6 <<<"$s1")"
"$PZ" shot "$RUNS/$id-oi-scene.png" >/dev/null 2>&1 || true

# ---- the hint and the Search Mode row
ev 'return CFSCENE.cueSetup()' >/dev/null
goto_scene 2
cue0="$(cnt 'cue said')"
deadline=$(( $(date +%s) + 60 )); cs=""
while [ "$(date +%s)" -lt "$deadline" ]; do
    cs="$(ev 'return CFSCENE.cueState()')"
    [ "$(f 1 <<<"$cs")" -ge 1 ] 2>/dev/null && break
    sleep 3
done
note "close cue (said, suppressed, last was this scene): $(tr '\t' ' ' <<<"$cs"); cue lines in the log: $(( $(cnt 'cue said') - cue0 ))"
[ "$(f 1 <<<"$cs")" -ge 1 ] 2>/dev/null && [ "$(f 3 <<<"$cs")" = true ] || fail "the close cue did not fire for the scene"
rows="$(ev 'return CFSCENE.liveRows()')"
note "Search Mode live rows for the scene: $rows"
[ "$rows" = 1 ] || fail "Search Mode has $rows rows for the scene, expected 1"

# ---- the dependency's pool reset is answered by the hourly sweep
t="$(ev 'return CFSCENE.trackerCycle()')"
note "tracker cycle (flag cleared, flags put back, records, flag now): $(tr '\t' ' ' <<<"$t")"
[ "$(f 1 <<<"$t")" = true ] && [ "$(f 2 <<<"$t")" -ge 1 ] 2>/dev/null && [ "$(f 4 <<<"$t")" = true ] || fail "the sweep did not restore the cleared flag"

# ---- relocation: the clock moves 4 nights, the survivor stands on the far side of the box
old_xy="$(f 3 <<<"$st"),$(f 4 <<<"$st")"
dir="$(ev 'return CFSCENE.side()')"
adv="$(ev 'return CFSCENE.advance(4)')"
note "clock (hours before, after): $(tr '\t' ' ' <<<"$adv")"
rl0="$(cnt "relocated $SID")"; far=$(( -dir ))
deadline=$(( $(date +%s) + 420 )); moved=0
while [ "$(date +%s)" -lt "$deadline" ]; do
    ev "return CFSCENE.far($far)" >/dev/null
    sleep 10
    [ "$(cnt "relocated $SID")" -gt "$rl0" ] && { moved=1; break; }
done
if [ "$moved" = 1 ]; then
    st2="$(statusline)"; new_xy="$(f 3 <<<"$st2"),$(f 4 <<<"$st2")"
    note "relocated: the scene moved from $old_xy to $new_xy"
    [ "$old_xy" != "$new_xy" ] || fail "relocation reported but the target did not change"
    check_shape "after relocation"; s2="$SHAPE"
    [ "$(f 13 <<<"$s2")" -ge 1 ] 2>/dev/null || fail "the record did not count the replacement note (re=$(f 13 <<<"$s2"))"
    [ "$(f 17 <<<"$s2")" = "$(f 17 <<<"$s1")" ] || fail "the text file id changed across relocation"
    [ "$(f 12 <<<"$s2")" = "$NID" ] || fail "the record id changed across relocation"
else
    fail "no relocation in 420 s: the scene never moved (relocation unproven)"
fi

# ---- save and reload
"$PZ" stop --save >/dev/null 2>&1 || fail "save and quit failed"
sleep 3
world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
"$PZ" start --continue "$world" >/dev/null 2>&1 || abort "the save did not reload"
wait_true 90 'OIShared.NoteForcerGame~=nil and OIShared.GeneratedRuntime~=nil' || fail "reload: runtime not up"
ev -f "$H" >/dev/null || abort "could not reload the check's Lua"
at="$(ev 'return CFSCENE.attach()')"
[ "$(f 1 <<<"$at")" = true ] || abort "reload: the scene is not in the record ($at)"
k=0; deadline=$(( $(date +%s) + 240 ))
while :; do
    st3="$(statusline)"
    [ "$(f 2 <<<"$st3")" = placed ] && break
    ev "return CFSCENE.far(1)" >/dev/null; sleep 8
    [ "$(date +%s)" -lt "$deadline" ] || abort "reload: the scene is not placed (status $st3)"
done
note "reloaded: status $(f 2 <<<"$st3") at $(f 3 <<<"$st3"),$(f 4 <<<"$st3")"
check_shape "reloaded save"; s3="$SHAPE"
[ "$(f 17 <<<"$s3")" = "$(f 17 <<<"$s1")" ] || fail "reload: the text file id changed"
sl="$(run_log | grep "ev=force" | grep "op=sweep" | tail -1)"
if [ -n "$sl" ]; then
    grep -q "repaired=0" <<<"$sl" && grep -q "foreign=0" <<<"$sl" || fail "start sweep after reload not clean: $sl"
    note "reload sweep line: $(sed 's/^.*ev=force //' <<<"$sl")"
else note "reload sweep line: none (nothing carried)"; fi

# ---- the find, once; the nudge, once
n0="$(cnt 'scene nudge queued')"; r0="$(cnt "ev=recognised.*doc=$SID")"
fd="$(ev "return CFSCENE.find('search')")"
sleep 1
fd2="$(ev "return CFSCENE.find('look')")"
sleep 4
n1="$(cnt 'scene nudge queued')"; r1="$(cnt "ev=recognised.*doc=$SID")"
note "find via Search Mode (ok, new, recognised): $(tr '\t' ' ' <<<"$fd"); then Look it over (ok, new, recognised): $(tr '\t' ' ' <<<"$fd2")"
note "find events in the log: $((r1 - r0)); nudge lines queued: $((n1 - n0))"
[ "$(f 2 <<<"$fd")" = true ] && [ "$(f 3 <<<"$fd2")" = true ] || fail "the find was not recorded as expected"
[ "$(f 2 <<<"$fd2")" = false ] || fail "the second find on another path counted as new"
[ $((r1 - r0)) = 1 ] || fail "find events: $((r1 - r0)), expected 1"
[ $((n1 - n0)) = 1 ] || fail "nudge lines: $((n1 - n0)), expected 1"
[ "$(cnt 'said clue line')" -ge 1 ] || fail "the nudge was not shown in the bubble"

errs="$(mod_errors)"; [ -z "$errs" ] || fail "errors inside the mods: $(head -3 <<<"$errs" | tr '\n' ' ')"
result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$EVIDENCE/$id-oi-scene.txt"
{ echo "Linux Of Interest scene check $id: $result"; source_line; renderer_line
  for x in "${notes[@]}"; do echo "note: $x"; done; for x in "${fails[@]}"; do echo "FAIL: $x"; done; } > "$out.part"
mv "$out.part" "$out"
say "written: $out"; cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ] && exit 0 || exit 1
