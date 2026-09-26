#!/usr/bin/env bash
# Stage 5 acceptance check for docs/design/MODULE_SEPARATION_2026-09-26.md.
#
# Per the ADHD re-evaluation before this stage (5 frames, all converging on
# the same correction): copying module C into a blank scratch mod folder
# with zero source edits is NOT yet a fair test, since the generic document
# schema / publish() boundary section 2.3 originally called for is still
# real, unbuilt work - C's files genuinely need EngineAPI.lua/
# InteractionAPI.lua's real Lua files to be present, not just a schema.
#
# What IS real and already true, checked here mechanically instead of by
# hand every time: every cross-module reach goes through exactly one of the
# three named PublicAPI files (EngineAPI.lua / InteractionAPI.lua /
# PDAAPI.lua), never a direct require of another module's own file. This
# turns that already-achieved invariant into a permanent regression gate,
# so a future edit can't quietly punch a new hole through the boundary
# without this failing loudly.
#
# Exit 0 pass, 1 boundary violation found, 2 could not run.
set -uo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
C="$REPO/mod/common/media/lua/client/ConspiracyFiles"
S="$REPO/mod/common/media/lua/shared/ConspiracyFiles"
[ -d "$C" ] || { echo "module_boundary: $C not found" >&2; exit 2; }

# Module ownership, per docs/design/MODULE_SEPARATION_2026-09-26.md
# sections 2.6 and 3a. Kept here as the mechanical source of truth this
# check runs against - if this list and the design doc's own prose ever
# disagree, the disagreement is real and should be fixed in one place.
A_FILES="PlayerVoice ClueSearch ClueMarkers ContextMenu Organiser SearchedContainerWatch GeneratedMenu ClueCue CaseFile EvidencePickupHint LocalPersonHooks ClueActions LocalPersonIntegration"
B_FILES="AutomaticInvestigations DiscoveryLog GeneratedRuntime T3Nearby VanillaSceneRuntime AddressMap MapMediaRuntime CasePerson IdentityObserver MysteryRuntime VisitedBuildingLog PersonNameLog BodyOutfitLog KeyJournal KeyObserver MapMediaRead PlaceVisitLog EvidenceRows"
C_FILES="KnoxUI KnoxApps OrganiserScreen DocumentPane OrganiserFont OrganiserFont24"
# The sanctioned boundary: the only files any module may require to reach
# another module. Dispatchers, shared utilities and the debug-only files
# excluded from the split (docs/design/MODULE_SEPARATION_2026-09-26.md
# section 3a) may be required by anyone.
API_FILES="EngineAPI InteractionAPI PDAAPI"
SHARED_OK="Log Validator Version SaveBudget Events/EngineEvents Events/InteractionEvents Events/PDAEvents"

# Documented exceptions: a real reach this check would otherwise flag, kept
# as-is on purpose, with why written down here instead of silently allowed.
# Format: "file.lua:Target" - exact matches only, so a NEW reach from the
# same file to a different target still fails loudly.
#
# DiscoveryLog.lua:PlayerVoice - a top-level (not function-scoped) bare
# require("ConspiracyFiles/PlayerVoice") with a discarded return value,
# purely to force PZ to load a file that only registers itself onto the
# shared global table otherwise ("a module reached only through the shared
# table can silently never exist" - this file's own comment). Routing it
# through InteractionAPI.lua instead would cycle: EngineAPI.lua requires
# DiscoveryLog.lua at ITS OWN top level, and InteractionAPI.lua's top level
# requires GeneratedMenu.lua, which requires EngineAPI.lua - a real
# circular require if this one line moved off a direct, no-op-on-return
# require. Every other real reach in this file (the functional PlayerVoice
# read used later) already goes through InteractionAPI.lua at its own,
# safely function-scoped, point of use.
EXCEPTIONS="DiscoveryLog.lua:PlayerVoice"

violations=0

check_module() {
    local module_name="$1" own_files="$2" forbidden_files="$3"
    for f in $own_files; do
        local path="$C/$f.lua"; [ -f "$path" ] || path="$S/$f.lua"
        [ -f "$path" ] || continue
        for target in $forbidden_files; do
            local key="$f.lua:$target"
            case " $EXCEPTIONS " in *" $key "*) continue ;; esac
            # Both a require() of the other module's own file AND a direct
            # read off its exported field on the shared global table are
            # real cross-module reaches - grep for both, not just require().
            # Strip full-line comments first: a doc comment that merely
            # NAMES another module (e.g. "-- with ConspiracyFiles.X.verbose")
            # is not a real reach and would otherwise false-positive.
            if grep -vE '^\s*--' "$path" | grep -qE "require\(\"ConspiracyFiles/${target}\"\)|ConspiracyFiles\.${target}\b"; then
                echo "VIOLATION: $module_name file $f.lua reaches $target directly (must go through ${API_FILES})" >&2
                violations=$((violations+1))
            fi
        done
    done
}

check_module "module A" "$A_FILES" "$B_FILES $C_FILES"
check_module "module B" "$B_FILES" "$A_FILES $C_FILES"
check_module "module C" "$C_FILES" "$A_FILES $B_FILES"

if [ "$violations" -eq 0 ]; then
    echo "module_boundary: PASS - every cross-module reach goes through EngineAPI/InteractionAPI/PDAAPI"
    exit 0
else
    echo "module_boundary: FAIL - $violations direct cross-module require(s) found"
    exit 1
fi
