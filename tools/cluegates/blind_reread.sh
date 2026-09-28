#!/usr/bin/env bash
# BLIND RE-READ, scripted (tools/cluegates/blind_reread.md; checklist E1).
#
#   tools/cluegates/blind_reread.sh [--force] [clue id ...]
#   tools/cluegates/blind_reread.sh --rows <ticket.json>   a draft, before converting
#
# For each clue in the derived clue list (or only the ids given) that has no
# current receipt, renders exactly what the reader sees, runs ONE fresh read
# with a model other than the writer's (Haiku through the `claude` CLI, from an
# empty folder, with no tools, no settings and no session kept) and writes
# tools/cluegates/receipts/<id>.json with the result: A, B, both or none
# (DR-20260928-NOHELP-CLUE-CHECK). No second reads; --force replaces a receipt.
# Then runs the receipt check. Prints ids, votes and codes only, never clue text.
#
# Environment: PARALLEL (default 8), READER_MODEL (default claude-haiku-4-5).
# Each invocation always makes exactly one read per selected clue.
set -u
cd "$(dirname "$0")/../.."
RUNS=1; PARALLEL=${PARALLEL:-8}; MODEL=${READER_MODEL:-claude-haiku-4-5}
FORCE=0; if [ "${1:-}" = "--force" ]; then FORCE=1; shift; fi  # re-read after a text change only; there are no second reads
ROWS=""; if [ "${1:-}" = "--rows" ]; then ROWS=$2; shift 2; fi
if [ "$FORCE" -eq 1 ] && [ "$#" -eq 0 ] && [ -z "$ROWS" ]; then echo "--force requires selected clue ids" >&2; exit 2; fi
WORK=$(mktemp -d); trap 'rm -rf "$WORK"' EXIT
mkdir -p "$WORK/empty" "$WORK/reads"
sed -n '/^```$/,/^```$/p' tools/cluegates/blind_reread.md | sed '1d;$d' > "$WORK/prompt.tmpl"

if [ -n "$ROWS" ]; then lua5.1 tools/cluegates/render_rows.lua "$ROWS" "$WORK/reads" > "$WORK/ids" || exit 1
elif [ $# -gt 0 ]; then printf '%s\n' "$@" > "$WORK/ids"
else lua5.1 -e 'package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
  for _,c in ipairs(require("NHShared/Mystery/Manifest").clues) do print(c.id) end' > "$WORK/ids"; fi

# Only clues without a current receipt, unless --force.
: > "$WORK/todo"
while read -r id; do
  [ -n "$id" ] || continue
  if [ -z "$ROWS" ]; then
    out=$(lua5.1 tools/cluegates/check_receipts.lua --render "$id") || { echo "$id NOT_IN_LIST"; continue; }
    printf '%s\n' "$out" | sed '/^sha256: /d' > "$WORK/reads/$id.render"
    printf '%s\n' "$out" | sed -n 's/^sha256: //p' > "$WORK/reads/$id.sha"
  fi
  sha=$(cat "$WORK/reads/$id.sha")
  if [ $FORCE -eq 0 ] && [ -f "tools/cluegates/receipts/$id.json" ] && grep -q "\"$sha\"" "tools/cluegates/receipts/$id.json"; then continue; fi
  python3 - "$WORK" "$id" <<'EOF'
import sys
w,i=sys.argv[1],sys.argv[2]
t=open(w+"/prompt.tmpl").read(); c=open(w+"/reads/"+i+".render").read()
open(w+"/reads/"+i+".prompt","w").write(t.replace("<paste the rendered clue text here>\n",c))
EOF
  echo "$id" >> "$WORK/todo"
done < "$WORK/ids"

read_one() {  # $1 work dir, $2 id, $3 run number
  local w=$1 id=$2 n=$3 out word
  for _ in 1 2 3; do
    out=$(cd "$w/empty" && timeout 90 claude -p --model "$MODEL" --tools "" --no-session-persistence \
      --setting-sources "" --strict-mcp-config \
      --system-prompt "You answer questions about a single text excerpt." < "$w/reads/$id.prompt" 2>/dev/null)
    # Two answers, "A: YES|NO - ..." and "B: YES|NO - ...": A, B, both or none.
    word=$(printf '%s\n' "$out" | tr -d '*' | tr 'a-z' 'A-Z' | awk '
      /^ *A *: *(YES|NO)/ && a=="" {a=($0 ~ /^ *A *: *YES/)?"Y":"N"}
      /^ *B *: *(YES|NO)/ && b=="" {b=($0 ~ /^ *B *: *YES/)?"Y":"N"}
      END {if (a!="" && b!="") print (a=="Y"&&b=="Y")?"both":(a=="Y")?"A":(b=="Y")?"B":"none"}')
    case "$word" in A|B|both|none) echo "$word" > "$w/reads/$id.run$n"; return 0;; esac
  done
}
export -f read_one; export MODEL
while read -r id; do for n in $(seq 1 "$RUNS"); do echo "$WORK $id $n"; done; done < "$WORK/todo" \
  | xargs -r -P "$PARALLEL" -n 3 bash -c 'read_one "$@"' _

while read -r id; do
  python3 - "$WORK" "$id" "$MODEL" "$FORCE" <<'EOF'
import sys,os,json,datetime
w,i,m,force=sys.argv[1:5]
v={"A":0,"B":0,"both":0,"none":0}
for f in os.listdir(w+"/reads"):
    if f.startswith(i+".run"):
        x=open(w+"/reads/"+f).read().strip()
        v[x]+=1
sha=open(w+"/reads/"+i+".sha").read().strip()
path="tools/cluegates/receipts/"+i+".json"
json.dump({"clue":i,"sha256":sha,"model":m+" (no repo access, no tools, fresh context per read)",
    "date":datetime.date.today().isoformat(),"votes":v},open(path,"w"),indent=2)
print(i,[k for k in v if v[k]][0] if any(v.values()) else "no-answer")
EOF
done < "$WORK/todo"
if [ -n "$ROWS" ]; then
  # A draft is not in the clue list yet: judge its rows with the same rules.
  ROWSFILE="$ROWS" lua5.1 -e 'package.path="tools/nohelp_content/?.lua;"..package.path
    local J=require("json"); local R=dofile("tools/cluegates/check_receipts.lua")
    local f=io.open(os.getenv("ROWSFILE"),"rb"); local d=J.decode(f:read("*a")); f:close()
    local p=R.check(d.rows or d); for _,x in ipairs(p) do print(x.id.." "..x.code) end
    print(#(d.rows or d).." draft rows, "..#p.." without a valid blind re-read")'
else
  lua5.1 tools/cluegates/check_receipts.lua
fi
