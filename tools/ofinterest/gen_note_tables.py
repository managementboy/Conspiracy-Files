#!/usr/bin/env python3
"""Generate mod-ofinterest/.../OIShared/Generated/NoteTables.lua from the PRIVATE analysis
(dev/ofinterest-private/, gitignored). Output is NUMBERS ONLY (plus id path strings):
  ["Note/0042"]={story,order,place,{themes},confidence}
story 1..23 (0 none), order 1.. (0 none), place 1..13 (0 none; index in the dependency's
KNOWN_CATEGORIES), themes 1..30 (index in the private theme list), confidence 0 none/1 low/2 med/3 high.
Usage: python3 tools/ofinterest/gen_note_tables.py [--check]   (--check: fail if the file is stale)
No note text is read: stories.json 'summary' and ext 'summary'/'entities'/'events' are never touched."""
import glob, json, os, re, sys
REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
PRIV = os.path.join(REPO, "dev", "ofinterest-private")
OUT = os.path.join(REPO, "mod-ofinterest/common/media/lua/shared/OIShared/Generated/NoteTables.lua")
DEP = os.path.expanduser("~/.steam/debian-installation/steamapps/workshop/content/108600/3796373365/mods/ItIsOfInterestToMe/42/media/lua/client/ItIsOfInterestToMe/LocationCategory.lua")

def norm(path):
    m = re.search(r"Note/EN/(\d+)\.txt$", path)
    if m: return "Note/" + m.group(1)
    m = re.search(r"Letters/(\w+)/EN/(\d+)\.txt$", path)
    if m: return "Letter/%s/%s" % (m.group(1), m.group(2))
    raise SystemExit("unrecognised file key (shape only): " + re.sub(r"\d", "N", path))

def places():
    src = open(DEP, encoding="utf-8").read()
    block = re.search(r"KNOWN_CATEGORIES\s*=\s*\{(.*?)\}", src, re.S).group(1)
    return re.findall(r'"(\w+)"', block)

def main():
    stories = json.load(open(os.path.join(PRIV, "stories.json")))
    themes = list(json.load(open(os.path.join(PRIV, "theme_counts.json")))["overall"])
    cats = places()
    ext = {}
    for f in sorted(glob.glob(os.path.join(PRIV, "ext_*.json"))):
        for e in json.load(open(f)): ext[norm(e["file"])] = e
    conf = {"low": 1, "medium": 2, "high": 3}
    info = {}
    for st in stories:
        n = int(st["story_id"][1:])
        order = [norm(p) for p in (st.get("order_guess") or [])]
        for p in st["files"]:
            i = norm(p)
            info[i] = (n, order.index(i) + 1 if i in order else 0, conf[st["confidence"]])
    rows = []
    for i in sorted(ext):
        e = ext[i]
        s, o, c = info.get(i, (0, 0, 0))
        place = cats.index(e["location"]) + 1 if e.get("location") else 0
        th = sorted(themes.index(t) + 1 for t in (e.get("themes") or []))
        rows.append('["%s"]={%d,%d,%d,{%s},%d}' % (i, s, o, place, ",".join(map(str, th)), c))
    assert len(rows) == 500 and sum(1 for v in info.values() if v[0]) == 67, (len(rows), len(info))
    text = "return {\n" + ",\n".join(rows) + "\n}\n"
    if "--check" in sys.argv:
        sys.exit(0 if open(OUT).read() == text else 1)
    open(OUT, "w").write(text)
    print("wrote %d rows, %d stories, %d places, %d themes" % (len(rows), len(stories), len(cats), len(themes)))
main()
