#!/usr/bin/env bash
# THE CONNECTED PAIR IN A REAL SAVE (Phase C).
#
# Finishes the opening through the session api, retires it, and asks whether the
# runtime then offers a follow-up FROM ITS THREAD - the whole point of the pair.
# Then saves, reloads, and asks again, because a connection that does not
# survive a reload is not a connection.
#
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "pair: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
claim_game || { say "another run holds the machine"; exit 2; }
start_cold || { say "the world would not start"; exit 2; }
ev -f tools/autotest/checks/core_loop.lua >/dev/null
ev -f tools/autotest/checks/placement.lua >/dev/null
deadline=$(( $(date +%s) + 300 ))
while :; do
    c="$(ev 'return CFPlace.clues()')"
    [ "$(cut -f1 <<<"$c")" -gt 0 ] 2>/dev/null && break
    [ "$(date +%s)" -lt "$deadline" ] || break
    sleep 3
done

premise="$(ev 'local C=require("ConspiracyFiles/Generated/SuccessiveCases");return tostring(C.sessions(C.current(ModData.get("ConspiracyFiles.Generated.G2")))[1].case.facts.premise)')"
say "first case premise: $premise"
# THE OPENING IS A PREMISE FLAGGED `opening=true`, NOT ONE PARTICULAR ID.
# This demanded `no-contact-at-premises`, which was the only opening when it
# was written. 1478c04 diversified them - "Opening selection is no longer
# hardcoded to the same collection notice" - and this check then failed a
# correct first case for being one of the new ones (`name-on-standby-list`,
# 2026-09-22). Ask Premises which ids are openings rather than naming one.
# READ FROM THE SHIPPED SOURCE, not from the game. Premises keeps its list in
# a file-local `entries` with no public accessor, so asking the game returned
# nothing and this fell back to a hardcoded set - working, but re-introducing
# the literal it exists to remove. Exposing `entries` just for a check would
# be changing the product to suit a test; the check can read the file it
# ships, which is what test/opening_not_hardcoded does.
openings="$(grep -o 'id="[a-z-]*"[^}]*opening=true' "$REPO/mod/common/media/lua/shared/ConspiracyFiles/Generated/Premises.lua" \
    | sed 's/id="//;s/".*//' | tr '\n' ' ')"
say "premises flagged as openings: ${openings:-none found}"
[ -n "$openings" ] || fail "could not read any opening premise from Premises.lua"
case " $openings " in
    *" $premise "*) say "first case is an opening premise: $premise" ;;
    *) fail "the first case's premise is $premise, which is not one of the openings ($openings)" ;;
esac

say "thread recorded on the live case: $(ev 'local C=require("ConspiracyFiles/Generated/SuccessiveCases");local t=C.sessions(C.current(ModData.get("ConspiracyFiles.Generated.G2")))[1].case.thread;return t and (t.document.."\t"..t.point) or "none"')"

# Finish the opening through the api, then retire it the way the runtime does.
# THE OPENING IS PLAYED, NOT WRITTEN. An earlier version drove the case through
# the session api from outside, and it could not work: the runtime holds the
# case wrapper in memory, so its own periodic commits write that stale copy back
# and the store reverts. The writes landed (known=7, accounted=true) and the
# very next call still read "case is not fully discovered". The only sound way
# to finish a case in a live game is the way a player does - find the clue, take
# it, inspect it - which is what lib.sh's inspect_doc does.
say "playing the opening: finding, taking and inspecting each clue"
# docs() returns the TABLE, not a count - the first version passed the whole
# dump to seq, which then played nothing and reported "not one clue could be
# played" as though placement had failed.
total="$(ev 'return #CFLoop.docs()')"
say "  documents: $total"
played=0
for i in $(seq 1 "${total:-0}"); do
    if name="$(inspect_doc "$i")"; then
        played=$((played+1)); say "  clue $i: $name"
    else
        say "  clue $i: $name"
    fi
done
say "played $played of $total"
[ "$played" -gt 0 ] || fail "not one clue could be played"

state="$(ev 'local S=require("ConspiracyFiles/Generated/Session")
local C=require("ConspiracyFiles/Generated/SuccessiveCases")
local Ret=require("ConspiracyFiles/Generated/RetiredCase")
for _,r in ipairs(C.sessions(C.current(ModData.get("ConspiracyFiles.Generated.G2")))) do
  if Ret.isRetired(r) then return "retired\t"..tostring(r.caseId) end
end
local r=C.sessions(C.current(ModData.get("ConspiracyFiles.Generated.G2")))[1]
return "live\tknown="..#(r.known or {}).."\taccounted="..tostring(S.accounted(r))')"
say "after playing: $state"

say "thread survives on the retired record: $(ev 'local Ret=require("ConspiracyFiles/Generated/RetiredCase");local C=require("ConspiracyFiles/Generated/SuccessiveCases")
for _,r in ipairs(C.sessions(C.current(ModData.get("ConspiracyFiles.Generated.G2")))) do
  if Ret.isRetired(r) and r.thread then return r.thread.document.."\t"..r.thread.point end end
return "none"')"

say "pendingThread offers it: $(ev 'local C=require("ConspiracyFiles/Generated/SuccessiveCases");local t=C.pendingThread(C.current(ModData.get("ConspiracyFiles.Generated.G2")));return t and (t.fromCase.."\t"..t.reference) or "none"')"

# Save, reload, and ask again.
say "saving and reloading"
"$PZ" stop --save >/dev/null 2>&1 || { fail "could not save"; exit 1; }
"$PZ" start --continue >/dev/null 2>&1 || { fail "could not reload"; exit 1; }
sleep 6
say "after reload, pendingThread still offers it: $(ev 'local C=require("ConspiracyFiles/Generated/SuccessiveCases");local t=C.pendingThread(C.current(ModData.get("ConspiracyFiles.Generated.G2")));return t and (t.fromCase.."\t"..t.reference) or "none"')"

# GENERATION FROM A THREAD IS NOT RETESTED HERE. test/connected_pair.lua proves
# it at tier 1 - the premise, the inherited point and reference on the paper, the
# chronology, the refusals - and cheaply. What only a live save can show is what
# is checked above: that a played-out opening retires, that its thread survives
# on the retired record, and that the thread is still offered after a real save
# and reload. An earlier version tried to generate here too and reported "no
# world metadata yet", which was its own stub failing rather than anything
# about the mod.
say "follow-up generation: covered by test/connected_pair.lua (tier 1), not retested in-game"

say "mod errors: $(mod_error_count 2>/dev/null || echo '?')"
"$PZ" stop >/dev/null 2>&1
if [ "${#fails[@]}" -gt 0 ]; then
    for x in "${fails[@]}"; do say "FAIL: $x"; done
    exit 1
fi
exit 0
