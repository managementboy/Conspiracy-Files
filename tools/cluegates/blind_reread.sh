#!/usr/bin/env bash
# BLIND RE-READ, scripted (tools/cluegates/blind_reread.md; checklist E1).
#
#   tools/cluegates/blind_reread.sh [--force] [clue id ...]
#   tools/cluegates/blind_reread.sh --rows <ticket.json>   a draft, before converting
#
# For each clue in the derived clue list (or only the ids given) that has no
# current receipt, renders exactly what the reader sees, runs RUNS fresh reads
# with a model other than the writer's (Haiku through the `claude` CLI, from an
# empty folder, with no tools, no settings and no session kept), records votes
# and writes tools/cluegates/receipts/<id>.json. Default is one read per clue;
# use --force with selected flagged ids to append one independent second read.
# Then runs the receipt check. Prints ids, votes and codes only, never clue text.
#
# Environment: RUNS (default 1), PARALLEL (default 8), READER_MODEL (default
# claude-haiku-4-5).
set -u
cd "$(dirname "$0")/../.."
RUNS=${RUNS:-1}; PARALLEL=${PARALLEL:-8}; MODEL=${READER_MODEL:-claude-haiku-4-5}
FORCE=0; if [ "${1:-}" = "--force" ]; then FORCE=1; shift; fi
ROWS=""; if [ "${1:-}" = "--rows" ]; then ROWS=$2; shift 2; fi
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
    word=$(printf '%s\n' "$out" | head -1 | tr -d '*' | awk '{print toupper($1)}' | tr -dc 'A-Z')
    case "$word" in A|B|NEITHER) echo "$word" > "$w/reads/$id.run$n"; return 0;; esac
  done
}
export -f read_one; export MODEL
while read -r id; do for n in $(seq 1 "$RUNS"); do echo "$WORK $id $n"; done; done < "$WORK/todo" \
  | xargs -r -P "$PARALLEL" -n 3 bash -c 'read_one "$@"' _

while read -r id; do
  python3 - "$WORK" "$id" "$MODEL" "$FORCE" <<'EOF'
import sys,os,json,datetime
w,i,m,force=sys.argv[1:5]
v={"A":0,"B":0,"neither":0}
for f in os.listdir(w+"/reads"):
    if f.startswith(i+".run"):
        x=open(w+"/reads/"+f).read().strip()
        v["neither" if x=="NEITHER" else x]+=1
sha=open(w+"/reads/"+i+".sha").read().strip()
path="tools/cluegates/receipts/"+i+".json"
if force=="1" and os.path.exists(path):
    try:
        old=json.load(open(path))
        if old.get("sha256")==sha:
            for k in v: v[k]+=int(old.get("votes",{}).get(k,0))
    except Exception: pass
json.dump({"clue":i,"sha256":sha,"model":m+" (no repo access, no tools, fresh context per read)",
    "date":datetime.date.today().isoformat(),"votes":v},open(path,"w"),indent=2)
print(i,"A",v["A"],"B",v["B"],"neither",v["neither"])
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
