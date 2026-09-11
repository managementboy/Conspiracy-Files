#!/usr/bin/env bash
# Boot check: does the working tree's mod start cleanly in the real game?
#
#   tools/autotest/boot_check.sh [--hidden] [--soak SECONDS]
#
# Starts a fresh world, lets it run (default 60s, so tick-driven modules get to
# work), then passes only if every mod Lua file was loaded and nothing in the
# log errored inside the mod, and the survivor's papers opened by themselves. Writes a short report to
# docs/management/evidence/linux-autotest/ and a screenshot beside the run
# data in dev/eval/linux/runs/. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
soak=60 start_args=()
while [ $# -gt 0 ]; do
    case "$1" in
        --soak) soak="${2:?}"; shift 2 ;;
        --hidden) start_args+=(--hidden); shift ;;
        *) echo "usage: $0 [--hidden] [--soak SECONDS]" >&2; exit 2 ;;
    esac
done

grep -q "not running" <<<"$("$PZ" status)" || { echo "game already running; tools/autotest/pz.sh stop first" >&2; exit 2; }
"$PZ" start "${start_args[@]}" || { echo "boot check: the game did not reach a playable world" >&2; "$PZ" stop; exit 2; }
session="$(cat "$REPO/dev/eval/linux/session")"
runs="$REPO/dev/eval/linux/runs"; mkdir -p "$runs"
echo "soaking ${soak}s" >&2; sleep "$soak"

# Which of the repo's mod files did the game actually load? Compared in Lua,
# because the loaded list is far longer than one eval reply may be.
expected="$(cd "$REPO/mod" && find . -name '*.lua' | sed -E 's|^\./[^/]+/||' | sort)"
total="$(wc -l <<<"$expected")"
{
    echo 'local want = {'
    sed 's/.*/  "&",/' <<<"$expected"
    echo '}'
    cat <<'EOF'
local have = {}
for i = 0, getLoadedLuaCount() - 1 do
    local f = getLoadedLua(i):gsub("\\", "/")
    local rel = f:match("/ConspiracyFiles/[^/]+/(media/lua/.*)$")
    if rel then have[rel] = true end
end
local missing = {}
for _, f in ipairs(want) do if not have[f] then missing[#missing + 1] = f end end
return #want - #missing, table.concat(missing, " ")
EOF
} > "$runs/$session-files.lua"
files="$("$PZ" eval -f "$runs/$session-files.lua" 2>/dev/null)"
facts="$("$PZ" eval 'local p=getPlayer(); return ConspiracyFiles.VERSION, getCore():getVersion(), p and not p:isDead()' 2>/dev/null)"
"$PZ" shot "$runs/$session.png" >/dev/null 2>&1

log="$(run_log)"
mod_errors="$(mod_errors)"
n_errors="$(grep -c . <<<"$mod_errors")"
cf_warn="$(grep -E '\[CF\] v=1 .*lvl=(w|e) ' <<<"$log" | sed 's/^.*> //')"
load="$(grep -o 'game loading took [0-9]* seconds' <<<"$log" | tail -1)"
# The survivor's papers open by themselves at start (catalogue NB-29).
papers="$(grep -oE 'papers (opened in the inventory panel[^"]*|not opened[^"]*)' <<<"$log" | tail -1)"
"$PZ" stop

loaded="$(sed -n 's/^ok \([0-9]*\).*/\1/p' <<<"$files")"
missing="$(sed -n 's/^ok [0-9]*\t\{0,1\}//p' <<<"$files")"
verdict=PASS
[ "$loaded" = "$total" ] || verdict=FAIL
[ "$n_errors" = 0 ] || verdict=FAIL
grep -q 'true$' <<<"$facts" || verdict=FAIL
[[ "$papers" == "papers opened"* ]] || verdict=FAIL

evidence="$REPO/docs/management/evidence/linux-autotest"; mkdir -p "$evidence"
report="$evidence/$session-boot.txt"
{
    echo "Linux boot check $session: $verdict"
    echo "source: $(git -C "$REPO" rev-parse --short HEAD)$(git -C "$REPO" diff --quiet HEAD -- mod || echo ' + uncommitted mod changes')"
    echo "mod version / game version / player alive: $(sed 's/^ok //' <<<"$facts")"
    echo "${load:-load time not found}; soaked ${soak}s"
    echo "mod files loaded: ${loaded:-?} of $total${missing:+; missing: $missing}"
    echo "survivor's papers: ${papers:-no open attempt logged}"
    echo "errors inside the mod: $n_errors"
    [ -z "$mod_errors" ] || sed 's/^/  /' <<<"$mod_errors" | head -10
    echo "mod warnings/errors logged by the mod itself: $(grep -c . <<<"$cf_warn")"
    [ -z "$cf_warn" ] || sed 's/^/  /' <<<"$cf_warn" | head -10
    echo "screenshot: dev/eval/linux/runs/$session.png (not committed)"
} > "$report"
cat "$report"
[ "$verdict" = PASS ]
