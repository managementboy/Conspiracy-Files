#!/usr/bin/env bash
# Can the suite fail? Reintroduce known defects and see which are caught.
#
#   tools/autotest/mutants/run.sh            every mutant
#   tools/autotest/mutants/run.sh 003        one
#
# Exit 0 when every mutant is caught, 1 when any survives. A SURVIVING mutant
# is a measured hole: a defect this codebase shipped, reintroduced, with the
# whole offline suite still green.
set -uo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
only="${1:-}"
corpus="$REPO/tools/autotest/mutants/corpus.tsv"
caught=0; survived=(); applied=0; touched=()

restore() { git -C "$REPO" checkout -- "$1" 2>/dev/null; }

# REFUSE TO RUN ON A DIRTY TREE.
#
# This tool edits shipped source and puts it back. The first version finished
# with `git checkout -- mod/`, which was meant as a safety net and instead
# destroyed uncommitted work: a run on 2026-09-24 reverted four files of
# in-progress changes with no warning. A tool that silently discards your
# edits is worse than no tool.
#
# So: a clean mod/ tree is a precondition, and only the files this run actually
# mutated are ever restored.
if [ -n "$(git -C "$REPO" status --porcelain mod/ 2>/dev/null)" ]; then
    echo "refusing to run: mod/ has uncommitted changes." >&2
    echo "This tool edits shipped source and restores it; running it now would" >&2
    echo "discard your work. Commit or stash first:" >&2
    git -C "$REPO" status --short mod/ >&2
    exit 2
fi

while IFS=$'\t' read -r id file find replace note; do
    [ -z "${id:-}" ] && continue
    case "$id" in \#*) continue ;; esac
    [ -n "$only" ] && [ "$only" != "$id" ] && continue
    if ! grep -qF -- "$find" "$REPO/$file" 2>/dev/null; then
        echo "mutant $id: SKIPPED — its anchor is gone from $file (fix rewritten?)" >&2
        continue
    fi
    python3 - "$REPO/$file" "$find" "$replace" <<'PY'
import sys
path,find,replace=sys.argv[1],sys.argv[2],sys.argv[3]
s=open(path,encoding='utf-8',newline='').read()
open(path,'w',encoding='utf-8',newline='').write(s.replace(find,replace,1))
PY
    touched+=("$file")
    applied=$((applied+1))
    if timeout 900 "$REPO/tools/autotest/unit.sh" >/dev/null 2>&1; then
        survived+=("$id: $note")
        echo "mutant $id: SURVIVED — $note" >&2
    else
        caught=$((caught+1))
        echo "mutant $id: caught" >&2
    fi
    restore "$file"
done < "$corpus"

# Restore only what this run mutated. Never a blanket checkout: see the
# precondition above for why.
for f in "${touched[@]:-}"; do [ -n "$f" ] && restore "$f"; done

echo
echo "mutants applied: $applied; caught: $caught; survived: ${#survived[@]}"
[ "$applied" -gt 0 ] || { echo "NO MUTANTS APPLIED — the corpus is not exercising anything" >&2; exit 1; }
for s in "${survived[@]}"; do echo "  HOLE  $s"; done
[ ${#survived[@]} -eq 0 ]
