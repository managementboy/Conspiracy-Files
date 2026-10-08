#!/usr/bin/env python3
"""Scan every engine call in the mod's Lua and check it against the installed game.

  tools/enginecalls/enginecalls.py [--root DIR ...] [--sigs FILE] [--allowlist FILE]
                                   [--tree-from-git REV] [--evidence] [--selftest]

For each  obj:method(...)  /  Class.method(...)  call it asks: does ANY game class have a
method of that name, with that many arguments, accepting those literal values?  Lua is untyped,
so the receiver is usually unknown; that makes this a floor, not a proof (a name that exists
on some other class still passes).  What it does catch is the removed-method / wrong-count /
wrong-literal class of bug: IsoGridSquare.getDoor(boolean) in 42.20.4.

Nothing from the game is stored in the repo: the signature list is read from the installed
jar with javap into a gitignored cache each time the jar changes.

Statuses (all fail the run unless allowlisted):
  VANISHED  no game class, no mod or vanilla Lua function has this method name
  ARITY     the name exists in the game but no overload takes this many arguments
  LITERAL   an overload has the right count but none accepts these literal values
Exit: 0 clean | 1 findings | 20 no game (never a pass)
"""
import argparse, collections, glob, hashlib, json, os, re, subprocess, sys, tempfile

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
LUA_NAMES = set("""format gsub sub find match gmatch rep lower upper len byte char insert remove concat sort unpack
pairs ipairs type tostring tonumber floor ceil max min abs random sqrt pcall error print select next rawget rawset
setmetatable getmetatable assert require load time clock date reverse getn sin cos pow huge fmod modf exp log
getClass getSimpleName getName hashCode equals toString
loadstring loadfile dofile setfenv getfenv xpcall tinsert tremove traceback running status wrap yield resume create
open close lines read write flush seek getenv exit tmpname rename remove difftime""".split())
NUM = {"int", "long", "short", "byte", "float", "double", "char", "java.lang.Integer", "java.lang.Long",
       "java.lang.Double", "java.lang.Float", "java.lang.Short", "java.lang.Byte", "java.lang.Number"}


def split_top(s):
    out, d, cur, q = [], 0, "", None
    for ch in s:
        if q:
            cur += ch
            if ch == q:
                q = None
            continue
        if ch in "\"'":
            q = ch; cur += ch; continue
        if ch in "<([{": d += 1
        elif ch in ">)]}": d -= 1
        if ch == "," and d == 0:
            out.append(cur.strip()); cur = ""
        else:
            cur += ch
    if cur.strip(): out.append(cur.strip())
    return out


def mask(src):
    """Blank comments and the INSIDE of string literals, keeping every offset and newline, so
    regexes never see 'string:sub' inside text or  -- foo:bar()  in a comment.  Returns
    (masked, literal_kinds) where literal_kinds maps the offset of a string's opening quote to 'str'."""
    out, i, n = [], 0, len(src)
    while i < n:
        c = src[i]
        if src.startswith("--", i):
            m = re.match(r"--\[(=*)\[", src[i:])
            if m:
                end = src.find("]" + m.group(1) + "]", i)
                end = n if end < 0 else end + len(m.group(1)) + 2
                out.append("".join(ch if ch == "\n" else " " for ch in src[i:end])); i = end
            else:
                end = src.find("\n", i); end = n if end < 0 else end
                out.append(" " * (end - i)); i = end
        elif c in "\"'":
            j = i + 1
            while j < n and src[j] != c and src[j] != "\n":
                j += 2 if src[j] == "\\" else 1
            j = min(j, n - 1)
            out.append(c + "s" * max(j - i - 1, 0) + (src[j] if j > i else "")); i = j + 1
        else:
            m = re.match(r"\[(=*)\[", src[i:]) if c == "[" else None
            if m:
                end = src.find("]" + m.group(1) + "]", i)
                end = n if end < 0 else end + len(m.group(1)) + 2
                out.append("[" + "s" * (end - i - 2) + "]"); i = end
            else:
                out.append(c); i += 1
    return "".join(out)


def literal_kind(a):
    a = a.strip()
    if re.fullmatch(r"([\"'])s*\1", a): return "str"
    if re.fullmatch(r"-?\d+(\.\d+)?", a): return "num"
    if a in ("true", "false"): return "bool"
    return "?"


def lit_ok(kind, t):
    t = t.replace("...", "")   # a varargs parameter accepts the element type
    if t == "java.lang.Object" or kind == "?": return True
    if kind == "str": return t in ("java.lang.String", "java.lang.CharSequence")
    if kind == "num": return t in NUM
    if kind == "bool": return t in ("boolean", "java.lang.Boolean")
    return True


