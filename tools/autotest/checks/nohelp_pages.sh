#!/usr/bin/env bash
# Readable objects carry their own text: notes, diaries, letters, photos (and the
# other paper types) get locked custom pages that survive save and reload.
#
#   tools/autotest/checks/nohelp_pages.sh
#
# PASS needs, for every readable type: more than one page written through the
# mod's own writePages, a foreign lock ("NoHelp") so the vanilla journal opens
# it read-only, canBeWrite on, and the same after save, quit and reload.
# Types T7 did not prove (Diary, Notepad, Receipt, Newspaper) are reported as
# findings, not failures. Real display only. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "nohelp-pages: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); note() { findings+=("$*"); say "$*"; }
PROVEN=" Base.Note Base.Notebook Base.LetterHandwritten Base.Photo "

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
[ -n "$world" ] || abort "world not recorded by pz.sh start"
H="$REPO/tools/autotest/checks/nohelp_pages.lua"
ev -f "$H" >/dev/null || abort "could not load the pages harness"
wait_true 60 'NHShared.GeneratedRuntime~=nil and NHShared.GeneratedRuntime.writePages~=nil' >/dev/null \
    || abort "writePages is not exported by the loaded mod"

made="$(ev 'return CFNHPages.make()' | cut -f1)"
say "made: $made"
before="$(ev 'return CFNHPages.read()' | cut -f1)"

judge_rows() { local label="$1" rows="$2" row t n lock cw ok
    while IFS= read -r row; do
        row="${row# }"; [ -n "$row" ] || continue
        IFS='|' read -r t n lock cw _ <<<"$row"; t="${t# }"; t="${t% }"; ok=1
        [ "${n:-0}" -gt 1 ] 2>/dev/null || ok=0
        [ "$lock" = "NoHelp" ] || ok=0
        [ "$cw" = "true" ] || ok=0
        if [ "$ok" = 1 ]; then say "$label $t: ok ($n pages)"
        elif [[ "$PROVEN" == *" $t "* ]]; then fail "$label $t: pages=$n lockedBy=$lock canBeWrite=$cw"
        else note "$label $t (not proven by T7): pages=$n lockedBy=$lock canBeWrite=$cw"; fi
    done < <(tr ';' '\n' <<<"$rows")
}
judge_rows "before reload" "$before"

"$PZ" stop --save >/dev/null 2>&1 || fail "save/quit failed"
sleep 2
"$PZ" start --continue "$world" >/dev/null 2>&1 || fail "reload failed"
sleep 5
ev -f "$H" >/dev/null || fail "harness reload failed"
after="$(ev 'return CFNHPages.read()' | cut -f1)"
judge_rows "after reload" "$after"

result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$id-nohelp-pages.txt"
{
    echo "Linux nohelp-pages check $id: $result"
    source_line
    echo "before: $before"; echo "after:  $after"
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$out.part"
mv "$out.part" "$out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ]
