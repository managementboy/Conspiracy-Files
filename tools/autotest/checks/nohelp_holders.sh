#!/usr/bin/env bash
# A placed object SET is one holder (a vanilla bag/box/case) with its pieces inside, and inspecting it
# records the find once (docs/design/SET_HOLDERS.md). Real display only (never --hidden).
#
#   tools/autotest/checks/nohelp_holders.sh
#
# Waits for a set the world placed, stands beside it, reads the real container: exactly one holder, every
# piece inside, none loose, the holder is the one the pick rule makes, pieces weigh no more than its
# capacity; recognises and inspects it in place (the find is recorded once, even twice); inspecting a piece
# in it afterwards adds nothing and says nothing more. Control: a set with its piece removed would fail the
# shape line. Always stops the game. Exit 0 proven, 1 failed, 2 could not run.
set -uo pipefail
export PZ_NOHELP_ONLY=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "nohelp-holders: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
trap '"$PZ" stop >/dev/null 2>&1' EXIT
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
notes=(); note() { notes+=("$*"); say "$*"; }
cnt() { local n; n="$(run_log | grep -c -- "$1")"; echo "${n:-0}"; }
H="$REPO/tools/autotest/checks/nohelp_holders.lua"

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
ev -f "$H" >/dev/null || abort "could not load the check's Lua"

deadline=$(( $(date +%s) + 420 )); n=0; w=0
while :; do
    n="$(ev 'return CFHOLD.sets()' | cut -f1)"
    is_number "$n" && [ "$n" -ge 1 ] && break
    [ "$(date +%s)" -lt "$deadline" ] || abort "no set placed after 420 s"
    # Waiting sets are placed once their square is loaded: stand at one.
    w=$((w + 1)); ev "return CFHOLD.waiting($w)" >/dev/null
    sleep 10
done
note "placed sets in containers or on the ground: $n"

k=0; shape=""
for k in $(seq 1 "$n"); do
    p="$(ev "return CFHOLD.pick($k)")"; [ "$(cut -f1 <<<"$p")" = true ] || break
    ev "return CFHOLD.teleport($(cut -f3 <<<"$p"))" >/dev/null
    wait_true 25 'CFHOLD.loaded()' >/dev/null || continue
    shape="$(ev 'return CFHOLD.shape()')"
    [ "$(cut -f1 <<<"$shape")" = true ] && break
    note "set $k: $(tr '\t' ' ' <<<"$shape")"
done
[ "$(cut -f1 <<<"$shape")" = true ] || { fail "no placed set was a holder with pieces: $(tr '\t' ' ' <<<"$shape")"; shape=""; }
if [ -n "$shape" ]; then
    inside="$(cut -f4 <<<"$shape")"; loose="$(cut -f5 <<<"$shape")"; holders="$(cut -f6 <<<"$shape")"; want="$(cut -f7 <<<"$shape")"
    note "holder: $(cut -f2 <<<"$shape") named \"$(cut -f3 <<<"$shape")\"; pieces inside $inside of $want, loose $loose, holders $holders; weight/capacity $(cut -f9 <<<"$shape")"
    [ "$holders" = 1 ] || fail "expected exactly one holder, saw $holders"
    [ "$inside" = "$want" ] || fail "pieces inside the holder: $inside, expected $want"
    [ "$loose" = 0 ] || fail "$loose piece(s) lying loose beside the holder"
    [ "$(cut -f8 <<<"$shape")" = true ] || fail "the holder is not the one the pick rule makes for this world seed and clue"
    w="$(cut -f9 <<<"$shape")"; awk -v a="${w%/*}" -v b="${w#*/}" 'BEGIN{exit !(a+0<=b+0)}' || fail "pieces weigh more than the holder's capacity ($w)"
    c0="$(cnt 'clue text:')"
    r="$(ev 'return CFHOLD.inspectHolder()')"; sleep 2
    note "inspect holder (known before, after one, after two; recognised; ok1; ok2; isRecognised): $(tr '\t' ' ' <<<"$r")"
    [ "$(cut -f2 <<<"$r")" = 0 ] || fail "set already known before inspecting"
    [ "$(cut -f3 <<<"$r")" = 1 ] && [ "$(cut -f4 <<<"$r")" = 1 ] || fail "the find was not recorded exactly once"
    c1="$(cnt 'clue text:')"
    [ "$(( c1 - c0 ))" = 2 ] || note "caption started $(( c1 - c0 )) time(s) for two inspects of the holder (each Inspect plays it)"
    q="$(ev 'return CFHOLD.inspectPiece()')"; sleep 2
    note "inspect a piece inside (known count; ok; piece number; category): $(tr '\t' ' ' <<<"$q")"
    [ "$(cut -f2 <<<"$q")" = 1 ] || fail "inspecting a piece changed the find count"
    [ "$(cut -f5 <<<"$q")" = Evidence ] || fail "piece is not marked Evidence after recognition ($(cut -f5 <<<"$q"))"
    [ "$(cnt 'clue text:')" = "$c1" ] || fail "caption played again for a piece inside the holder"
    "$PZ" shot "$RUNS/$id-nohelp-holder.png" >/dev/null 2>&1 || true
fi
errs="$(mod_errors)"; [ -z "$errs" ] || fail "errors inside the mods: $(head -3 <<<"$errs" | tr '\n' ' ')"

result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$EVIDENCE/$id-nohelp-holders.txt"
{ echo "Linux No Help holders check $id: $result"; source_line
  for x in "${notes[@]}"; do echo "note: $x"; done; for f in "${fails[@]}"; do echo "FAIL: $f"; done; } > "$out.part"
mv "$out.part" "$out"
say "written: $out"; cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ] && exit 0 || exit 1
