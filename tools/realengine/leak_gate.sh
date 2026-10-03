#!/usr/bin/env bash
# Nothing that belongs to the game may be committed: not its jar, its stdlib.lua, its Lua source,
# or anything we derive from it (method lists, class dumps). The real-engine tools read the game
# from its install folder every time, and keep their copies in gitignored places.
#   leak_gate.sh                 check every tracked file
#   leak_gate.sh --staged        check what is about to be committed (the pre-commit hook uses this)
#   leak_gate.sh --files-from F  check the paths listed in F (for the test of this script)
#   leak_gate.sh --install-hook  install a local pre-commit hook that runs --staged
# Exit: 0 clean | 1 a game file is tracked/staged
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
. tools/env.sh
if [ "${1:-}" = "--install-hook" ]; then
    hook=.git/hooks/pre-commit
    if [ -f "$hook" ] && grep -q leak_gate "$hook"; then echo "leak gate hook already installed"; exit 0; fi
    { [ -f "$hook" ] && cat "$hook" || echo '#!/usr/bin/env bash'; echo 'tools/realengine/leak_gate.sh --staged || exit 1'; } > "$hook.new"
    mv "$hook.new" "$hook"; chmod +x "$hook"; echo "installed $hook"; exit 0
fi
case "${1:-}" in
    --staged) files="$(git diff --cached --name-only --diff-filter=AM)" ;;
    --files-from) files="$(cat "$2")" ;;
    *) files="$(git ls-files)" ;;
esac
bad=0
while IFS= read -r f; do
    [ -n "$f" ] || continue
    if [[ "$f" =~ (^|/)(stdlib\.lua|projectzomboid\.jar|pzexe\.jar)$ ]] \
       || [[ "$f" == docs/reference/pz-modding/vanilla-lua/* ]] \
       || [[ "$f" == tools/enginecalls/.cache/* ]] || [[ "$f" == tools/realengine/out/* ]] \
       || [[ "$f" =~ (^|/)sigs-[0-9a-f]+\.txt$ ]]; then
        echo "LEAK  $f is game content or derived from it and must not be committed"; bad=$((bad + 1)); continue
    fi
done <<<"$files"
# Content check, when the game is here: no tracked .lua file may be byte-identical to the game's stdlib.lua.
if [ "${1:-}" != "--files-from" ] && [ -n "${PZ_HOME:-}" ] && [ -f "$PZ_HOME/stdlib.lua" ]; then
    want="$(sha256sum "$PZ_HOME/stdlib.lua" | cut -d' ' -f1)"
    while IFS= read -r f; do
        [ -f "$f" ] && [[ "$f" == *.lua ]] && [ "$(sha256sum "$f" | cut -d' ' -f1)" = "$want" ] \
            && { echo "LEAK  $f is a copy of the game's stdlib.lua"; bad=$((bad + 1)); }
    done <<<"$files"
fi
echo "leak gate: $bad game file(s) in $([ "${1:-}" = "--staged" ] && echo the commit || echo the repo)"
[ "$bad" -eq 0 ]