def parse_sigs(path):
    meth = collections.defaultdict(list)  # name -> [params]
    for ln in open(path, encoding="utf-8", errors="replace"):
        m = re.match(r"^\s+public (?:static |final |abstract |synchronized |native |default )*(?:<[^>]+> )?"
                     r"[\w.$<>\[\],? ]+? (\w+)\((.*)\)(?: throws [\w.,$ ]+)?;$", ln.rstrip())
        if m:
            meth[m.group(1)].append(split_top(m.group(2)) if m.group(2) else [])
    return meth


def find_game():
    env = subprocess.run(["bash", "-c", ". tools/env.sh; echo \"$PZ_HOME|$JAVA_HOME\""], cwd=REPO,
                         capture_output=True, text=True).stdout.strip().split("|")
    pz, jh = (env + ["", ""])[:2]
    return (pz if pz and os.path.isfile(os.path.join(pz, "projectzomboid.jar")) else None), jh


def jar_sigs(pz, jh):
    """Run javap over the installed jar into a gitignored cache; reuse it while the jar is unchanged."""
    jar = os.path.join(pz, "projectzomboid.jar")
    st = os.stat(jar)
    key = hashlib.sha256(f"{jar}{st.st_size}{st.st_mtime}".encode()).hexdigest()[:16]
    cache = os.path.join(REPO, "tools/enginecalls/.cache")
    os.makedirs(cache, exist_ok=True)
    out = os.path.join(cache, f"sigs-{key}.txt")
    if not os.path.exists(out):
        names = subprocess.run(["unzip", "-Z1", jar], capture_output=True, text=True).stdout.split()
        cls = [n[:-6].replace("/", ".") for n in names if n.endswith(".class") and re.match(r"(zombie|fmod|org/joml|se/krka)/", n)
               and not re.search(r"\$\d", n)]
        with open(out, "w") as fh:
            for i in range(0, len(cls), 400):
                subprocess.run([os.path.join(jh, "bin/javap"), "-public", "-cp", jar] + cls[i:i + 400],
                               stdout=fh, stderr=subprocess.DEVNULL)
    return out


def lua_defined_names(files):
    names = set()
    for f in files:
        t = mask(open(f, encoding="utf-8", errors="replace").read())
        names |= set(re.findall(r"function\s+[\w.]*[.:](\w+)\s*\(", t)) | set(re.findall(r"function\s+(\w+)\s*\(", t))
        names |= set(re.findall(r"\b(\w+)\s*=\s*function", t))
        names |= set(re.findall(r"^\s*[\w.]+\.(\w+)\s*=", t, re.M))
        names |= set(re.findall(r"[{,]\s*(\w+)\s*=\s*function", t))
        names |= set(re.findall(r"^\s*(\w+)\s*=", t, re.M))
    return names


def scan(files, meth, defined):
    findings, total = [], 0
    for f in files:
        raw = open(f, encoding="utf-8", errors="replace").read()
        t = mask(raw)
        for m in re.finditer(r"(?<!\.)([.:])(\w+)\s*\(", t):  # not the second dot of ..
            name = m.group(2)
            if name in LUA_NAMES or name in defined:
                continue
            i, d = m.end(), 1
            j = i
            while j < len(t) and d:
                d += (t[j] in "([{") - (t[j] in ")]}")
                j += 1
            args = split_top(t[i:j - 1]) if t[i:j - 1].strip() else []
            line = t.count("\n", 0, m.start()) + 1
            total += 1
            if name not in meth:
                findings.append(("VANISHED", f, line, name, len(args)))
                continue
            kinds = [literal_kind(a) for a in args]

            def fits(p, check_types):
                va = bool(p) and p[-1].endswith("...")
                if not va and len(p) != len(args): return False
                if va and len(args) < len(p) - 1: return False
                return (not check_types) or all(lit_ok(k, p[min(n, len(p) - 1)]) for n, k in enumerate(kinds))
            if not any(fits(p, False) for p in meth[name]):
                findings.append(("ARITY", f, line, name, len(args)))
            elif not any(fits(p, True) for p in meth[name]):
                findings.append(("LITERAL", f, line, name, len(args)))
    return findings, total


def load_allowlist(path):
    entries = {}
    if os.path.exists(path):
        for ln in open(path):
            ln = ln.strip()
            if ln and not ln.startswith("#"):
                key, _, reason = ln.partition("|")
                entries[key.strip()] = reason.strip()
    return entries


