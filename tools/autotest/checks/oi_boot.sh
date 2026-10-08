#!/usr/bin/env bash
# Of Interest boot check: does the game open with Of Interest, its dependency
# "It is of interest to me!" (Workshop 3796373365) and ZombieBuddy together?
#
#   tools/autotest/checks/oi_boot.sh [--soak SECONDS]
#
# PASS needs, in a new world:
#   - both mods and ZombieBuddy active (getActivatedMods);
#   - ZombieBuddy verified OfInterestScenes.jar, put it on the classpath and applied
#     its story advices (at least 140), none failing;
#   - the listener answers with no failed or dropped lines;
#   - no error in the log inside a Conspiracy Files mod;
#   - the dependency still works: a plain note is registered, has content, opens its
#     window and bakes a text id. Only booleans come back - never any note text.
# Visible window only (never --hidden); the display is the machine's own.
# Report: docs/management/evidence/linux-autotest/<session>-oi-boot.txt.
# Exit 0 pass, 1 fail, 2 could not run. Counts only (the owner plays blind).
set -uo pipefail
export PZ_NOHELP_ONLY=1 PZ_OI=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
soak=45
while [ $# -gt 0 ]; do
    case "$1" in --soak) soak="${2:?}"; shift 2 ;; *) echo "usage: $0 [--soak SECONDS]" >&2; exit 2 ;; esac
done
say() { echo "oi-boot: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
notes=()

claim_game || exit 2
start_cold || { say "the game did not reach a playable world"; "$PZ" stop; exit 2; }
id="$(session)"
log="$(cat "$CONSOLE")"

mods="$(ev 'local m=getActivatedMods(); return m:contains("ConspiracyFilesOfInterest"), m:contains("ItIsOfInterestToMe"), m:contains("ZombieBuddy"), m:contains("ConspiracyFilesNoHelp"), m:contains("ConspiracyFiles")')"
IFS=$'\t' read -r m_oi m_dep m_zb m_nh m_da <<<"$mods"
[ "$m_oi" = true ] && [ "$m_dep" = true ] && [ "$m_zb" = true ] || fail "mod list: Of Interest=$m_oi dependency=$m_dep ZombieBuddy=$m_zb"
[ "$m_nh" = false ] && [ "$m_da" = false ] || fail "mod list: an incompatible mod is active (NoHelp=$m_nh DeadAir=$m_da)"
notes+=("mod list: OfInterest=$m_oi dependency=$m_dep ZombieBuddy=$m_zb NoHelp=$m_nh DeadAir=$m_da")

grep -q "ZBS verification valid for .*OfInterestScenes.jar" <<<"$log" || fail "ZombieBuddy did not verify the jar's signature"
grep -q "added to classpath: .*OfInterestScenes.jar" <<<"$log" || fail "the jar was not loaded"
applied="$(grep -c "Applied advice to zombie.randomizedWorld" <<<"$log")"
bad="$(grep -c "Failed to apply advice to zombie.randomizedWorld" <<<"$log")"
[ "$applied" -ge 140 ] || fail "only $applied story advices applied"
[ "$bad" -eq 0 ] || fail "$bad story advices failed"

wait_true 60 'OIShared.VanillaSceneRuntime.listenerStatus()~=nil' || fail "the listener does not answer"
st="$(ev 'local s=OIShared.VanillaSceneRuntime.listenerStatus(); return s.version,s.seen,s.dropped,s.failed,s.queued,s.err or ""')"
IFS=$'\t' read -r v seen dropped failed queued err <<<"$st"
[ "${failed:-1}" = 0 ] && [ "${dropped:-1}" = 0 ] || fail "listener failed=$failed dropped=$dropped ${err:-}"
notes+=("ZombieBuddy advices $applied; listener v$v seen=$seen queued=$queued failed=$failed dropped=$dropped")
say "soaking ${soak}s"; sleep "$soak"

dep="$(ev 'local inv=getPlayer():getInventory(); local it=inv:AddItem("Base.Note"); local reg=ReadableItemRegistry.isRegistered("Base.Note"); local has=ReadableItemRegistry.hasContent(it); local ok=pcall(ReadableItemRegistry.open,it,0); local shown=NoteWindow.instance~=nil; local baked=it:getModData().iioitmTextId~=nil; if NoteWindow.instance then NoteWindow.instance:close() end; inv:Remove(it); return reg,has,ok,shown,baked')"
IFS=$'\t' read -r d_reg d_has d_ok d_shown d_baked <<<"$dep"
[ "$d_reg$d_has$d_ok$d_shown$d_baked" = truetruetruetruetrue ] || fail "dependency read: registered=$d_reg content=$d_has opened=$d_ok shown=$d_shown baked=$d_baked"
notes+=("dependency read: registered=$d_reg content=$d_has opened=$d_ok window=$d_shown id-baked=$d_baked (no text read)")

errs="$(mod_errors)"
[ -z "$errs" ] || fail "errors inside the mods: $(head -3 <<<"$errs" | tr '\n' ' ')"
nerr="$(grep -c "^ERROR" "$CONSOLE")"; notes+=("ERROR lines in the whole console: $nerr (mod errors: $(grep -c . <<<"$errs"))")

result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$id-oi-boot.txt"
mkdir -p "$(dirname "$out")"
{
    echo "Linux Of Interest boot check $id: $result"
    source_line
    renderer_line
    for n in "${notes[@]}"; do echo "$n"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$out.part"
mv "$out.part" "$out"
say "written: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ]
