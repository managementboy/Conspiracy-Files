#!/usr/bin/env bash
# Of Interest phase 3 check: ONE specific note forced onto an item, in the real game (visible window,
# never --hidden), through save and reload.
#
#   tools/autotest/checks/oi_force_note.sh
#
# Boots Of Interest + the dependency + ZombieBuddy, forces the first standalone Note id of the
# catalogue onto a Base.Note (and the first standalone Letter id onto a letter with place code 3 = Prison), then asserts:
#   - the item carries exactly that id, our token and seal; the world record and the dependency's
#     used-tracker both have it;
#   - the dependency's own text path (getOrAssignText) gives that exact id, text length > 0;
#   - a tampered item (id wiped) is repaired by the Read wrapper before the dependency picks;
#   - after SAVE and RELOAD the same items still carry the same ids, verify is clean, the
#     sweep at game start repaired nothing;
#   - 40 fresh dummy notes picked by the dependency's own random pick never get the forced id;
#   - then the pool is drained until the dependency's cycle reset: whether the reset clears our
#     tracker flag is REPORTED (it is the dependency's rule), and our sweep must put it back.
# Only ids, codes and text LENGTHS are printed - never any note text (the owner plays blind).
# Report: docs/management/evidence/linux-autotest/<session>-oi-force-note.txt. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
export PZ_NOHELP_ONLY=1 PZ_OI=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "oi-force-note: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
notes=()
claim_game || exit 2
start_cold || { say "the game did not reach a playable world"; "$PZ" stop; exit 2; }
wait_true 60 'OIShared.NoteCatalogue.isActive() and OIShared.NoteForcerGame~=nil' || fail "catalogue/forcer not active"

IFS=$'\t' read -r NID LID <<<"$(ev 'local C=OIShared.NoteCatalogue; local n,l; for _,i in ipairs(C.standalone()) do if not n and i:find("^Note/") then n=i end; if not l and i:find("^Letter/") then l=i end end; return n,l')"
[ -n "${NID:-}" ] && [ -n "${LID:-}" ] || { fail "no standalone ids ($NID/$LID)"; NID=Note/0001; LID=x; }
FILE="${NID#Note/}.txt"; LFILE="${LID##*/}.txt"; LCAT="$(cut -d/ -f2 <<<"$LID")"
notes+=("chosen: $NID and $LID")

PLACE="$(ev "local r=OIShared.NoteCatalogue.get('$NID'); return r and r.place or 0")"
[ "$PLACE" = 0 ] && P=nil || P="$PLACE"
r="$(ev "local it,t=OIShared.NoteForcerGame.placeTest('$NID','inv',$P); local it2,t2=OIShared.NoteForcerGame.placeTest('$LID','inv',3); return it~=nil, t, it2~=nil, t2")"
IFS=$'\t' read -r ok1 tok1 ok2 tok2 <<<"$r"
[ "$ok1" = true ] && [ "$ok2" = true ] || fail "placeTest refused: note=$ok1/$tok1 letter=$ok2/$tok2"

# find our items again by token (not by a Lua reference) and read exactly the documented keys
read_item() { # read_item TOKEN -> textId, baked, location, seal-ok, ft
    ev "local t='$1'; for _,it in ipairs(OIShared.NoteForcerGame.carried()) do local m=it:getModData(); if m.oiToken==t then return m.iioitmTextId, m.iioitmLocationBaked, m.iioitmLocation or '-', m.oiSeal==OIShared.NoteForcer.seal(t, ModData.getOrCreate('OIShared.ForcedNotes')[t].note, ModData.getOrCreate('OIShared.ForcedNotes')[t].ver), it:getFullType(), m.iioitmLetterCategory or '-' end end return 'missing'"
}
check_items() { # check_items LABEL
    local label="$1" a b
    a="$(read_item "$tok1")"; b="$(read_item "$tok2")"
    IFS=$'\t' read -r id baked loc seal ft cat <<<"$a"
    [ "$id" = "$FILE" ] && [ "$baked" = true ] && [ "$seal" = true ] && [ "$ft" = Base.Note ] || fail "$label: note item wrong: $a"
    notes+=("$label note: id=$id baked=$baked place=$loc seal=$seal type=$ft")
    IFS=$'\t' read -r id baked loc seal ft cat <<<"$b"
    [ "$id" = "$LFILE" ] && [ "$baked" = true ] && [ "$seal" = true ] && [ "$cat" = "$LCAT" ] && [ "$loc" = Prison ] || fail "$label: letter item wrong: $b"
    notes+=("$label letter: id=$id baked=$baked place=$loc seal=$seal category=$cat")
    local tr; tr="$(ev "local u=ModData.getOrCreate('ItIsOfInterestToMe_UsedText'); local rec=ModData.getOrCreate('OIShared.ForcedNotes'); return u.Note and u.Note['$FILE']==true, u['Letter_$LCAT'] and u['Letter_$LCAT']['$LFILE']==true, rec['$tok1'] and rec['$tok1'].note, rec['$tok2'] and rec['$tok2'].note")"
    IFS=$'\t' read -r t1 t2 r1 r2 <<<"$tr"
    [ "$t1" = true ] && [ "$t2" = true ] && [ "$r1" = "$NID" ] && [ "$r2" = "$LID" ] || fail "$label: tracker/record wrong: $tr"
    notes+=("$label tracker: note=$t1 letter=$t2; record: $r1 $r2")
    local sw; sw="$(ev "local n,l=0,0; for _,it in ipairs(OIShared.NoteForcerGame.carried()) do local s=OIShared.NoteForcer.verify(it, OIShared.NoteForcerGame.deps()); if s=='ok' then n=n+1 else l=l+1 end end; return n,l")"
    [ "$sw" = "$(printf '2\t0')" ] || fail "$label: verify not clean (ok,notok)=$sw"
    local len; len="$(ev "for _,it in ipairs(OIShared.NoteForcerGame.carried()) do local m=it:getModData(); if m.oiToken=='$tok1' then local t=ReadableItemRegistry.getOrAssignText(it,NoteContentPool,'Note',m.iioitmLocation,NoteContentPoolEN); local r=ReadableItemRegistry.resolveTextById(NoteContentPool,m.iioitmTextId); return m.iioitmTextId, #t, r~=nil and #r or 0 end end return 'missing'")"
    IFS=$'\t' read -r lid llen rlen <<<"$len"
    [ "$lid" = "$FILE" ] && [ "${llen:-0}" -gt 0 ] && [ "${rlen:-0}" -gt 0 ] || fail "$label: open path gave id=$lid length=$llen/$rlen"
    notes+=("$label open path: id=$lid text length=$llen (resolveTextById length=$rlen)")
}
check_items "new world"