def run(args):
    pz, jh = (None, None) if args.sigs else find_game()
    if not args.sigs and not pz:
        print("enginecalls: NOT EXERCISED - no game here. This is not a pass.")
        return 20
    sigs = args.sigs or jar_sigs(pz, jh)
    meth = parse_sigs(sigs)
    roots = args.root or [os.path.join(REPO, "mod"), os.path.join(REPO, "mod-nohelp"), os.path.join(REPO, "mod-ofinterest")]
    files = sorted(f for r in roots for f in glob.glob(os.path.join(r, "**/*.lua"), recursive=True))
    tmp = None
    if args.tree_from_git:  # scan the mod as it was at a past commit (regression proof)
        tmp = tempfile.mkdtemp()
        for r in ("mod", "mod-nohelp"):
            subprocess.run(f"git archive {args.tree_from_git} {r} | tar -x -C {tmp}", shell=True, cwd=REPO, check=True)
        files = sorted(glob.glob(os.path.join(tmp, "**/*.lua"), recursive=True))
    vanilla = glob.glob(os.path.join(pz, "media/lua/**/*.lua"), recursive=True) if pz else []
    defined = lua_defined_names(files) | lua_defined_names(vanilla)
    findings, total = scan(files, meth, defined)
    base = tmp or REPO
    allow = load_allowlist(args.allowlist)
    used, bad = set(), []
    for st, f, line, name, n in findings:
        key = f"{os.path.relpath(f, base)}:{name}"
        if key in allow:
            used.add(key)
        else:
            bad.append((st, os.path.relpath(f, base), line, name, n))
    stale = sorted(set(allow) - used) if not args.tree_from_git and not args.root else []
    for st, f, line, name, n in bad:
        print(f"{st:8} {f}:{line}  {name}() with {n} argument(s)")
    for key in stale:
        print(f"STALE    allowlist entry matches no call any more: {key}")
    print(f"enginecalls: {total} engine-looking calls checked, {len(bad)} finding(s), {len(allow) - len(stale)} allowlisted, {len(stale)} stale")
    if args.evidence:
        d = os.path.join(REPO, "docs/management/evidence/enginecalls")
        os.makedirs(d, exist_ok=True)
        out = os.path.join(d, __import__("datetime").datetime.now().strftime("%Y%m%dT%H%M%S") + ".txt")
        with open(out, "w") as fh:
            fh.write(f"calls={total} findings={len(bad)} allowlisted={len(allow) - len(stale)} stale={len(stale)}\n")
            for st, f, line, name, n in bad: fh.write(f"{st} {f}:{line} {name}/{n}\n")
        print("saved", os.path.relpath(out, REPO))
    return 1 if (bad or stale) else 0


def selftest():
    sig = os.path.join(REPO, "tools/enginecalls/fixtures/sigs.txt")
    meth = parse_sigs(sig)
    cases = {  # source -> expected statuses
        'local a = s:getDoor(true)': ["LITERAL"],
        'local a = s:getDoor(GridSquareEdge.NORTH)': [],
        'local a = s:getDoor()': ["ARITY"],
        'local a = s:vanishedThing(1)': ["VANISHED"],
        'local a = ("x"):sub(1)': [],
        '-- s:getDoor(true)\nlocal a = 1': [],
        '--[[ s:getDoor(true) ]] local a = 1': [],
        'local t = "s:getDoor(true)"': [],
        'local a = s:optional(1, 2, 3)': [],
        'local a = s:optional()': [],
        'local a = s:optional2()': ["ARITY"],
        'local a = s:optional(1)': [],
        'local x = "a"..stamp()': [],
        'local function stamp() end local x = M.stamp()': [],
    }
    bad = 0
    for src, want in cases.items():
        with tempfile.NamedTemporaryFile("w", suffix=".lua", delete=False) as fh:
            fh.write(src)
        got = [x[0] for x in scan([fh.name], meth, lua_defined_names([fh.name]))[0]]
        os.unlink(fh.name)
        if got != want:
            bad += 1; print(f"SELFTEST FAIL {src!r}: wanted {want}, got {got}")
    print("enginecalls selftest:", "PASS" if not bad else f"{bad} FAIL")
    return 1 if bad else 0


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", action="append")
    ap.add_argument("--sigs")
    ap.add_argument("--allowlist", default=os.path.join(REPO, "tools/enginecalls/allowlist.txt"))
    ap.add_argument("--tree-from-git")
    ap.add_argument("--evidence", action="store_true")
    ap.add_argument("--selftest", action="store_true")
    a = ap.parse_args()
    sys.exit(selftest() if a.selftest else run(a))
