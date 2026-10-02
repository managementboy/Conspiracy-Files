"""Deterministic Javadoc-Markdown -> graphify graph (no LLM).
Reads docs/reference/pz-modding/javadocs/*.md, writes graphify-out/pz-javadocs-graph.json.
Nodes: package, class/interface/enum, method, field. Edges: contains, child_of (extends),
implements, references (types in member signatures)."""
import json, os, re, posixpath, glob

SRC = "docs/reference/pz-modding/javadocs"
OUT = "graphify-out/pz-javadocs-graph.json"
PFX, SFX = "projectzomboid.com-modding-", ".html.md"
LINK = re.compile(r'\[([^\]]+)\]\(([^)\s]+)(?:\s+"[^"]*")?\)')
SKIP = ("package-", "module-")

def nid(*p): return "pzjd_" + re.sub(r"[^a-z0-9]+", "_", ".".join(p).lower()).strip("_")

files = {}  # fqn -> path
for f in glob.glob(f"{SRC}/*{SFX}"):
    b = os.path.basename(f)[len(PFX):-len(SFX)]
    if b.startswith(SKIP) or "-package-" in b or b.endswith(("package-summary", "package-tree", "package-use")): continue
    files[b.replace("-", ".")] = f
classes = set(files)

def resolve(txt, href, pkg_dir, pkg):
    """Return FQN of a type reference or None."""
    if href and not href.startswith("http"):
        p = posixpath.normpath(posixpath.join(pkg_dir, href.split("#")[0]))
        c = p[:-5].replace("/", ".")
        if c in classes: return c
    t = re.sub(r"<.*", "", txt).strip("`")
    if t in classes: return t
    if pkg + "." + t in classes: return pkg + "." + t
    return None

nodes, links, seen = {}, [], set()
def node(i, label, ftype, src, **kw):
    if i not in nodes:
        nodes[i] = dict(id=i, label=label, norm_label=label.lower(), file_type=ftype, source_file=src,
                        _origin="ast", **kw)
def link(a, b, rel, src):
    k = (a, b, rel)
    if k in seen or a == b: return
    seen.add(k)
    links.append(dict(source=a, target=b, relation=rel, _origin="ast", confidence="EXTRACTED",
                      confidence_score=1.0, source_file=src))

pending = []
for fqn, path in files.items():
    txt = open(path, encoding="utf-8").read()
    rel = path
    m = re.search(r"^\d+\. \[([^\]]+)\]\(package-summary\.html\)", txt, re.M)
    pkg = m.group(1) if m else fqn.rsplit(".", 1)[0]
    pkg_dir = pkg.replace(".", "/")
    cid = nid(fqn)
    d = re.search(r"^((?:[\w@]+ )*)(class|interface|enum|record|@interface) ([\w.]+)", txt, re.M)
    kind = d.group(2) if d else "class"
    node(cid, fqn.rsplit(".", 1)[-1] if "." in fqn else fqn, "code", rel, pz_kind=kind, fqn=fqn,
         modifiers=(d.group(1).strip() if d else ""))
    pid = nid("pkg", pkg)
    node(pid, pkg, "code", rel, pz_kind="package", fqn=pkg)
    link(pid, cid, "contains", rel)
    # declaration: extends / implements
    if d:
        decl = txt[d.start():].split("\n\n", 1)[0]
        for kw, relname in (("extends", "child_of"), ("implements", "implements")):
            mm = re.search(rf"^{kw} (.+?)(?=\n(?:implements|extends)|\Z)", decl, re.M | re.S)
            if not mm: continue
            s = mm.group(1).replace("\n", " ")
            for lm in LINK.finditer(s):
                t = resolve(lm.group(1), lm.group(2), pkg_dir, pkg)
                if t: pending.append((cid, t, relname, rel))
            s2 = LINK.sub("", s)
            for t0 in re.split(r"[,\s]+", s2):
                if "." in t0 or t0:
                    t = resolve(t0.strip(), None, pkg_dir, pkg)
                    if t: pending.append((cid, t, relname, rel))
                    elif re.match(r"^[a-z][\w]*(\.[\w]+)+$", t0) and not t0.startswith("java"):
                        # parent class exists in the game but has no Javadoc page: keep the chain via a stub
                        node(nid(t0), t0.rsplit(".", 1)[-1], "code", rel, pz_kind="undocumented", fqn=t0)
                        pending.append((cid, t0, relname, rel))
    # members
    for sec, mk in (("Field Details", "field"), ("Method Details", "method"), ("Constructor Details", "constructor")):
        mm = re.search(rf"^\* {sec}\n.*?(?=^\* \w|\Z)", txt, re.M | re.S)
        if not mm: continue
        for h in re.finditer(r"^\s+\+ ### (.+?)\n\n(.*?)(?=^\s+\+ ### |\Z)", mm.group(0), re.M | re.S):
            name = h.group(1).replace("\\_", "_")
            sig = " ".join(h.group(2).split("\n\n", 1)[0].split())
            sigtxt = LINK.sub(r"\1", sig)
            mid = nid(fqn, mk, name, sigtxt)
            node(mid, f"{nodes[cid]['label']}.{name}", "code", rel, pz_kind=mk, signature=sigtxt[:300])
            link(cid, mid, "contains", rel)
            for lm in LINK.finditer(sig):
                t = resolve(lm.group(1), lm.group(2), pkg_dir, pkg)
                if t: pending.append((cid, t, "references", rel))
for a, t, r, rel in pending: link(a, nid(t), r, rel)

os.makedirs("graphify-out", exist_ok=True)
json.dump(dict(directed=True, multigraph=False, graph={}, nodes=list(nodes.values()), links=links, hyperedges=[]),
          open(OUT, "w"))
print(len(classes), "classes;", len(nodes), "nodes;", len(links), "links")
