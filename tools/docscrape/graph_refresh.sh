#!/usr/bin/env bash
# graphify update drops the Javadoc nodes; run this instead of `graphify update .`
set -e
cd "$(dirname "$0")/../.."
graphify update .
python3 tools/docscrape/pz_javadocs_to_graph.py
graphify merge-graphs graphify-out/graph.json graphify-out/pz-javadocs-graph.json --out graphify-out/merged-graph.json
cp graphify-out/merged-graph.json graphify-out/graph.json
