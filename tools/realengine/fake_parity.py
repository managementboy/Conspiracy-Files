#!/usr/bin/env python3
"""Police the hand-made fakes that remain in test/*.lua.

A test that still pretends to be the game declares what it imitates, on one comment line:

    -- FAKE-OF zombie.iso.IsoGridSquare: getZ TreatAsSolidFloor isSolid getDoor

For each declared name this checks (a) the file really defines it (the declaration is honest),
and (b) the REAL class has a method of that name taking as many arguments as the fake declares,
so a fake can never accept a call, or ignore arguments, the game would not. (`function s:getDoor()`
takes none; the game's takes one, so it fails here - a fake blind to its arguments is how the
removed getDoor(boolean) went unnoticed.)  Arity is the fake's parameter count minus its receiver
(`self` / the first parameter of a table field); `...` accepts anything.

  fake_parity.py --offline    declarations only (no game needed)
  fake_parity.py              also compares with the installed game's classes (javap, run time only)
Exit: 0 clean | 1 findings | 20 no game (default mode only; never a pass)
"""
import glob, os, re, subprocess, sys

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
DECL = re.compile(r"^\s*--\s*FAKE-OF\s+([\w.$]+)\s*:\s*(.+?)\s*$", re.M)


def arity_of(src, name):
    """Parameter count (without the receiver) of the first definition of `name`, or None; -1 = varargs."""
    for pat, colon in ((rf"function\s+[\w.]+:{name}\s*\(([^)]*)\)", True),
                       (rf"function\s+[\w.]+\.{name}\s*\(([^)]*)\)", False),
                       (rf"\b{name}\s*=\s*function\s*\(([^)]*)\)", False)):
        m = re.search(pat, src)
        if m:
            params = [p.strip() for p in m.group(1).split(",") if p.strip()]
            if "..." in params: return -1
            return len(params) if colon else max(len(params) - 1, 0)
    return None


def declared_fakes(root):
    out = []
    for f in sorted(glob.glob(os.path.join(root, "test/*.lua"))):
        src = open(f, encoding="utf-8", errors="replace").read()
        for m in DECL.finditer(src):
            out.append((os.path.relpath(f, REPO), m.group(1), m.group(2).split(), src))
    return out


def real_arities(pz, jh, cls, seen=None):
    """name -> set of arities for the class and everything it extends/implements."""
    seen = seen if seen is not None else set()
    if cls in seen: return {}
    seen.add(cls)
    jar = os.path.join(pz, "projectzomboid.jar")
    out = subprocess.run([os.path.join(jh, "bin/javap"), "-public", "-cp", jar, cls], capture_output=True, text=True)
    if out.returncode != 0: return None
    ar = {}
    for ln in out.stdout.splitlines():
        m = re.match(r"^\s+public (?:static |final |abstract |synchronized |native |default )*(?:<[^>]+> )?"
                     r"[\w.$<>\[\],? ]+? (\w+)\((.*)\)(?: throws [\w.,$ ]+)?;$", ln)
        if m:
            params = m.group(2).strip()
            n = 0 if not params else params.count(",") + 1 - _generic_commas(params)
            ar.setdefault(m.group(1), set()).add(-1 if params.endswith("...") else n)
    head = re.search(r"(?:class|interface|enum) [\w.$]+(?:<.*?>)? (?:extends ([\w.$<>, ?]+?))?(?: implements ([\w.$<>, ?]+?))? ?\{", out.stdout)
    if head:
        for parent in [re.sub(r"<.*", "", x).strip() for g in head.groups() if g for x in g.split(",")]:
            for k, v in (real_arities(pz, jh, parent, seen) or {}).items():
                ar.setdefault(k, set()).update(v)
    return ar


def _generic_commas(params):
    depth, extra = 0, 0
    for ch in params:
        depth += (ch == "<") - (ch == ">")
        if ch == "," and depth > 0: extra += 1
    return extra


def main():
    offline = "--offline" in sys.argv
    bad, n = [], 0
    fakes = declared_fakes(REPO)
    pz = jh = None
    if not offline:
        env = subprocess.run(["bash", "-c", ". tools/env.sh; echo \"$PZ_HOME|$JAVA_HOME\""], cwd=REPO,
                             capture_output=True, text=True).stdout.strip().split("|")
        pz, jh = (env + ["", ""])[:2]
        if not (pz and os.path.isfile(os.path.join(pz, "projectzomboid.jar")) and os.path.isfile(os.path.join(jh or "", "bin/javap"))):
            print("fake parity: NOT EXERCISED - no game here (declaration honesty still checked with --offline). Not a pass.")
            return 20
    for path, cls, names, src in fakes:
        real = None if offline else real_arities(pz, jh, cls)
        if not offline and real is None:
            bad.append(f"{path}: declares a fake of {cls}, which is not a class in this game build"); continue
        for name in names:
            n += 1
            a = arity_of(src, name)
            if a is None:
                bad.append(f"{path}: declares fake method {name} but never defines it"); continue
            if offline: continue
            if name not in real:
                bad.append(f"{path}: fake {cls.split('.')[-1]}:{name} - the real class has no such method")
            elif a != -1 and a not in real[name] and -1 not in real[name]:
                bad.append(f"{path}: fake {cls.split('.')[-1]}:{name} takes {a} argument(s); the real one takes {sorted(x for x in real[name])}")
    for b in bad: print("FAKE", b)
    print(f"fake parity: {len(fakes)} declared fake(s), {n} method(s) checked, {len(bad)} finding(s)" + (" (offline)" if offline else ""))
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
