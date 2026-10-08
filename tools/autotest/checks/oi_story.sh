#!/usr/bin/env bash
# Of Interest phase 5 check: STORIES AS SCENES in the real game. Visible window, never --hidden.
#
#   tools/autotest/checks/oi_story.sh
#
# Boots Of Interest + the dependency + ZombieBuddy with the shipped enable list (Generated/StoryEnable: the
# 2-part and the 12-part test story) and asserts from the saved world record:
#   - story A: 2 scenes in 2 distinct buildings of one town; story B: 12 scenes in 12 distinct buildings of
#     one town; all note ids unique and known to the catalogue; no building shared by two scenes;
# then teleports the survivor to the first scene of each story and checks the engine creates the scene on
# arrival (the note forced, one holder or one loose set) and that ONE find is recorded per scene; then
# saves, reloads and asserts the decisions are identical (same scene:building digest, nothing decided
# again) and the created scenes verify clean.
# Only ids, codes, counts and digests are printed - never any note text (the owner plays blind).
# Report: docs/management/evidence/linux-autotest/<session>-oi-story.txt. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
export PZ_NOHELP_ONLY=1 PZ_OI=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "oi-story: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
notes=(); note() { notes+=("$*"); say "$*"; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
trap '"$PZ" stop >/dev/null 2>&1' EXIT
cnt() { local n; n="$(run_log | grep -c -- "$1")"; echo "${n:-0}"; }
f() { cut -f"$1"; }
HS="$REPO/tools/autotest/checks/oi_scene.lua"
HT="$REPO/tools/autotest/checks/oi_story.lua"
A=9; B=1   # the two enabled stories (StoryEnable): 2 parts and 12 parts

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
wait_true 60 'OIShared.NoteCatalogue.isActive() and OIShared.NoteForcerGame~=nil and OIShared.GeneratedRuntime~=nil' || fail "catalogue/forcer/runtime not active"
ev -f "$HS" >/dev/null && ev -f "$HT" >/dev/null || abort "could not load the check's Lua"
ev 'return CFSTORY.god()' >/dev/null

# ---- the decisions, from the saved world record
wait_true 180 'CFSTORY.count()==58' || note "world record holds $(ev 'return CFSTORY.count()') story scenes after 180 s"
record_checks() { # record_checks LABEL
    local label="$1" a b g
    a="$(ev "return CFSTORY.story($A)")"; b="$(ev "return CFSTORY.story($B)")"; g="$(ev 'return CFSTORY.global()')"
    note "$label: story $A (scenes, buildings, towns, areas) = $(tr '\t' ' ' <<<"$a"); story $B = $(tr '\t' ' ' <<<"$b"); (dup notes, unknown notes, shared buildings) = $(f 1 <<<"$g") $(f 2 <<<"$g") $(f 3 <<<"$g")"
    [ "$(f 1 <<<"$a")" = 2 ] && [ "$(f 2 <<<"$a")" = 2 ] && [ "$(f 3 <<<"$a")" = 1 ] || fail "$label: story $A is not 2 scenes in 2 buildings of one town"
    [ "$(f 1 <<<"$b")" = 12 ] && [ "$(f 2 <<<"$b")" = 12 ] && [ "$(f 3 <<<"$b")" = 1 ] || fail "$label: story $B is not 12 scenes in 12 buildings of one town"
    [ "$(f 1 <<<"$g")" = 0 ] && [ "$(f 2 <<<"$g")" = 0 ] && [ "$(f 3 <<<"$g")" = 0 ] || fail "$label: duplicate note, unknown note or shared building"
    DIGEST="$(f 4 <<<"$g")"
}
record_checks "decided"; d1="$DIGEST"
note "plan line: $(run_log | grep 'ev=stories' | grep 'why=plan' | head -1 | sed 's/^.*ev=stories //')"
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
arrive() { # arrive STORY
    local story="$1" r st side=1 k=0
    r="$(ev "return CFSTORY.select($story)")"
    [ "$(f 1 <<<"$r")" != false ] || { fail "story $story: no first scene in the record"; return 1; }
    NID="$(f 2 <<<"$r")"; SID="$(f 1 <<<"$r")"
    note "story $story: first scene clue $SID, note id $NID"
    local deadline=$(( $(date +%s) + 300 ))
    while :; do
        ev "return CFSCENE.far($side)" >/dev/null
        sleep 8
        st="$(statusline)"
        [ "$(f 2 <<<"$st")" = placed ] && break
        k=$((k + 1)); [ $((k % 6)) = 0 ] && side=$((-side))
        [ "$(date +%s)" -lt "$deadline" ] || { fail "story $story: the scene was not created on arrival after 300 s (status: $st)"; return 1; }
    done
    note "story $story: created at $(f 3 <<<"$st"),$(f 4 <<<"$st"),$(f 5 <<<"$st")"
    check_shape "story $story first scene"
    return 0
}
find_once() { # find_once STORY
    local r0 r1 fd fd2
    r0="$(cnt "ev=recognised.*doc=$SID")"
    fd="$(ev "return CFSCENE.find('search')")"; sleep 1
    fd2="$(ev "return CFSCENE.find('look')")"; sleep 3
    r1="$(cnt "ev=recognised.*doc=$SID")"
    note "story $1: find via Search Mode (ok,new) $(tr '\t' ' ' <<<"$fd" | cut -d' ' -f1,2); Look it over (ok,new) $(tr '\t' ' ' <<<"$fd2" | cut -d' ' -f1,2); find events in the log: $((r1 - r0))"
    [ "$(f 2 <<<"$fd")" = true ] && [ "$(f 3 <<<"$fd2")" = true ] && [ "$(f 2 <<<"$fd2")" = false ] || fail "story $1: the find was not recorded exactly once"
    [ $((r1 - r0)) = 1 ] || fail "story $1: find events: $((r1 - r0)), expected 1"
}
SIDS=()
arrive "$A" && { SIDS+=("$A|$SID|$NID"); find_once "$A"; }
arrive "$B" && { SIDS+=("$B|$SID|$NID"); find_once "$B"; }
"$PZ" shot "$RUNS/$id-oi-story.png" >/dev/null 2>&1 || true

# ---- save and reload: the same decisions, nothing decided again, the scenes verify clean
"$PZ" stop --save >/dev/null 2>&1 || fail "save and quit failed"
sleep 3
world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
"$PZ" start --continue "$world" >/dev/null 2>&1 || abort "the save did not reload"
wait_true 90 'OIShared.NoteForcerGame~=nil and OIShared.GeneratedRuntime~=nil and OIShared.NoteCatalogue.isActive()' || fail "reload: runtime not up"
ev -f "$HS" >/dev/null && ev -f "$HT" >/dev/null || abort "could not reload the check's Lua"
ev 'return CFSTORY.god()' >/dev/null
sleep 20   # a few scheduler passes: the story pass would add anything missing
record_checks "reloaded"; d2="$DIGEST"
[ "$d1" = "$d2" ] || fail "reload: the decisions changed (digest differs)"
[ "$d1" = "$d2" ] && note "reload: the 58 scene:building decisions are identical"
[ "$(cnt 'ev=stories.*why=decided')" = 0 ] || fail "reload: the engine decided story scenes again"
for e in "${SIDS[@]}"; do
    IFS="|" read -r st SID NID <<<"$e"
    ev "return CFSTORY.select($st)" >/dev/null
    k=0; deadline=$(( $(date +%s) + 240 )); side=1
    while :; do
        s3="$(statusline)"; [ "$(f 2 <<<"$s3")" = placed ] && break
        ev "return CFSCENE.far($side)" >/dev/null; sleep 8
        [ "$(date +%s)" -lt "$deadline" ] || { fail "reload: story $st scene is not placed (status $s3)"; continue 2; }
    done
    check_shape "reloaded story $st first scene"
done
sl="$(run_log | grep "ev=force" | grep "op=sweep" | tail -1)"
if [ -n "$sl" ]; then
    grep -q "repaired=0" <<<"$sl" && grep -q "foreign=0" <<<"$sl" || fail "start sweep after reload not clean: $sl"
    note "reload sweep line: $(sed 's/^.*ev=force //' <<<"$sl")"
else note "reload sweep line: none (nothing carried)"; fi

errs="$(mod_errors)"; [ -z "$errs" ] || fail "errors inside the mods: $(head -3 <<<"$errs" | tr '\n' ' ')"
result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$EVIDENCE/$id-oi-story.txt"
{ echo "Linux Of Interest story check $id: $result"; source_line; renderer_line
  for x in "${notes[@]}"; do echo "note: $x"; done; for x in "${fails[@]}"; do echo "FAIL: $x"; done; } > "$out.part"
mv "$out.part" "$out"
say "written: $out"; cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ] && exit 0 || exit 1
