#!/usr/bin/env bash
# Of Interest phase 6 check: ALL STORIES + THE STANDALONE BATCH in the real game. Visible window, never --hidden.
#
#   tools/autotest/checks/oi_batch.sh
#
# Boots Of Interest + the dependency + ZombieBuddy with the shipped enable list (all 19 stories) and the shipped
# batch config, and asserts from the saved world record: total scenes 250 +-10%, all note ids unique and known to
# the catalogue, no shared building, scenes in every town (min/max), host-kind counts; reads the world-start
# planning time from the log (busy milliseconds and the number of passes it was spread over); then teleports
# the survivor to one scene of each available kind (a story part, a building-hosted standalone scene, and a
# vehicle / body host when those are switched on), checks the engine creates the scene on arrival (the note
# forced, one holder or one loose set) and that ONE find is recorded per scene; then saves, reloads and asserts
# the decisions are identical (same digest, nothing decided again).
# Only ids, codes, counts and digests are printed - never any note text (the owner plays blind).
# Report: docs/management/evidence/linux-autotest/<session>-oi-batch.txt. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
export PZ_NOHELP_ONLY=1 PZ_OI=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "oi-batch: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
notes=(); note() { notes+=("$*"); say "$*"; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
trap '"$PZ" stop >/dev/null 2>&1' EXIT
cnt() { local n; n="$(run_log | grep -c -- "$1")"; echo "${n:-0}"; }
f() { cut -f"$1"; }
HS="$REPO/tools/autotest/checks/oi_scene.lua"
HT="$REPO/tools/autotest/checks/oi_batch.lua"

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
wait_true 60 'OIShared.NoteCatalogue.isActive() and OIShared.NoteForcerGame~=nil and OIShared.GeneratedRuntime~=nil' || fail "catalogue/forcer/runtime not active"
ev -f "$HS" >/dev/null && ev -f "$HT" >/dev/null || abort "could not load the check's Lua"
ev 'return CFBATCH.god()' >/dev/null

# ---- the decisions, from the saved world record
T0=$(date +%s)
until [ "$(cnt 'ev=stories.*why=done')" -ge 1 ] || [ $(( $(date +%s) - T0 )) -gt 600 ]; do sleep 3; done
note "time until the stories pass finished: $(( $(date +%s) - T0 )) s; scenes in the record: $(ev 'return CFBATCH.count()' | tr '\t' ' ')"
record_checks() { # record_checks LABEL
    local label="$1" c g t h
    c="$(ev 'return CFBATCH.count()')"; g="$(ev 'return CFBATCH.global()')"; t="$(ev 'return CFBATCH.towns()')"; h="$(ev 'return CFBATCH.hosts()')"
    note "$label: scenes (all, standalone) = $(tr '\t' ' ' <<<"$c"); (dup notes, unknown notes, shared buildings, digest) = $(tr '\t' ' ' <<<"$g"); towns (min, max, count) = $(f 1 <<<"$t") $(f 2 <<<"$t") $(f 3 <<<"$t"); per town: $(f 4 <<<"$t"); standalone hosts (building, vehicle, body) = $(tr '\t' ' ' <<<"$h")"
    local total="$(f 1 <<<"$c")"
    { [ "$total" -ge 225 ] && [ "$total" -le 275 ]; } || fail "$label: $total scenes, expected 250 +-10%"
    [ "$(f 1 <<<"$g")" = 0 ] && [ "$(f 2 <<<"$g")" = 0 ] && [ "$(f 3 <<<"$g")" = 0 ] || fail "$label: duplicate note, unknown note or shared building"
    [ "$(f 3 <<<"$t")" = 14 ] || fail "$label: scenes in $(f 3 <<<"$t") towns, expected 14"
    [ "$(f 1 <<<"$t")" -ge 1 ] || fail "$label: a town has no scene"
    DIGEST="$(f 4 <<<"$g")"; TOTAL="$total"
}
record_checks "decided"; d1="$DIGEST"; total1="$TOTAL"
plan="$(run_log | grep 'ev=stories' | grep 'why=plan' | head -1 | sed 's/^.*ev=stories //')"
note "plan line: $plan"
note "batch line: $(run_log | grep 'ev=batch' | grep 'why=plan' | head -1 | sed 's/^.*ev=batch //')"
pms="$(sed -n 's/.* ms=\([0-9]*\).*/\1/p' <<<"$plan")"
[ -n "$pms" ] && [ "$pms" -le 2000 ] || fail "world-start planning took ${pms:-?} ms busy (limit about 2000)"
[ "$(cnt 'ev=stories.*why=done')" -ge 1 ] || fail "the engine never logged the stories as done"

# ---- arrival: the survivor goes to the first scene of each story
statusline() { ev 'return CFSCENE.status()'; }
goto_scene() { ev "return CFSCENE.stand(${1:-2})" >/dev/null; wait_true 60 'CFSCENE.loaded()' || { fail "the scene's squares did not load"; return 1; }; sleep 2; }
check_shape() { # check_shape LABEL
    local label="$1" s k
    goto_scene 2 || return
    s="$(ev 'return CFSCENE.shape()')"
    if [ "$(f 1 <<<"$s")" != true ]; then fail "$label: shape unreadable: $(tr '\t' ' ' <<<"$s")"; return; fi
    local holders inside loose want
    holders="$(f 2 <<<"$s")"; inside="$(f 3 <<<"$s")"; loose="$(f 4 <<<"$s")"; want="$(f 5 <<<"$s")"
    note "$label: holders=$holders inside=$inside loose=$loose want=$want holder=$(f 6 <<<"$s") pickRule=$(f 7 <<<"$s") note piece=$(f 16 <<<"$s") item=$(f 18 <<<"$s") re=$(f 13 <<<"$s") verify=$(f 15 <<<"$s")"
    if [ "$holders" = 1 ]; then
        [ "$inside" = "$want" ] && [ "$loose" = 0 ] || fail "$label: pieces inside=$inside loose=$loose, expected $want inside"
        [ "$(f 7 <<<"$s")" = true ] || fail "$label: the holder is not the one the pick rule makes"
    else
        [ "$holders" = 0 ] && [ "$loose" = "$want" ] || fail "$label: neither one holder with all pieces nor a loose set ($holders/$loose/$want)"
    fi
    [ "$(f 16 <<<"$s")" = 1 ] || fail "$label: the note is not piece 1"
    [ "$(f 8 <<<"$s")" = true ] && [ "$(f 9 <<<"$s")" = true ] && [ "$(f 10 <<<"$s")" = true ] || fail "$label: forced keys wrong"
    [ "$(f 11 <<<"$s")" = true ] || fail "$label: the dependency's used-flag is not set"
    [ "$(f 12 <<<"$s")" = "$NID" ] || fail "$label: the record names another id"
    [ "$(f 15 <<<"$s")" = ok ] || fail "$label: verify says $(f 15 <<<"$s")"
    local wantItem=Base.LetterHandwritten; case "$NID" in Note/*) wantItem=Base.Note ;; esac
    [ "$(f 18 <<<"$s")" = "$wantItem" ] || fail "$label: the note piece is $(f 18 <<<"$s"), expected $wantItem"
    k="$(ev 'return CFSCENE.keys()')"
    [ "$(f 1 <<<"$k")" = 1 ] && [ "$(f 3 <<<"$k")" = 0 ] || fail "$label: forced pieces=$(f 1 <<<"$k"), objects with note keys=$(f 3 <<<"$k")"
}
arrive() { # arrive KIND [NTH]
    local story="$1" r st side=1 k=0
    r="$(ev "return CFBATCH.select('$story',${2:-1})")"
    [ "$(f 1 <<<"$r")" != false ] || { fail "$story: no such scene in the record"; return 1; }
    NID="$(f 2 <<<"$r")"; SID="$(f 1 <<<"$r")"
    note "$story: first scene clue $SID, note id $NID"
    if [ "$story" = vehicle ]; then
        ev "return CFBATCH.prep()" >/dev/null
        wait_true 90 'CFBATCH.spawn()' || { fail "vehicle: could not spawn a fitting vehicle at the host's site"; return 1; }
        note "vehicle host: spawned (type, at) $(ev 'return CFBATCH.spawned()' | tr '\t' ' ')"
    fi
    local deadline=$(( $(date +%s) + 300 ))
    while :; do
        ev "return CFSCENE.far($side)" >/dev/null
        sleep 8
        st="$(statusline)"
        [ "$(f 2 <<<"$st")" = placed ] && break
        k=$((k + 1)); [ $((k % 6)) = 0 ] && side=$((-side))
        [ "$(date +%s)" -lt "$deadline" ] || { fail "$story: the scene was not created on arrival after 300 s (status: $st)"; return 1; }
    done
    note "$story: created at $(f 3 <<<"$st"),$(f 4 <<<"$st"),$(f 5 <<<"$st")"
    check_shape "$story first scene"
    return 0
}
find_once() { # find_once STORY
    local r0 r1 fd fd2
    r0="$(cnt "ev=recognised.*doc=$SID")"
    fd="$(ev "return CFSCENE.find('search')")"; sleep 1
    fd2="$(ev "return CFSCENE.find('look')")"; sleep 3
    r1="$(cnt "ev=recognised.*doc=$SID")"
    note "$1: find via Search Mode (ok,new) $(tr '\t' ' ' <<<"$fd" | cut -d' ' -f1,2); Look it over (ok,new) $(tr '\t' ' ' <<<"$fd2" | cut -d' ' -f1,2); find events in the log: $((r1 - r0))"
    [ "$(f 2 <<<"$fd")" = true ] && [ "$(f 3 <<<"$fd2")" = true ] && [ "$(f 2 <<<"$fd2")" = false ] || fail "$1: the find was not recorded exactly once"
    [ $((r1 - r0)) = 1 ] || fail "$1: find events: $((r1 - r0)), expected 1"
}
SIDS=()
KINDS="story building"
HV="$(ev 'return CFBATCH.hosts()')"
[ "$(f 2 <<<"$HV")" -gt 0 ] && KINDS="$KINDS vehicle"
[ "$(f 3 <<<"$HV")" -gt 0 ] && KINDS="$KINDS body"
note "kinds checked on arrival: $KINDS"
for kind in $KINDS; do
    arrive "$kind" 1 && { SIDS+=("$kind|$SID|$NID"); find_once "$kind"; }
done
"$PZ" shot "$RUNS/$id-oi-batch.png" >/dev/null 2>&1 || true

# ---- save and reload: the same decisions, nothing decided again, the scenes verify clean
"$PZ" stop --save >/dev/null 2>&1 || fail "save and quit failed"
sleep 3
world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
"$PZ" start --continue "$world" >/dev/null 2>&1 || abort "the save did not reload"
wait_true 90 'OIShared.NoteForcerGame~=nil and OIShared.GeneratedRuntime~=nil and OIShared.NoteCatalogue.isActive()' || fail "reload: runtime not up"
ev -f "$HS" >/dev/null && ev -f "$HT" >/dev/null || abort "could not reload the check's Lua"
ev 'return CFBATCH.god()' >/dev/null
sleep 20   # a few scheduler passes: the story pass would add anything missing
record_checks "reloaded"; d2="$DIGEST"
[ "$d1" = "$d2" ] || fail "reload: the decisions changed (digest differs)"
[ "$d1" = "$d2" ] && note "reload: the $total1 scene:building decisions are identical"
[ "$(cnt 'ev=stories.*why=decided')" = 0 ] || fail "reload: the engine decided story scenes again"
for e in "${SIDS[@]}"; do
    IFS="|" read -r st SID NID <<<"$e"
    ev "return CFBATCH.select('$st',1)" >/dev/null
    k=0; deadline=$(( $(date +%s) + 240 )); side=1
    while :; do
        s3="$(statusline)"; [ "$(f 2 <<<"$s3")" = placed ] && break
        ev "return CFSCENE.far($side)" >/dev/null; sleep 8
        [ "$(date +%s)" -lt "$deadline" ] || { fail "reload: story $st scene is not placed (status $s3)"; continue 2; }
    done
    check_shape "reloaded $st scene"
done
sl="$(run_log | grep "ev=force" | grep "op=sweep" | tail -1)"
if [ -n "$sl" ]; then
    grep -q "repaired=0" <<<"$sl" && grep -q "foreign=0" <<<"$sl" || fail "start sweep after reload not clean: $sl"
    note "reload sweep line: $(sed 's/^.*ev=force //' <<<"$sl")"
else note "reload sweep line: none (nothing carried)"; fi

errs="$(mod_errors)"; [ -z "$errs" ] || fail "errors inside the mods: $(head -3 <<<"$errs" | tr '\n' ' ')"
result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$EVIDENCE/$id-oi-batch.txt"
{ echo "Linux Of Interest batch check $id: $result"; source_line; renderer_line
  for x in "${notes[@]}"; do echo "note: $x"; done; for x in "${fails[@]}"; do echo "FAIL: $x"; done; } > "$out.part"
mv "$out.part" "$out"
say "written: $out"; cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ] && exit 0 || exit 1
