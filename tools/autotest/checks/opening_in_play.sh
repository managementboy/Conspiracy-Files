#!/usr/bin/env bash
set -uo pipefail
. tools/autotest/lib.sh
say() { echo "opening: $*" >&2; }
claim_game || { say "machine busy"; exit 2; }
start_cold || { say "no start"; exit 2; }
ev -f tools/autotest/checks/core_loop.lua >/dev/null
ev -f tools/autotest/checks/placement.lua >/dev/null
deadline=$(( $(date +%s) + 300 ))
while :; do
    c="$(ev 'return CFPlace.clues()')"
    [ "$(cut -f1 <<<"$c")" -gt 0 ] 2>/dev/null && break
    [ "$(date +%s)" -lt "$deadline" ] || break
    sleep 3
done
say "survivor name: $(ev 'local d=getPlayer():getDescriptor(); return (d:getForename() or "?").." "..(d:getSurname() or "?")')"
say "first case premise: $(ev 'local w=ModData.get("ConspiracyFiles.Generated.G2"); local C=require("ConspiracyFiles/Generated/SuccessiveCases"); local r=C.sessions(C.current(w))[1]; return tostring(r and r.case and r.case.facts and r.case.facts.premise)')"
say "opening recorded: $(ev 'local w=ModData.get("ConspiracyFiles.Generated.G2"); local C=require("ConspiracyFiles/Generated/SuccessiveCases"); local r=C.sessions(C.current(w))[1]; return tostring(r and r.case and r.case.opening and r.case.opening.self)')"
say "slip title / name present:"
ev 'local w=ModData.get("ConspiracyFiles.Generated.G2"); local C=require("ConspiracyFiles/Generated/SuccessiveCases"); local r=C.sessions(C.current(w))[1]
local d=getPlayer():getDescriptor(); local name=(d:getForename() or "").." "..(d:getSurname() or "")
for _,doc in ipairs(r.case.documents) do if doc.body:find(name,1,true) then return doc.title.."\tNAME PRESENT" end end
return "no document carries the name"' | sed 's/^/    /' >&2
say "validates after reload test - saving"
"$PZ" stop --save >/dev/null 2>&1
"$PZ" start --continue >/dev/null 2>&1
sleep 6
ev -f tools/autotest/checks/core_loop.lua >/dev/null
say "after reload, premise: $(ev 'local w=ModData.get("ConspiracyFiles.Generated.G2"); local C=require("ConspiracyFiles/Generated/SuccessiveCases"); local r=C.sessions(C.current(w))[1]; return tostring(r and r.case and r.case.facts and r.case.facts.premise)')"
say "after reload, validates: $(ev 'local G=require("ConspiracyFiles/Generated/Generator"); local w=ModData.get("ConspiracyFiles.Generated.G2"); local C=require("ConspiracyFiles/Generated/SuccessiveCases"); local r=C.sessions(C.current(w))[1]; local ok,why=G.validate(r.case); return tostring(ok).."\t"..tostring(why)')"
say "mod errors: $(mod_error_count 2>/dev/null || echo '?')"
"$PZ" stop >/dev/null 2>&1