# Read wrapper: wipe the id, press the dependency's own open; the id must be back before it picks
rw="$(ev "for _,it in ipairs(OIShared.NoteForcerGame.carried()) do local m=it:getModData(); if m.oiToken=='$tok1' then m.iioitmTextId=nil; local ok=pcall(ReadableItemRegistry.open,it,0); return ok, m.iioitmTextId, m.oiSeal~=nil end end return 'missing'")"
IFS=$'\t' read -r opened afterid sealed <<<"$rw"
[ "$afterid" = "$FILE" ] || fail "tampered item was not repaired before the dependency read it: id=$afterid"
notes+=("read wrapper: id wiped then Read -> id=$afterid (open call ok=$opened)")

"$PZ" stop --save >/dev/null 2>&1 || fail "save and quit failed"
sleep 3
world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
"$PZ" start --continue "$world" >/dev/null 2>&1 || fail "the save did not reload"
wait_true 90 'OIShared.NoteForcerGame~=nil and #OIShared.NoteForcerGame.carried()>0' || fail "reload: no forced item in the inventory"
check_items "reloaded save"
sl="$(run_log | grep "ev=force" | grep "op=sweep" | tail -1)"
grep -q "repaired=0" <<<"$sl" && grep -q "foreign=0" <<<"$sl" || fail "game-start sweep after reload was not clean: ${sl:-none}"
notes+=("reload sweep line: $(sed 's/^.*ev=force //' <<<"$sl")")

# the dependency's own random picks: 40 fresh dummy notes of the same pool and location
pk="$(ev "local f='$FILE'; local loc=nil; for _,it in ipairs(OIShared.NoteForcerGame.carried()) do local m=it:getModData(); if m.oiToken=='$tok1' then loc=m.iioitmLocation end end; local hit=0; for i=1,40 do local d=instanceItem('Base.Note'); d:getModData().iioitmLocation=loc; ReadableItemRegistry.getOrAssignText(d,NoteContentPool,'Note',loc,NoteContentPoolEN); if d:getModData().iioitmTextId==f then hit=hit+1 end end; return hit")"
[ "$pk" = 0 ] || fail "the dependency handed the forced id out $pk time(s) in 40 picks"
notes+=("40 dummy picks: forced id handed out $pk times")
# drain every other eligible entry, then one more pick = the dependency's cycle reset
dr="$(ev "local f='$FILE'; local loc=nil; for _,it in ipairs(OIShared.NoteForcerGame.carried()) do local m=it:getModData(); if m.oiToken=='$tok1' then loc=m.iioitmLocation end end; local u=ModData.getOrCreate('ItIsOfInterestToMe_UsedText').Note; local left=0; for _,e in ipairs(NoteContentPool) do if (not e.location or e.location==loc) and not u[e.id] then left=left+1 end end; local hit=0; for i=1,left do local d=instanceItem('Base.Note'); d:getModData().iioitmLocation=loc; ReadableItemRegistry.getOrAssignText(d,NoteContentPool,'Note',loc,NoteContentPoolEN); if d:getModData().iioitmTextId==f then hit=hit+1 end end; local d=instanceItem('Base.Note'); ReadableItemRegistry.getOrAssignText(d,NoteContentPool,'Note',loc,NoteContentPoolEN); local cleared=(u[f]~=true); local c,back=OIShared.NoteForcerGame.sweep(); return left,hit,cleared,d:getModData().iioitmTextId==f,back,u[f]==true")"
IFS=$'\t' read -r left hit cleared handed back restored <<<"$dr"
[ "${hit:-1}" = 0 ] || fail "drain: forced id handed out $hit time(s) before the cycle reset"
[ "$restored" = true ] || fail "after the cycle reset our sweep did not put the flag back"
notes+=("drain: $left more picks, forced id handed out $hit times; cycle reset cleared our flag=$cleared, handed out on the reset pick=$handed; sweep put back $back flag(s); flag now=$restored")

errs="$(mod_errors)"; [ -z "$errs" ] || fail "errors inside the mods: $(head -3 <<<"$errs" | tr '\n' ' ')"
result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
id="$(session)"; out="$REPO/docs/management/evidence/linux-autotest/$id-oi-force-note.txt"
{ echo "Linux Of Interest force-note check $id: $result"; source_line; renderer_line
  for n in "${notes[@]}"; do echo "$n"; done; for f in "${fails[@]}"; do echo "FAIL: $f"; done; } > "$out.part"
mv "$out.part" "$out"; cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ]
