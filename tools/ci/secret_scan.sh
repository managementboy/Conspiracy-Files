#!/usr/bin/env bash
# Reject a committed credential. Self-contained on purpose: a secret scan that
# depends on a third-party action is a supply-chain hole in the one job whose
# whole point is supply-chain hygiene.
#
#   tools/ci/secret_scan.sh          scan every tracked file
#
# Exit 0 clean, 1 something that looks like a secret, 2 could not run.
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
git rev-parse --git-dir >/dev/null 2>&1 || { echo "secret scan: not a git repository"; exit 2; }

# Each pattern is a shape a real credential has, not a word that appears near
# one. "password" in prose is not a finding; forty base64 characters after
# "api_key =" is.
patterns=(
    'AKIA[0-9A-Z]{16}'                                  # AWS access key id
    'ghp_[A-Za-z0-9]{36}'                               # GitHub personal token
    'github_pat_[A-Za-z0-9_]{60,}'                      # GitHub fine-grained
    'xox[baprs]-[A-Za-z0-9-]{10,}'                      # Slack
    'sk-[A-Za-z0-9]{32,}'                               # OpenAI-shaped
    'sk-ant-[A-Za-z0-9_-]{20,}'                         # Anthropic
    'AIza[0-9A-Za-z_-]{35}'                             # Google API key
    '-----BEGIN [A-Z ]*PRIVATE KEY-----'                # any private key
    '(api[_-]?key|secret|token|passwd|password)[[:space:]]*[:=][[:space:]]*["'"'"'][A-Za-z0-9/+_-]{24,}["'"'"']'
)
# Files that legitimately contain long opaque strings.
skip='^(graphify-out/|dist/|artifacts/|tools/kahlua/RunLua\.class|.*\.(png|jpg|zip|class|ttf|bin))'

# ONE grep PASS, not one per file per pattern. The first version ran 2,302
# files against nine patterns separately and took over two minutes; grep is
# perfectly happy to take the whole alternation and the whole file list.
list="$(mktemp)"; pats="$(mktemp)"; trap 'rm -f "$list" "$pats"' EXIT
git ls-files -z | tr '\0' '\n' | grep -vE "$skip" > "$list"
printf '%s\n' "${patterns[@]}" > "$pats"
hits=0
# xargs, not $(...): a path with a space in it would otherwise be split into
# two paths that do not exist, and grep would scan neither.
if found="$(xargs -a "$list" -d '\n' -r grep -nEI -f "$pats" --no-messages -- 2>/dev/null)"; then
    # Print the location only. A scanner that echoes the value it found has
    # just published the credential into the build log.
    while IFS= read -r line; do
        [ -n "$line" ] || continue
        echo "SECRET? ${line%%:*}:$(cut -d: -f2 <<<"$line")"
        hits=$((hits + 1))
    done <<<"$found"
fi

if [ "$hits" -gt 0 ]; then
    echo "secret scan: $hits suspected credential(s); values are not printed"
    exit 1
fi
echo "secret scan: $(git ls-files | wc -l) tracked files, 0 suspected credentials"
