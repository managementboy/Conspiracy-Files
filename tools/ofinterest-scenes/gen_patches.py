#!/usr/bin/env python3
"""Generate ScenePatches.java: one ZombieBuddy advice patch per vanilla story
class that DECLARES one of the four story methods, read from the installed
projectzomboid.jar (class files parsed directly; no JDK needed).

  gen_patches.py <projectzomboid.jar> <out ScenePatches.java>

Exact class names, not a pattern: ZombieBuddy retransforms an already loaded
class only when its name is listed exactly (PatchEngine, targetClasses)."""
import struct, sys, zipfile

METHODS = {"randomizeBuilding": "building", "randomizeDeadSurvivor": "building",
           "randomizeZoneStory": "zone", "randomizeVehicleStory": "vehicle"}

def declared(data):
    """Names of the non-static methods a class file declares."""
    i = 8
    (n,) = struct.unpack(">H", data[i:i+2]); i += 2
    pool = [None] * n
    k = 1
    while k < n:
        tag = data[i]; i += 1
        if tag == 1:
            (ln,) = struct.unpack(">H", data[i:i+2]); i += 2
            pool[k] = data[i:i+ln].decode("utf-8", "replace"); i += ln
        elif tag in (3, 4): i += 4
        elif tag in (5, 6): i += 8; k += 1
        elif tag in (7, 8, 16, 19, 20): i += 2
        elif tag in (9, 10, 11, 12, 17, 18): i += 4
        elif tag == 15: i += 3
        else: raise ValueError("constant tag %d" % tag)
        k += 1
    i += 6
    (ni,) = struct.unpack(">H", data[i:i+2]); i += 2 + 2 * ni
    def skip_members(i):
        (cnt,) = struct.unpack(">H", data[i:i+2]); i += 2
        out = []
        for _ in range(cnt):
            flags, name, desc, ac = struct.unpack(">HHHH", data[i:i+8]); i += 8
            for _ in range(ac):
                (ln,) = struct.unpack(">I", data[i+2:i+6]); i += 6 + ln
            out.append((flags, pool[name]))
        return i, out
    i, _ = skip_members(i)
    i, methods = skip_members(i)
    return [name for flags, name in methods if not flags & 0x0008]

def main(jar, out):
    rows = []
    with zipfile.ZipFile(jar) as z:
        for name in sorted(z.namelist()):
            if not (name.startswith("zombie/randomizedWorld/") and name.endswith(".class")) or "$" in name:
                continue
            for m in declared(z.read(name)):
                if m in METHODS:
                    rows.append((name[:-6].replace("/", "."), m))
    lines = ["// DERIVED FILE - tools/ofinterest-scenes/gen_patches.py from projectzomboid.jar.",
             "// One advice per vanilla story class declaring a story method: every",
             "// generated scene reaches SceneListener (DR-20260929-NOHELP-GAP-PLAN, E4).",
             "package conspiracyfiles.ofinterest;", "", "import me.zed_0xff.zombie_buddy.Patch;", "",
             "public class ScenePatches {"]
    for i, (cls, m) in enumerate(rows):
        lines += [
            '    @Patch(className = "%s", methodName = "%s")' % (cls, m),
            "    public static class P%03d {" % i,
            "        @Patch.OnEnter public static void enter(@Patch.This Object self, @Patch.AllArguments Object[] args) { SceneListener.enter(self, \"%s\", args); }" % METHODS[m],
            "        @Patch.OnExit(onThrowable = Throwable.class) public static void exit() { SceneListener.exit(); }",
            "    }"]
    lines.append("}")
    open(out, "w").write("\n".join(lines) + "\n")
    print("%d patches" % len(rows))

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
