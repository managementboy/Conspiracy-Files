#!/usr/bin/env bash
# Create the next message in the bridge, numbered correctly.
#   ai-bridge/new.sh claude "map trail shape round 3"
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
author="${1:?usage: new.sh <claude|chatgpt> <slug>}"
shift
slug="$(printf '%s' "$*" | tr '[:upper:] ' '[:lower:]-' | tr -cd 'a-z0-9-')"
[ -n "$slug" ] || { echo "a short slug is required" >&2; exit 1; }
last="$(ls "$here" | grep -oE '^[0-9]{4}' | sort -n | tail -1 || true)"
next="$(printf '%04d' $(( 10#${last:-0} + 1 )))"
to="chatgpt"; [ "$author" = "chatgpt" ] && to="claude"
file="$here/$next-$author-$slug.md"
cat > "$file" <<HEADER
To:    $to
From:  $author
Date:  $(date +%Y-%m-%d)
Re:    $*
Reads:

HEADER
echo "$file"
