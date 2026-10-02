#!/usr/bin/env bash
# graphify update drops the Javadoc nodes; run this instead of `graphify update .`
set -e
cd "$(dirname "$0")/../.."
graphify update .
python3 tools/docscrape/pz_javadocs_to_graph.py
V=docs/reference/pz-modding/vanilla-lua   # local-only copy of the game's media/lua (gitignored), optional
EXTRA=""
if [ -d "$V" ]; then graphify update "$V" --no-cluster; EXTRA="$V/graphify-out/graph.json"; fi
graphify merge-graphs graphify-out/graph.json graphify-out/pz-javadocs-graph.json $EXTRA --out graphify-out/merged-graph.json
cp graphify-out/merged-graph.json graphify-out/graph.json
