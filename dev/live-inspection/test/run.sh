#!/usr/bin/env bash
set -Eeuo pipefail
ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
python3 -m unittest discover -s "$ROOT/test" -p 'test_*.py' -v
lua5.1 -e "assert(loadfile('$ROOT/probe/common/media/lua/client/ConspiracyFilesLiveInspection.lua'))"
python3 -m compileall -q "$ROOT/lib"
